# 🎉 Wedding Crossword Game - Clara & Emanuel

[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue?logo=github)](https://emanuelfontelles.github.io/claraenena/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Jogo interativo de palavras cruzadas para o casamento de Clara & Emanuel
>
> **Data do Casamento:** 08 de Novembro de 2025
> **Local:** Espaço Hibisco, Fortaleza-CE

---

## 📋 Sobre o Projeto

Este é um jogo de palavras cruzadas personalizado criado especialmente para celebrar o casamento de Clara e Emanuel. O jogo apresenta pistas sobre a história do casal, seus hobbies, viagens e momentos especiais.

### 🎨 Características

- ✨ Identidade visual elegante baseada no convite de casamento
- 🎯 11 palavras cruzadas com pistas personalizadas
- 📱 Design totalmente responsivo (desktop, tablet, mobile)
- ⌨️ Navegação completa por teclado (setas, Tab, Backspace)
- ✅ Validação de respostas com feedback visual
- 💡 Opções para revelar ou limpar respostas
- 🎊 Animações suaves e elegantes
- 📦 Zero dependências externas (funciona offline)

---

## 🚀 Deploy Rápido

### Opção 1: Deploy Automatizado (Recomendado)

```bash
# Execute o script de deploy
./deploy.sh
```

O script irá:
1. ✅ Verificar dependências (git)
2. ✅ Validar o arquivo `index.html`
3. ✅ Clonar/atualizar o repositório
4. ✅ Fazer commit e push automático
5. ✅ Exibir a URL do GitHub Pages

### Opção 2: Deploy Manual

```bash
# 1. Clone o repositório (se ainda não tiver)
git clone https://github.com/EmanuelFontelles/claraenena.git
cd claraenena

# 2. Copie o arquivo index.html
cp /caminho/para/index.html .

# 3. Faça commit e push
git add index.html
git commit -m "🎉 Update Wedding Crossword Game"
git push -u origin main
```

---

## 🌐 Acesso ao Jogo

**URL do GitHub Pages:**
🔗 **https://emanuelfontelles.github.io/claraenena/**

**Repositório:**
🔗 **https://github.com/EmanuelFontelles/claraenena**

---

## 🛠️ Desenvolvimento Local

### Pré-requisitos

- Qualquer navegador moderno (Chrome, Firefox, Safari, Edge)
- Servidor HTTP local (opcional, mas recomendado)

### Testando Localmente

#### Opção 1: Python (Recomendado)

```bash
# Python 3
python3 -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

Acesse: `http://localhost:8000`

#### Opção 2: Node.js (http-server)

```bash
# Instalar http-server (apenas uma vez)
npm install -g http-server

# Executar servidor
http-server -p 8000
```

Acesse: `http://localhost:8000`

#### Opção 3: PHP

```bash
php -S localhost:8000
```

Acesse: `http://localhost:8000`

#### Opção 4: VS Code (Live Server Extension)

1. Instale a extensão "Live Server"
2. Clique com botão direito em `index.html`
3. Selecione "Open with Live Server"

---

## 📝 Estrutura do Projeto

```
claraenena/
├── index.html          # Arquivo principal (HTML + CSS + JS inline)
├── deploy.sh           # Script automatizado de deploy
├── README.md           # Documentação (este arquivo)
└── .gitignore          # Arquivos ignorados pelo git
```

---

## 🎮 Como Jogar

### Navegação

| Ação | Método |
|------|--------|
| **Mover entre células** | Setas do teclado (↑ ↓ ← →) |
| **Próxima célula** | Tab ou digite uma letra |
| **Célula anterior** | Backspace (em célula vazia) |
| **Alternar direção** | Clique na célula atual |
| **Ir para palavra** | Clique na pista correspondente |

### Controles

- **✓ Verificar Respostas:** Valida todas as respostas e mostra feedback
- **💡 Revelar Respostas:** Mostra todas as respostas corretas (com confirmação)
- **🗑️ Limpar Tudo:** Remove todas as respostas (com confirmação)

### Palavras Cruzadas

#### Verticais (6 palavras)
1. **BARRAGRANDE** - Praia piauense que irão curtir a lua de mel
2. **EMO** - Estilo musical adorado pela noiva
3. **JUNHO** - Mês da mudança de Fortaleza para São Paulo
4. **RUGBY** - Esporte inglês que 'uniu' o casal
5. **VENEZA** - Cidade conhecida pelos seus canais, em que aconteceu o noivado
6. **FISICA** - Curso de Graduação do noivo

#### Horizontais (5 palavras)
7. **NENA** - Apelido do noivo
8. **SENHORDOSANEIS** - Trilogia do cinema que os noivos assistem no repeat
9. **PARAGUAI** - País que o casal visitou esse ano com intenção de comprar um aspirador robô
10. **BENTOEKIKI** - Nome dos gatinhos do casal
11. **PAULANEY** - Nome da rua da futura casa dos noivos

---

## 🎨 Identidade Visual

### Paleta de Cores

```css
--bg-primary: #f5f1e8      /* Background bege creme */
--bg-secondary: #e8ded0    /* Background secundário */
--color-primary: #6b7566   /* Verde folha */
--color-secondary: #a8b5a0 /* Verde suave */
--color-accent: #d4af37    /* Dourado */
--color-text: #4a4a4a      /* Cinza escuro */
```

### Tipografia

- **Títulos:** Cormorant Garamond (serif, elegante, itálico)
- **Corpo:** Montserrat (sans-serif, legível)

---

## 🔧 Troubleshooting

### Problema: Script de deploy não executa

**Solução:**
```bash
# Tornar o script executável
chmod +x deploy.sh

# Executar novamente
./deploy.sh
```

### Problema: Git push falha com 403

**Solução:**
```bash
# Configurar credenciais do Git
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"

# Usar SSH ao invés de HTTPS
git remote set-url origin git@github.com:EmanuelFontelles/claraenena.git
```

### Problema: GitHub Pages não atualiza

**Solução:**
1. Aguarde 2-3 minutos (tempo de build do GitHub Pages)
2. Limpe o cache do navegador (Ctrl+F5 ou Cmd+Shift+R)
3. Verifique se GitHub Pages está habilitado:
   - Vá em Settings → Pages
   - Certifique-se que Source está em "Deploy from branch: main"

### Problema: Jogo não carrega localmente

**Solução:**
```bash
# Use um servidor HTTP local (não abra o arquivo diretamente)
python3 -m http.server 8000

# Acesse http://localhost:8000 (não file://)
```

### Problema: Células não aparecem corretamente

**Solução:**
- Verifique se está usando um navegador moderno
- Limpe o cache do navegador
- Verifique o console do navegador (F12) para erros

---

## 📱 Compatibilidade

### Navegadores Suportados

| Navegador | Versão Mínima |
|-----------|---------------|
| Chrome | 90+ |
| Firefox | 88+ |
| Safari | 14+ |
| Edge | 90+ |

### Dispositivos

- ✅ Desktop (1920x1080 e superiores)
- ✅ Laptop (1366x768 e superiores)
- ✅ Tablet (768x1024)
- ✅ Mobile (375x667 e superiores)

---

## 🔒 Habilitando GitHub Pages

Se este é seu primeiro deploy, habilite o GitHub Pages:

1. Acesse o repositório: https://github.com/EmanuelFontelles/claraenena
2. Vá em **Settings** (Configurações)
3. No menu lateral, clique em **Pages**
4. Em **Source**, selecione:
   - Branch: `main`
   - Folder: `/ (root)`
5. Clique em **Save**
6. Aguarde 2-3 minutos
7. A URL será exibida: https://emanuelfontelles.github.io/claraenena/

---

## 📚 Tecnologias Utilizadas

- **HTML5** - Estrutura semântica
- **CSS3** - Estilização e responsividade (CSS Grid, Flexbox, Animations)
- **JavaScript (ES6+)** - Lógica do jogo (Vanilla JS, zero dependências)
- **Google Fonts** - Cormorant Garamond & Montserrat
- **GitHub Pages** - Hospedagem estática gratuita

---

## 📦 Comandos Úteis

### Git

```bash
# Ver status do repositório
git status

# Ver histórico de commits
git log --oneline

# Desfazer último commit (mantendo mudanças)
git reset --soft HEAD~1

# Forçar atualização do repositório local
git fetch origin
git reset --hard origin/main
```

### Deploy

```bash
# Deploy completo
./deploy.sh

# Verificar se script tem permissão de execução
ls -la deploy.sh

# Ver conteúdo do script
cat deploy.sh
```

### Teste Local

```bash
# Servidor Python (porta 8000)
python3 -m http.server 8000

# Servidor Python (porta customizada)
python3 -m http.server 3000

# Verificar se porta está em uso
lsof -i :8000

# Matar processo na porta 8000
kill -9 $(lsof -t -i:8000)
```

---

## 🤝 Contribuindo

Este é um projeto pessoal para o casamento de Clara & Emanuel. No entanto, se você deseja usar como base para seu próprio projeto:

1. Fork este repositório
2. Modifique as palavras, pistas e identidade visual
3. Atualize as configurações no `deploy.sh`
4. Deploy para seu próprio GitHub Pages

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

---

## 👨‍💻 Autor

**Emanuel Fontelles**
Senior Python Software Engineer | ML & Data Engineering

- 🌐 Website: [emanuelfontelles.github.io](https://emanuelfontelles.github.io)
- 💼 LinkedIn: [linkedin.com/in/emanuelfontelles](https://linkedin.com/in/emanuelfontelles)
- 📧 Email: [seu-email@example.com](mailto:seu-email@example.com)
- 🐙 GitHub: [@EmanuelFontelles](https://github.com/EmanuelFontelles)

---

## 💖 Agradecimentos

Criado com amor para celebrar a união de **Clara & Emanuel**.

> *"Mas, por qualquer estrada, irei contigo, e o nosso destino será o mesmo."*
> — J.R.R. Tolkien

---

## 🎊 Casamento

**Data:** 08 de Novembro de 2025
**Local:** Espaço Hibisco, Fortaleza-CE
**URL do Jogo:** https://emanuelfontelles.github.io/claraenena/

---

<div align="center">

**Feito com 💍 por Emanuel Fontelles**

[⬆ Voltar ao topo](#-wedding-crossword-game---clara--emanuel)

</div>
