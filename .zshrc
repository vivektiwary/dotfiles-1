# Path to your oh-my-zsh installation.
export ZSH=/Users/bizongo-admin/.oh-my-zsh

ZSH_THEME="cobalt2"
COMPLETION_WAITING_DOTS="true"
plugins=(git docker-rails zsh-autosuggestions short-dir zsh-completions)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

autoload -U compinit && compinit

#. `brew --prefix`/etc/profile.d/z.sh
# export PATH="/Users/shubham/anaconda2/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

hour=`date +"%T"`
hour=${hour%%:*}
if [ "$hour" -lt 12 ]
then
  echo "Good morning, Vivek."
elif [ "$hour" -ge 12 -a "$hour" -lt 17 ]
then
  echo "Good Afternoon, Vivek."
else
  echo "Good Evening, Vivek."
fi

echo "----------------------------------------"
fortune -s
echo "----------------------------------------"

echo "Current time: `date +"%r %a %d %h %y"`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# using ripgrep as it is bit faster
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
. `brew --prefix`/etc/profile.d/z.sh

alias cat='bat'
alias help='tldr'
