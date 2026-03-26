# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

PATH=$PATH:"/opt/homebrew/bin/"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# bun completions
[ -s "/Users/towaki/.bun/_bun" ] && source "/Users/towaki/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"

alias vim="nvim"
alias rsyncall="~/scripts/rsyncall/rsyncall.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/towaki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/towaki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/towaki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/towaki/google-cloud-sdk/completion.zsh.inc'; fi


export g3d=/Users/$USER/g3d
export G3D10DATA=$g3d/G3D10/data-files:$g3d/data10/common:$g3d/data10/game:$g3d/data10/research
export INCLUDE=$g3d/G3D10/external/glew.lib/include:$g3d/G3D10/external/glfw.lib/include:$g3d/G3D10/external/civetweb.lib/include:$g3d/G3D10/external/qrencode.lib/include:$g3d/G3D10/external/zlib.lib/include:$g3d/G3D10/external/physx/include:$g3d/G3D10/G3D-base.lib/include:$g3d/G3D10/G3D-gfx.lib/include:$g3d/G3D10/G3D-app.lib/include:$g3d/G3D10/external/tbb/include:$g3d/G3D10/external/glslang/glslang:$INCLUDE
export LIBRARY=$g3d/G3D10/build/lib:$g3d/G3D10/build/bin:$LIBRARY
export PATH=$PATH:$g3d/G3D10/bin:$g3d/G3D10/build/bin

# Secrets sourced from ~/.zshrc_secrets (not committed to dotfiles repo)
[ -f ~/.zshrc_secrets ] && source ~/.zshrc_secrets

. "$HOME/.cargo/env"
export UV_HTTP_TIMEOUT=120
source "$HOME/.rye/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/towaki/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/towaki/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/towaki/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/towaki/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias python-conda="/Users/towaki/miniconda3/bin/python"
export HAIPERA_PYTHON_PATH="/Users/towaki/miniconda3/bin/python"
export AWS_CLI_AUTO_PROMPT="off"
alias outerport="rye run outerport"
alias op-sync='/opt/homebrew/bin/rsync -azh --delete --info=progress2 nokotan:~/code/outerport-backend/ ~/code/outerport-backend/'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# OPENAI_API_KEY is in ~/.zshrc_secrets
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
alias docker-om='docker run -it --rm -v "$HOME:$HOME" -e "HOME=$HOME" -w "$PWD" -e "DISPLAY=`ifconfig | grep -o "inet [0-9.]*" | grep -Eo "[0-9.]{7,}" | grep -Fv 127.0.0.1 | head -1`:0" --user $UID openmodelica/openmodelica:v1.26.3-gui'
