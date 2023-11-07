<div class="prodcarous taby sdsd">
<?php if ($heading_title) { ?>
<h3 class="title modtitle"><?php echo $heading_title; ?></h3>
  <?php } ?>
  <?php $i = 0; foreach ($tabs as $tab) { $i++; ?>
<div id="prodcarousel<?php echo $tab['module']; ?>-<?php echo $tab['id']; ?>" class="owl-carousel productcarusel pctab view<?php echo $prodview.' '.$class; if ($i == 1) { echo ' active'; } ?>">
  <?php foreach ($tab['product'] as $product) { ?>
  <div class="item text-center product-layout">
   <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
<?php if ($prodview !=1 && $prodview !=2) { ?>
        <p><?php echo $product['description']; ?></p>
 <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-3x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-3x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          
        </p>
		<button type="button" class="tap-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"></span></button>
        <?php } ?>
      </div>
     
      <?php if ($product['percent']) { ?><span class="percent"><span class="proc">РАСПРОДАЖА</span></span><?php } ?>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#prodcarousel<?php echo $tab['module']; ?>-<?php echo $tab['id']; ?>').owlCarousel({
  items: <?php echo $items; ?>,
  autoPlay: 5000,
  navigation: true,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  pagination: false
});
--></script>
 <?php } ?>

</div>