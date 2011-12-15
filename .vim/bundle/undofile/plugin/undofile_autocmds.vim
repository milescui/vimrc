" This file is automatically read and written
if !has("persistent_undo")|finish|endif
augroup UndoFile
au!
au BufReadPre * setlocal undofile
augroup End
