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
	  <?php if ($description) { ?>
	  <div class="row">
	    <div class="col-md-12">
	    <?php echo $description; ?>
	    </div>
	  </div>
	  <?php } ?>
	  <?php if ($form_position) { ?>
	  <?php if ($form) { ?>
	  <h2><?php echo $text_write; ?></h2>
	  <?php } else { ?>
	  <div class="buttons clearfix">
	    <div class="pull-right">
		  <button type="button" id="button-toggle" class="btn btn-primary"><?php echo $text_write; ?> <i class="fa fa-chevron-down"></i></button>
	    </div>
	  </div>
	  <?php } ?>
	  <form <?php if (!$form) { ?>style="display: none;" <?php } ?>class="form-horizontal" id="form-testimonial" enctype="multipart/form-data" method="post">
	    <?php if ($guest) { ?>
	    <?php if ($field_title) { ?>
	    <div class="form-group<?php if ($field_title == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-title"><?php echo $entry_title; ?></label>
		    <input type="text" name="title" value="" id="input-title" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_city) { ?>
	    <div class="form-group<?php if ($field_city == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
		    <input type="text" name="city" value="" id="input-city" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_email) { ?>
	    <div class="form-group<?php if ($field_email == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
		    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_name) { ?>
	    <div class="form-group<?php if ($field_name == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
		    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_text) { ?>
	    <div class="form-group<?php if ($field_text == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-text"><?php echo $entry_text; ?></label>
		    <textarea name="text" rows="5" id="input-text" class="form-control wysibb"></textarea>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_good) { ?>
	    <div class="form-group<?php if ($field_good == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-good"><?php echo $entry_good; ?></label>
		    <textarea name="good" rows="5" id="input-good" class="form-control wysibb"></textarea>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_bad) { ?>
	    <div class="form-group<?php if ($field_bad == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-bad"><?php echo $entry_bad; ?></label>
		    <textarea name="bad" rows="5" id="input-bad" class="form-control"></textarea>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_rating) { ?>
	    <div class="form-group<?php if ($field_rating == 2) { ?> required<?php } ?>">
		  <div class="col-md-2">
		    <label class="control-label"><?php echo $entry_rating; ?></label>
		  </div>
		  <div class="col-md-10">
		    <div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?><span data-rating-value="<?php echo $i; ?>" onclick="setRating('<?php echo $i; ?>')" class="fa fa-stack"><i class="fa fa-star-<?php echo $i; ?> fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><?php } ?>
			  <input id="input-rating" type="hidden" name="rating" value="0" />		  
		    </div>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_avatar) { ?>	
	    <div class="form-group<?php if ($field_avatar == 2) { ?> required<?php } ?>">
		  <div class="col-md-2">
		    <label class="control-label"><?php echo $entry_avatar; ?></label>
		  </div>
		  <div class="col-md-10">
		    <div><label class="btn btn-primary btn-sm" for="input-avatar"><input id="input-avatar" type="file" name="avatar" style="display:none" accept="image/jpeg,image/png"><i class="fa fa-upload"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_upload; ?></span></label> <button type="button" data-toggle="tooltip" title="<?php echo $button_clear; ?>" class="btn btn-danger btn-sm" id="button-clear"><i class="fa fa-trash"></i></button> <span class="label label-info" id="label-avatar"></span></div>
		    <div><small><?php echo $max_avatar; ?></small></div>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_image) { ?>	
	    <div class="form-group<?php if ($field_image == 2) { ?> required<?php } ?>">
		  <div class="col-md-2">
		    <label class="control-label"><?php echo $entry_image; ?></label>
		  </div>
		  <div class="col-md-10">
		    <div id="image-list"></div>
		    <div><button type="button" class="btn btn-primary btn-sm" id="button-add-image"><i class="fa fa-plus"></i> <?php echo $button_add; ?></button></div>
		    <div><small><?php echo $max_image; ?></small></div>
		  </div>
	    </div>
	    <?php } ?>
	    <?php echo $captcha; ?>
	    <div class="buttons clearfix">
		  <div class="pull-right">
		    <button type="button" id="button-testimonial" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_submit; ?></button>
		  </div>
	    </div>
	    <?php } else { ?>
	    <?php echo $text_login; ?>
	    <?php } ?>
	  </form>
	  <?php } ?>
	  <div class="row">
	    <div class="col-md-4">
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
		<div class="col-md-2">
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
		<div class="col-md-6">
		  <div class="text-right pull-right">
		    <div id="testimonial-total">
		      <span><?php echo $total; ?></span>
		      <?php if ($field_rating) { ?>
		      <span><?php echo $rating_total; ?></span>
		      <?php if ($rating) { ?>
		      <span>
			    <span><?php echo $text_rating; ?></span>
			    <span class="rating">
			      <?php for ($i = 1; $i <= 5; $i++) { ?>
			      <?php if ($rating < $i) { ?>
			      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
			      <?php } else { ?>
			      <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
			      <?php } ?>
			      <?php } ?>
			    </span>
		      </span>
		      <?php } ?>
		      <?php } ?>
		    </div>
		  </div>
		</div>
	  </div>
	  <div id="testimonial">
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
	  </div>
	  <?php if (!$form_position) { ?>
	  <?php if ($form) { ?>
	  <h2><?php echo $text_write; ?></h2>
	  <?php } else { ?>
	  <div class="buttons clearfix">
	    <div class="pull-right">
		  <button type="button" id="button-toggle" class="btn btn-primary"><?php echo $text_write; ?> <i class="fa fa-chevron-down"></i></button>
	    </div>
	  </div>
	  <?php } ?>
	  <form <?php if (!$form) { ?>style="display: none;" <?php } ?>class="form-horizontal" id="form-testimonial" enctype="multipart/form-data" method="post">
	    <?php if ($guest) { ?>
	    <?php if ($field_title) { ?>
	    <div class="form-group<?php if ($field_title == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-title"><?php echo $entry_title; ?></label>
		    <input type="text" name="title" value="" id="input-title" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_city) { ?>
	    <div class="form-group<?php if ($field_city == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-city"><?php echo $entry_city; ?></label>
		    <input type="text" name="city" value="" id="input-city" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_email) { ?>
	    <div class="form-group<?php if ($field_email == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
		    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_name) { ?>
	    <div class="form-group<?php if ($field_name == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
		    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_text) { ?>
	    <div class="form-group<?php if ($field_text == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-text"><?php echo $entry_text; ?></label>
		    <textarea name="text" rows="5" id="input-text" class="form-control wysibb"></textarea>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_good) { ?>
	    <div class="form-group<?php if ($field_good == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-good"><?php echo $entry_good; ?></label>
		    <textarea name="good" rows="5" id="input-good" class="form-control wysibb"></textarea>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_bad) { ?>
	    <div class="form-group<?php if ($field_bad == 2) { ?> required<?php } ?>">
		  <div class="col-sm-12">
		    <label class="control-label" for="input-bad"><?php echo $entry_bad; ?></label>
		    <textarea name="bad" rows="5" id="input-bad" class="form-control"></textarea>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_rating) { ?>
	    <div class="form-group<?php if ($field_rating == 2) { ?> required<?php } ?>">
		  <div class="col-md-2">
		    <label class="control-label"><?php echo $entry_rating; ?></label>
		  </div>
		  <div class="col-md-10">
		    <div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?><span data-rating-value="<?php echo $i; ?>" onclick="setRating('<?php echo $i; ?>')" class="fa fa-stack"><i class="fa fa-star-<?php echo $i; ?> fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><?php } ?>
			  <input id="input-rating" type="hidden" name="rating" value="0" />		  
		    </div>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_avatar) { ?>	
	    <div class="form-group<?php if ($field_avatar == 2) { ?> required<?php } ?>">
		  <div class="col-md-2">
		    <label class="control-label"><?php echo $entry_avatar; ?></label>
		  </div>
		  <div class="col-md-10">
		    <div><label class="btn btn-primary btn-sm" for="input-avatar"><input id="input-avatar" type="file" name="avatar" style="display:none" accept="image/jpeg,image/png"><i class="fa fa-upload"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_upload; ?></span></label> <button type="button" data-toggle="tooltip" title="<?php echo $button_clear; ?>" class="btn btn-danger btn-sm" id="button-clear"><i class="fa fa-trash"></i></button> <span class="label label-info" id="label-avatar"></span></div>
		    <div><small><?php echo $max_avatar; ?></small></div>
		  </div>
	    </div>
	    <?php } ?>
	    <?php if ($field_image) { ?>	
	    <div class="form-group<?php if ($field_image == 2) { ?> required<?php } ?>">
		  <div class="col-md-2">
		    <label class="control-label"><?php echo $entry_image; ?></label>
		  </div>
		  <div class="col-md-10">
		    <div id="image-list"></div>
		    <div><button type="button" class="btn btn-primary btn-sm" id="button-add-image"><i class="fa fa-plus"></i> <?php echo $button_add; ?></button></div>
		    <div><small><?php echo $max_image; ?></small></div>
		  </div>
	    </div>
	    <?php } ?>
	    <?php echo $captcha; ?>
	    <div class="buttons clearfix">
		  <div class="pull-right">
		    <button type="button" id="button-testimonial" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_submit; ?></button>
		  </div>
	    </div>
	    <?php } else { ?>
	    <?php echo $text_login; ?>
	    <?php } ?>
	  </form>
	  <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
<?php if ($field_avatar) { ?>
$('#input-avatar').on('change', function() {
	$('#label-avatar').html(this.files[0].name); 
	$('#button-clear').show();
});
$('#button-clear').on('click', function() {
	$('#input-avatar').val('');
	$('#button-clear').hide();
	$('#label-avatar').empty();
});
<?php } ?>
<?php if ($field_image) { ?>

var row = 0;

$('#button-add-image').on('click', function() {
	if ($('#image-list .image-row').length < '<?php echo $image_limit; ?>') {
		html = '<div class="image-row image-row' + row + '"><label class="btn btn-primary btn-sm" for="input-image' + row + '"><input id="input-image' + row + '" type="file" name="image[]" onchange="$(\'#label-image' + row + '\').html(this.files[0].name);" accept="image/jpeg,image/png"><i class="fa fa-upload"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_upload; ?></span></label> <button type="button" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" onclick="$(this).tooltip(\'destroy\'); $(\'.image-row' + row + '\').remove(); $(\'#button-add-image\').removeAttr(\'disabled\');" class="btn btn-danger btn-sm"><i class="fa fa-remove"></i></button> <span class="label label-info" id="label-image' + row + '"></span></div>';
			
		$('#image-list').append(html);
		$('[rel=tooltip]').tooltip();
		
		row++;
	}
	
	if ($('#image-list .image-row').length == '<?php echo $image_limit; ?>') {
		$('#button-add-image').attr('disabled', 'disabled');
	}
});
<?php } ?>
<?php if (!$form) { ?>
$('#button-toggle').on('click', function() {
	if ($('#button-toggle i').hasClass('fa-chevron-down')) {
		$('#button-toggle i').removeClass('fa-chevron-down').addClass('fa-chevron-up');
	} else {
		$('#button-toggle i').removeClass('fa-chevron-up').addClass('fa-chevron-down');
	}
	
	$('#form-testimonial').slideToggle();
});
<?php } ?>
<?php if ($field_rating) { ?>
function setRating(rating) {
	$('#form-testimonial .rating input[name=\'rating\']').val(rating);
}

$('#form-testimonial .rating span').mouseover(function() {
	
	var rating = $(this).data('rating-value');
	
	for (var i = 1; i <= 5; i++) {
		if (rating >= i) {
			$('#form-testimonial .rating .fa-star-' + i).addClass('fa-star');
		} else {
			$('#form-testimonial .rating .fa-star-' + i).removeClass('fa-star');
		}
	}
});

$('#form-testimonial .rating').mouseout(function() {
	
	var rating = $('#form-testimonial .rating input[name=\'rating\']').val();
	
	for (var i = 1; i <= 5; i++) {
		if (rating >= i) {
			$('#form-testimonial .rating .fa-star-' + i).addClass('fa-star');
		} else {
			$('#form-testimonial .rating .fa-star-' + i).removeClass('fa-star');
		}
	}
});
<?php } ?>
<?php if ($editor) { ?>
$(document).ready(function() {
	var wbbOpt = {
        buttons:'bold,italic,underline,strike,fontcolor,fontsize,|,bullist,numlist,|,video,link,smilebox',
		lang: '<?php echo $wysibb_language; ?>',
		smileList: [
			<?php if ($smiles) { ?>
			<?php foreach ($smiles as $smile) { ?>
			{title: '', img: '<img src="<?php echo $smile['url']; ?>" class="smile">', bbcode:":<?php echo $smile['name']; ?>:"},
			<?php } ?>
			<?php } ?>
		]
	}
<?php if ($field_text) { ?>
	$("#input-text").wysibb(wbbOpt);
<?php } ?>
<?php if ($field_good) { ?>
	$("#input-good").wysibb(wbbOpt);
<?php } ?>
<?php if ($field_bad) { ?>
	$("#input-bad").wysibb(wbbOpt);
<?php } ?>
});
<?php } ?>
$('#button-testimonial').on('click', function() {
	<?php if ($editor) { ?>
	<?php if ($field_text) { ?>
	$("#input-text").sync();
	<?php } ?>
	<?php if ($field_good) { ?>
	$("#input-good").sync();
	<?php } ?>
	<?php if ($field_bad) { ?>
	$("#input-bad").sync();
	<?php } ?>
	<?php } ?>
	$.ajax({
		url: 'index.php?route=information/testimonial/write',
		type: 'post',
		dataType: 'json',
		data: new FormData($('#form-testimonial').get(0)),
		cache: false,
		contentType: false,
		processData: false,
		beforeSend: function() {
			$('#button-testimonial').button('loading');
		},
		complete: function() {
			$('#button-testimonial').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#content').parent().before('<div class="testimonial-alert alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				setTimeout(function () {
					$('.testimonial-alert').fadeOut();
				}, 3000);
			}

			if (json['success']) {
				$('#content').parent().before('<div class="testimonial-alert alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				setTimeout(function () {
					$('.testimonial-alert').fadeOut();
				}, 3000);
				<?php if (!$moderation) { ?>
				$('#testimonial-total').load('index.php?route=information/testimonial/total');
				$('#testimonial').load('index.php?route=information/testimonial/testimonial_list');
				<?php } ?>
				// Clear form
				$('#form-testimonial').get(0).reset();
				<?php if ($field_rating) { ?>
				$('#form-testimonial .rating span i').removeClass('fa-star');
				$('#form-testimonial input[name=\'rating\']').val('');
				<?php } ?>
				<?php if ($field_avatar || $field_image) { ?>
				$('#form-testimonial .label-info').empty();
				<?php } ?>
				<?php if ($field_avatar) { ?>
				$('#button-clear').hide();
				<?php } ?>
				<?php if ($field_image) { ?>
				$("#form-testimonial .image-row").remove();
				$('#button-add-image').removeAttr('disabled');
				<?php } ?>
				<?php if ($editor) { ?>
				$('#form-testimonial .wysibb-text-editor').empty();
				<?php } ?>
			}
		}
	});
});
//--></script>
<?php echo $footer; ?>