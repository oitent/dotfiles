# =============================================================================
# PATH
# =============================================================================
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/python@3.14/libexec/bin  # unversioned python/pip
fish_add_path /opt/homebrew/share/google-cloud-sdk/bin   # gcloud extra components
fish_add_path ~/.bun/bin                                  # bun

# =============================================================================
# Environment Variables
# =============================================================================
set -gx NVM_DIR "$HOME/.nvm"
set -gx EDITOR "zed --wait"
set -gx CLOUDSDK_PYTHON /opt/homebrew/bin/python3

# =============================================================================
# Abbreviations (fish's smart aliases - expand inline as you type)
# =============================================================================

# Git
abbr --add g git
abbr --add ga 'git add'
abbr --add gaa 'git add -A'
abbr --add gc 'git commit -m'
abbr --add gca 'git commit --amend'
abbr --add gco 'git checkout'
abbr --add gcb 'git checkout -b'
abbr --add gp 'git push'
abbr --add gpl 'git pull'
abbr --add gs 'git status'
abbr --add gl 'git log --oneline --graph --decorate -20'
abbr --add gd 'git diff'
abbr --add gds 'git diff --staged'

# Python
abbr --add py python
abbr --add pip pip3
abbr --add venv 'python -m venv .venv'
abbr --add activate 'source .venv/bin/activate.fish'

# Node / npm
abbr --add ni 'npm install'
abbr --add nr 'npm run'
abbr --add nrd 'npm run dev'
abbr --add nrb 'npm run build'

# Bun
abbr --add bi 'bun install'
abbr --add br 'bun run'
abbr --add brd 'bun run dev'

# Navigation
abbr --add .. 'cd ..'
abbr --add ... 'cd ../..'
abbr --add .... 'cd ../../..'

# Editors
abbr --add c code
abbr --add z zed

# =============================================================================
# fzf key bindings
# Ctrl+R = history, Ctrl+F = files, Ctrl+G = git log, Ctrl+S = git status
# =============================================================================
fzf_configure_bindings --history=\cr --directory=\cf --git_log=\cg --git_status=\cs

# =============================================================================
# nvm - default to LTS
# =============================================================================
set --universal nvm_default_version lts

# =============================================================================
# pyenv
# =============================================================================
set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# =============================================================================
# direnv
# =============================================================================
direnv hook fish | source
