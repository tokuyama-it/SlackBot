cronJob = require('cron').CronJob

module.exports = (robot) ->
  send = (channel, msg) ->
    robot.send {room: channel}, msg

#--------------------クラス定義---------------- 
  #学校関連
  class School
    #5分前を知らせるメソッド
    FiveMin:(subject)->
      send '#general', "@everyone 5分後に"+subject+"です。"

    #授業終了を知らせるメソッド
    Finished:->
      send '#general', "@everyone\n本日の授業はすべて終了しました。\nお疲れ様でした。"

  #AtCoder関連
  class AtCoder
    #コンテストの通知
    ContestNotification :(name,time,rated,link) -> 
      send '#競プロ', "【お知らせ】\n本日は「"+name+"」が開催されます！\n開催時間:"+time+"\nRated対象:"+rated+"\n"+link

#--------------------インスタンス化----------

  Sc=new School()

#--------------------授業予定--------------------
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
  
  new cronJob('0 0 7 * * 1', () ->
    send '#general', "今日のIE3の授業予定は\n\n1："+IE3[0][0]+"\n2："+IE3[0][1]+"\n3："+IE3[0][2]
    send '@URR4ZUUM8', "今日のME3の授業予定は\n\n1："+ME3[0][0]+"\n2："+ME3[0][1]+"\n3："+ME3[0][2]
  ).start()

  new cronJob('0 0 7 * * 2', () ->
    send '#general', "今日のIE3の授業予定は\n\n1："+IE3[1][0]+"\n2："+IE3[1][1]+"\n3："+IE3[1][2]
    send '@URR4ZUUM8', "今日のME3の授業予定は\n\n1："+ME3[1][0]+"\n2："+ME3[1][1]+"\n3："+ME3[1][2]
  ).start()

  new cronJob('0 0 7 * * 3', () ->
    send '#general', "今日のIE3の授業予定は\n\n1："+IE3[2][0]+"\n2："+IE3[2][1]+"\n3,4："+IE3[2][2]
    send '@URR4ZUUM8', "今日のME3の授業予定は\n\n1："+ME3[2][0]+"\n2："+ME3[2][1]+"\n3："+ME3[2][2]+"\n4："+ME3[2][3]
  ).start()

  new cronJob('0 0 7 * * 4', () ->
    send '#general', "今日のIE3の授業予定は\n\n1："+IE3[3][0]+"\n2："+IE3[3][1]+"\n3："+IE3[3][2]+"\n4："+IE3[3][3]
    send '@URR4ZUUM8', "今日のME3の授業予定は\n\n1："+ME3[3][0]+"\n2："+ME3[3][1]+"\n3："+ME3[3][2]+"\n4："+ME3[3][3]
  ).start()    

  new cronJob('0 0 7 * * 5', () ->
    send '#general', "今日のIE3の授業予定は\n\n1："+IE3[4][0]+"\n2："+IE3[4][1]+"\n3："+IE3[4][2]
    send '@URR4ZUUM8', "今日のME3の授業予定は\n\n1："+ME3[4][0]+"\n2："+ME3[4][1]+"\n3："+ME3[4][2]
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
