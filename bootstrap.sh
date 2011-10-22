VIM_DIR=~/.vim
PLATFORM=`uname`

# Backup old .vim
for i in $VIM_DIR ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done

# Clone my vimrc
git clone git://github.com/Panya/dotvim.git $VIM_DIR
cd $VIM_DIR

# Update Pathogen bundle
git submodule init; git submodule update

# Build vimproc
cd bundle/vimproc
if [[ $PLATFORM == 'Linux' || $PLATFORM == 'FreeBSD' ]]; then
    make -f make_gcc.mak
elif [[ $PLATFORM == 'Darwin' ]]; then
    make -f make_mac.mak
fi

# Add links to vimrc and gvimrc
for i in vimrc gvimrc; do ln -s $VIM_DIR/$i ~/.$i; done

# Cleanup
git clean -fd
