cronJob = require('cron').CronJob

module.exports = (robot) ->
  send = (channel, msg) ->
    robot.send {room: channel}, msg

#--------------------クラス定義---------------- 
  #AtCoder関連
  class AtCoder
    #コンテストの通知
    ContestNotification :(name,time,rated,link) -> 
      send '#競プロ', "【お知らせ】\n本日は「"+name+"」が開催されます！\n開催時間:"+time+"\nRated対象:"+rated+"\n"+link

#--------------------インスタンス化----------
  AC=new AtCoder()

  #--------------------AtCoder-----------------------

#new cronJob('0 0 10 * * 6',()->AC.ContestNotification("AtCoder Regular Contest 112","21:00~23:00(120分)","~2799","https://atcoder.jp/contests/arc112")).start()

  #--------------------カスタマイズ--------------------
