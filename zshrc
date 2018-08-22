# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/fabio/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ziggoto"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BROWSER=/usr/bin/firefox
export CHROMIUM_BIN=/usr/bin/chromium-browser
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export ANDROID_HOME=/home/fabio/Android/Sdk
export GOPATH=/home/fabio/go
export GOROOT=/usr/local/go
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GOPATH/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/fabio/.sdkman"
[[ -s "/home/fabio/.sdkman/bin/sdkman-init.sh" ]] && source "/home/fabio/.sdkman/bin/sdkman-init.sh"

source /etc/zsh_command_not_found

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

source ~/antigen.zsh
# antigen bundle soimort/translate-shell

# export PATH=/home/fabio/.nvm/versions/node/v8.1.2/bin:/home/fabio/.sdkman/candidates/gradle/current/bin:/home/fabio/bin:/home/fabio/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/fabio/Android/Sdk/tools:/home/fabio/Android/Sdk/platform-tools:/home/fabio/.vimpkg/bin:$ANDROID_HOME/build-tools/26.0.1

export EDITOR=vim

# added by Anaconda3 installer
export PATH="/home/fabio/anaconda3/bin:$PATH"

export TCLLIBPATH=/usr/lib/x86_64-linux-gnu

function gmdevenv { cd /home/fabio/Projetos/gm-dev-env/core; ./run.sh $*; cd - >/dev/null; }

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/home/fabio/.jenv/bin/jenv-init.sh" ]] && source "/home/fabio/.jenv/bin/jenv-init.sh" && source "/home/fabio/.jenv/commands/completion.sh"

# Have less display colours
# # from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

export MANPAGER='less -s -M +Gg'

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

source /etc/profile.d/undistract-me.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/fabio/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/fabio/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/fabio/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/fabio/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin
export PATH=$PATH:~/anaconda3/bin

# Requires bat installed:
# https://github.com/sharkdp/bat
alias bat="bat --paging auto"
