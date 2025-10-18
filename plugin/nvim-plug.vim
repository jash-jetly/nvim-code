" ===================================================
" NVIM-CODE: Gemini AI Integration by Jash Jetly
" ===================================================

" Define a sign for changed lines
sign define GeminiChanged text=✱ texthl=DiffChange linehl=NONE

" Main :Code command
command! -nargs=+ Code call GeminiSmartApply(<f-args>)

function! GeminiSmartApply(...) abort
  " Combine prompt args
  let l:prompt   = join(a:000, ' ')
  let l:original = getline(1, '$')
  let l:stdin    = join(l:original, "\n")

  " Detect filename and language
  let l:filename = expand('%:t')
  let l:ext      = expand('%:e')

  let l:lang_map = {
        \ 'py': 'Python', 'js': 'JavaScript', 'ts': 'TypeScript',
        \ 'java': 'Java', 'cpp': 'C++', 'c': 'C', 'html': 'HTML',
        \ 'css': 'CSS', 'go': 'Go', 'rs': 'Rust', 'php': 'PHP',
        \ 'rb': 'Ruby', 'sh': 'Shell' }

  let l:lang = get(l:lang_map, l:ext, 'plain text')

  " Construct prompt
  let l:full_prompt = 'You are coding inside a file named ' . l:filename .
        \ ' which uses ' . l:lang . '. ' . l:prompt

  " Run Gemini CLI
  let l:cmd = 'gemini-chat ' . shellescape(l:full_prompt)
  let l:output = systemlist(l:cmd, l:stdin)

  " Handle errors
  if v:shell_error
    echohl ErrorMsg | echo "❌ AI failed." | echohl None
    return
  endif

  " No changes
  if join(l:output, "\n") ==# l:stdin
    echo "✅ No changes made"
    return
  endif

  " Clear signs
  call sign_unplace('gemini')

  let l:buf = bufnr('%')
  let l:linecount = max([len(l:original), len(l:output)])

  " Highlight changed lines
  for l:i in range(l:linecount - 1)
    let l:orig_line = get(l:original, l:i, '')
    let l:new_line  = get(l:output, l:i, '')
    if l:orig_line !=# l:new_line
      call sign_place(l:i + 1, 'gemini', 'GeminiChanged', l:buf, {'lnum': l:i + 1})
    endif
  endfor

  " Replace buffer
  undojoin
  execute '%delete _'
  call append(0, l:output)

  echo "✨ AI updated " . l:filename . " (" . l:lang . ")"
endfunction

" Keymaps
nnoremap <leader>gg :Code clean and optimize this code<CR>
nnoremap <leader>uh :sign unplace * group=gemini<CR>
