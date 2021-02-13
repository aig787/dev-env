# Install fonts
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git
git clone https://github.com/gpakosz/.tmux.git

nerd-fonts/install.sh Hack
nerd-fonts/install.sh Meslo

rm -rf nerd-fonts

# Install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

curl -fsSL https://starship.rs/install.sh | bash -s -- --yes
