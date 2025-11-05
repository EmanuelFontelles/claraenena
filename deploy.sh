#!/bin/bash

################################################################################
# Deploy Script - Wedding Crossword Game (Clara & Emanuel)
# Author: Emanuel Fontelles
# Description: Automated deployment script to GitHub Pages
# Repository: github.com/EmanuelFontelles/claraenena
# URL: https://emanuelfontelles.github.io/claraenena/
################################################################################

set -e  # Exit on error

# ===================================
# COLOR CODES FOR TERMINAL OUTPUT
# ===================================
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly MAGENTA='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly NC='\033[0m' # No Color

# ===================================
# CONFIGURATION VARIABLES
# ===================================
readonly REPO_OWNER="EmanuelFontelles"
readonly REPO_NAME="claraenena"
readonly REPO_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}.git"
readonly BRANCH_NAME="main"
readonly GITHUB_PAGES_URL="https://${REPO_OWNER}.github.io/${REPO_NAME}/"
readonly LOCAL_REPO_DIR="${REPO_NAME}"
readonly SOURCE_FILE="index.html"

# ===================================
# UTILITY FUNCTIONS
# ===================================

/**
 * Prints an info message with blue color
 * @param $1 - Message to print
 */
log_info() {
    echo -e "${BLUE}ℹ️  INFO:${NC} $1"
}

/**
 * Prints a success message with green color
 * @param $1 - Message to print
 */
log_success() {
    echo -e "${GREEN}✅ SUCCESS:${NC} $1"
}

/**
 * Prints a warning message with yellow color
 * @param $1 - Message to print
 */
log_warning() {
    echo -e "${YELLOW}⚠️  WARNING:${NC} $1"
}

/**
 * Prints an error message with red color and exits
 * @param $1 - Error message to print
 */
log_error() {
    echo -e "${RED}❌ ERROR:${NC} $1" >&2
    exit 1
}

/**
 * Prints a section header with cyan color
 * @param $1 - Header text
 */
