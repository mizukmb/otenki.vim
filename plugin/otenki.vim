if exists('g:loaded_otenki')
  finish
endif
let g:loaded_otenki = 1

command! -nargs=* Otenki echo otenki#callOtenkiInfo('today', <f-args>)
command! -nargs=* OtenkiTomorrow echo otenki#callOtenkiInfo('tomorrow', <f-args>)
command! -nargs=* OtenkiAfterTomorrow echo otenki#callOtenkiInfo('afterTomorrow', <f-args>)

function! MyStatusOtenki()
  if !exists('s:otenkiInfo')
    let s:otenkiInfo = otenki#callOtenkiInfoSimple()
  endif
  return s:otenkiInfo
endfunction
