<?php if ($testimonials) { ?>    
<div class="text-right"><?php echo $pagination; ?></div> 
<?php foreach ($testimonials as $testimonial) { ?>
<table class="table table-striped table-bordered">
  <tr>
    <?php if ($testimonial['avatar']) { ?>
    <td class="text-center column-avatar">
	  <p><img src="<?php echo $testimonial['avatar']; ?>" alt="<?php echo $testimonial['name']; ?>" class="img-responsive" /></p>
    </td>
    <?php } ?>
    <td>
	  <?php if ($testimonial['title']) { ?>
	  <h2><?php echo $testimonial['title']; ?></h2>
	  <?php } ?>
	  <p>
	    <?php if ($testimonial['rating']) { ?>
	    <span class="rating">
		  <?php for ($i = 1; $i <= 5; $i++) { ?>
		  <?php if ($testimonial['rating'] < $i) { ?>
		  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
		  <?php } else { ?>
		  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
		  <?php } ?>
		  <?php } ?>
	    </span>
	    <?php } ?>
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
	  <?php if ($testimonial['text']) { ?>
	  <p><strong><?php echo $entry_text; ?></strong></p><p><?php echo $testimonial['text']; ?></p>
	  <?php } ?>
	  <?php if ($testimonial['good']) { ?>
	  <p><strong><?php echo $entry_good; ?></strong></p><p><?php echo $testimonial['good']; ?></p>
	  <?php } ?>
	  <?php if ($testimonial['bad']) { ?>
	  <p><strong><?php echo $entry_bad; ?></strong></p><p><?php echo $testimonial['bad']; ?></p>
	  <?php } ?>
	  <?php if ($testimonial['image']) { ?>
	  <p><strong><?php echo $entry_image; ?></strong></p>
	  <div class="s-thumbnail s-thumbnail<?php echo $testimonial['testimonial_id']; ?>"><?php foreach ($testimonial['image'] as $value) { ?><a data-thumbnail="<?php echo $testimonial['testimonial_id']; ?>" href="<?php echo $value['thumb']; ?>"><img src="<?php echo $value['thumbnail']; ?>" class="img-thumbnail"></a><?php } ?></div>
	  <?php } ?>
	  <?php if ($testimonial['comment']) { ?>
	  <blockquote><p><strong><?php echo $entry_comment; ?></strong></p><p><?php echo $testimonial['comment']; ?></p></blockquote>
	  <?php } ?>
	  <?php if ($testimonial['readmore']) { ?>
	  <p class="text-right"><a class="btn btn-primary btn-sm" href="<?php echo $testimonial['href']; ?>"><?php echo $button_readmore; ?></a>
	  <?php } ?>
    </td>
  </tr>
</table>	
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php if ($field_image) { ?>
<script type="text/javascript"><!--
  $(document).ready(function() {
	  $('.s-thumbnail a').on('click', function() {
		  $('.s-thumbnail' + $(this).data('thumbnail')).magnificPopup({
			  type:'image',
			  delegate: 'a',
			  gallery: {
				  enabled:true
			  }
		  });
	  });
  });
//--></script>
<?php } ?>
<?php } ?>