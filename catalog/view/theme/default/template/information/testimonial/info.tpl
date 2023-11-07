<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
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
      <h1><?php echo $heading_title; ?></h1>
	  <div class="row">
		<?php if ($avatar) { ?>
		<div class="col-md-8">
		  <p><img src="<?php echo $avatar; ?>" alt="<?php echo $name; ?>" /></p>
		</div>
		<div class="col-md-4">
		  <table class="table table-striped table-bordered">
		    <?php if ($name) { ?>
		    <tr>
		      <td class="text-left"><strong><?php echo $entry_name; ?>:</strong></td>
			  <td class="text-right"><?php echo $name; ?></td>
		    </tr>
			<?php } ?>
			<?php if ($city) { ?>
		    <tr>
		      <td class="text-left"><strong><?php echo $entry_city; ?>:</strong></td>
			  <td class="text-right"><?php echo $city; ?></td>
		    </tr>
			<?php } ?>
			<?php if ($rating) { ?>
		    <tr>
		      <td class="text-left"><strong><?php echo $entry_rating; ?>:</strong></td>
			  <td class="text-right">
			    <?php if ($rating) { ?>
				<span class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
				  <?php if ($rating < $i) { ?>
				  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				  <?php } else { ?>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				  <?php } ?>
				  <?php } ?>
				</span>
				<?php } ?>
			  </td>
		    </tr>
			<?php } ?>
			<?php if ($date_added) { ?>
		    <tr>
		      <td class="text-left"><strong><?php echo $entry_date_added; ?>:</strong></td>
			  <td class="text-right"><?php echo $date_added; ?></td>
		    </tr>
			<?php } ?>
		  </table>
		</div>
		<?php } else { ?>
		<?php if ($name) { ?><?php echo $name; ?><?php } ?>
		<?php if ($city) { ?><?php echo $city; ?><?php } ?>
		<?php if ($rating) { ?>
		<span class="rating">
		  <?php for ($i = 1; $i <= 5; $i++) { ?>
		  <?php if ($rating < $i) { ?>
		  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
		  <?php } else { ?>
		  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
		  <?php } ?>
		  <?php } ?>
		</span>
		<?php } ?>
		<?php if ($date_added) { ?><?php echo $date_added; ?><?php } ?>
		<?php } ?>
	  </div>
	  <div class="row">
	    <div class="col-md-12">
	      <?php if ($text) { ?>
		  <h2><?php echo $entry_text; ?></h2>
		  <p><?php echo $text; ?></p>
		  <?php } ?>
		  <?php if ($good) { ?>
		  <h2><?php echo $entry_good; ?></h2>
		  <p><?php echo $good; ?></p>
		  <?php } ?>
		  <?php if ($bad) { ?>
		  <h2><?php echo $entry_bad; ?></h2>
		  <p><?php echo $bad; ?></p>
		  <?php } ?>
		  <?php if ($image) { ?>
		  <h2><?php echo $entry_image; ?></h2>
		  <p class="s-thumbnail-info"><?php foreach ($image as $value) { ?><a href="<?php echo $value['thumb']; ?>"><img src="<?php echo $value['thumbnail']; ?>" class="img-thumbnail"></a><?php } ?></p>
		  <script type="text/javascript"><!--
			  $('.s-thumbnail-info a').on('click', function() {
					$('.s-thumbnail-info').magnificPopup({
						type:'image',
						delegate: 'a',
						gallery: {
							enabled:true
						}
					});
				});
		  //--></script>
		  <?php } ?>
		  <?php if ($comment) { ?>
		  <h2><?php echo $entry_comment; ?></h2>
		  <p><blockquote><?php echo $comment; ?></blockquote></p>
		  <?php } ?>
		</div>
	  </div>
	<?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>