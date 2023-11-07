<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1>Страница не найдена</h1>
      <p style="margin-bottom: 30px;">К сожалению, тут ничего нет. Вы можете перейти на <a href="/">главную</a>, либо заглянуть в другие разделы.</p>
	  <p></p>
	  <div class="main-katalog">
<div class="el-main-katalog">
<a href="/kuhni/"><img src="/image/main/1.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/kuhni/">Кухни</a></div>
</div>
<div class="el-main-katalog">
<a href="/gostinye/"><img src="/image/main/2.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/gostinye/">Гостиные</a></div>
</div>
<div class="el-main-katalog">
<a href="/hallway/"><img src="/image/main/3.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/hallway/">Прихожие</a></div>
</div>
<div class="el-main-katalog">
<a href="/spalnja/"><img src="/image/main/4.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/spalnja/">Спальни</a></div>
</div>
<div class="el-main-katalog">
<a href="/krovat-kaluga/"><img src="/image/main/44.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/krovat-kaluga/">Кровати</a></div>
</div>
<div class="el-main-katalog">
<a href="/cabinets/"><img src="/image/main/5.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/cabinets/">Шкафы</a></div>
</div>
<div class="el-main-katalog">
<a href="/detskaja/"><img src="/image/main/6.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/detskaja/">Детские</a></div>
</div>
<div class="el-main-katalog">
<a href="/index.php?route=product/category&amp;path=133"><img src="/image/main/7.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/index.php?route=product/category&amp;path=133">Столы и стеллажи</a></div>
</div>
<div class="el-main-katalog">
<a href="/matrasy/"><img src="/image/main/8.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="/matrasy/">Матрасы</a></div>
</div>
<div class="el-main-katalog">
<a href="=/index.php?route=product/category&amp;path=134"><img src="/image/main/9.jpg" style="width: 215px;"></a>
<div class="text-main-catalog"><a href="=/index.php?route=product/category&amp;path=134">Мягкая мебель</a></div>
</div>
</div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
