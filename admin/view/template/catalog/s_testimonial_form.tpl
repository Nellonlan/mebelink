<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-testimonial" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-testimonial" class="form-horizontal">
		  <input type="hidden" name="store_url" value="<?php echo $store_url; ?>">
		  <input type="hidden" name="store_name" value="<?php echo $store_name; ?>">
		  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
			<?php if ($field_avatar || $field_image) { ?>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
			<?php } ?>
            <li><a href="#tab-seo" data-toggle="tab"><?php echo $tab_seo; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
          </ul>
		  <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
			  <?php if ($field_title) { ?>
			  <div class="form-group<?php if ($field_title == 2) { ?> required<?php } ?>">
			    <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
				  <?php if ($error_title) { ?>
				  <div class="text-danger"><?php echo $error_title; ?></div>
				  <?php } ?>
				</div>
		      </div>
		      <?php } ?>
			  <?php if ($field_city) { ?>
		      <div class="form-group<?php if ($field_city == 2) { ?> required<?php } ?>">
			    <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
				  <?php if ($error_city) { ?>
				  <div class="text-danger"><?php echo $error_city; ?></div>
                  <?php } ?>
			    </div>
		      </div>
			  <?php } ?>
			  <?php if ($field_email) { ?>
			  <div class="form-group<?php if ($field_email == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
				  <?php if ($error_email) { ?>
				  <div class="text-danger"><?php echo $error_email; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php if ($field_name) { ?>
			  <div class="form-group<?php if ($field_name == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				  <?php if ($error_name) { ?>
				  <div class="text-danger"><?php echo $error_name; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php if ($field_text) { ?>
			  <div class="form-group<?php if ($field_text == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
				<div class="col-sm-10">
				  <textarea name="text" cols="60" rows="8" placeholder="<?php echo $entry_text; ?>" id="input-text" class="form-control"><?php echo $text; ?></textarea>
				  <?php if ($error_text) { ?>
				  <div class="text-danger"><?php echo $error_text; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php if ($field_good) { ?>
			  <div class="form-group<?php if ($field_good == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-good"><?php echo $entry_good; ?></label>
				<div class="col-sm-10">
				  <textarea name="good" cols="60" rows="8" placeholder="<?php echo $entry_good; ?>" id="input-good" class="form-control"><?php echo $good; ?></textarea>
				  <?php if ($error_good) { ?>
				  <div class="text-danger"><?php echo $error_good; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php if ($field_bad) { ?>
			  <div class="form-group<?php if ($field_bad == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-bad"><?php echo $entry_bad; ?></label>
				<div class="col-sm-10">
				  <textarea name="bad" cols="60" rows="8" placeholder="<?php echo $entry_bad; ?>" id="input-bad" class="form-control"><?php echo $bad; ?></textarea>
				  <?php if ($error_bad) { ?>
				  <div class="text-danger"><?php echo $error_bad; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php if ($field_email && $email && $store_url) { ?>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-alert"><?php echo $entry_alert; ?></label>
				<div class="col-sm-10">
				  <input id="input-alert" type="checkbox" name="alert" value="1"/>
				</div>
			  </div>
			  <?php } ?>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
				<div class="col-sm-10">
				  <textarea name="comment" cols="60" rows="8" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control summernote"><?php echo $comment; ?></textarea>
				</div>
			  </div>
			  <?php if ($field_rating) { ?>
			  <div class="form-group<?php if ($field_rating == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-rating"><?php echo $entry_rating; ?></label>
				<div class="col-sm-10">
				  <select name="rating" class="form-control" id="input-rating">
					<option value=""><?php echo $text_select; ?></option>
					<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($rating == $i) { ?>
					<option value="<?php echo $i; ?>" selected="selected"><?php echo $i; ?></option>
					<?php } else { ?>
					<option value="<?php echo $i; ?>"><?php echo $i; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				  <?php if ($error_rating) { ?>
				  <div class="text-danger"><?php echo $error_rating; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			</div>
			<div class="tab-pane" id="tab-data">
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
				<div class="col-sm-10">
				  <select name="language_id" id="input-language" class="form-control">
					<?php foreach ($languages as $language) { ?>
					<?php if ($language['language_id'] == $language_id) { ?>
					<option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="status" id="input-status" class="form-control">
					<?php if ($status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			  </div>			  			  
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
				<div class="col-sm-3">
				  <div class="input-group date">
					<input type="text" name="date_added" value="<?php echo $date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD HH:mm:ss" id="input-date-added" class="form-control" />
					<span class="input-group-btn">
					<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
					</span></div>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
				<div class="col-sm-10">
				  <div class="well well-sm" style="height: 150px; overflow: auto;">
					<div class="checkbox">
					  <label>
						<?php if (in_array(0, $testimonial_store)) { ?>
						<input type="checkbox" name="testimonial_store[]" value="0" checked="checked" />
						<?php echo $text_default; ?>
						<?php } else { ?>
						<input type="checkbox" name="testimonial_store[]" value="0" />
						<?php echo $text_default; ?>
						<?php } ?>
					  </label>
					</div>
					<?php foreach ($stores as $store) { ?>
					<div class="checkbox">
					  <label>
						<?php if (in_array($store['store_id'], $s_testimonial_store)) { ?>
						<input type="checkbox" name="s_testimonial_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
						<?php echo $store['name']; ?>
						<?php } else { ?>
						<input type="checkbox" name="s_testimonial_store[]" value="<?php echo $store['store_id']; ?>" />
						<?php echo $store['name']; ?>
						<?php } ?>
					  </label>
					</div>
					<?php } ?>
				  </div>
				</div>
			  </div>
			</div>
			<?php if ($field_avatar || $field_image) { ?>
			<div class="tab-pane" id="tab-image">
			  <?php if ($field_avatar) { ?>
			  <div class="form-group<?php if ($field_avatar == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label" for="input-avatar"><?php echo $entry_avatar; ?></label>
				<div class="col-sm-10">
				  <a href="" id="thumb-avatar" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="avatar" value="<?php echo $avatar; ?>" id="input-avatar" />
				  <?php if ($error_avatar) { ?>
				  <div class="text-danger"><?php echo $error_avatar; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php if ($field_image) { ?>
			  <div class="form-group<?php if ($field_image == 2) { ?> required<?php } ?>">
				<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
				<div class="col-sm-10">
				  <div id="image">
					<?php $image_row = 0; ?>
					<?php if ($image) { ?>
					<?php foreach ($image as $value) { ?>
					<span><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $value['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image[]" value="<?php echo $value['image']; ?>" id="input-image<?php echo $image_row; ?>"/></span>
					<?php $image_row++;  ?>
					<?php } ?>
					<?php } ?>
					<span><a onclick="addImage();" href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/></a><input type="hidden" name="image[]" value="" id="input-image<?php echo $image_row; ?>" /></span>
				  </div>
				  <?php if ($error_image) { ?>
				  <div class="text-danger"><?php echo $error_image; ?></div>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			</div>
			<?php } ?>
			<div class="tab-pane" id="tab-seo">
			  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_keyword; ?></div> 
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
				  <?php if ($error_keyword) { ?>
				  <div class="text-danger"><?php echo $error_keyword; ?></div>
				  <?php } ?>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="testimonial_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($testimonial_layout[0]) && $testimonial_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="testimonial_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($testimonial_layout[$store['store_id']]) && $testimonial_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
		  </div>
        </form>
      </div>
    </div>
  </div>
  <?php if ($editor) { ?>
  <link href="view/javascript/s_testimonial/wysibb/theme/default/wbbtheme.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/s_testimonial/wysibb/jquery.wysibb.min.js"></script>
  <?php if ($wysibb_language) { ?>
  <script type="text/javascript" src="view/javascript/s_testimonial/wysibb/lang/<?php echo $wysibb_language; ?>.js"></script>
  <?php } ?>
  <?php } ?>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script type="text/javascript"><!--
	  <?php if ($field_image) { ?>
	  var image_row = <?php echo $image_row; ?>;
		
	  function addImage() {
		  image_row++; 
		  
		  html = '<span><a onclick="addImage();" href="" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/></a><input type="hidden" name="image[]" value="" id="input-image' + image_row + '" /></span> ';
		
		  $('#image .img-thumbnail').removeAttr('onclick');
		  $('#image').append(html);
	  }
	  <?php } ?>
	  $('.date').datetimepicker({

	  });
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
//--></script>
</div>
<?php echo $footer; ?>