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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-testimonial" class="form-horizontal">
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_title_testimonial; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
			  <div class="input-group">
				<span class="input-group-addon">
				  <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
				</span>
				<input type="text" name="title_testimonial[<?php echo $language['language_id']; ?>]" placeholder="<?php echo $entry_title_testimonial; ?>" value="<?php echo isset($title_testimonial[$language['language_id']]) ? $title_testimonial[$language['language_id']] : ''; ?>" class="form-control" />
			  </div>
			  <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
              <select name="title" id="input-title" class="form-control">
                <?php if ($title) { ?>
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
            <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <select name="city" id="input-city" class="form-control">
                <?php if ($city) { ?>
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
            <label class="col-sm-2 control-label" for="input-name-status"><?php echo $entry_name_status; ?></label>
            <div class="col-sm-10">
              <select name="name_status" id="input-name-status" class="form-control">
                <?php if ($name_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
            <div class="col-sm-10">
              <select name="text" id="input-text" class="form-control">
                <?php if ($text) { ?>
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
            <label class="col-sm-2 control-label" for="input-good"><?php echo $entry_good; ?></label>
            <div class="col-sm-10">
              <select name="good" id="input-good" class="form-control">
                <?php if ($good) { ?>
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
            <label class="col-sm-2 control-label" for="input-bad"><?php echo $entry_bad; ?></label>
            <div class="col-sm-10">
              <select name="bad" id="input-bad" class="form-control">
                <?php if ($bad) { ?>
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
            <label class="col-sm-2 control-label" for="input-rating"><?php echo $entry_rating; ?></label>
            <div class="col-sm-10">
              <select name="rating" id="input-rating" class="form-control">
                <?php if ($rating) { ?>
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
            <div class="col-sm-10">
              <select name="date_added" id="input-date-added" class="form-control">
                <?php if ($date_added) { ?>
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
            <label class="col-sm-2 control-label" for="input-avatar"><?php echo $entry_avatar; ?></label>
            <div class="col-sm-10">
              <select name="avatar" id="input-avatar" class="form-control">
                <?php if ($avatar) { ?>
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
			<label class="col-sm-2 control-label" for="input-avatar-width"><?php echo $entry_avatar_size; ?></label>
			<div class="col-sm-10">
			  <div class="row">
				<div class="col-sm-6">
				  <input type="text" name="avatar_width" value="<?php echo $avatar_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-avatar-width" class="form-control" />
				  <?php if ($error_avatar_width) { ?>
				  <div class="text-danger"><?php echo $error_avatar_width; ?></div>
				  <?php } ?>
				</div>
				<div class="col-sm-6">
				  <input type="text" name="avatar_height" value="<?php echo $avatar_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
				  <?php if ($error_avatar_height) { ?>
				  <div class="text-danger"><?php echo $error_avatar_height; ?></div>
				  <?php } ?>
				</div>
			  </div>
			</div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
            <div class="col-sm-10">
              <select name="image" id="input-image" class="form-control">
                <?php if ($image) { ?>
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
			<label class="col-sm-2 control-label" for="input-thumbnail-width"><?php echo $entry_thumbnail; ?></label>
			<div class="col-sm-10">
			  <div class="row">
				<div class="col-sm-6">
				  <input type="text" name="thumbnail_width" value="<?php echo $thumbnail_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-thumbnail-width" class="form-control" />
				  <?php if ($error_thumbnail_width) { ?>
				  <div class="text-danger"><?php echo $error_thumbnail_width; ?></div>
				  <?php } ?>
				</div>
				<div class="col-sm-6">
				  <input type="text" name="thumbnail_height" value="<?php echo $thumbnail_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
				  <?php if ($error_thumbnail_height) { ?>
				  <div class="text-danger"><?php echo $error_thumbnail_height; ?></div>
				  <?php } ?>
				</div>
			  </div>
			</div>
		  </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image-limit"><?php echo $entry_image_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="image_limit" value="<?php echo $image_limit; ?>" placeholder="<?php echo $entry_image_limit; ?>" id="input-image-limit" class="form-control" />
			  <?php if ($error_image_limit) { ?>
              <div class="text-danger"><?php echo $error_image_limit; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
			  <?php if ($error_limit) { ?>
              <div class="text-danger"><?php echo $error_limit; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-readmore"><?php echo $entry_readmore; ?></label>
            <div class="col-sm-10">
              <select name="readmore" id="input-readmore" class="form-control">
                <?php if ($readmore) { ?>
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
            <label class="col-sm-2 control-label" for="input-show-all"><?php echo $entry_show_all; ?></label>
            <div class="col-sm-10">
              <select name="show_all" id="input-show-all" class="form-control">
                <?php if ($show_all) { ?>
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
            <label class="col-sm-2 control-label" for="input-sort"><?php echo $entry_sort; ?></label>
            <div class="col-sm-10">
              <select name="sort" id="input-sort" class="form-control">
                <?php if ($sort == 'st.date_added') { ?>
                <option value="st.date_added" selected="selected"><?php echo $text_date_added; ?></option>
                <option value="st.rating"><?php echo $text_rating; ?></option>
                <?php } else { ?>
                <option value="st.date_added"><?php echo $text_date_added; ?></option>
                <option value="st.rating" selected="selected"><?php echo $text_rating; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-carousel"><?php echo $entry_carousel; ?></label>
            <div class="col-sm-10">
              <select name="carousel" id="input-carousel" class="form-control">
                <?php if ($carousel) { ?>
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
            <label class="col-sm-2 control-label" for="input-carousel-item"><?php echo $entry_carousel_item; ?></label>
            <div class="col-sm-10">
              <input type="text" name="carousel_item" value="<?php echo $carousel_item; ?>" placeholder="<?php echo $entry_carousel_item; ?>" id="input-carousel-item" class="form-control" />
			  <?php if ($error_carousel_item) { ?>
              <div class="text-danger"><?php echo $error_carousel_item; ?></div>
              <?php } ?>
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
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>