#!/usr/bin/env bash
# Ubuntu Packages
read -r -d '' ubuntu_packages << EOM
cmake
curl
dmenu
git
neovim
net-tools
exuberant-ctags
python-pip
python2
python3
python3-pip
tmux
gawk
zsh
EOM

read -r -d '' python3_packages << EOM
dploy
jedi
EOM


echo "Installing Ubuntu packages"
for i in $ubuntu_packages ; do
	sudo apt install -y "$i"
done

echo "Installing Python 3 packages"
for i in $python3_packages ; do
	sudo -H pip3 install "$i"
done

if hash rg 2>/dev/null ; then
	echo "Ripgrep already installed"
else
	echo "Installing ripgrep"
	pushd builddir
	ripgrep_version="0.10.0"
	curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${ripgrep_version}/ripgrep_${ripgrep_version}_amd64.deb"
	sudo dpkg -i "ripgrep_${ripgrep_version}_amd64.deb"
	popd
fi

if hash rustup 2>/dev/null; then
	echo "Rust already installed"
else
	echo "Installing Rust"
	curl https://sh.rustup.rs -sSf | sh
fi
