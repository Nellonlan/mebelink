<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($testimonials as $testimonial) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="testimonial-thumb">
	  <?php if ($testimonial['avatar']) { ?>
      <p class="image"><img src="<?php echo $testimonial['avatar']; ?>" alt="" class="img-responsive" /></p>
      <?php } ?>
	  <div class="caption">
	    <?php if ($testimonial['title']) { ?>
        <h4><?php echo $testimonial['title']; ?></h4>
	    <?php } ?>
        <?php if ($testimonial['good']) { ?>
	    <p><strong><?php echo $entry_good; ?></strong><br/><?php echo $testimonial['good']; ?></p>
	    <?php } ?>
	    <?php if ($testimonial['bad']) { ?>
	    <p><strong><?php echo $entry_bad; ?></strong><br/><?php echo $testimonial['bad']; ?></p>
	    <?php } ?>
	    <?php if ($testimonial['text']) { ?>
	    <p><strong><?php echo $entry_text; ?></strong><br/><?php echo $testimonial['text']; ?></p>
	    <?php } ?>
        <?php if ($testimonial['rating']) { ?>
        <p class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($testimonial['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </p>
	    <?php } ?>
        <?php if ($testimonial['name'] || $testimonial['city'] || $testimonial['date_added']) { ?>
        <p>
          <?php if ($testimonial['name']) { ?>
		  <i><?php echo $testimonial['name']; ?></i>
		  <?php } ?>
		  <?php if ($testimonial['city']) { ?>
		  <i><?php echo $testimonial['city']; ?></i>
		  <?php } ?>
		  <?php if ($testimonial['date_added']) { ?>
		  <i><?php echo $testimonial['date_added']; ?></i>
		  <?php } ?>
        </p>
	    <?php } ?>
	    <?php if ($testimonial['image']) { ?>
	    <p><strong><?php echo $entry_image; ?></strong></p>
	    <p class="sm-thumbnail sm-thumbnail<?php echo $module; ?><?php echo $testimonial['testimonial_id']; ?>"><?php foreach ($testimonial['image'] as $value) { ?><a data-thumbnail="<?php echo $module; ?><?php echo $testimonial['testimonial_id']; ?>" href="<?php echo $value['thumb']; ?>"><img src="<?php echo $value['thumbnail']; ?>" class="img-thumbnail"></a><?php } ?></p>
	    <?php } ?>
	  </div>
	  <?php if ($readmore) { ?>
	  <a href="<?php echo $testimonial['href']; ?>" class="btn btn-primary btn-sm"><?php echo $button_readmore; ?></a>
	  <?php } ?>
    </div>
  </div>
  <?php } ?>
</div>
<?php if ($show_all) { ?>
<div class="row">
  <div class="col-md-12">
    <div class="button-group pull-right">
      <a class="btn btn-primary" href="<?php echo $show_all_url; ?>"><?php echo $button_show_all; ?></a>
    </div>
  </div>
</div>
<?php } ?>
<?php if ($image) { ?>
<script type="text/javascript"><!--
	$('.sm-thumbnail a').on('click', function() {
		$('.sm-thumbnail' + $(this).data('thumbnail')).magnificPopup({
			type:'image',
			delegate: 'a',
			gallery: {
			    enabled:true
			}
		});
	});
--></script>
<?php } ?>