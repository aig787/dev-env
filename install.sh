DEV_ENV_DIR="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" >/dev/null 2>&1 && pwd )"

mkdir -p $DEV_ENV_DIR/.workdir
cd $DEV_ENV_DIR/.workdir

# Install fonts
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
for font in Hack Meslo JetbrainsMono
do
    git sparse-checkout add patched-fonts/$font
    ./install.sh $font
done
cd ..

cd $DEV_ENV_DIR
rm -rf .workdir

git clone https://github.com/gpakosz/.tmux.git

# Install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

curl -fsSL https://starship.rs/install.sh | sudo sh -s -- --yes

