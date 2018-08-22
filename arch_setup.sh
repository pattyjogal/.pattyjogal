# Install packages
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ..

sudo yay -S - < arch_deps.txt

# Start off by installing python, and get the site packages directory

sudo yay -S extra/python

PYTHON_SPDIR = `python -c "import site; print(site.getsitepackages()[0])"`

#### SYMLINK CONFIGS ####
ln -s  ~/Dotfiles/.vimrc ~/.vimrc
ln -s  ~/Dotfiles/.tmux.conf ~/.tmux.conf
ln -s  ~/Dotfiles/.zshrc ~/.zshrc

#### POWERLINE SETUP ####

# For ease of access, symlink the powerline directory to the home folder

sudo yay -S powerline
ln -s $PYTHON_SPDIR/powerline ~/powerline

#### VIM SETUP ####

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the plugins
vim -c ":PlugInstall"
