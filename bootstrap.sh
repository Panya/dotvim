VIM_DIR=~/.vim

# Backup old .vim
for i in $VIM_DIR ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done

# Clone my vimrc
git clone -b pathogen git://github.com/Panya/dotvim.git $VIM_DIR

# Init Pathogen
mkdir -p $VIM_DIR/autoload; curl -so $VIM_DIR/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

# Update Pathogen bundle
cd $VIM_DIR
git submodule init; git submodule update

# Copy my snippets
mkdir -p $VIM_DIR/snippets
for i in css html xslt; do curl -so $VIM_DIR/snippets/$i.snippets https://raw.github.com/Panya/snipmate-snippets/master/$i.snippets; done

# Add links to vimrc and gvimrc
for i in vimrc gvimrc; do ln -s $VIM_DIR/$i ~/.$i; done

# Cleanup
git clean -fd
