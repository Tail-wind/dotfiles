set number
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=2 smarttab
syntax on
set autoindent
set laststatus=2
set rtp+=/Users/eanbyrne/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
