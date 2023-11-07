<h3 class="hidden-xs">
<?php 
if($title_link) {
	echo '<a href ="'.$title_link.'">'.$heading_title.'</a>';
} else {
	echo $heading_title;
} 
?>
</h3>					
<div id="scroller_<?php echo $module; ?>" class="owl-carousel scroller hidden-xs">
		<?php foreach ($products as $product) { ?>
				 <div class="product-thumb transition">
					<?php if ($product['thumb']) { ?>
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
					<?php } ?>
					<div class="caption" style="min-height: <?php echo $show_price ? 85: 40?>px">
						<?php if ($show_title =='1') { ?>
							<div class="name">
							<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
							</div>
						<?php } ?>
						<?php if ($show_desc =='1') { ?>
							<p style="height:<?php echo $dHeight; ?>px"><?php echo $product['desc']; ?></p>
						<?php } ?>
						<?php if ($show_price =='1') { ?>
							<?php if ($product['price']) { ?>
								<p class="price">
								<?php if (!$product['special']) { ?>
									<?php echo $product['price']; ?>
								<?php } else { ?>
									<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
								<?php } ?>
								 <?php if ($product['tax']) { ?>
								  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								  <?php } ?>
								</p>
							<?php } ?>
						<?php } ?>
						<?php if (($product['rating']) && ($show_rate =='1')) { ?>
							<div class="rating">
							  <?php for ($i = 1; $i <= 5; $i++) { ?>
							  <?php if ($product['rating'] < $i) { ?>
							  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
							  <?php } else { ?>
							  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
							  <?php } ?>
							  <?php } ?>
							</div>
						<?php } ?>
					</div>
					<?php if ($butCount > 0) {?>
					<div class="button-group">
						<?php if ($show_cart =='1') { ?>
							<button style="width: <?php echo $butWidth; ?>% !important" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">
						<?php if($butCount < 3) echo $button_cart; ?>
						</span></button><?php } ?>
						<?php if ($show_wish =='1') { ?>
						<button style="width: <?php echo $butWidth; ?>% !important" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button><?php } ?>
						<?php if ($show_compare =='1') { ?>
						<button style="width: <?php echo $butWidth; ?>% !important" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button><?php } ?>
						</div>
					<?php } ?>
				</div>			
		<?php } ?>
</div>

<script type="text/javascript"><!--
$('#scroller_<?php echo $module; ?>').owlCarousel({
	items: <?php echo $visible; ?>,
	itemsDesktop : [1170,<?php echo $visible ?>],
	itemsDesktopSmall : [970,3],
	itemsTablet       : [750,2],
	itemsMobile : [440,1],
	<?php if ($autoscroll) {?>
		autoPlay: <?php echo $autoscroll; ?>,
	<?php } ?>
	<?php if ($shownav == 0) {?>
		navigation: false,
	<?php } else {?>
		navigation: true,
	<?php } ?>
	slideSpeed: <?php echo $animationspeed; ?>,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],	
	<?php if ($hoverpause == 0) {?>
		stopOnHover: false,
	<?php } else {?>
		stopOnHover: true,
	<?php } ?>
/*	itemsDesktop: false,
	itemsDesktopSmall: false,
	itemsTablet: true,
	itemsTabletSmall: true,
	itemsMobile: true,*/
	
	pagination: true
});
--></script>