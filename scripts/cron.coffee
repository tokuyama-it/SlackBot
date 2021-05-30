cronJob = require('cron').CronJob

#時間割
IE3=[
  ['国語総合II','物理II','数学IIIA']
  ['アルゴリズムとデータ構造','体育','数学IIIB']
  ['コンピュータシステム概論','情報数学','電子工学実験']
  ['哲学','アナログ回路','確率','HR']
  ['計測工学','総合英語IIR','ディジタル回路']
]
ME3=[
  ['物理II','哲学','数学IIIB']
  ['プログラミング応用','体育','総合英語IIR']
  ['設計製図I','国語総合II','機構学','コンピュータ制御']
  ['創造演習II','数学IIIA','工業力学','HR']
  ['電子回路I','アクチュエータ','材料学I']
]
CA3=[
    ['建築計画I','数学IIIA','物理II']
    ['情報処理','体育','測量実習']
    ['CAD基礎','総合英語IIR','数学IIIB']
    ['構造力学基礎','水力学基礎','哲学','HR']
    ['国語総合II','工学デザイン基礎III','地盤工学基礎']
]


module.exports = (robot) ->
  send = (channel, msg) ->
    robot.send {room: channel}, msg

  D = new Date

#--------------------関数定義------------------
  #天気予報
  WeatherApiKey=process.env.WeatherAPI
  searchWeather=()->
    request=robot.http("http://api.openweathermap.org/data/2.5/weather?q=Tokuyama,jp&appid=#{WeatherApiKey}&units=metric").get()
    stMessage = request (err,res,body) ->
      json = JSON.parse body
      weatherName = json['weather'][0]['main']
      message="今日の天気は"+weatherName+"です！"
      send '#general', message

#--------------------クラス定義---------------- 
  #学校関連
  class School
    #5分前
    FiveMin:(subject)->
      send '#general', "@everyone 5分後に"+subject+"です。"

    #授業終了
    Finished:->
      send '#general', "@everyone\n本日の授業はすべて終了しました。\nお疲れ様でした。"

    #時間割
    Jikanwari:->
      #配列用に-1
      Day=D.getDay()-1

      text_ME="今日のME3の授業予定は\n\n"
      for i in [0..ME3[Day].length-1]
        text_ME+=i+1+"："+ME3[Day][i]+"\n"
      send '@URR4ZUUM8', text_ME

      text_IE="今日のIE3の授業予定は\n\n"
      for i in [0..IE3[Day].length-1]
        text_IE+=i+1+"："+IE3[Day][i]+"\n"
      send '#general', text_IE

  #AtCoder関連
  class AtCoder
    #コンテストの通知
    ContestNotification :(name,time,rated,link) -> 
      send '#競プロ', "【お知らせ】\n本日は「"+name+"」が開催されます！\n開催時間:"+time+"\nRated対象:"+rated+"\n"+link

#--------------------スケジュール--------------------  
  Sc=new School()

  new cronJob('0 0 7 * * 1-5',()->
    Sc.Jikanwari()
    searchWeather()
  ).start()

#--------------------AtCoder-----------------------
  AC=new AtCoder()

  new cronJob('0 0 12 16 May 0',()->AC.ContestNotification("AtCoder Regular Contest 119","21:00~23:00(120分)","~2799","https://atcoder.jp/contests/arc119")).start()
  new cronJob('0 0 10 22 May 6',()->AC.ContestNotification("AtCoder Heuristic Contest 003","2021-05-22(土) 12:00 ~ 2021-05-30(日) 20:00","-","https://atcoder.jp/contests/ahc003")).start()
  new cronJob('0 0 10 22 May 6',()->AC.ContestNotification("エイシングプログラミングコンテスト2021（AtCoder Beginner Contest 202）","2021-05-22(土) 21:00 ~ 2021-05-22(土) 22:40 (100分)","~ 1999","https://atcoder.jp/contests/abc202")).start()
  new cronJob('0 0 10 23 May 0',()->AC.ContestNotification("AtCoder Regular Contest 120","2021-05-23(日) 22:00 ~ 2021-05-24(月) 00:00 (120分)","~ 2799","https://atcoder.jp/contests/arc120")).start()
  new cronJob('0 0 10 29 May 6',()->AC.ContestNotification("NOMURA プログラミングコンテスト 2021(AtCoder Regular Contest 121)","2021-05-29(土) 21:00 ~ 2021-05-29(土) 23:00 (120分)","~ 2799","https://atcoder.jp/contests/arc121")).start()
  new cronJob('0 0 10 30 May 0',()->AC.ContestNotification("AtCoder Beginner Contest 203（Sponsored by Panasonic）","2021-05-30(日) 21:00 ~ 2021-05-30(日) 22:40 (100分)","~ 1999","https://atcoder.jp/contests/abc203")).start()

#--------------------カスタマイズ--------------------
  new cronJob('0 0 21 * * *',()->
    Day=D.getDay()

    if Day == 0
      send '@URR4ZUUM8', "本日の英単語は1800-1900です。"

    else if Day == 1
      send '@URR4ZUUM8', "本日の英単語は1-300です。"

    else if Day == 2
      send '@URR4ZUUM8', "本日の英単語は300-600です。"

    else if Day == 3
      send '@URR4ZUUM8', "本日の英単語は600-900です。"

    else if Day == 4
      send '@URR4ZUUM8', "本日の英単語は900-1200です。"

    else if Day == 5
      send '@URR4ZUUM8', "本日の英単語は1200-1500です。"

    else if Day == 6
      send '@URR4ZUUM8', "本日の英単語は1500-1800です。"
  ).start()

new cronJob('0 0 7 * * *',()->
    Day=D.getDay()

    if Day == 1
      send '@URR4ZUUM8', "本日の英単語は1800-1900です。"

    else if Day == 2
      send '@URR4ZUUM8', "本日の英単語は1-300です。"

    else if Day == 3
      send '@URR4ZUUM8', "本日の英単語は300-600です。"

    else if Day == 4
      send '@URR4ZUUM8', "本日の英単語は600-900です。"

    else if Day == 5
      send '@URR4ZUUM8', "本日の英単語は900-1200です。"

    else if Day == 6
      send '@URR4ZUUM8', "本日の英単語は1200-1500です。"

    else if Day == 0
      send '@URR4ZUUM8', "本日の英単語は1500-1800です。"
      
  ).start()