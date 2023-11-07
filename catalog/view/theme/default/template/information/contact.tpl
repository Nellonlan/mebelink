<?php echo $header; ?>
<div class="container">
  
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
      <h1><?php echo $heading_title; ?></h1>
<div class="right map">
<h2>Адрес магазина мебели МДК</h2>
<b>Адрес магазина:</b><br>г. Калуга, ул. Достоевского, 27 - Вся корпусная и мягкая мебель от российских фабрик, кухни  по индивидуальным размерам.<br><br>
<b>Телефоны:</b><br>+7(960)516-31-74<!--<br>+7(906)507-75-53--><br><br>
<b>Время работы:</b> <br>Пн-Пт: 10.00 до 19.00 <br>Сб: 10.00 до 18.00 <br>Вс: 10.00 до 17.00<br><br>

<!--<b>Работа в праздничные дни:</b><br>
С 1 по 10 мая: 10.00 до 17.00<br>
<b><span style="color: red;">2 и 9 мая: Выходные дни</span></b><br><br>-->

<b>Данные магазина:</b> <br>ИП Щегленкова О.В. <br>ОГРНИП: 310402711700067<br><br>
  <div><a target="_blank" href="https://vk.com/mebeldk40"><img style="width: 23px; margin-right: 10px;" src="/image/vkontakte.svg"></a><a target="_blank" href="https://instagram.com/mebeldk.klg"><img style="width: 23px;" src="/image/instagram.svg"></a></div>
<br>
<iframe src="https://yandex.ru/map-widget/v1/?z=14&amp;ol=biz&amp;oid=1288820743" width="100%" height="500" frameborder="0"></iframe>			 
        </div><br>
      <div style="text-align: center;">
	<span><img alt="" src="https://mebeldk.ru/image/data/094.JPG" style="width: 320px; height: 240px;    padding: 5px;"><img alt="" src="https://mebeldk.ru/image/data/vhod2.jpg" style="width: 320px; height: 240px;    padding: 5px;"></span><br>
	</div>
	<p></p>
	<div style="text-align: center;">
		<span><b>Магазин «Мебель доступная каждому» в Калуге:</b></span></div>
		<center><span><b>ул. Достоевского 27, (вход с улицы Дзержинского, </b>между Фетта-пиццей и Пятерочкой, аллейка) - Вся корпусная и мягкая мебель от российских фабрик, кухни по индивидуальным размерам.<br></span><br></center>
		<p style="text-align: center; font-size: 18px;
    color: #fa5d02;">Как нас найти</p>
	<center><video poster="/16.jpg" width="300" src="/15.mp4" controls></video></center>
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
	  <p></p>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
