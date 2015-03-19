if exists('g:loaded_otenki')
  finish
endif
let g:loaded_otenki = 1

command! -nargs=? Otenki echo otenki#callOtenkiTodayInfo(<f-args>)
command! -nargs=? OtenkiTomorrow echo otenki#callOtenkiTomorrowInfo(<f-args>)
command! -nargs=? OtenkiAfterTomorrow echo otenki#callOtenkiAfterTomorrowInfo(<f-args>)

