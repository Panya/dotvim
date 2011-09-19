# Backup old .vim
for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done

# Clone my vimrc
git clone -b pathogen git://github.com/Panya/janus.git ~/.vim

# Init Pathogen
mkdir -p ~/.vim/autoload; curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

# Update Pathogen bundle
cd ~/.vim
git submodule init; git submodule update

# Copy my snippets
for i in css html xslt; do curl -so snippets/$i.snippets https://raw.github.com/Panya/snipmate-snippets/master/$i.snippets; done

# Add links to vimrc and gvimrc
for i in vimrc gvimrc; do ln -s ~/.vim/$i ~/.$i; done
