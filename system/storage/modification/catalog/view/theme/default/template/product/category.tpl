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
	  
	  
<?php if ($categories) { ?>
	<div class="col-sm-12">
	  <div>
		<h3>Каталог мебели</h3>
	  </div>
	  <div style="text-align: center;">
		<div class="row  uuu">
		<?php foreach ($categories as $category) { ?>
		  <div class="col-sm-2 col-xs-6" style="margin-bottom: 20px;">
			<div><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>"/></a></div>
			<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		  </div>
		<?php } ?>
		</div>
	  </div>
	</div>
<?php } ?>
            
	  <hr>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        
        <?php if ($description) { ?>
        <div class="col-sm-10">
		<div class="description"><?php echo $description; ?></div>
		<?php if ($rm_description) { ?>
		  <script>
			$('.description').readmore({
			  speed: 500,
			  collapsedHeight: <?php echo $ht_description; ?>,
			  moreLink: '<div class="block-readmore"><a href="#"><?php echo $text_rm_sh_description; ?></a></div>',
			  lessLink: '<div class="block-readmore"><a href="#"><?php echo $text_rm_hd_description; ?></a></div>',
			});
		  </script>
		<?php } ?>
	  </div>
        <?php } ?>
      </div>
      
      <?php } ?>
      
      <?php if ($products) { ?>
      <div class="row">
        <div class="col-md-2 col-sm-6 hidden-xs">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
    
        <div class="col-md-4 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
	  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
      <div class="row prod">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="product-thumb">
            
					<div class="image">
						<!-- XD stickers start -->
						<?php if (!empty($product['product_xdstickers'])) { ?>
						<div class="xdstickers_wrapper<?php echo $xdstickers_position ?>">
							<?php foreach($product['product_xdstickers'] as $xdsticker) { ?>
								<div class="xdstickers <?php echo $xdsticker['id']; ?>">
									<?php echo $xdsticker['text']; ?>
								</div>
							<?php } ?>
						</div>
						<?php } ?>
						<!-- XD stickers end -->
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
					</div>
				
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              
                <?php if ($product['price']&&$product['price']>0) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  Цена: <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new">Цена: <?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
               
                </p>
                <?php } ?>
               
              </div>
			  <span style="display:none;">Купить</span>
              <div class="button-group">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"></span></button>
              
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>

		<?php if ($ext_description) { ?>
		<hr>
		  <div class="row">
			<div class="col-sm-12">
			  <?php if ($rmm_ext_description) { ?>
				<div class="ext-description">
				  <?php echo $ext_description; ?>
				</div>
<script>
  <?php if ($rmm_ext_description) { ?>
	if ($(window).width() < 768){
	  $('.ext-description').readmore({
		speed: 500,
		collapsedHeight: 0,
		moreLink: '<div class="button-collapse text-center visible-xs hidden-sm hidden-md hidden-lg"><a href="#" class="btn btn-primary"><?php echo $text_rmm_sh_description; ?></a></div>',
		lessLink: '<div class="button-collapse text-center visible-xs hidden-sm hidden-md hidden-lg"><a href="#" class="btn btn-primary"><?php echo $text_rmm_hd_description; ?></a></div>',
	  });
	}
  <?php } ?>
  <?php if ($rm_ext_description) { ?>
	if ($(window).width() >= 768){
	  $('.ext-description').readmore({
		speed: 500,
		collapsedHeight: <?php echo $ht_ext_description; ?>,
		moreLink: '<div class="block-readmore"><a href="#"><?php echo $text_rm_sh_description; ?></a></div>',
		lessLink: '<div class="block-readmore"><a href="#"><?php echo $text_rm_hd_description; ?></a></div>',
	  });
	}
  <?php } ?>
</script>
			  <?php }else{ ?>
				<div class="ext-description">
				  <?php echo $ext_description; ?>
				</div>
			  <?php } ?>
			</div>
		  </div>
		<?php } ?>
	  
<?php echo $microdatapro; $microdatapro_main_flag = 1; //microdatapro 7.5 - 1 - main ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if(!isset($microdatapro_main_flag)){echo $microdatapro;} //microdatapro 7.5 - 2 - extra ?>
<?php echo $footer; ?>
