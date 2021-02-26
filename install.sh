DEV_ENV_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p $DEV_ENV_DIR/.workdir
cd $DEV_ENV_DIR/.workdir

# Install fonts
NERDFONTS_VERSION="v2.1.0"
FONTS=(Hack Meslo)
mkdir -p patched-fonts
for font in "${FONTS[@]}"
do
    curl -Lo $font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$NERDFONTS_VERSION/$font.zip
    unzip $font.zip -d patched-fonts
done
curl -Lo nerd_install.sh https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v2.1.0/install.sh | bash -s

cd $DEV_ENV_DIR
rm -rf .workdir

git clone https://github.com/gpakosz/.tmux.git

# Install vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

curl -fsSL https://starship.rs/install.sh | sudo bash -s -- --yes

