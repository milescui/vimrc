" Filetype settings
if exists("did_load_filetypes")
    finish
endif

" ActionScript
au BufNewFile,BufRead *.as		setf actionscript

" Thrift
au BufNewFile,BufRead *.thrift		setf thrift

" Go
au BufNewFile,BufRead *.go		setf go

" Associate unknown filetypes
augroup filetypedetect
    au! BufRead,BufNewFile *.vm 	setfiletype html
augroup END

