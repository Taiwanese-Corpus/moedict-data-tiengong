#!/usr/bin/env perl6
use v6;
#use Grammar::Tracer;

class Entry {
    has Str:D $.pinyin = ...;
    has Str:_ $.ideograph;
    has Array $.defs;
}
class Headword is Entry {
    has Str $.etymology;
    has Array $.entries;
}

grammar G {
    token sig-rank { <[ \xE897 .. \xE89F ]> } # 1 - 9
    token sig-example { \xE738 } # 例
    token text { \N+ }
    token pinyin { z\S* }
    token ideograph { <-[\x00 .. \xFF]> }
    rule def {
        ^^ <sig-rank> <text>
    }
    rule etymology {
        '(' (<-[\n )]>+) ')' \N*
    }
    regex entry { 
        ^^ (\N+ '＝' : \N+) <.ws>
    }
    rule headword {
        ^^ <ideograph> <etymology>
        [ <def>+ || <text> ]
        <entry>*
    }
    rule syllable {
        ^^ <pinyin> \N+
        <headword>+
    }
    rule TOP { ^ [ <syllable> .*? ]+ .* $ }
}

sub untag ($_ is copy) { s:g/'<' <-[<>]>* '>'//; $_ }

class A {
    method def (\x) { x.make: ~x<text> }
    method entry (\x) { x.make: ~x[0] }
    method ideograph (\x) { x.make: ~x }
    method etymology (\x) { x.make: ~x[0] }
    method headword (\x) { x.make: {
        defs => x<text> ?? ~x<text> !! x<def>».made,
        ideograph => x<ideograph>.made,
        etymology => x<etymology>.made,
        entries => x<entry>».made,
    } }
    method sig-rank (\x) { x.make( x.ord - 0xE896) }
    method syllable (\x) {
        x.make: x<headword>.map:{
            Headword.new: pinyin => ~x<pinyin>, |.made,
        },
    }
    method TOP (\x) { x.make: x<syllable>».made }
}


my \match = G.parse: sample, actions => A.new;
say match.made[0][0].entries[];

sub sample { '
zung 粽綜錝

粽(作弄切，宗去聲。角黍也。)

參考「粽仔」。

參考「肉粽粽仔」。

zung è 粽仔＝用竹葉或竹籜裹糯米和佐料所製成的食品，客家習俗通常在端午節及七月半做來吃。客家粽包括有米粽、粄粽、焿粽。

zung kuan 粽擐＝綁粽子用的繩串。包粽仔之前，愛先粽擐吊起來。

zung yap 粽葉＝包粽子時用的竹葉。焿粽愛用粽葉來包，較脆；米粽愛用竹殼來包，較球；粄粽愛用月桃葉來包，較夭。

zụt 卒脺

卒(臧沒切，尊入聲。說文：隸人給事者。)

兵士。兵卒。

象棋中的卒子。

終了。卒業。

心情悒鬱。心情殟(vụt)卒。

脺(客語借用字。)

胖的樣子。人害人肥脺脺，天害人一把骨。

zụt è 卒仔＝小兵。毋好看別人恁無，成時細卒仔乜會建立大功勞。象棋中的卒子。卒仔過河，一步一步行，堵佇象腳、馬腳就當有用處。

zụt ngiap 卒業＝畢業，源自日本語「卒業(そつぎょう)」。你看佢小學都無卒業，事業乜做到拚拚袞。

zut 啐椊

啐(子聿切，即聿切，即律切，音卒。嘈啐，眾聲也。)

被人利用的傻子，參考「阿啐頭」。

細語不斷的樣子，又作「cut」。唧唧啐啐(zit zit zut zut)。

參考「肉啐啐仔」。

椊(昨沒切，存入聲。唐韻：椊杌，以柄內孔也。玉篇：柱頭枘也。)讀音作「cụt」。

塞子。樹椊仔。

塞住。椊緪、椊倒轉去。

頭撞地。椊落崩崗下、椊捯。

塞(某物)給人。名片椊等來、椊分佢。

放置。椊奈位去。

zut bún gi 椊分佢＝塞給他。你插蛸佢愛抑無愛，椊分佢就好走哩。

zut bún gi sì 椊分佢死＝抓他的頭撞地，把他給撞死。

zut dèn 椊等＝塞子塞住。好得有椊仔椊等，無俟早都揮發淨淨哩。

zut dèn loi 椊等來＝(很多東西)塞著過來。人看佢山歌唱到恁好，名片相埰椊等來分佢，想愛認識佢。

zut dò 椊捯＝頭撞到地。佢上隻月椊捯了後，無醒來過，醫生宣布佢傷捯大腦，可能會變植物人。

zut do zòn hi 椊倒轉去＝把蓋子蓋回去。豆油倒好過後，椊仔愛椊倒轉去，正毋會走味。

zut è 椊仔＝瓶口的塞子。頭擺罌仔都用樹椊仔來椊，這下用捦上去个，其實做毋得講係椊仔哩。

zut hen 椊緪＝塞子塞緊。酒椊仔愛椊緪來，無俟(sii)會走味哦！

zut het het 椊閡閡＝塞得緊緊地。椊仔椊閡閡，挷毋起來，看你有辦法嚒？

zut lok bén góng há 椊落崩崗下＝栽下懸崖下去。奇怪！這崩崗漘也無大轉彎，警示牌也清清楚楚，仰會長透有人椊落崩崗下，係毋係…？唉唷！莫想較贏，想起來會發屎驚。

zut lok bí tong dù 椊落陂塘肚＝栽到池塘裡去。昨晡暗，阿成食酒食到醉仔，椊落陂塘肚，險險浸死。

zut lok hi 椊落去＝把蓋子蓋上去。豆油倒好，椊仔椊落去，再過拿冰箱肚放。摔下去。佇這崩崗頂椊落去，該俟(sii)會無命哦！

zut lut teu 椊硉頭＝(鍋蓋等上面的)小把手。鑊蓋頂个椊硉頭撙毋緪哩，今晡日轉夜買隻轉來。

zut nai vi hi lè 椊奈位去哩＝放哪兒去了？鑿仔椊到奈位去哩？仰櫥仔、拖箱角尋透透還尋毋捯？

zut sì 椊死＝栽下而死。其老公幾下年前騎車仔經過高橋，毋知仰仔踵下去椊死忒。

zut sì gi 椊死佢＝抓他的頭來撞地，把他給撞死。這夭壽仔！係講分捯，椊死佢。咒人栽下而死。車仔騎恁亟，椊死佢。

zut sì sì 椊死死＝栽下而且當場死亡，語氣強調作「zut sí sì」。後生人就係恁儴，講毋聽，佇山頂騎車仔還騎當亟，踵落崩崗，椊死死。

zze

zze lì 軟糖，源自日本語「ゼリー」，英語「jelly」，是臺灣自日治時代以來的小零食，亦用於祭品「五燥」之一。

zzi

參考「la zzi ò」。

zziak

zziak ki 千斤頂，源自日本語「じゃっき」，英語「jack」，六堆客家作「萬力、鐵人仔」。

zziàm

zziàm bba 運動外套，源自日本語「ジャンパー」。

zziò

zziò do 棒極了、好極了。源自日本語「上等(じょうとう)」，又作「zziot dò」。zziò do！這擺考試个題目，全部有準備捯，考好學校應該無麼个問題。

zzio

zzio lò 噴壺，源自日語「如雨露(じょうろ)、如露(じょろ)」。淋白菜，水愛用閕，無就用zzio lò 來噴，做毋得用潑。又牽豬哥个人手項長透拿等zzio lò ，你仰手項也長透拿等zzio lò ？你也牽豬哥係嚒？

zziot

zziot dò 棒極了、好極了。源自日語「上等(じょうとう)」，又作「zziò do」。zziot dò！恁儴做，毋信佢還有麼个辦法做比較好。


' }
