if [ -d "$HOME/Library/Python/2.7/bin" ]; then
  PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/eanbyrne/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
alias vtop="vtop --theme brew"
