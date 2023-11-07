<?php echo $header; ?>



		



<div id="cbp-fwslider" class="cbp-fwslider">
				<ul>
					<!--<li><a href="/special/"><img src="slider/images/slide2022.jpg" alt="img01"/></a></li>-->
					
					
					<li><a href="#"><img src="slider/images/05.02.2023.jpg" alt="img01"/></a></li>
					
					<li><a href="/kuhni/"><img src="slider/images/2autumn05.10.22.jpg" alt="img01"/></a></li>
					<li><a href="#"><img src="slider/images/forslide3(1).jpg" alt="img01"/></a></li>
					<li><a href="/kuhni/"><img src="slider/images/19.jpeg" alt="img01"/></a></li>
					<li><a href="#"><img src="slider/images/forslide4(1).jpg" alt="img01"/></a></li>
					
					<li><a href="#"><img src="slider/images/forslide1(1).jpg" alt="img01"/></a></li>
					
					<li><a href="#"><img src="slider/images/forslide2(1).jpg" alt="img01"/></a></li>
				</ul>
			</div>



		
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&amp;apikey=df6f3be9-b817-4b72-a7d8-8f516a689c5d" type="text/javascript"></script>
    <script src="/catalog/view/javascript/icon_customImage.js" type="text/javascript"></script>
		<style>
        html, body, #map {
            width: 100%; height: 500px; padding: 0; margin: 0;
        }
    </style>
	
<?php echo $footer; ?>