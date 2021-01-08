zsh << 'HERE'
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
HERE

DEV_ENV_DIR=$(dirname "$0")

ln -s -f $DEV_ENV_DIR/p10k.zsh ~/.p10k.zsh
ln -s -f $DEV_ENV_DIR/zshrc ~/.zshrc
ln -s -f $DEV_ENV_DIR/zpreztorc ~/.zpreztorc

ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/

if [ ! -z "$DOTFILES_REPO" ]; then
  git clone $DOTFILES_REPO $DEV_ENV_DIR/.dotfiles
  for file in $(find $DEV_ENV_DIR/.dotfiles -type f -not -path '*/\.git/*' -not -path '*README.md'); do
   ln -s $file $HOME/$(basename $file)
  done
fi