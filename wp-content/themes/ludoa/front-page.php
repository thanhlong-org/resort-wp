<?php
/**
 * Template — one-page LP main content.
 *
 * @package Ludoa
 */

get_header();
$img = get_template_directory_uri() . '/assets/images';
?>
  <!-- ===================== Main ===================== -->
  <main id="top">

    <!-- ===== Stage: banner bị ghim + Concept trượt lên phủ ===== -->
    <div class="fv-stage">

    <!-- ===== FV / Hero ===== -->
    <section class="fv" id="fv">
      <div class="fv__bg">
        <img class="fv__bg-img blurImageTrigger" src="<?php echo esc_url( $img ); ?>/banner.jpg" alt="阿蘇の雲海" />
      </div>

      <div class="fv__inner">
        <h1 class="fv__title logo fadeUpTrigger" data-i18n="brand.logo">
          <span class="logo__top">大自然<span class="logo__accent">阿蘇</span></span>
          <span class="logo__main">健康の森</span>
        </h1>
        <p class="fv__sub fadeUpTrigger" data-i18n="fv.sub">世界最高峰の<br class="u-sp" />ウェルネスリゾート</p>
      </div>

      <div class="fv__scroll">
        <span class="fv__scroll-text">scroll</span>
        <span class="fv__scroll-line"></span>
      </div>

      <a class="fv__reserve" href="<?php echo esc_url( ludoa_reserve_url() ); ?>" target="_blank" rel="noopener">
        <span class="fv__reserve-text" data-i18n="fv.reserve">ご予約はこちら</span>
      </a>
    </section>

    <!-- ===== Concept ===== -->
    <section class="concept" id="about">
      <div class="concept__bg">
        <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/general-banner.jpg" alt="" />
      </div>

      <div class="l-inner concept__inner">
        <div class="concept__hero">
          <div class="concept__headline fadeInTrigger">
            <h2 class="concept__headline-main" data-i18n="concept.head_main">
              <span>世界初　総合的な</span><span>癒しのリゾート</span>
            </h2>
            <p class="concept__headline-sub" data-i18n="concept.head_sub">
              <span>心と体を解き放つ</span><span>五感で味わう極上の休日。</span>
            </p>
          </div>
          <div class="concept__photos">
            <img class="concept__photo concept__photo--1 blurImageTrigger" src="<?php echo esc_url( $img ); ?>/general-img-01.jpg" alt="施設内観" />
            <img class="concept__photo concept__photo--2 blurImageTrigger" src="<?php echo esc_url( $img ); ?>/general-img-02.jpg" alt="露天風呂" />
            <img class="concept__photo concept__photo--3 blurImageTrigger" src="<?php echo esc_url( $img ); ?>/general-img-03.jpg" alt="温泉" />
          </div>
        </div>

        <div class="concept__lead">
          <h3 class="concept__title fadeUpTrigger" data-i18n="concept.title">世界最高峰の<br />ウェルネス・リトリート</h3>
          <div class="concept__body fadeUpTrigger" data-i18n="concept.body">
            <p>日々の重責から解き放たれ、ただの「自分」に<br class="u-sp" />還る場所。<br class="u-pc" />それが大自然の中に佇む、<br />世界でここだけのウェルネス・リトリートです。</p>
            <p>よりも早く走ってきたあなたにこそ、<br />今、究極の「癒し」が必要です。</p>
            <p>――選び抜かれた設えの中で大自然に触れ、<span class="u-sp"><br />　　</span>心を澄ますこと。</p>
            <p>ここで手に入るものは、<br />あなたの未来を健康的で豊かに変える、<br />一生モノの価値という名の投資です。</p>
          </div>
        </div>

        <div class="concept__map fadeUpTrigger">
          <img src="<?php echo esc_url( $img ); ?>/img-mapJP.png" alt="日本地図" />
          <svg class="concept__map-line" viewBox="0 0 100 100" preserveAspectRatio="none" aria-hidden="true">
            <line x1="7" y1="70" x2="20" y2="76" stroke="#FFFFFF" stroke-width="1" vector-effect="non-scaling-stroke" />
          </svg>
          <span class="concept__map-pin" aria-hidden="true"></span>
          <span class="concept__map-label" data-i18n="concept.map_label"><span>大自然阿蘇</span><span>健康の森</span></span>
        </div>
      </div>
    </section>

    </div><!-- /.fv-stage -->

    <!-- ===== 温泉施設 (onsen) ===== -->
    <section class="onsen" id="onsen">
      <div class="l-inner onsen__inner">
        <div class="onsen__headline fadeUpTrigger">
          <p class="onsen__eyebrow" data-i18n="onsen.eyebrow"><span>訪れる人を<br />魅了する</span></p>
          <h2 class="v-title onsen__title" data-i18n="onsen.title"><span>世界一の</span><span>温泉施設</span></h2>
        </div>

        <div class="onsen__main">
          <figure class="onsen__photo">
            <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-01.jpg" alt="阿蘇健康火山温泉 大浴場" />
            <figcaption class="onsen__caption" data-i18n="onsen.caption"><span>湧き上がる</span><span>大地の恵み</span></figcaption>
          </figure>

          <div class="onsen__text fadeInTrigger">
            <div class="onsen__body staggerTrigger" data-i18n="onsen.body">
              <p>「阿蘇健康火山温泉」は</p>
              <p>世界最大級の大自然石庭露天風呂。</p>
              <p>世界のカルデラから湧き上がる恵みは、</p>
              <p>心身を癒し、温め、リセットしてくれます。</p>
              <p>阿蘇外輪山を一望できる露天風呂は、</p>
              <p>解放感と四季折々を肌で感じれる</p>
              <p>唯一無二の温浴施設です。</p>
              <p>また、大自然石庭露天風呂は、</p>
              <p>天然のトリプルミネラルを含む硫酸塩温泉で、</p>
              <p>日頃の疲れを癒し、</p>
              <p>疲労回復やストレス解放を促します。</p>
            </div>
            <h3 class="onsen__heading" data-i18n="onsen.heading">阿蘇健康<br class="u-sp" />火山温泉</h3>
          </div>
        </div>

        <div class="onsen__other">
          <p class="onsen__other-label fadeUpTrigger" data-i18n="onsen.other_label">その他の温泉施設</p>
          <ul class="onsen__gallery">
            <li class="onsen__gitem">
              <figure>
                <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-02.jpg" alt="宝石窯" />
                <figcaption data-i18n="onsen.g1">宝石窯</figcaption>
              </figure>
            </li>
            <li class="onsen__gitem">
              <figure>
                <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-03.jpg" alt="大自然石庭露天風呂" />
                <figcaption data-i18n="onsen.g2">大自然石庭露天風呂</figcaption>
              </figure>
            </li>
            <li class="onsen__gitem">
              <figure>
                <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-04.jpg" alt="フラワースパ" />
                <figcaption data-i18n="onsen.g3">フラワースパ</figcaption>
              </figure>
            </li>
          </ul>
        </div>

        <div class="kiln">
          <div class="kiln__text">
            <h3 class="kiln__title fadeUpTrigger" data-i18n="kiln.title">健康温熱窯十三種</h3>
            <p class="kiln__body fadeUpTrigger" data-i18n="kiln.body">薬草や鉱石の効能を体感できる13種類のドーム窯を<br class="u-sp" />備えた、<br class="u-pc" />日本最大級の健康温浴施設です。<br />他に類を見ない特別空間は、ひとつひとつの窯の中が<br class="u-sp" />丸く、<br class="u-pc" />それぞれで違う癒しを感じれます。<br />自然のエネルギーを全身に受け、<br />身体が欲する癒しを感じお選びください。<br />また、窯の外は広いスペースが設けられ、<br />横になりゆったりとした時間をお過ごし下さい。</p>
          </div>
          <div class="kiln__photos">
            <figure class="kiln__ph kiln__ph--amethyst">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-05.jpg" alt="紫水晶窯" />
              <figcaption data-i18n="kiln.c1">紫水晶窯</figcaption>
            </figure>
            <figure class="kiln__ph kiln__ph--gem">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-06.jpg" alt="宝石窯" />
              <figcaption data-i18n="kiln.c2">宝石窯</figcaption>
            </figure>
            <figure class="kiln__ph kiln__ph--salt">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/introduce-img-07.jpg" alt="石塩窯" />
              <figcaption data-i18n="kiln.c3">石塩窯</figcaption>
            </figure>
          </div>
        </div>
      </div>
    </section>

    <!-- ===== お食事 (veg) ===== -->
    <section class="veg" id="dining">
      <div class="veg__bg">
        <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/vegetable-banner.jpg" alt="" />
      </div>

      <div class="l-inner veg__inner">
        <div class="veg__headline fadeUpTrigger">
          <p class="veg__eyebrow" data-i18n="veg.eyebrow"><span>無農薬</span></p>
          <h2 class="v-title veg__title" data-i18n="veg.title"><span>自社栽培</span><span>野菜料理</span></h2>
        </div>

        <div class="veg__content">
          <div class="veg__photos">
            <figure class="veg__ph veg__ph--basket">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/vegetable-img-01.jpg" alt="きのこ" />
            </figure>
            <figure class="veg__ph veg__ph--kaiseki">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/vegetable-img-02.jpg" alt="創作薬膳料理" />
            </figure>
          </div>

          <div class="veg__body fadeInTrigger" data-i18n="veg.body">
            <p><span class="u-pc">阿蘇大自然 健康の森施設内にある </span>薬膳旬菜 阿蘇きのこ亭では、「体の中から元気に」を<br />テーマに「阿蘇健康農園」や「阿蘇バイオテック」で<br />大切に育てられた新鮮な野菜やきのこの旨味を<br class="u-sp" />引き出した<br class="u-pc" />特別な創作薬膳料理や大自然の恵みが<br class="u-sp" />凝縮された<br class="u-pc" />自慢のスープをご堪能いただけます。</p>
            <p>自社栽培の採れたて食材を使った<br />大自然農園レストラン ビッグファームでは、<br />管理栄養士監修のもとシェフが丁寧に仕上げた<br />パレットのように色鮮やかな彩り薫る<br />ヘルシーバイキングをライブキッチンの出来立ての<br />香ばしい匂いとともにお届けしています。</p>
            <p>四季折々の厳選食材や瑞々しい旬の野菜、<br />職人技が光るお造りを最も美味しい仕立てで愉しめる<br />「セットメニュー」もご用意し、素材の持ち味を<br class="u-sp" />活かした<br class="u-pc" />多彩なメニューを通じて五感で季節の<br class="u-sp" />移ろいを<br class="u-pc" />心ゆくまでご堪能いただけます。</p>
          </div>

          <figure class="veg__ph veg__ph--buffet">
            <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/vegetable-img-03.jpg" alt="ヘルシーバイキング" />
          </figure>
        </div>
      </div>
    </section>

    <!-- ===== 宿泊施設 (house) — marquee (decorative floating text, not translated) ===== -->
    <section class="house" id="stay">
      <div class="house__head l-inner">
        <div class="house__headline fadeUpTrigger">
          <p class="house__eyebrow" data-i18n="house.eyebrow"><span>全450棟</span></p>
          <h2 class="v-title house__title" data-i18n="house.title"><span>癒しの</span><span>ドームハウス</span></h2>
        </div>
        <p class="house__intro fadeInTrigger" data-i18n="house.intro">全室「離れ」の独立した空間で、<br class="u-sp" />五感を満たす極上の休息を。<br class="u-pc" />大自然に広がる全450棟のドームハウス。<br />癒しと安らぎの「胎内空間」でエビデンスに基づいた<br />良質な睡眠と心身のリラックスを実感ください。</p>
      </div>

      <div class="house__view fadeInTrigger">
        <div class="house__scaler">
          <div class="house__layer house__layer--img js-house-layer">
            <div class="house__unit">
              <img class="hm-img blurImageTrigger" src="<?php echo esc_url( $img ); ?>/house-img-01.jpg" style="left:220px;top:0;width:303px;height:361px" alt="全450棟のドームハウス" />
              <img class="hm-img blurImageTrigger" src="<?php echo esc_url( $img ); ?>/house-img-02.jpg" style="left:661px;top:333px;width:454px;height:302px" alt="客室" />
              <img class="hm-img blurImageTrigger" src="<?php echo esc_url( $img ); ?>/house-img-03.jpg" style="left:1159px;top:80px;width:327px;height:245px" alt="離れの露天" />
              <img class="hm-img blurImageTrigger" src="<?php echo esc_url( $img ); ?>/house-img-04.jpg" style="left:1661px;top:280px;width:296px;height:441px" alt="庭" />
            </div>
          </div>

          <div class="house__layer house__layer--jp js-house-layer">
            <div class="house__unit">
              <span class="hm-jp" style="left:293px;top:142px;font-size:25px">心身をほどく、</span>
              <span class="hm-jp" style="left:253px;top:142px;font-size:25px">450の癒しのかたち</span>
              <span class="hm-jp hm-jp--light" style="left:691px;top:234px;font-size:17px">静けさに眠る</span>
              <span class="hm-jp hm-jp--tight" style="left:640px;top:409px;font-size:28px">眠りを整え、</span>
              <span class="hm-jp hm-jp--tight" style="left:594px;top:409px;font-size:28px">深く休む</span>
              <span class="hm-jp hm-jp--light" style="left:130px;top:381px;font-size:17px">心ほどく滞在</span>
              <span class="hm-jp" style="left:895px;top:97px;font-size:20px">癒しと安らぎが満ちる、</span>
              <span class="hm-jp" style="left:855px;top:97px;font-size:20px">独立した休息空間</span>
              <span class="hm-jp hm-jp--light" style="left:1220px;top:339px;font-size:17px">癒しに泊まる</span>
              <span class="hm-jp" style="left:1432px;top:454px;font-size:25px">喧騒を離れ、</span>
              <span class="hm-jp" style="left:1392px;top:454px;font-size:25px">眠りの本質へ</span>
              <span class="hm-jp" style="left:1756px;top:22px;font-size:35px">自然、静けさ、</span>
              <span class="hm-jp" style="left:1703px;top:22px;font-size:35px">眠りが重なる場所</span>
              <span class="hm-jp hm-jp--light" style="left:1781px;top:606px;font-size:17px">自然に還る休息</span>
            </div>
          </div>

          <div class="house__layer house__layer--en js-house-layer">
            <div class="house__unit">
              <span class="hm-en" style="left:336px;top:339px;font-size:16px">450 forms of healing<br />that unwind the body and mind</span>
              <span class="hm-en" style="left:130px;top:549px;font-size:16px">A stay that unwinds the mind</span>
              <span class="hm-en" style="left:602px;top:190px;font-size:11px">Sleep in stillness</span>
              <span class="hm-en" style="left:428px;top:592px;font-size:12px">Rest deeply,<br />with sleep gently restored</span>
              <span class="hm-en" style="left:1058px;top:4px;font-size:11px">A private retreat filled<br />with healing and serenity</span>
              <span class="hm-en" style="left:1178px;top:501px;font-size:13px">Stay in healing</span>
              <span class="hm-en" style="left:1234px;top:650px;font-size:16px">Away from the noise,<br />toward the essence of sleep</span>
              <span class="hm-en" style="left:1566px;top:180px;font-size:12px">Where nature,<br />stillness,<br />and sleep come<br />together</span>
              <span class="hm-en" style="left:1829px;top:718px;font-size:12px">Rest that returns<br />to nature</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ===== 体験 (learn) — slider ===== -->
    <section class="learn" id="experience">
      <div class="l-inner learn__inner">
        <div class="learn__headline fadeUpTrigger">
          <p class="learn__eyebrow" data-i18n="learn.eyebrow"><span>体で学ぶ</span></p>
          <h2 class="v-title learn__title" data-i18n="learn.title"><span>心身を</span><span>整える体験</span></h2>
        </div>

        <div class="learn__lower">
          <div class="learn__lead">
            <p class="learn__label fadeUpTrigger" data-i18n="learn.label">多彩な健康体験</p>
            <p class="learn__desc fadeInTrigger" data-i18n="learn.desc">ホットヨガや健康トレーニング、講演等、他にも様々な<br class="u-sp" />体験、アクティビティをご用意しております。</p>
          </div>

          <div class="learn__main">
            <div class="learn__slider">
              <div class="learn__slide">
                <figure><img src="<?php echo esc_url( $img ); ?>/learn-img-01.jpg" alt="ヨガ" /><figcaption><span data-i18n="learn.s1">ヨガ</span></figcaption></figure>
              </div>
              <div class="learn__slide">
                <figure><img src="<?php echo esc_url( $img ); ?>/learn-img-02.jpg" alt="ピラティス" /><figcaption><span data-i18n="learn.s2">ピラティス</span></figcaption></figure>
              </div>
              <div class="learn__slide">
                <figure><img src="<?php echo esc_url( $img ); ?>/learn-img-03.jpg" alt="瞑想" /><figcaption><span data-i18n="learn.s3">瞑想</span></figcaption></figure>
              </div>
              <div class="learn__slide">
                <figure><img src="<?php echo esc_url( $img ); ?>/learn-img-03.jpg" alt="体力年齢測定" /><figcaption><span data-i18n="learn.s4">体力年齢測定</span></figcaption></figure>
              </div>
            </div>

            <div class="learn__nav">
              <button class="learn__arrow learn__arrow--prev" type="button" data-i18n-aria-label="learn.prev" aria-label="前へ">‹</button>
              <span class="learn__count">
                <em class="js-current">01</em>
                <span class="learn__count-line"></span>
                <span class="learn__total">04</span>
              </span>
              <button class="learn__arrow learn__arrow--next" type="button" data-i18n-aria-label="learn.next" aria-label="次へ">›</button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ===== 阿蘇の観光名所 (tourism) ===== -->
    <section class="tourism" id="tourism">
      <div class="tourism__bg">
        <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/tourism-banner.jpg" alt="" />
      </div>

      <div class="l-inner tourism__inner">
        <div class="tourism__headline fadeUpTrigger">
          <p class="tourism__eyebrow" data-i18n="tourism.eyebrow"><span>自然を感じる</span></p>
          <h2 class="v-title tourism__title" data-i18n="tourism.title"><span>阿蘇の</span><span>観光名所</span></h2>
        </div>

        <div class="tourism__list">
          <article class="tsp">
            <div class="tsp__text fadeUpTrigger">
              <h3 class="tsp__title" data-i18n="tourism.t1_title">世界最大級のカルデラ</h3>
              <p class="tsp__body" data-i18n="tourism.t1_body">世界でも類を見ない活火山の巨大なカルデラ内に<br class="u-sp" />位置する阿蘇サンクチュアリ。<br class="u-pc" />ここは、地球の<br class="u-sp" />原初的なエネルギーと直結できる稀有な場所です。<br />「エメラルド・ベルベット」と称される広大な草原と<br class="u-sp" />朝霧が、<br class="u-pc" />都会のリゾートでは決して味わえない<br class="u-sp" />精神的な静寂をもたらします。<br />まさに「大地の呼吸」を感じる舞台です。</p>
            </div>
            <figure class="tsp__photo">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/tourism-img-01.jpg" alt="エメラルドベルベット" />
              <figcaption class="tsp__cap" data-i18n="tourism.t1_cap"><span>エメラルド</span><span>ベルベット</span></figcaption>
            </figure>
          </article>

          <article class="tsp">
            <div class="tsp__text fadeUpTrigger">
              <h3 class="tsp__title" data-i18n="tourism.t2_title">明神池名水公園</h3>
              <p class="tsp__body" data-i18n="tourism.t2_body">圧倒的な透明度と「モネの池」のような美しさ。<br class="u-sp" />毎分約２トン湧き出る<br class="u-pc" />清水は、池の底がくっきりと<br class="u-sp" />見えるほど高い透明度を誇ります。<br />特に冬場の水草が少ない時期には、光の加減で水面が<br class="u-sp" />深いインディゴブルーに<br class="u-pc" />染まり、悠々と泳ぐ鯉の姿も<br class="u-sp" />相まって「まるで岐阜の“モネの池”のよう」と<br />SNSなどでも話題になります。夏には水草が広がり、<br class="u-sp" />生命力あふれる<br class="u-pc" />緑の風景へ。訪れる季節ごとに異なる<br class="u-sp" />美しさに出会えるスポットです。</p>
            </div>
            <figure class="tsp__photo">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/tourism-img-02.jpg" alt="岐阜のモネの池" />
              <figcaption class="tsp__cap" data-i18n="tourism.t2_cap"><span>岐阜の</span><span>モネの池”</span></figcaption>
            </figure>
          </article>

          <article class="tsp">
            <div class="tsp__text fadeUpTrigger">
              <h3 class="tsp__title" data-i18n="tourism.t3_title">上色見熊野座神社</h3>
              <p class="tsp__body" data-i18n="tourism.t3_body">近年、SNSをきっかけに世界中から注目を集めている、<br class="u-sp" />幻想的な雰囲気の<br class="u-pc" />神社です。杉木立に囲まれた参道と<br class="u-sp" />神秘的な景観は、「まるで異世界への<br class="u-pc" />入り口のよう」と<br class="u-sp" />海外旅行者の間でも話題となっています。<br />また、蛍火の杜へを思わせる美しい世界観や、<br class="u-sp" />るろうに剣心のロケ地として<br class="u-pc" />知られており、<br class="u-sp" />日本ならではの静寂と神秘を体感できる<br class="u-sp" />人気スポットとして、<br class="u-pc" />多くの観光客が訪れています。</p>
            </div>
            <figure class="tsp__photo">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/tourism-img-03.jpg" alt="異世界への入り口" />
              <figcaption class="tsp__cap" data-i18n="tourism.t3_cap"><span>異世界への</span><span>入り口</span></figcaption>
            </figure>
          </article>

          <article class="tsp">
            <div class="tsp__text fadeUpTrigger">
              <h3 class="tsp__title" data-i18n="tourism.t4_title">阿蘇山頂・草千里ヶ浜</h3>
              <p class="tsp__body" data-i18n="tourism.t4_body">草千里ヶ浜 （くさせんりがはま）は、<br class="u-sp" />熊本県・阿蘇を代表する<br class="u-pc" />絶景スポットのひとつで、<br class="u-sp" />阿蘇五岳のひとつ「烏帽子岳（えぼしだけ）」の<br />北麓に広がる大草原です。 「阿蘇といえばここ」と<br class="u-sp" />言われるほど有名で、<br class="u-pc" />火山・草原・放牧風景が<br class="u-sp" />一度に見られる、日本でもかなり珍しい景観です。<br />雄大な火山と大草原のエネルギーを五感で体感できる<br class="u-sp" />場所です。</p>
            </div>
            <figure class="tsp__photo">
              <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/tourism-img-04.jpg" alt="大草原のエネルギー" />
              <figcaption class="tsp__cap" data-i18n="tourism.t4_cap"><span>大草原の</span><span>エネルギー</span></figcaption>
            </figure>
          </article>
        </div>
      </div>
    </section>

    <!-- ===== 料金プラン (plan) ===== -->
    <section class="plan" id="price">
      <div class="l-inner plan__inner">
        <p class="plan__eyebrow fadeUpTrigger" data-i18n="plan.eyebrow"><span>料金プラン</span></p>

        <div class="plan__header">
          <div class="plan__lead fadeUpTrigger">
            <p class="plan__brand" data-i18n="plan.brand">大自然阿蘇健康の森</p>
            <h3 class="plan__name" data-i18n="plan.name">世界一の温浴施設で癒しを極める<br />ウェルネス・リトリートプラン</h3>
          </div>
          <div class="plan__price fadeUpTrigger">
            <p class="plan__price-note" data-i18n="plan.price_note"><strong>お一人様3泊〜</strong> （2名1室利用時）</p>
            <p class="plan__price-main">
              <span class="plan__price-num">150,000</span>
              <span class="plan__price-unit">
                <span class="plan__price-tax" data-i18n="plan.price_tax">（税込）</span>
                <span class="plan__price-yen" data-i18n="plan.price_yen">円〜</span>
              </span>
            </p>
          </div>
        </div>

        <div class="plan__cards staggerTrigger">
          <div class="plan__card">
            <h4 class="plan__card-title" data-i18n="plan.c1_title">プランに含まれるもの</h4>
            <ul class="plan__list" data-i18n="plan.c1_list">
              <li>宿泊施設</li>
              <li>食事料金</li>
              <li>基本利用料金</li>
            </ul>
            <p class="plan__note" data-i18n="plan.c1_note">宿泊施設や食事料金等は基本的にすべて含まれています。</p>
          </div>

          <div class="plan__card plan__card--center">
            <h4 class="plan__card-title" data-i18n="plan.c2_title">無料送迎<span class="plan__card-sub">要予約</span></h4>
            <p class="plan__ctext" data-i18n="plan.c2_text">主要公共交通機関の<br class="u-pc" />空港、駅、バスターミナルまでの<br class="u-pc" />無料送迎バスがございます。</p>
          </div>

          <div class="plan__card">
            <h4 class="plan__card-title" data-i18n="plan.c3_title">別途費用</h4>
            <ul class="plan__fees">
              <li>
                <p class="plan__fee-name" data-i18n="plan.c3_f1_name">通訳・コンシェルジュ費用</p>
                <p class="plan__fee-sub" data-i18n="plan.c3_f1_sub">一日あたり <strong>10,000円</strong></p>
              </li>
              <li class="plan__fee-hr"></li>
              <li>
                <p class="plan__fee-name" data-i18n="plan.c3_f2_name">入湯税</p>
                <p class="plan__fee-sub" data-i18n="plan.c3_f2_sub">大人の方（13歳以上）は、お一人様<br />１泊につき <strong>150円</strong> 別途必要です。</p>
              </li>
            </ul>
          </div>
        </div>

        <div class="plan__cta fadeUpTrigger">
          <a class="btn-bracket" href="#" data-modal="price"><span data-i18n="plan.cta">料金を確認する</span></a>
        </div>
      </div>
    </section>

    <!-- ===== アクセス (access) ===== -->
    <section class="access" id="access">
      <div class="access__bg">
        <img class="blurImageTrigger" src="<?php echo esc_url( $img ); ?>/map-banner.jpg" alt="" />
      </div>

      <div class="l-inner access__inner">
        <p class="access__eyebrow fadeUpTrigger" data-i18n="access.eyebrow"><span>アクセス</span></p>

        <div class="access__loc fadeUpTrigger">
          <p class="access__loc-head" data-i18n="access.loc_head">所在地</p>
          <p class="access__addr" data-i18n="access.addr">〒869-1404　<br class="u-sp" />熊本県阿蘇郡南阿蘇村河陽5579-3</p>
        </div>

        <?php
        // Google Maps: destination is the resort address; route opens
        // directions from the visitor's current location (origin omitted).
        $ludoa_map_q  = rawurlencode( '〒869-1404 熊本県阿蘇郡南阿蘇村河陽5579-3' );
        $ludoa_langs  = ludoa_languages();
        $ludoa_map_hl = $ludoa_langs[ ludoa_lang() ]['html_lang'];
        ?>
        <div class="access__map fadeInTrigger">
          <iframe
            src="https://maps.google.com/maps?q=<?php echo $ludoa_map_q; ?>&hl=<?php echo esc_attr( $ludoa_map_hl ); ?>&z=15&output=embed"
            title="Google Map"
            width="588"
            height="408"
            loading="lazy"
            allowfullscreen
            referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>

        <div class="access__btns fadeUpTrigger">
          <a class="btn-bracket" href="https://www.google.com/maps/search/?api=1&query=<?php echo $ludoa_map_q; ?>" target="_blank" rel="noopener"><span data-i18n="access.btn_map">Google Mapで見る</span></a>
          <a class="btn-bracket" href="https://www.google.com/maps/dir/?api=1&destination=<?php echo $ludoa_map_q; ?>&travelmode=driving" target="_blank" rel="noopener"><span data-i18n="access.btn_route">経路を見る</span></a>
        </div>

        <div class="access__transit">
          <p class="access__transit-head fadeUpTrigger" data-i18n="access.transit_head">主要な交通機関からのアクセス</p>
          <div class="access__groups staggerTrigger">
            <div class="access__group">
              <p class="access__group-title" data-i18n="access.g1_title">空港からお越しのお客様</p>
              <p class="access__item" data-i18n="access.g1_i1">熊本空港から 車で約30分</p>
              <p class="access__item" data-i18n="access.g1_i2">福岡空港から 車で約135分</p>
            </div>
            <div class="access__group">
              <p class="access__group-title" data-i18n="access.g2_title">電車でお越しのお客様</p>
              <p class="access__item" data-i18n="access.g2_i1">JR阿蘇駅から タクシーで約20分</p>
              <p class="access__item" data-i18n="access.g2_i2">JR赤水駅から タクシーで約7分</p>
            </div>
            <div class="access__group">
              <p class="access__group-title" data-i18n="access.g3_title">お車でお越しのお客様</p>
              <p class="access__item" data-i18n="access.g3_i1">熊本市内から 車で約60分</p>
              <p class="access__item" data-i18n="access.g3_i2">福岡方面から 高速道路利用でアクセス可能</p>
            </div>
          </div>
        </div>
      </div>

      <div class="access__strip">
        <div class="access__strip-track js-strip">
          <img src="<?php echo esc_url( $img ); ?>/introduce-img-01.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/introduce-img-02.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/introduce-img-07.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/introduce-img-03.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/introduce-img-05.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/house-img-03.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/introduce-img-06.jpg" alt="" />
          <img src="<?php echo esc_url( $img ); ?>/house-img-02.jpg" alt="" />
        </div>
      </div>
    </section>

  </main>

  <!-- ===================== Modals ===================== -->
  <!-- お問い合わせフォーム -->
  <div class="modal" id="modal-contact" aria-hidden="true">
    <div class="modal__box modal__box--form">
      <button class="modal__close" type="button" data-modal-close data-i18n-aria-label="modal.close" aria-label="閉じる"></button>
      <div class="modal__scroll">

        <!-- STEP 1: 入力 -->
        <div class="cform-step cform-step--input">
        <p class="modal__title"><span data-i18n="form.title">お問い合わせ</span></p>
        <form class="cform" novalidate>
          <?php wp_nonce_field( 'ludoa_contact', 'ludoa_contact_nonce' ); ?>
          <div class="cform__row">
            <label class="cform__label"><span data-i18n="form.name">お名前</span> <em>*</em></label>
            <input type="text" name="ludoa_name" data-i18n-placeholder="form.name_ph" placeholder="阿蘇 太郎" required />
          </div>
          <div class="cform__grid">
            <div class="cform__row">
              <label class="cform__label"><span data-i18n="form.email">メールアドレス</span> <em>*</em></label>
              <input type="email" name="ludoa_email" placeholder="example@domain.com" required />
            </div>
            <div class="cform__row">
              <label class="cform__label"><span data-i18n="form.tel">お電話番号</span> <em>*</em></label>
              <input type="tel" name="ludoa_tel" placeholder="090-0000-0000" required />
            </div>
          </div>
          <div class="cform__row">
            <label class="cform__label"><span data-i18n="form.subject">お問い合わせ内容の種類</span> <em>*</em></label>
            <div class="cform__select">
              <select name="ludoa_subject_type" required>
                <option value="" disabled selected data-i18n="form.opt1">プラン内容について</option>
                <option data-i18n="form.opt1b">プラン内容について</option>
                <option data-i18n="form.opt2">ご予約について</option>
                <option data-i18n="form.opt3">アクセスについて</option>
                <option data-i18n="form.opt4">その他</option>
              </select>
            </div>
          </div>
          <div class="cform__row">
            <label class="cform__label" data-i18n="form.message">ご質問・ご要望</label>
            <textarea name="ludoa_message" data-i18n-placeholder="form.message_ph" placeholder="食事制限やアレルギー、送迎に関するご相談などはこちらにご記入ください。"></textarea>
          </div>
          <p class="cform__privacy" data-i18n="form.privacy">ご入力いただきました情報は、当社の個人情報保護方針に基づき厳重に管理いたします。<br />当社の<a href="https://asofarmland.co.jp/privacy-policy" target="_blank" rel="noopener">個人情報保護方針</a>をご確認いただき、同意いただいた上で送信ください。</p>
          <label class="cform__agree"><input type="checkbox" name="ludoa_agree" required /><span data-i18n="form.agree">同意する<em>*</em></span></label>
          <button type="submit" class="btn-bracket cform__submit"><span data-i18n="form.submit">送信する</span></button>
        </form>
        </div>

        <!-- STEP 2: 確認 -->
        <div class="cform-step cform-step--confirm" hidden>
          <p class="modal__title"><span data-i18n="form.confirm_title">入力内容のご確認</span></p>
          <p class="cform__note" data-i18n="form.confirm_note">以下の内容でよろしければ「送信する」ボタンを押してください。</p>
          <dl class="cform__summary">
            <div class="cform__summary-row">
              <dt data-i18n="form.name">お名前</dt>
              <dd data-cfield="name"></dd>
            </div>
            <div class="cform__summary-row">
              <dt data-i18n="form.email">メールアドレス</dt>
              <dd data-cfield="email"></dd>
            </div>
            <div class="cform__summary-row">
              <dt data-i18n="form.tel">お電話番号</dt>
              <dd data-cfield="tel"></dd>
            </div>
            <div class="cform__summary-row">
              <dt data-i18n="form.subject">お問い合わせ内容の種類</dt>
              <dd data-cfield="subject"></dd>
            </div>
            <div class="cform__summary-row">
              <dt data-i18n="form.message">ご質問・ご要望</dt>
              <dd data-cfield="message"></dd>
            </div>
          </dl>
          <p class="cform__error" data-i18n="form.send_error" hidden>送信に失敗しました。時間をおいて再度お試しください。</p>
          <div class="cform__actions">
            <button type="button" class="btn-bracket cform__back"><span data-i18n="form.back">戻る</span></button>
            <button type="button" class="btn-bracket cform__submit cform__send"><span data-i18n="form.submit">送信する</span></button>
          </div>
        </div>

        <!-- STEP 3: 完了 -->
        <div class="cform-step cform-step--thanks" hidden>
          <p class="modal__title"><span data-i18n="form.thanks_title">送信完了</span></p>
          <p class="cform__thanks" data-i18n="form.thanks_text">お問い合わせいただきありがとうございます。<br />内容を確認のうえ、担当者よりご連絡いたします。</p>
          <div class="cform__actions">
            <button type="button" class="btn-bracket cform__closebtn" data-modal-close><span data-i18n="form.close">閉じる</span></button>
          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- 宿泊料金 -->
  <div class="modal" id="modal-price" aria-hidden="true">
    <div class="modal__box modal__box--price">
      <button class="modal__close" type="button" data-modal-close data-i18n-aria-label="modal.close" aria-label="閉じる"></button>
      <div class="modal__scroll">
        <div class="price">
          <section class="price__sec">
            <p class="modal__title"><span data-i18n="price.stay_title">宿泊料金</span></p>
            <p class="price__subtitle" data-i18n="price.stay_sub">1泊お一人様あたり　※サ込税込・円</p>
            <div class="price__zone">
              <p class="price__zone-name" data-i18n="price.zone_village">ヴィレッジゾーン</p>
              <div class="price__tablewrap">
                <table class="price__table">
                  <thead><tr><th data-i18n="price.th_type">区分</th><th data-i18n="price.th_1">1名利用時</th><th data-i18n="price.th_2">2名利用時</th><th data-i18n="price.th_3">3名利用時</th><th data-i18n="price.th_4">4名利用時</th></tr></thead>
                  <tbody>
                    <tr><th data-i18n="price.row_adult">大人</th><td>80,000</td><td>50,000</td><td>49,000</td><td>48,000</td></tr>
                    <tr><th data-i18n="price.row_elem">小学生</th><td>–</td><td>35,000</td><td>34,000</td><td>33,000</td></tr>
                    <tr><th data-i18n="price.row_child">幼児（4〜6歳）</th><td>–</td><td>25,000</td><td>24,000</td><td>23,000</td></tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="price__zone">
              <p class="price__zone-name" data-i18n="price.zone_royal">ロイヤルゾーン</p>
              <div class="price__tablewrap">
                <table class="price__table">
                  <thead><tr><th data-i18n="price.th_type">区分</th><th data-i18n="price.th_1">1名利用時</th><th data-i18n="price.th_2">2名利用時</th><th data-i18n="price.th_3">3名利用時</th><th data-i18n="price.th_4">4名利用時</th></tr></thead>
                  <tbody>
                    <tr><th data-i18n="price.row_adult">大人</th><td>85,000</td><td>55,000</td><td>54,000</td><td>53,000</td></tr>
                    <tr><th data-i18n="price.row_elem">小学生</th><td>–</td><td>38,500</td><td>37,500</td><td>36,500</td></tr>
                    <tr><th data-i18n="price.row_child">幼児（4〜6歳）</th><td>–</td><td>27,500</td><td>26,500</td><td>25,500</td></tr>
                  </tbody>
                </table>
              </div>
            </div>
            <ul class="price__notes">
              <li data-i18n="price.note1">※大人（13歳以上）の方は、お一人様1泊につき入湯税＠150円別途必要です。</li>
              <li data-i18n="price.note2">※滞在中の通訳・コンシェルジュ費用は別途いただきます。（一日あたり10,000円）</li>
              <li data-i18n="price.note3">※主要公共交通機関の空港、駅、バスターミナルまでの無料送迎バスがございます。（要予約）</li>
            </ul>
          </section>

          <section class="price__sec">
            <p class="modal__title"><span data-i18n="price.meal_title">食事</span></p>
            <p class="price__subtitle price__subtitle--note" data-i18n="price.meal_sub">（宿泊料金に含む）</p>
            <div class="price__zone">
              <div class="price__tablewrap">
                <table class="price__table">
                  <thead><tr><th data-i18n="price.meal_th">内容</th><th data-i18n="price.meal_breakfast">朝食</th><th data-i18n="price.meal_lunch">昼食</th><th data-i18n="price.meal_dinner">夕食</th></tr></thead>
                  <tbody>
                    <tr><th data-i18n="price.meal_r1">健康御膳</th><td data-i18n="price.meal_buffet">バイキング</td><td data-i18n="price.meal_setcourse">セット又はコース</td><td data-i18n="price.meal_setcourse">セット又はコース</td></tr>
                    <tr><th data-i18n="price.meal_r2">デラックスバイキング</th><td data-i18n="price.meal_buffet">バイキング</td><td data-i18n="price.meal_buffet">バイキング</td><td data-i18n="price.meal_buffet">バイキング</td></tr>
                  </tbody>
                </table>
              </div>
            </div>
            <ul class="price__notes">
              <li data-i18n="price.meal_note1">※朝食・夕食はビックファームレストランでのご提供、ご昼食についてはビックファームレストラン又は他のレストランがご利用できます。</li>
              <li data-i18n="price.meal_note2">※Aコースについては事前（宿泊のご予約時）のご予約になります。</li>
            </ul>
          </section>

          <section class="price__sec">
            <p class="modal__title"><span data-i18n="price.fac_title">ご利用いただける施設</span></p>

            <div class="price__area price__area--5">
              <p class="price__area-name" data-i18n="price.area1">農園・体験エリア</p>
              <div class="price__cards">
                <div class="price__card"><p class="price__card-h" data-i18n="price.f1_h">元気の森</p><p class="price__card-b" data-i18n="price.f1_b">森の中を歩きながら自然に触れられる散策スポット</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f2_h">元気チャレンジ館</p><p class="price__card-b" data-i18n="price.f2_b">体を動かしながら楽しく取り組めるアクティビティ施設</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f3_h">幼児チャレンジ館</p><p class="price__card-b" data-i18n="price.f3_b">小さなお子様向けの遊び・体験施設</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f4_h">ふれあい動物王国</p><p class="price__card-b" data-i18n="price.f4_b">動物たちとふれあいながら過ごせるエリア</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f5_h">ビックファーム</p><p class="price__card-b" data-i18n="price.f5_b">全450棟のドーム型宿泊施設</p></div>
              </div>
            </div>

            <div class="price__area price__area--4">
              <p class="price__area-name" data-i18n="price.area2">測定・トレーニングエリア</p>
              <div class="price__cards">
                <div class="price__card"><p class="price__card-h" data-i18n="price.f6_h">体力年齢測定館</p><p class="price__card-b" data-i18n="price.f6_b">ご自身の体力年齢をチェックできる測定施設</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f7_h">健康トレーニング館</p><p class="price__card-b" data-i18n="price.f7_b">運動器具を使ったトレーニングができる施設</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f8_h">健康リフレッシュ館</p><p class="price__card-b" data-i18n="price.f8_b">軽い運動やストレッチで心身をリフレッシュできる施設</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f9_h">手のひら発汗測定</p><p class="price__card-b" data-i18n="price.f9_b">手のひらの発汗量から自律神経の状態をチェック</p></div>
              </div>
            </div>

            <div class="price__area price__area--5">
              <p class="price__area-name" data-i18n="price.area3">温浴・リラクゼーションエリア</p>
              <div class="price__cards">
                <div class="price__card"><p class="price__card-h" data-i18n="price.f10_h">オキシゲンドーム</p><p class="price__card-b" data-i18n="price.f10_b">酸素濃度を高めた空間でゆったり過ごせるドーム</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f11_h">酵素風呂</p><p class="price__card-b" data-i18n="price.f11_b">発酵の熱を利用した、米ぬかなどの酵素風呂</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f12_h">よもぎ蒸し</p><p class="price__card-b" data-i18n="price.f12_b">よもぎの蒸気を下半身から浴びる温浴</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f13_h">マッサージ</p><p class="price__card-b" data-i18n="price.f13_b">専門スタッフによる、心身をゆるめるマッサージ</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f14_h">ヘッドスパ</p><p class="price__card-b" data-i18n="price.f14_b">頭を中心に、凝りや疲れをほぐすリラクゼーション</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f15_h">健康火山温泉</p><p class="price__card-b" data-i18n="price.f15_b">阿蘇の地で楽しめる火山由来の温泉</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f16_h">健康温熱十三種</p><p class="price__card-b" data-i18n="price.f16_b">13種類の温熱窯を巡って楽しめる発汗施設</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f17_h">岩草浴</p><p class="price__card-b" data-i18n="price.f17_b">温めた岩と薬草の香りに包まれる発汗浴</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f18_h">ドーム還元浴</p><p class="price__card-b" data-i18n="price.f18_b">ドーム型の温熱室でじんわりと汗を流す発汗浴</p></div>
                <div class="price__card"><p class="price__card-h" data-i18n="price.f19_h">マグマクレイスパ</p><p class="price__card-b" data-i18n="price.f19_b">マグマ由来の泥（クレイ）を使ったスパ施設</p></div>
              </div>
            </div>
          </section>

          <div class="price__close">
            <a class="btn-bracket" href="#" data-modal-close><span data-i18n="price.close">閉じる</span></a>
          </div>
        </div>
      </div>
    </div>
  </div>

<?php
get_footer();
