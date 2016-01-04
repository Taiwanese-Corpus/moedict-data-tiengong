#!/usr/bin/env perl6
use v6;

=begin sample
zung
粽
(作弄切，宗去聲。角黍也。)
參考「粽仔」。
參考「肉粽粽仔」。
=end sample

grammar G {
    token sig-rank { <[ \xE897 .. \xE89F ]> } # 1 - 9
    token sig-example { \xE738 } # 例
    rule syllable { '<i>' '<b>' .*? (<-[<>\s]>+) '</b>' '</i>' }
    rule TOP { ^ [ .*? <syllable> ]+ .* }
}

class A {
    method sig-rank ($/) { $/.make( $/.ord - 0xE896) }
    method syllable ($/) { $/.make: $0 }
    method TOP ($/) { $/.make: $<syllable>».made }
}

my $match = G.parse: sample, actions => A.new;
say $match.made;

sub sample { '
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zung
	</b></i></font></font><font face="新細明體"><span lang="zh-TW"><font face="華康中黑體"><font size="2" style="font-size: 11pt"><b>粽綜錝</b></font></font></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="新細明體"><span lang="zh-TW"><font face="細明體"><b>粽</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>(</b></font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><font size="1" style="font-size: 8pt"><b>作弄</b></font></font><font size="1" style="font-size: 8pt"><b>切，宗去聲。角黍也。</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>)</b></font></font></p>
	<p style="text-indent: 0cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">參考「<font face="細明體">粽</font>仔」。</span></font></p>
	<p style="text-indent: 0cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">參考「肉粽粽仔」。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zung
	è </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">粽仔＝用竹葉或竹籜裹糯米和佐料所製成的食品，客家習俗通常在端午節及七月半做來吃。客家粽包括有米粽、粄粽、焿粽。</span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zung
	kuan </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">粽擐＝綁粽子用的繩串。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>包<font face="細明體">粽</font>仔之前，愛先<font face="細明體">粽擐吊</font>起來。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zung</font><font size="1" style="font-size: 8pt">
	</font><font size="2" style="font-size: 11pt">yap
	</font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">粽葉＝包粽子時用的竹葉。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">焿粽愛用粽葉來包，較脆；米粽愛用竹殼來包，較球；粄粽愛用月桃葉來包，較夭。</span></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zụt
	</b></i></font></font><font face="新細明體"><span lang="zh-TW"><font face="華康中黑體"><font size="2" style="font-size: 11pt"><b>卒脺</b></font></font></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW"><font face="細明體"><b>卒</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>(</b></font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><font size="1" style="font-size: 8pt"><b>臧</b></font></font><font size="1" style="font-size: 8pt"><b>沒切，尊入聲。說文：隸人給事者。</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>)</b></font></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">兵士。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>兵<font face="細明體">卒</font>。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW"><font face="細明體">象棋</font>中的<font face="細明體">卒</font>子。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW"><font face="細明體">終</font>了。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">卒業</font>。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">心情<font face="細明體">悒鬱</font>。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>心情殟</span></font><font face="Times New Roman, serif">(vụt)</font><font face="新細明體"><span lang="zh-TW"><font face="細明體">卒</font>。</span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW"><font face="細明體"><b>脺</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>(</b></font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><font size="1" style="font-size: 8pt"><b>客語借用字</b></font></font><font size="1" style="font-size: 8pt"><b>。</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>)</b></font></font></p>
	<p style="text-indent: 0cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">胖的樣子。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal"><font face="標楷體">人害人肥脺脺，天害人一把骨。</font></span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">z</font><font size="2" style="font-size: 11pt">ụ</font><font size="2" style="font-size: 11pt">t
	è </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">卒仔＝</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">小兵。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">毋好看別人恁無，成時細卒仔乜會建立大功勞。</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">象棋中的卒子。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">卒仔過河，一步一步行，堵佇象腳、馬腳就當有用處。</span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">z</font><font size="2" style="font-size: 11pt">ụ</font><font size="2" style="font-size: 11pt">t
	ngiap </font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><span lang="ja-JP">卒業</span></font><span lang="ja-JP">＝</span><font face="細明體"><span lang="ja-JP">畢業，源自日本語「卒業</span></font></span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW"><font face="MS Mincho"><font size="1" style="font-size: 8pt"><span lang="ja-JP">そつぎ</span></font></font><font face="MS Mincho"><font size="1" style="font-size: 8pt"><span lang="ja-JP">ょ</span></font></font><font face="MS Mincho"><font size="1" style="font-size: 8pt"><span lang="ja-JP">う</span></font></font></span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><span lang="ja-JP">」</span></font><span lang="ja-JP">。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>你看佢小學都無<font face="細明體">卒業</font>，事<font face="細明體">業</font>乜做到<font face="細明體">拚拚袞</font>。</span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zut
	</b></i></font></font><font face="新細明體"><span lang="zh-TW"><font face="華康中黑體"><font size="2" style="font-size: 11pt"><b>啐椊</b></font></font></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW"><b>啐</b></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>(</b></font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><font size="1" style="font-size: 8pt"><b>子聿</b></font></font><font size="1" style="font-size: 8pt"><b>切，即聿切，即律切，音卒。嘈啐，眾聲也。</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>)</b></font></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">被人利用的傻子，參考「阿啐頭」。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">細語不斷的樣子，又作「</span></font><font face="Times New Roman, serif">cut</font><font face="新細明體"><span lang="zh-TW">」。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>唧唧啐啐</span></font><font face="Times New Roman, serif">(zit
	zit zut zut)</font><font face="新細明體"><span lang="zh-TW">。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">參考「肉啐啐仔」。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="新細明體"><span lang="zh-TW"><font face="細明體"><b>椊</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>(</b></font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><font size="1" style="font-size: 8pt"><b>昨</b></font></font><font size="1" style="font-size: 8pt"><b>沒切，存入聲。唐韻：</b></font><font face="細明體"><font size="1" style="font-size: 8pt"><b>椊</b></font></font><font size="1" style="font-size: 8pt"><b>杌，以柄內孔也。玉篇：柱頭枘也。</b></font></span></font><font face="Times New Roman, serif"><font size="1" style="font-size: 8pt"><b>)</b></font></font><font face="新細明體"><span lang="zh-TW"><b>讀音作「</b></span></font><font face="Times New Roman, serif"><b>cụt</b></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><b>」</b></font><b>。</b></span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">塞子。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">樹椊</font>仔。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">塞住。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">椊緪</font>、<font face="細明體">椊倒</font>轉去。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">頭<font face="細明體">撞</font>地。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">椊</font>落<font face="細明體">崩崗</font>下、<font face="細明體">椊</font>捯。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">塞</span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW"><font face="細明體">某</font>物</span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW">給人。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>名片<font face="細明體">椊</font>等來、<font face="細明體">椊</font>分佢。</span></font></p>
	<p style="margin-left: 0.68cm; text-indent: -0.33cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">放置。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">椊</font>奈位去。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	bún g</font><font size="2" style="font-size: 11pt"><u>i</u></font><font size="2" style="font-size: 11pt">
	</font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊</font>分佢＝塞給他。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>你插蛸佢愛<font face="細明體">抑無</font>愛，<font face="細明體">椊</font>分佢就好走哩。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	bún g</font><font size="2" style="font-size: 11pt"><u>i</u></font><font size="2" style="font-size: 11pt">
	sì </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊分佢死＝抓他的頭撞地，把他給撞死。</span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">z<span dir="ltr" style="float: left; width: 5cm; height: 0.5cm; border: none; padding: 0cm; background: #ffffff">
		<p align="right" style="margin-left: 0cm; text-indent: 0cm; margin-bottom: 0cm; line-height: 0.42cm">
		<font face="Times New Roman, serif"><i>zung </i></font><font face="新細明體"><span lang="zh-TW">－</span></font><font face="Times New Roman, serif"><i>zut
		</i></font>
		</p>
	</span>ut dèn </font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊</font>等＝塞子塞住。<font face="華康粗黑體"><font size="1"><b></b></font></font>好得有<font face="細明體">椊</font>仔<font face="細明體">椊</font>等，無<font face="細明體">俟</font>早都揮發淨淨哩。</span></font>
	</p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	dèn l</font><font size="2" style="font-size: 11pt"><u>o</u></font><font size="2" style="font-size: 11pt">i
	</font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊</font>等來＝</span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW">很多東西</span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW">塞著過來。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>人看佢山歌唱到恁好，名片相<font face="細明體">埰椊</font>等來分佢，<font face="細明體">想</font>愛認識佢。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	dò </font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊</font>捯＝頭<font face="細明體">撞</font>到地。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>佢上隻月<font face="細明體">椊</font>捯了後，無<font face="細明體">醒</font>來過，醫生<font face="細明體">宣</font>布佢傷捯大腦，可能會變<font face="細明體">植</font>物人。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	do zòn hi </font></font><font face="新細明體"><span lang="zh-TW">椊倒轉去＝把蓋子蓋回去。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>豆<font face="細明體">油倒</font>好過後，<font face="細明體">椊</font>仔愛<font face="細明體">椊倒</font>轉去，正毋會走味。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	è </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊仔＝瓶口的塞子。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>頭擺罌仔都用<font face="細明體">樹椊</font>仔來<font face="細明體">椊</font>，這下用<font face="細明體">捦</font>上去个，其<font face="細明體">實</font>做毋得講係<font face="細明體">椊</font>仔哩。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	h</font><font size="2" style="font-size: 11pt"><u>e</u></font><font size="2" style="font-size: 11pt">n
	</font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊緪</font>＝塞子塞緊。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">酒椊</font>仔愛<font face="細明體">椊緪來</font>，無<font face="細明體">俟</font></span></font><font face="Times New Roman, serif">(s<u>i</u>i)</font><font face="新細明體"><span lang="zh-TW">會走味哦！</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	het het </font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊閡閡</font>＝塞得緊緊地。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">椊</font>仔<font face="細明體">椊閡閡</font>，挷毋起來，看你有辦法嚒？</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut</font>
	<font size="2" style="font-size: 11pt">lok</font> <font size="2" style="font-size: 11pt">bén</font>
	<font size="2" style="font-size: 11pt">góng</font> <font size="2" style="font-size: 11pt">há
	</font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊</font>落<font face="細明體">崩崗</font>下＝<font face="細明體">栽</font>下<font face="細明體">懸崖</font>下去。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>奇<font face="細明體">怪</font>！這<font face="細明體">崩崗漘</font>也無大轉<font face="細明體">彎</font>，<font face="細明體">警</font>示牌也清清楚楚，仰會長<font face="細明體">透</font>有人<font face="細明體">椊</font>落<font face="細明體">崩崗</font>下，係毋係…？<font face="細明體">唉唷</font>！<font face="細明體">莫想</font>較<font face="細明體">贏</font>，<font face="細明體">想</font>起來會發屎驚。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	lok bí t</font><font size="2" style="font-size: 11pt"><u>o</u></font><font size="2" style="font-size: 11pt">ng
	dù </font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體">椊</font>落<font face="細明體">陂塘</font>肚＝<font face="細明體">栽</font>到<font face="細明體">池塘裡</font>去。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">昨</font>晡暗，阿成食<font face="細明體">酒</font>食到醉仔，<font face="細明體">椊</font>落<font face="細明體">陂塘</font>肚，<font face="細明體">險險浸</font>死。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	lok hi </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊落去＝</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">把蓋子蓋上去。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">豆油倒好，椊仔椊落去，再過拿冰箱肚放。</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">摔下去。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>佇這崩崗頂椊落去，該俟</span></font><font face="Times New Roman, serif">(s<u>i</u>i)</font><font face="新細明體"><span lang="zh-TW">會無命哦！</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	lut t</font><font size="2" style="font-size: 11pt"><u>e</u></font><font size="2" style="font-size: 11pt">u
	</font></font><font face="新細明體"><span lang="zh-TW">椊硉頭＝</span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW">鍋蓋等上面的</span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW">小把手。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">鑊蓋頂</font>个<font face="細明體">椊硉頭</font>撙毋<font face="細明體">緪</font>哩，<font face="細明體">今晡日轉夜買隻轉來</font>。</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	nai vi hi lè </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊奈位去哩＝放哪兒去了？</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">鑿仔椊到奈位去哩？仰櫥仔、拖箱角尋透透還尋毋捯？</span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	sì </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊死＝栽下而死。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">其老公幾下年前騎車仔經過高橋，毋知仰仔踵下去椊死忒。</span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	sì g</font><font size="2" style="font-size: 11pt"><u>i</u></font><font size="2" style="font-size: 11pt">
	</font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊死佢＝</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">抓他的頭來撞地，把他給撞死。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">這夭壽仔！係講分</span><span style="letter-spacing: normal">捯</span><span style="letter-spacing: normal">，椊死佢。</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">咒人栽下而死。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">車仔騎恁亟，椊死佢。</span></span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zut
	sì sì </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">椊死死＝栽下而且當場死亡，語氣強調作「</span></span></font><font face="Times New Roman, serif">zut
	sí sì</font><font face="新細明體"><span lang="zh-TW"><font face="細明體">」</font><span style="letter-spacing: normal">。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><span style="letter-spacing: normal">後生人就係恁儴，講毋聽，佇山頂騎車仔還騎當亟，踵落崩崗，椊死死。</span></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>z<span dir="ltr" style="float: left; width: 5cm; height: 0.5cm; border: none; padding: 0cm; background: #ffffff">
		<p align="left" style="margin-left: 0cm; text-indent: 0cm; margin-bottom: 0cm; line-height: 0.42cm">
		<font face="Times New Roman, serif"><i>zut </i></font><font face="新細明體"><span lang="zh-TW">－</span></font><font face="Times New Roman, serif"><i>zziot
		</i></font>
		</p>
	</span>ze </b></i></font></font>
	</p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zze
	lì </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">軟糖，源自日本語「ゼリー」，英語「</span></span></font><font face="Times New Roman, serif">jelly</font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">」，是臺灣自日治時代以來的小零食，亦用於祭品「五燥」之一。</span></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zzi
	</b></i></font></font>
	</p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="新細明體"><span lang="zh-TW">參考「</span></font><font face="Times New Roman, serif"><b>l</b><u><b>a</b></u><b>
	zzi ò</b></font><font face="新細明體"><span lang="zh-TW"><b>」</b>。</span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zziak
	</b></i></font></font>
	</p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zziak
	k</font><font size="2" style="font-size: 11pt"><u>i</u></font><font size="2" style="font-size: 11pt">
	</font></font><font face="新細明體"><span lang="zh-TW">千斤頂，源自日本語「<font size="1" style="font-size: 8pt">じゃっき</font>」，英語「</span></font><font face="Times New Roman, serif">jack</font><font face="新細明體"><span lang="zh-TW">」，<span style="letter-spacing: normal">六堆客家作「萬力、鐵人仔」。</span></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zziàm
	</b></i></font></font>
	</p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zziàm
	bb</font><font size="2" style="font-size: 11pt"><u>a</u></font><font size="2" style="font-size: 11pt">
	</font></font><font face="新細明體"><span lang="zh-TW"><span lang="ja-JP">運動外套，源自日本語「</span><font size="1" style="font-size: 8pt"><span lang="ja-JP">ジャンパー</span></font><span lang="ja-JP">」。</span></span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zziò
	</b></i></font></font>
	</p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zziò
	d</font><font size="2" style="font-size: 11pt"><u>o</u></font><font size="2" style="font-size: 11pt">
	</font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">棒極了、好極了。源自日本語「上等</span></span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW"><font size="1" style="font-size: 8pt">じょうとう</font></span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">」，又作「</span></span></font><font face="Times New Roman, serif">zziot
	dò</font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">」。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font></span></font><font face="Times New Roman, serif">zziò
	d<u>o</u></font><font face="新細明體"><span lang="zh-TW">！這擺考<font face="細明體">試</font>个題目，全部有<font face="細明體">準備</font>捯，考好學校應該無麼个問題。</span></font></p>
	<p class="western" style="margin-left: 0.64cm; text-indent: -0.64cm; margin-bottom: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zzio
	</b></i></font></font>
	</p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zzio
	lò </font></font><font face="新細明體"><span lang="zh-TW"><font face="細明體"><span lang="ja-JP">噴壺</span></font><span lang="ja-JP">，源自日語「如</span><font face="細明體"><span lang="ja-JP">雨露</span></font></span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW"><font size="1" style="font-size: 8pt"><span lang="ja-JP">じょうろ</span></font></span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW"><span lang="ja-JP">、如</span><font face="細明體"><span lang="ja-JP">露</span></font></span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW"><font size="1" style="font-size: 8pt"><span lang="ja-JP">じょろ</span></font></span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW"><span lang="ja-JP">」。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font>淋<font face="細明體">白</font>菜，水愛用<font face="細明體">閕</font>，無就用</span></font><font face="Times New Roman, serif">zzio
	lò </font><font face="新細明體"><span lang="zh-TW">來<font face="細明體">噴</font>，做毋得用<font face="細明體">潑</font>。<font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b>又</b></font></font><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font><font face="細明體">牽</font>豬哥个人手項長<font face="細明體">透</font>拿等</span></font><font face="Times New Roman, serif">zzio
	lò </font><font face="新細明體"><span lang="zh-TW"><font face="細明體">，你仰</font>手項也長<font face="細明體">透</font>拿等</span></font><font face="Times New Roman, serif">zzio
	lò </font><font face="新細明體"><span lang="zh-TW">？你也<font face="細明體">牽</font>豬哥係嚒？</span></font></p>
	<p class="western" style="margin-bottom: 0cm; line-height: 0.53cm"><font face="Times New Roman, serif"><font size="4" style="font-size: 14pt"><i><b>zziot
	</b></i></font></font>
	</p>
	<p class="western" style="margin-bottom: 0cm; border: none; padding: 0cm; line-height: 0.53cm">
	<font face="Times New Roman, serif"><font size="2" style="font-size: 11pt">zziot
	dò </font></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">棒極了、好極了。源自日語「上等</span></span></font><font face="Times New Roman, serif">(</font><font face="新細明體"><span lang="zh-TW"><font size="1" style="font-size: 8pt">じょうとう</font></span></font><font face="Times New Roman, serif">)</font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">」，又作「</span></span></font><font face="Times New Roman, serif">zziò
	d<u>o</u></font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">」。</span><font face="華康粗黑體"><font size="1" style="font-size: 8pt"><b></b></font></font></span></font><font face="Times New Roman, serif">zziot
	dò</font><font face="新細明體"><span lang="zh-TW"><span style="letter-spacing: normal">！恁儴做，</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">毋信佢還有麼个辦法做比</span><span style="letter-spacing: normal"></span><span style="letter-spacing: normal">較好。</span></span></font></p>
</div>
<div title="footer">
	<p align="center" style="margin-top: 0.85cm; margin-bottom: 0cm; line-height: 0.53cm">
	<br/>

	</p>
' }
