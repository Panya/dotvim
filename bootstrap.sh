VIM_DIR=~/.vim
NVIM_DIR=~/.config/nvim

# Backup old .vim
for i in $VIM_DIR ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done

# Clone my vimrc
git clone git://github.com/Panya/dotvim.git $VIM_DIR
cd $VIM_DIR

# Add links to vimrc and gvimrc
for i in vimrc gvimrc; do ln -s $VIM_DIR/$i ~/.$i; done

# Cleanup
git clean -fd

# Add nvim config
if [ ! -f "$NVIM_DIR/init.vim" ]; then
  printf "set runtimepath^=$VIM_DIR runtimepath+=$VIM_DIR/after\nlet &packpath = &runtimepath\nsource ~/.vimrc" > $NVIM_DIR/init.vim
fi
