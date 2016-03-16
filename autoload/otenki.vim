function! otenki#getOtenkiInfo(city, day)
  let res = webapi#http#get('http://weather.livedoor.com/forecast/webservice/json/v1', { "city": a:city })

  if res.status == 500
    return {'status': 500}
  endif

  let date_dict = {'today': 0, 'tomorrow': 1, 'afterTomorrow': 2}
  let date_num = date_dict[a:day]

  let otenki_json = webapi#json#decode(res.content)

  let pref = otenki_json.location.prefecture
  let city = otenki_json.location.city
  let location = pref . city
  let date = otenki_json.forecasts[date_num].dateLabel
  let telop = otenki_json.forecasts[date_num].telop

  return {'status': 200, 'pref': pref,'city': city, 'location': location, 'date': date, 'telop': telop}
endfunction

function! otenki#callOtenkiInfo(day, ...)
  let g:otenki_cityname_data = get(g:, 'otenki_cityname_data', 'tokyo')

  let city = get(a:, 1, g:otenki_cityname_data)

  if !has_key(s:otenki_location_code_dict, city)
    return 'Error!! Not exist city name. > ' . city
  endif

  let city_code = s:otenki_location_code_dict[city]
  let data = otenki#getOtenkiInfo(city_code, a:day)

  if data.status == 500
   return 'Error!! Your PC isn''t connected to the Internet.'
  endif
  return data.location . "の". data.date . "の天気は" . data.telop . "です" 
endfunction

function! otenki#callOtenkiInfoSimple()
  let city = g:otenki_cityname_data
  let city_code = s:otenki_location_code_dict[city]
  let data = otenki#getOtenkiInfo(city_code, 'today')

  if data.status == 500
    return 'Error!!'
  endif
  return data.city . "|" . data.telop
endfunction

let s:otenki_location_code_dict = {
      \'wakkanai': '011000',
      \'asahikawa': '012010',
      \'rumoi': '012020',
      \'abashiri': '013010',
      \'kitami': '013020',
      \'monbetsu': '013030',
      \'nemuro': '014010',
      \'kushiro': '014020',
      \'obihiro': '014030',
      \'muroran': '015010',
      \'uraga': '015020',
      \'sapporo': '016010',
      \'iwamizawa': '016020',
      \'kutchan': '016030',
      \'hakodate': '017010',
      \'esashi': '017020',
      \'aomori': '020010',
      \'mutsu': '020020',
      \'hachinohe': '020030',
      \'morioka': '030010',
      \'miyako': '030020',
      \'ofunato': '030030',
      \'sendai': '040010',
      \'shiroishi': '040020',
      \'akita': '050010',
      \'yokote': '050020',
      \'yamagata': '060010',
      \'yonezawa': '060020',
      \'sakata': '060030',
      \'shinjo': '060040',
      \'fukushima': '070010',
      \'onahama': '070020',
      \'wakamatsu': '070030',
      \'mito': '080010',
      \'tsuchiura': '080020',
      \'utsunomiya': '090010',
      \'ohtawara': '090020',
      \'maebashi': '100010',
      \'minakami': '100020',
      \'saitama': '110010',
      \'kumagaya': '110020',
      \'chichibu': '110030',
      \'chiba': '120010',
      \'choshi': '120020',
      \'tateyama': '120030',
      \'tokyo': '130010',
      \'oshima': '130020',
      \'hachijoshima': '130030',
      \'chichishima': '130040',
      \'yokohama': '140010',
      \'odawara': '140020',
      \'niigata': '150010',
      \'nagaoka': '150020',
      \'takada': '150030',
      \'aikawa': '150040',
      \'toyama': '160010',
      \'fushiki': '160020',
      \'kanazawa': '170010',
      \'wajima': '170020',
      \'fukui': '180010',
      \'atsuga': '180020',
      \'kofu': '190010',
      \'kawaguchiko': '190020',
      \'nagano': '200010',
      \'matsumoto': '200020',
      \'iida': '200030',
      \'gifu': '210010',
      \'takayama': '210020',
      \'shizuoka': '220010',
      \'ajiro': '220020',
      \'mishima': '220030',
      \'hamamatsu': '220040',
      \'nagoya': '230010',
      \'toyohashi': '230020',
      \'tsu': '240010',
      \'owase': '240020',
      \'shiga': '250010',
      \'hikone': '250020',
      \'kyoto': '260010',
      \'maizuru': '260020',
      \'osaka': '270000',
      \'kobe': '280010',
      \'toyooka': '280020',
      \'nara': '290010',
      \'kazeya': '290020',
      \'wakayama': '300010',
      \'shionomisaki': '300020',
      \'tottori': '310010',
      \'yonago': '310020',
      \'matsue': '320010',
      \'hamada': '320020',
      \'saigo': '320030',
      \'okayama': '330010',
      \'tsuyama': '330020',
      \'hiroshima': '340010',
      \'shobara': '340020',
      \'shimonoseki': '350020',
      \'yamaguchi': '350020',
      \'yanagii': '350030',
      \'hagi': '350040',
      \'tokushima': '360010',
      \'hiwasa': '360020',
      \'takamatsu': '370000',
      \'matsuyama': '380010',
      \'niihama': '380020',
      \'uwajima': '380030',
      \'kochi': '390010',
      \'murotomisaki': '390020',
      \'shimizu': '390030',
      \'fukuoka': '400010',
      \'yawata': '400020',
      \'iizuma': '400030',
      \'kurume': '400040',
      \'saga': '410010',
      \'imari': '410020',
      \'nagasaki': '420010',
      \'sasebo': '420020',
      \'izuhara': '420030',
      \'fukue': '420040',
      \'kumamoto': '430010',
      \'aso': '430020',
      \'ushibuka': '430030',
      \'hitoyoshi': '430040',
      \'oita': '440010',
      \'nakatsu': '440020',
      \'hita': '440030',
      \'saeki': '440040',
      \'miyazaki': '450010',
      \'nobeoka': '450020',
      \'tojo': '450030',
      \'takachiho': '450040',
      \'kagoshima': '460010',
      \'kanoya': '460020',
      \'tanegashima': '460030',
      \'naze': '460040',
      \'naha': '471010',
      \'nago': '471020',
      \'kumejima': '471030',
      \'minamidaito': '471040',
      \'miyakojima': '473000',
      \'ishigakijima': '474010',
      \'yonagunijima': '474020'
      \}

