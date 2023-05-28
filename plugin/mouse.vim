" Enable mouse for all modes
set mouse=a
" Variable to track mouse enabled flag
let g:is_mouse_enabled = 1

" Toggles mouse
function ToggleMouse()
	if g:is_mouse_enabled == 1
		echo "Mouse OFF"	
		set mouse=
		let g:is_mouse_enabled = 0
	else
		echo "Mouse ON"	
		set mouse=a 
		let g:is_mouse_enabled = 1
	endif	
endfunction
