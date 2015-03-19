if exists('g:loaded_otenki')
  finish
endif
let g:loaded_otenki = 1

if !exists(g:otenki_cityname_data)
  let g:otenki_cityname_data = 'tokyo'
endif

command! -nargs=? Otenki echo otenki#callOtenkiTodayInfo(<f-args>)
command! -nargs=? OtenkiTomorrow echo otenki#callOtenkiTomorrowInfo(<f-args>)
command! -nargs=? OtenkiAfterTomorrow echo otenki#callOtenkiAfterTomorrowInfo(<f-args>)

