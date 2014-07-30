" vim: set ts=4 sw=4 sts=0:
"-----------------------------------------------------------------------------
" 文字コード関連
"
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
set fileencodings=utf-8,eucjp-ms,iso-2022-jp,cp932,latin1
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif

"-----------------------------------------------------------------------------
" 編集関連
"
"空白ではなくTabを使用する
set noexpandtab
"オートインデントする
set autoindent
"カーソルの位置表示
set ruler
"バックアップの無効
set nobackup
"vimの機能の有効化
set nocompatible
set smartindent
set smarttab
"backspaceの挙動制御
set backspace=1
set wildmenu
set formatoptions+=mM
set showtabline=2
set cindent

"-----------------------------------------------------------------------------
" 検索関連
"
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch

set modeline

"-----------------------------------------------------------------------------
" 装飾関連
"
"シンタックスハイライトを有効にする
if has("syntax")
	syntax on
endif

"ファイル拡張子毎にインデント機能をオンに
filetype plugin indent on
"行番号を表示しない
set nonumber
"タブの左側にカーソル表示
set listchars=tab:^\ ,eol:<,trail:_,nbsp:%
set list
"タブ幅を設定する
"set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
"入力中のコマンドをステータスに表示する
set showcmd
"括弧入力時の対応する括弧を表示
set showmatch
"検索結果文字列のハイライトを有効にする
set hlsearch
"ステータスラインを常に表示
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set whichwrap=b,s,h,l,<,>,[,]

let format_allow_over_tw = 1

function! InnsertTabWrapper()
	let col = col('.) -1
	if !col || getline('.')[col - 1] !~ '\k'
		return "<\TAB>"
	else
		if pumvisible()
			return "\<C-N>"
		else
			return "\<C-N>\<C-P>"
		end
	endif
endfunction

"-----------------------------------------------------------------------------
"Syntax and Extension
autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd BufNewFile,BufRead *.md set filetype=markdown

"autocmd BufNewFile,BufRead *.php set expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html set expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.css set expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.js set expandtab tabstop=2 shiftwidth=2

"-----------------------------------------------------------------------------
