" :augroup blog
"   :  autocmd!
"   :  autocmd BufReadPre,FileReadPre	    *.blog set bin
"   :  autocmd BufReadPost,FileReadPost	*.blog silent execute "'[,']!log2text -i <afile> -l ".expand("~/.logtool/skype.logmap")  | %s/$//
"   :  autocmd BufReadPost,FileReadPost	*.blog set nobin
"   :  autocmd BufReadPost,FileReadPost	*.blog execute ":doautocmd BufReadPost " . expand("%:r")
" :augroup END
