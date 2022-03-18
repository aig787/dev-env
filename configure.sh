#/bin/bash

DEV_ENV_DIR="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" >/dev/null 2>&1 && pwd )"

ln -s -f $DEV_ENV_DIR/zshrc ~/.zshrc

ln -s -f $DEV_ENV_DIR/.tmux/.tmux.conf ~/.tmux.conf
cp $DEV_ENV_DIR/.tmux/.tmux.conf.local ~/

if [ ! -z "$DOTFILES_REPO" ]; then
  git clone $DOTFILES_REPO $DEV_ENV_DIR/.dotfiles
  for file in $(find $DEV_ENV_DIR/.dotfiles -type f -not -path '*/\.git/*' -not -path '*README.md'); do
   ln -s $file $HOME/$(basename $file)
  done
fi
