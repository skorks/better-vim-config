source helper.vim
call Setup()

execute "normal! 2Gox\<CR>y\<CR>z"
normal 2jdd
normal k
execute 'GitGutterRevertHunk'
call DumpSigns('hunkRevertNearbySigns')
call DumpGitDiff('hunkRevertNearbyGitDiff')
