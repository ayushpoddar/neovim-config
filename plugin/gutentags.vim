if executable('ctags')
    " Create the `tags` file (may need to install ctags first)
    command! MakeTags !ctags -R .

		" Define what a project means for gutentags
		" First line: the default project root markers are not appended to the user
		" defined ones
		" Second line: Look for .git to find project root
		let g:gutentags_add_default_project_roots = 0
		let g:gutentags_project_root = ['.git']

		" Set the directory where to store the tags files
		let g:gutentags_cache_dir = expand('$XDG_DATA_HOME/nvim/.tmp/ctags/')

		" Clear all ctags
		command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

		" Set options for ctags
		let g:gutentags_ctags_extra_args = [
					\ '--tag-relative=yes',
					\ '--fields=+ailmnS',
					\ ]

		" Exclude the following file types while tagging
		let g:gutentags_ctags_exclude = [
					\ '*.git', '*.svg', '*.hg',
					\ '*/tests/*',
					\ 'build',
					\ 'dist',
					\ '*sites/*/files/*',
					\ 'bin',
					\ 'node_modules',
					\ 'bower_components',
					\ 'cache',
					\ 'compiled',
					\ 'docs',
					\ 'example',
					\ 'bundle',
					\ 'vendor',
					\ '*.md',
					\ '*-lock.json',
					\ '*.lock',
					\ '*bundle*.js',
					\ '*build*.js',
					\ '.*rc*',
					\ '*.json',
					\ '*.min.*',
					\ '*.map',
					\ '*.bak',
					\ '*.zip',
					\ '*.pyc',
					\ '*.class',
					\ '*.sln',
					\ '*.Master',
					\ '*.csproj',
					\ '*.tmp',
					\ '*.csproj.user',
					\ '*.cache',
					\ '*.pdb',
					\ 'tags*',
					\ 'cscope.*',
					\ '*.css',
					\ '*.less',
					\ '*.scss',
					\ '*.exe', '*.dll',
					\ '*.mp3', '*.ogg', '*.flac',
					\ '*.swp', '*.swo',
					\ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
					\ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
					\ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
					\ ]
endif
