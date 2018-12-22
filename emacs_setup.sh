#Install emacs first
sudo pacman -S --needed emacs

# Symlink the appropriate files from the Dotfiles dir
ln -sf $(pwd)/init.el ~/.emacs.d/init.el
ln -sf $(pwd)/emacs-config.org ~/.emacs.d/emacs-config.org

# Some of the packages aren't configured with use-package
mkdir ~/.emacs.d/lisp
wget -O ~/.emacs.d/lisp/evil-leader.el https://raw.githubusercontent.com/cofi/evil-leader/master/evil-leader.el