log_header() {
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

/**
 * Checks if a command exists
 * @param $1 - Command name
 * @return 0 if exists, 1 otherwise
 */
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

/**
 * Validates required dependencies
 */
check_dependencies() {
    log_header "Checking Dependencies"

    local missing_deps=()

    if ! command_exists git; then
        missing_deps+=("git")
    fi

    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing required dependencies: ${missing_deps[*]}\nPlease install them and try again."
    fi

    log_success "All required dependencies are installed"
}

/**
 * Validates source file exists
 */
check_source_file() {
    log_header "Validating Source File"

    if [ ! -f "${SOURCE_FILE}" ]; then
        log_error "Source file '${SOURCE_FILE}' not found in current directory!\nPlease run this script from the project root."
    fi

    local file_size=$(stat -c%s "${SOURCE_FILE}" 2>/dev/null || stat -f%z "${SOURCE_FILE}" 2>/dev/null)
    log_info "Source file: ${SOURCE_FILE} (${file_size} bytes)"
    log_success "Source file validated"
}

/**
 * Clones or updates the repository
 */
setup_repository() {
    log_header "Setting Up Repository"

    if [ -d "${LOCAL_REPO_DIR}/.git" ]; then
        log_info "Repository already exists. Updating..."
        cd "${LOCAL_REPO_DIR}" || log_error "Failed to enter repository directory"

        # Fetch latest changes
        log_info "Fetching latest changes..."
        git fetch origin || log_warning "Failed to fetch from origin (network issue?)"

        # Reset to latest
        log_info "Resetting to origin/${BRANCH_NAME}..."
        git reset --hard "origin/${BRANCH_NAME}" 2>/dev/null || log_warning "Branch may not exist remotely yet"

        cd .. || exit 1
        log_success "Repository updated"
    else
        log_info "Cloning repository from ${REPO_URL}..."

        # Remove directory if it exists but is not a git repo
        if [ -d "${LOCAL_REPO_DIR}" ]; then
            log_warning "Directory exists but is not a git repository. Removing..."
            rm -rf "${LOCAL_REPO_DIR}"
        fi

        # Clone repository
        if ! git clone "${REPO_URL}" "${LOCAL_REPO_DIR}"; then
            log_error "Failed to clone repository. Please check:\n  - Repository URL: ${REPO_URL}\n  - Network connection\n  - Git credentials"
        fi

        log_success "Repository cloned successfully"
    fi
}

/**
 * Deploys the file to the repository
 */
deploy_file() {
    log_header "Deploying to GitHub Pages"

    cd "${LOCAL_REPO_DIR}" || log_error "Failed to enter repository directory"

    # Copy source file
    log_info "Copying ${SOURCE_FILE} to repository..."
    cp "../${SOURCE_FILE}" "${SOURCE_FILE}" || log_error "Failed to copy source file"

    # Check for changes
    if git diff --quiet "${SOURCE_FILE}"; then
        log_warning "No changes detected in ${SOURCE_FILE}"
        log_info "Deployment skipped - file is already up to date"
        cd .. || exit 1
        return 0
    fi

    # Stage file
    log_info "Staging ${SOURCE_FILE}..."
    git add "${SOURCE_FILE}" || log_error "Failed to stage file"

    # Create commit
    local commit_date=$(date '+%Y-%m-%d %H:%M:%S')
    local commit_message="🎉 Update Wedding Crossword Game - ${commit_date}"

    log_info "Creating commit..."
    git commit -m "${commit_message}" || log_error "Failed to create commit"

    # Push to remote
    log_info "Pushing to ${BRANCH_NAME}..."

    local max_retries=4
    local retry_count=0
    local wait_time=2

    while [ ${retry_count} -lt ${max_retries} ]; do
        if git push -u origin "${BRANCH_NAME}"; then
            log_success "Successfully pushed to GitHub!"
            cd .. || exit 1
            return 0
        else
            retry_count=$((retry_count + 1))
            if [ ${retry_count} -lt ${max_retries} ]; then
                log_warning "Push failed. Retrying in ${wait_time}s... (Attempt ${retry_count}/${max_retries})"
                sleep ${wait_time}
                wait_time=$((wait_time * 2))  # Exponential backoff
            fi
        fi
    done

    cd .. || exit 1
    log_error "Failed to push after ${max_retries} attempts. Please check:\n  - Network connection\n  - Git credentials\n  - Repository permissions"
}

/**
 * Displays final deployment information
 */
show_deployment_info() {
    log_header "Deployment Complete! 🎉"

    echo -e "${GREEN}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                                                                ║${NC}"
    echo -e "${GREEN}║  ${MAGENTA}✨ Wedding Crossword Game Successfully Deployed! ✨${GREEN}        ║${NC}"
    echo -e "${GREEN}║                                                                ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}📦 Repository:${NC}"
    echo -e "   ${REPO_URL}"
    echo ""
    echo -e "${CYAN}🌐 GitHub Pages URL:${NC}"
    echo -e "   ${GREEN}${GITHUB_PAGES_URL}${NC}"
    echo ""
    echo -e "${YELLOW}⏳ Note:${NC} It may take a few minutes for GitHub Pages to update."
    echo -e "${YELLOW}   If the site doesn't load immediately, wait 2-3 minutes and refresh.${NC}"
    echo ""
    echo -e "${CYAN}📝 Next Steps:${NC}"
    echo -e "   1. Wait 2-3 minutes for GitHub Pages to build"
    echo -e "   2. Visit the URL above to test the game"
    echo -e "   3. Share the link with your wedding guests! 💍"
    echo ""
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${MAGENTA}  Clara & Emanuel - 08 de Novembro de 2025${NC}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# ===================================
# MAIN EXECUTION
# ===================================

/**
 * Main function that orchestrates the deployment
 */
main() {
    log_header "Wedding Crossword Game - Deployment Script"

    echo -e "${MAGENTA}Clara & Emanuel - 08 de Novembro de 2025${NC}"
    echo -e "${MAGENTA}Deploying to: ${GITHUB_PAGES_URL}${NC}"
    echo ""

    # Step 1: Check dependencies
    check_dependencies

    # Step 2: Validate source file
    check_source_file

    # Step 3: Setup repository
    setup_repository

    # Step 4: Deploy file
    deploy_file

    # Step 5: Show deployment info
    show_deployment_info

    log_success "All done! 🎊"
}

# ===================================
# SCRIPT ENTRY POINT
# ===================================

# Run main function with error handling
if ! main "$@"; then
    log_error "Deployment failed. Please check the error messages above."
fi

exit 0
