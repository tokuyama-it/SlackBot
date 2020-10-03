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
  AC=new AtCoder()
#--------------------毎日SHR-----------------
new cronJob('0 35 8 * * 1-5', () ->Sc.FiveMin("SHR")).start()

#--------------------月曜--------------------
new cronJob('0 45 8 * * 1', () ->send '@URR4ZUUM8', "5分後に「プログラミング基礎」です。").start()

new cronJob('0 45 8 * * 1', () ->Sc.FiveMin("数学II B")).start()

new cronJob('0 25 10 * * 1',() ->Sc.FiveMin("歴史")).start()

new cronJob('0 45 12 * * 1',() ->Sc.FiveMin("物理")).start()

new cronJob('0 25 14 * * 1',() ->Sc.FiveMin("プログラミング")).start()
#--------------------火曜--------------------
new cronJob('0 45 8 * * 2', () ->Sc.FiveMin("体育")).start()

new cronJob('0 25 10 * * 2', () ->Sc.FiveMin("英会話")).start()

new cronJob('0 45 12 * * 2', () ->Sc.FiveMin("総合英語IR")).start()

new cronJob('0 25 14 * * 2', () ->send '@URR4ZUUM8', "5分後に「創造製作I」です。").start()

#--------------------水曜--------------------
new cronJob('0 45 8 * * 3', () ->Sc.FiveMin("国語総合II")).start()

new cronJob('0 25 10 * * 3', () ->Sc.FiveMin("数学II A")).start()

new cronJob('0 45 12 * * 3', () ->Sc.FiveMin("倫理")).start()

new cronJob('0 25 14 * * 3', () ->Sc.FiveMin("プログラミング言語")).start()

new cronJob('0 45 8 * * 3', () ->send '@URR4ZUUM8', "5分後に「基礎設計製図II」です。").start()

new cronJob('0 45 8 * * 3', () ->Sc.FiveMin("コンピュータ工学")).start()

new cronJob('0 25 10 * * 3', () ->Sc.FiveMin("総合英語IW")).start()

new cronJob('0 45 12 * * 3', () ->Sc.FiveMin("数学II A")).start()

#--------------------木曜--------------------
new cronJob('0 45 8 * * 4', () ->Sc.FiveMin("化学I")).start()
new cronJob('0 25 10 * * 4', () ->Sc.FiveMin("芸術科目")).start()
new cronJob('0 45 12 * * 4', () ->send '@URR4ZUUM8', "5分後に「数学II B」です。").start()

new cronJob('0 45 12 * * 4', () ->Sc.FiveMin("電気回路")).start()
new cronJob('0 25 14 * * 4', () ->Sc.FiveMin("HR")).start()

#--------------------金曜--------------------
new cronJob('0 45 8 * * 5', () ->send '@URR4ZUUM8', "5分後に「基礎設計製図II」です。").start()
new cronJob('0 45 8 * * 5', () ->Sc.FiveMin("コンピュータ工学")).start()
new cronJob('0 25 10 * * 5', () ->Sc.FiveMin("総合英語IW")).start()
new cronJob('0 45 12 * * 5', () ->Sc.FiveMin("数学II A")).start()

#--------------------授業終了アナウンス--------------------
new cronJob('0 0 16 * * 1', () ->Sc.Finished()).start()
new cronJob('0 20 15 * * 4', () ->send '#general', "@everyone\n前期の授業がすべて終了しました！\n明日から夏休みです！😎").start()
new cronJob('0 20 14 * * 2,3', () ->Sc.Finished()).start()

#--------------------1日の授業予定アナウンス--------------------
new cronJob('0 0 8 * * 1', () ->
  send '#general', "今日のIE2の授業予定は\n\n1：数学IIB\n2：歴史\n3：物理I\n4：プログラミング"
  send '@URR4ZUUM8', "今日のME2の授業予定は\n\n1：プログラミング基礎\n2：歴史\n3：物理I"
).start()

new cronJob('0 0 8 * * 2', () ->
  send '#general', "今日のIE2の授業予定は\n\n1：体育\n2：英会話\n3：総合英語IR"
  send '@URR4ZUUM8', "今日のME2の授業予定は\n\n1：体育\n2：英会話\n3：総合英語IR\n4：創造製作I"
).start()
  
new cronJob('0 0 8 * * 3', () ->
  send '#general', "今日のIE2の授業予定は\n\n1：国語総合II\n2：数学IIA\n3：倫理\n4：プログラミング言語"
  send '@URR4ZUUM8', "今日のME2の授業予定は\n\n1:国語総合II\n2：数学IIA\n3：倫理"
).start()
  
new cronJob('0 0 8 * * 4', () ->
  send '#general', "今日のIE2の授業予定は\n\n1：化学I\n2：芸術科目\n3：電気回路\n4：HR"
  send '@URR4ZUUM8', "今日のME2の授業予定は\n\n1：化学I\n2：芸術科目\n3：数学II B\n4：HR"
).start()    
  
new cronJob('0 0 8 * * 3', () ->
  send '#general', "今日のIE2の授業予定は\n\n1：コンピュータ工学\n2：総合英語IW\n3：数学IIA"
  send '@URR4ZUUM8', "今日のME2の授業予定は\n\n1：基礎設計製図II\n2：総合英語IW\n3：数学IIA"
).start()

  #--------------------AtCoder-----------------------

#new cronJob('0 0 10 * * 6',()->AC.ContestNotification("AtCoder Beginner Contest 176","21:00~22:40(100分)","~1999","https://atcoder.jp/contests/abc176")).start()

  #--------------------カスタマイズ--------------------

new cronJob('0 20 0 * * *', () ->
  send '#general', "【テスト配信】\n今日のIE2の授業予定は\n\n1：コンピュータ工学\n2：総合英語IW\n3：数学IIA"
).start()