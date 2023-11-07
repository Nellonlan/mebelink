<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="HandheldFriendly" content="true"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#ff940d">
<meta name="theme-color" content="#ffffff">
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet1.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script>
    $( function() {
        /*
        - how to call the plugin:
        $( selector ).cbpFWSlider( [options] );
        - options:
        {
            // default transition speed (ms)
            speed : 500,
            // default transition easing
            easing : 'ease'
        }
        - destroy:
        $( selector ).cbpFWSlider( 'destroy' );
        */

        $( '#cbp-fwslider' ).cbpFWSlider();

    } );
</script>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
</style>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<script src="slider/js/modernizr.custom.js"></script>
<script src="slider/js/jquery.cbpFWSlider.min.js"></script>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
  <div class="vverh">
  <div class="vverh-adress"><i class="fa fa-map-marker"></i><span class="adres-top">Калуга, Достоевского 27</span>
  </div>
  <div class="vverh-adress2"><i class="fa fa-phone-marker"></i><span class="adres-top"><a href="tel:+79605163174">+7(960)516-31-74</a></span><!--<span class="adres-top"><a href="tel:+79065077553">+7(906)507-75-53</a></span>-->
  </div>
  </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4 header">
	  
	  <div class="info">
			<div class="buttons">
				<p>

					<a href="" data-modal="#modal3" class="modal__trigger"><img class="logo-header" src="/image/mod-menu.jpg" alt="МДК"></a><a target="_blank" href="https://vk.com/mebeldk40"></a><a target="_blank" href="https://instagram.com/mebeldk.klg"></a>
				</p>
			</div>
		</div>
	  <div id="modal3" class="modal modal__bg" role="dialog" aria-hidden="true">
		<div class="modal__dialog">
			<div class="modal__content">
				<div class="row modal-okno">
     
	<div class="col-sm-33-2">
        <p class="zagol"><a href="/kuhni/">КУХНИ</a></p>
        <ul class="list-unstyled">
           <li><a href="/kuhni/to-size/">Кухонные гарнитуры</a></li>
		  <li><a href="/kuhni/koshelev/">Наши работы</a></li>
          <li><a href="/index.php?route=product/category&path=20_128">Cтеновые панели</a></li>
		  <li><a href="/kuhni/corners/">Кухонные уголки</a></li>
		  <li><a href="/kuhni/dining-tables/">Обеденные столы</a></li>
		  <li><a href="/kuhni/chairs-stools/">Стулья, табуреты</a></li>
		  <li><a href="/index.php?route=product/category&path=20_129">Мойки и смесители</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
         <p class="zagol"><a href="/gostinye/">ГОСТИНЫЕ</a></p>
        <ul class="list-unstyled">
          <li><a href="/gostinye/furniture/">Мебель для гостиной</a></li>
		  <li><a href="/gostinye/zhurnalnye-stoly/">Журнальные столики</a></li>
          <li><a href="/gostinye/tv-tumby/">TV-тумбы и мини стенки</a></li>
		  <li><a href="/gostinye/tables-books/">Столы - книжки</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
        <p class="zagol"><a href="/hallway/">ПРИХОЖИЕ</a></p>
        <ul class="list-unstyled">
    <li><a href="/hallway/cosiness/">Прихожие</a></li>
		  <li><a href="/hallway/obuvnitsy/">Обувницы</a></li>
        </ul>
		<p class="zagol"><a href="/krovat-kaluga/">КРОВАТИ</a></p>
        <ul class="list-unstyled">
      <li><a href="/spalnja/krovati-s-podemnym-mehanizmom/">С подъемным механизмом</a></li>
		  <li><a href="/krovat-kaluga/krovati-iz-massiva/">Из массива</a></li>
		  <li><a href="/krovat-kaluga/krovati-iz-ekokozhi-i-tkani/">Из экокожи</a></li>
		  <li><a href="/krovat-kaluga/krovati-s-myagkim-izgolovem/">С мягким изголовьем</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
         <p class="zagol"><a href="/spalnja/">СПАЛЬНЯ</a></p>
        <ul class="list-unstyled">
 <li><a href="/spalnja/spalni-po-moduljam/">Модульные спальни</a></li>
		  <li><a href="/spalnja/komody/">Комоды</a></li>
		  <li><a href="/spalnja/tualetnye-stoliki/">Туалетные столики</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
         <p class="zagol"><a href="/cabinets/">ШКАФЫ</a></p>
        <ul class="list-unstyled">
 <li><a href="/cabinets/coupe/">Шкафы - купе</a></li>
          <li><a href="/cabinets/swing/">Распашные шкафы</a></li>
		  <li><a href="/cabinets/corner/">Угловые шкафы</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
         <p class="zagol"><a href="/detskaja/">ДЕТСКИЕ</a></p>
        <ul class="list-unstyled">
        <li><a href="/detskaja/podrostkovye-po-moduljam/">Модульные детские</a></li>
		  <li><a href="/detskaja/2-h-jarusnye-krovati/">Двухъярусные кровати</a></li>
          <li><a href="/detskaja/krovati/">Детские кровати</a></li>
		  <li><a href="/detskaja/krovat-cherdak/">Кровати-чердак</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
         <p class="zagol"><a href="/index.php?route=product/category&path=133">СТОЛЫ И СТЕЛЛАЖИ</a></p>
        <ul class="list-unstyled">
          <li><a href="/index.php?route=product/category&path=133_93">Компьютерные столы</a></li>
		  <li><a href="/index.php?route=product/category&path=133_130">Стеллажи</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
         <p class="zagol"><a href="/matrasy/">МАТРАСЫ</a></p>
        <ul class="list-unstyled">
               <li><a href="/detskaja/podrostkovye-po-moduljam/">Детские матрасы</a></li>
		  <li><a href="/detskaja/2-h-jarusnye-krovati/">Матрасы</a></li>
          <li><a href="/index.php?route=product/category&path=77_122">Чехлы</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
        <p class="zagol"><a href="/index.php?route=product/category&path=134">МЯГКАЯ МЕБЕЛЬ</a></p>
        <ul class="list-unstyled">
          <li><a href="/index.php?route=product/category&path=134_125">Диваны и софы</a></li>
		  <li><a href="/index.php?route=product/category&path=134_126">Кресла</a></li>
          <li><a href="/index.php?route=product/category&path=134_132">Мягкие углы</a></li>
        </ul>
	</div>
	<div class="col-sm-33-2">
        <p class="zagol"><a href="/contact-us/">КОНТАКТЫ</a></p>
        <ul class="list-unstyled">
          <li><a href="/kompany">О компании</a></li>
		  <li><a href="/make-orders">Как заказать</a></li>
          <li><a href="/brands/">Производители</a></li>
		  <li><a href="/tovary-v-nalichii/">Лидеры продаж</a></li>
		  <li class="inform"><a class="stolstel ofis" style="color: #fa5d01;" href="/about_us">Отзывы</a></li>

