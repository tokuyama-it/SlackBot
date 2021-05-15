module.exports = (robot) ->

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

    #おみくじ機能    
    robot.hear /おみくじ/i, (msg) ->
        omikuji = ["大吉です!!!", "大吉です!!!", "大吉です!!!", "大吉です!!!", "大吉です!!!", "吉です！ 今日はいいことがありそうです!", "吉です！ 大吉の次のやつです!ついてます!", "吉です！ 作業が捗るでしょう!","吉です！ 有意義な一日になるでしょう!", "吉です！ 楽しい1日が過ごせるでしょう!", "吉です！ Twitterで大物にフォローされるかもしれません!!", "吉です！ 充実した1日になりそうです!!","吉です！ あなたにいいことが起きる予感がします...!", "吉です！ 楽しい1日がすごせるでしょう!", "吉です！ 大吉の次のやつです!ついてます!!", "中吉です！ 良い1日となりそうです!","中吉です！ 普段より作業効率があがるでしょう!", "中吉です！ プログラミング運が特にいいです!", "中吉です！ プログラミング運が特にいいです!", "中吉です！ 普段より作業効率が上がるでしょう!","中吉です！ 良い1日となりそうです!", "中吉です！ 成長が実感できることが起こる予感がします...!", "中吉です！ 成長が実感できることが起こる予感がします...!", "中吉です！ タイピング運が特にいいです!","中吉です！ タイピング運が特にいいです!", "中吉です！ 勉強運が高いです!勉強が捗るかもしれません!", "中吉です！ 勉強運が高いです!学問が完全に理解できるかもしれません!!", "中吉です！ 普段より作業効率が上がるでしょう!","中吉です！ プログラミング運が特にいいです!", "中吉です！ 楽しい1日がすごせるでしょう", "小吉です！今日もいつもどおり平和な1日となりそうです!", "小吉です！今日もいつもどおり平和な1日となりそうです!","小吉です！今日も1日頑張りましょう!", "小吉です！今日も1日頑張りましょう!", "小吉です！今日もいつもどおり平和な1日となりそうです!", "小吉です！今日もいつもどおり平和な1日となりそうです!","小吉です！今日も1日頑張りましょう!", "小吉です！今日も1日頑張りましょう!", "小吉です！ラッキーアイテムは「関数電卓」です!", "小吉です！ラッキーアイテムは「;(セミコロン)」です!","小吉です！ラッキーアイテムは「int型」です!", "小吉です！ラッキーアイテムは「boolean型」です!", "小吉です！ラッキーアイテムは「適正言語」です!", "小吉です！ラッキーアイテムは「:(コロン)」です!","小吉です！ラッキーアイテムは「double型」です！", "小吉です！寿司打運がたかいです!!", "小吉です！ラッキーアイテムは「関数電卓」です!", "小吉です！ラッキーアイテムは「;(セミコロン)」です!","小吉です！ラッキーアイテムは「@(アットマーク)」です!", "小吉です！プログラミング運がたかいです!", "小吉です！競プロ運が高いです!", "小吉です！今日も1日がんばりましょう!!","小吉です！ラッキーアイテムは「boolean型」です!", "小吉です！ラッキーアイテムは「sudo」です！気をつけて使ってください!", "小吉です！ラッキーアイテムは「キーボード」です!キーボードを使う作業が捗るでしょう!","小吉です！今日もいつもどおり平和な1日となりそうです!", "小吉です！ラッキーアイテムは「x86」です! 32bitの存在を忘れないでください...!", "小吉です！ラッキーワードは「マウス」です!","小吉です！ラッキーアイテムは「AtCoder」です!競プロの調子がいいかもしれません!", "小吉です！今日も1日頑張りましょう!","小吉です！今日もいつもどおり平和な1日となりそうです!", "小吉です！ラッキーアイテムは「RDBMS」です!", "小吉です！ラッキーアイテムは「Fire Fox」です!","小吉です！ラッキーアイテムは「double型」です!", "小吉です！今日もいつもどおり平和な1日となりそうです!", "小吉です！今日もいつもどおり平和な1日となりそうです!","小吉です！プログラミング運が高いです！", "小吉です！寿司打運が高いです! 調子がいいかもしれません!", "小吉です！今日も1日頑張りましょう!", "小吉です！ラッキーアイテムは「ネットサーフィン」です!しすぎには注意してください!","小吉です！ラッキーアイテムは「適正言語」です!", "小吉です！ラッキーアイテムは「゛(濁点)」です!", "小吉です！今日も1日頑張りましょう!", "小吉です！今日も1日頑張りましょう!","小吉です！今日も1日頑張りましょう!", "末吉です！ラッキーアイテムは「ESC(エスケープ)」です!", "末吉です！ラッキーアイテムは「`(バッククォート)」です！","末吉です！ラッキーアイテムは「_(アンダーバー)」です!", "末吉です！大吉目指して毎日トライしてみてください！", "末吉です！大吉目指して毎日トライしてみてください！","末吉です！大吉目指して毎日トライしてみてください！", "末吉です！作業に集中するとものすごい捗るかもしれません！", "末吉です！神社で出たらなんとも言えないやつですね...！","末吉です！神社で出たらなんともいえないやつですね...！", "末吉です！神社で出たらなんとも言えないやつですね...！", "末吉です！ラッキーアイテムは「||(論理和)」！","末吉です！ラッキーアイテムは「&&(論理積)」！", "末吉です！今日も1日頑張りましょう！", "末吉です！ラッキーアイテムは「!(論理否定)」です！", "末吉です！決して運が悪いわけではありませんよ！","末吉です！ラッキーアイテムは「||(論理和)」！", "末吉です！明日は小吉目指してトライしてみてください！", "末吉です！ラッキーアイテムは「TweetDeck」です！", "末吉です！ラッキーアイテムは「&&(論理積)」です！", "末吉です！ラッキーアイテムは「TweetDeck」です！", "凶です...。(確率:4%)", "凶です...。(確率:4%)", "凶です...。(確率:4%)", "凶です...。(確率:4%)", "!!!...大凶です...!!!(確率:1%)"]
        msg.send "<@" + msg.message.user.id + ">さんの今日の運勢は..."
        mikuji_kekka = msg.random omikuji
        if (mikuji_kekka == "凶です...。(確率:4%)" || mikuji_kekka == "!!!...大凶です...!!!(確率:1%)")
            msg.send "えっと、非常に申し上げにくいんですが...。\n"+mikuji_kekka
            if mikuji_kekka == "凶です...。(確率:4%)"
                msg.send "とはいえ、きっとなにかいいことがあるはず...!今日もがんばりましょう!!"
            else
                msg.send "Botくんのせいじゃないんです!!ごめんなさい!!\n一日、お気をつけてください...。"
        else if (mikuji_kekka == "大吉です!!!")
            msg.send "おおおおおおおおおめでとうございます!!!!\n"+mikuji_kekka+"\n今日は最高の一日になるでしょう!"
        else
            msg.send mikuji_kekka;

    #おみくじの各運勢の確率を返す
    robot.hear /man omikuji/i, (msg) ->
        msg.send "おみくじの各運勢の出る確率は以下のとおりです。\n大吉：5%\n\n吉　：10%\n\n中吉：15%\n\n小吉：45%\n\n末吉：20%\n\n凶　：4%\n\n大凶：1%"

    #名詞+動詞をランダムで返す
    robot.hear /なにするべき?/i, (msg) ->
        should = ["オブジェクト指向", "slack", "Python", "Java", "VSCode", "スマホ", "アプリ", "自分", "D言語くん", "Botくん", "シングルクォート", "JavaScript", "関数型言語"]
        should2 = ["書く", "愛する", "可愛がる", "なでる", "つくる", "怒る", "戒める", "褒める", "食べる",]
        msg.send "<@" + msg.message.user.id + "> さんがするべきことは..."
        msg.send "「" + msg.random(should) + "を" + msg.random(should2) + "」です！！\n\n(「◯◯を◯◯」のランダムな組み合わせです)"

    #言語をランダムで返す
    robot.hear /適正言語/i, (msg) ->
        msg.send "<@" + msg.message.user.id + "> さん、本日の適正言語は..."
        lang = ["Go","Kotlin","R言語","Perl","F#","OCaml","Scala","Java", "Python", "C言語", "C++", "JavaScript", "Ruby", "Swift", "Rust", "Shell Script", "C#"];
        msg.send msg.random(lang) + 'です！'

    #slack上のユーザーIDを返信
    robot.hear /id取得/i, (msg) ->
        msg.send "" + msg.message.user.id
  
    #AtCoderのレートをランダムで表示
    robot.hear /新レート/i, (msg) ->
        source = new Array(3000)
        for i in [0..3000]
            source[i] = i + 100
        rate = msg.random source

        msg.send "<@" + msg.message.user.id + "> さんの新レートは..."
        if (rate < 400)
            msg.send rate + "(灰)です！"
        else if (rate < 800)
            msg.send rate + "(茶)です！"
        else if (rate < 1200)
            msg.send rate + "(緑)です！"
        else if (rate < 1600)
            msg.send rate + "(水)です！"
        else if (rate < 2000)
            msg.send rate + "(青)です！"
        else if (rate < 2400)
            msg.send rate + "(黄)です！"
        else if (rate < 2800)
            msg.send rate + "(橙)です！"
        else
            msg.send rate + "(赤)です！"

    #IEの時間割
    robot.hear /時間割/i, (msg) ->
        Jikan=""
        for i in IE3
            Jikan+=i+"\n"
        msg.send Jikan

    #MEの時間割
    robot.hear /ME時間割/i, (msg) ->
        Jikan=""
        for i in ME3
            Jikan+=i+"\n"
        msg.send Jikan


    robot.hear /癒して/i, (msg) ->
        msg.send "にゃーん\n"+CatImg()


CatImg = (height, width)->
  height = height ||  Math.floor(Math.random()*250) + 250
  width = width  || Math.floor(Math.random()*250) + 250
  root = "http://placekitten.com"
  root += "/g" if Math.random() > 0.5
  return "#{root}/#{height}/#{width}#.png"