<li class="inform"><a href="/index.php?route=information/contact">Написать отзыв</a></li>
        </ul>
	</div>
    </div>
				
				<!-- modal close button -->
				<a href="" class="modal__close demo-close">
				<svg class="" viewBox="0 0 24 24"><path d="M19 6.41l-1.41-1.41-5.59 5.59-5.59-5.59-1.41 1.41 5.59 5.59-5.59 5.59 1.41 1.41 5.59-5.59 5.59 5.59 1.41-1.41-5.59-5.59z"/><path d="M0 0h24v24h-24z" fill="none"/></svg>
				</a>
			</div>
		</div>
	</div>
	  <script  src="/js/index.js"></script>
	
	   <div class="vopros-header"><a href="#call" class="modalbox call"><span><i class="fa fa-comment-o"></i>Задать вопрос</span></a></div>
      </div>
       <div class="logo header">
	   <?php if($_SERVER['REQUEST_URI'] == "/index.php?route=common/home" OR $_SERVER['REQUEST_URI'] == "/") { ?>
	   <img class="logo-header" src="/image/catalog/logo.png" alt="МДК">
	   <?php } else { ?>
	   <a href="<?php echo $home; ?>"><img src="/image/catalog/logo.png" alt="МДК" class="logo-header" /></a>
	   <?php } ?>
            <p class="logo-text">МЕБЕЛЬ ДОСТУПНАЯ КАЖДОМУ</p>
        </div>
      
      <div class="col-sm-5 header sear"><?php echo $search; ?>
	  <div style="clear: right"></div>
	  <div class="envelope-header"><a href="mailto:mebeldk@inbox.ru" style="color: #101010;"><i class="fa fa-envelope-o"></i>mebeldk@inbox.ru</a></div>
	 
    </div>
	
  </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header">
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><img class="logo-header" src="/image/mod-menu.jpg" alt="МДК"></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
