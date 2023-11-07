<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
	    <?php if ($update) { ?>
		<button onclick="updateTestimonials(); location.reload();" type="button" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-warning"><i class="fa fa-warning"></i> <?php echo $button_update; ?></button>
		<?php } ?>
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
	<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-testimonial" class="form-horizontal">
		  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
			<li><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <li><a href="#tab-form" data-toggle="tab"><?php echo $tab_form; ?></a></li>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
			<li><a href="#tab-seo" data-toggle="tab"><?php echo $tab_seo; ?></a></li>
          </ul>
		  <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_status" id="input-status" class="form-control">
				    <?php if ($s_testimonial_status) { ?>
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
			    <label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_link" id="input-link" class="form-control">
				    <?php if ($s_testimonial_link) { ?>
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
			    <label class="col-sm-2 control-label" for="input-link-order"><?php echo $entry_link_order; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_link_order" id="input-link-order" class="form-control">
				    <?php if ($s_testimonial_link_order) { ?>
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
			    <label class="col-sm-2 control-label" for="input-guest"><?php echo $entry_guest; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_guest" id="input-guest" class="form-control">
				    <?php if ($s_testimonial_guest) { ?>
				    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_enabled; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?>  </option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-all-store"><?php echo $entry_all_store; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_all_store" id="input-all-store" class="form-control">
				    <?php if ($s_testimonial_all_store) { ?>
				    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_enabled; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?>  </option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-mail"><?php echo $entry_mail; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_mail" id="input-mail" class="form-control">
				    <?php if ($s_testimonial_mail) { ?>
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
			    <label class="col-sm-2 control-label" for="input-moderation"><?php echo $entry_moderation; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_moderation" id="input-moderation" class="form-control">
				    <?php if ($s_testimonial_moderation) { ?>
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
			    <label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_language" id="input-language" class="form-control">
				    <?php if ($s_testimonial_language) { ?>
				    <option value="1" selected="selected"><?php echo $text_language_all; ?></option>
				    <option value="0"><?php echo $text_language_select; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_language_all; ?></option>
				    <option value="0" selected="selected"><?php echo $text_language_select; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_date_added" id="input-date-added" class="form-control">
				    <?php if ($s_testimonial_date_added) { ?>
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
			    <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
			    <div class="col-sm-10">
				  <input type="text" name="s_testimonial_limit" value="<?php echo $s_testimonial_limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
				  <?php if ($error_limit) { ?>
				  <div class="text-danger"><?php echo $error_limit; ?></div>
				  <?php } ?>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-field"><?php echo $entry_field; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_field" id="input-field" class="form-control">
				    <?php if ($s_testimonial_field) { ?>
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
			    <label class="col-sm-2 control-label" for="input-cut"><?php echo $entry_cut; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_cut" id="input-cut" class="form-control">
				    <?php if ($s_testimonial_cut) { ?>
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
			    <label class="col-sm-2 control-label" for="input-text-limit"><?php echo $entry_text_limit; ?></label>
			    <div class="col-sm-10">
				  <input type="text" name="s_testimonial_text_limit" value="<?php echo $s_testimonial_text_limit; ?>" placeholder="<?php echo $entry_text_limit; ?>" id="input-text-limitt" class="form-control" />
				  <?php if ($error_text_limit) { ?>
				  <div class="text-danger"><?php echo $error_text_limit; ?></div>
				  <?php } ?>
			    </div>
			  </div>
			</div>
			<div class="tab-pane" id="tab-description">
			  <div class="panel-body">
			    <ul class="nav nav-tabs" id="language">
                  <?php foreach ($languages as $language) { ?>
                  <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                  <?php } ?>
                </ul>
			    <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
				    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title_testimonial; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="s_testimonial_description[<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title_testimonial; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($s_testimonial_description[$language['language_id']]) ? $s_testimonial_description[$language['language_id']]['title'] : ''; ?>">
                      </div>
                    </div>
				    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                      <div class="col-sm-10">
                        <textarea name="s_testimonial_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($s_testimonial_description[$language['language_id']]) ? $s_testimonial_description[$language['language_id']]['description'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                      <div class="col-sm-10">
                        <textarea name="s_testimonial_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($s_testimonial_description[$language['language_id']]) ? $s_testimonial_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                      <div class="col-sm-10">
                        <textarea name="s_testimonial_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($s_testimonial_description[$language['language_id']]) ? $s_testimonial_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                      </div>
                    </div>
                  </div>
                  <?php } ?>
			    </div>
			  </div>
			</div>
		    <div class="tab-pane" id="tab-form">
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-editor"><?php echo $entry_editor; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_editor" id="input-editor" class="form-control">
				    <?php if ($s_testimonial_editor) { ?>
				    <option value="1" selected="selected"><?php echo $text_wysibb; ?></option>
				    <option value="0"><?php echo $text_no_editor; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_wysibb; ?></option>
				    <option value="0" selected="selected"><?php echo $text_no_editor; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-smile-theme"><?php echo $entry_smile_theme; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_smile_theme" id="input-smile-theme" class="form-control">
				    <?php foreach ($smile_themes as $smile_theme) { ?>
				    <option value="<?php echo $smile_theme; ?>"<?php if ($s_testimonial_smile_theme == $smile_theme) { ?> selected="selected"<?php } ?>><?php echo $smile_theme; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-form"><?php echo $entry_form; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_form" id="input-form" class="form-control">
				    <?php if ($s_testimonial_form) { ?>
				    <option value="1" selected="selected"><?php echo $text_simple; ?></option>
				    <option value="0"><?php echo $text_accordeon; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_simple; ?></option>
				    <option value="0" selected="selected"><?php echo $text_accordeon; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-form-position"><?php echo $entry_form_position; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_form_position" id="input-form-position" class="form-control">
				    <?php if ($s_testimonial_form_position) { ?>
				    <option value="1" selected="selected"><?php echo $text_top; ?></option>
				    <option value="0"><?php echo $text_bottom; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_top; ?></option>
				    <option value="0" selected="selected"><?php echo $text_bottom; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_title" id="input-title" class="form-control">
				    <?php if ($s_testimonial_title == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_title == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_city" id="input-city" class="form-control">
				    <?php if ($s_testimonial_city == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_city == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_name" id="input-name" class="form-control">
				    <?php if ($s_testimonial_name == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_name == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_email" id="input-email" class="form-control">
				    <?php if ($s_testimonial_email == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_email == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_text" id="input-text" class="form-control">
				    <?php if ($s_testimonial_text == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_text == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-good"><?php echo $entry_good; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_good" id="input-good" class="form-control">
				    <?php if ($s_testimonial_good == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_good == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-bad"><?php echo $entry_bad; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_bad" id="input-bad" class="form-control">
				    <?php if ($s_testimonial_bad == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_bad == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-rating"><?php echo $entry_rating; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_rating" id="input-rating" class="form-control">
				    <?php if ($s_testimonial_rating == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_rating == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-avatar"><?php echo $entry_avatar; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_avatar" id="input-avatar" class="form-control">
				    <?php if ($s_testimonial_avatar == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } elseif ($s_testimonial_avatar == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_image" id="input-image" class="form-control">
				    <?php if ($s_testimonial_image == 2) { ?>
				    <option value="2" selected="selected"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
			    	<?php } elseif ($s_testimonial_image == 1) { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1" selected="selected"><?php echo $text_no_required; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="2"><?php echo $text_required; ?></option>
				    <option value="1"><?php echo $text_no_required; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-image-limit"><?php echo $entry_image_limit; ?></label>
			    <div class="col-sm-10">
				  <input type="text" name="s_testimonial_image_limit" value="<?php echo $s_testimonial_image_limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-image-limit" class="form-control" />
				  <?php if ($error_image_limit) { ?>
				  <div class="text-danger"><?php echo $error_image_limit; ?></div>
				  <?php } ?>
			    </div>
			  </div>
		  	  <div class="form-group">
		  	    <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
			    <div class="col-sm-10">
				  <select name="s_testimonial_captcha" id="input-captcha" class="form-control">
				    <?php if ($s_testimonial_captcha) { ?>
				    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				    <option value="0"><?php echo $text_disabled; ?></option>
				    <?php } else { ?>
				    <option value="1"><?php echo $text_enabled; ?></option>
				    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				    <?php } ?>
				  </select>
			    </div>
			  </div>
		    </div>
		    <div class="tab-pane" id="tab-image">
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-upload-avatar-width"><?php echo $entry_upload_avatar; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_upload_avatar_width" value="<?php echo $s_testimonial_upload_avatar_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-upload-avatar-width" class="form-control" />
					  <?php if ($error_upload_avatar_width) { ?>
					  <div class="text-danger"><?php echo $error_upload_avatar_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_upload_avatar_height" value="<?php echo $s_testimonial_upload_avatar_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_upload_avatar_height) { ?>
					  <div class="text-danger"><?php echo $error_upload_avatar_height; ?></div>
					  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-upload-image-width"><?php echo $entry_upload_image; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_upload_image_width" value="<?php echo $s_testimonial_upload_image_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-upload-image-width" class="form-control" />
					  <?php if ($error_upload_image_width) { ?>
					  <div class="text-danger"><?php echo $error_upload_image_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_upload_image_height" value="<?php echo $s_testimonial_upload_image_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_upload_image_height) { ?>
					  <div class="text-danger"><?php echo $error_upload_image_height; ?></div>
					  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-avatar-width"><?php echo $entry_avatar_size; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_avatar_width" value="<?php echo $s_testimonial_avatar_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-avatar-width" class="form-control" />
					  <?php if ($error_avatar_width) { ?>
					  <div class="text-danger"><?php echo $error_avatar_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_avatar_height" value="<?php echo $s_testimonial_avatar_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_avatar_height) { ?>
					  <div class="text-danger"><?php echo $error_avatar_height; ?></div>
					  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-avatar-popup-width"><?php echo $entry_avatar_info; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_avatar_info_width" value="<?php echo $s_testimonial_avatar_info_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-avatar-popup-width" class="form-control" />
					  <?php if ($error_avatar_info_width) { ?>
					  <div class="text-danger"><?php echo $error_avatar_info_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_avatar_info_height" value="<?php echo $s_testimonial_avatar_info_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_avatar_info_height) { ?>
					  <div class="text-danger"><?php echo $error_avatar_info_height; ?></div>
					  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
		  	  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-thumbnail-width"><?php echo $entry_thumbnail; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_thumbnail_width" value="<?php echo $s_testimonial_thumbnail_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-thumbnail-width" class="form-control" />
					  <?php if ($error_thumbnail_width) { ?>
					  <div class="text-danger"><?php echo $error_thumbnail_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_thumbnail_height" value="<?php echo $s_testimonial_thumbnail_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_thumbnail_height) { ?>
					  <div class="text-danger"><?php echo $error_thumbnail_height; ?></div>
					  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-thumbnail_info-width"><?php echo $entry_thumbnail_info; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_thumbnail_info_width" value="<?php echo $s_testimonial_thumbnail_info_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-thumbnail_info-width" class="form-control" />
					  <?php if ($error_thumbnail_info_width) { ?>
					  <div class="text-danger"><?php echo $error_thumbnail_info_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_thumbnail_info_height" value="<?php echo $s_testimonial_thumbnail_info_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_thumbnail_info_height) { ?>
					  <div class="text-danger"><?php echo $error_thumbnail_info_height; ?></div>
				   	  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_thumb; ?></label>
			    <div class="col-sm-10">
				  <div class="row">
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_thumb_width" value="<?php echo $s_testimonial_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
					  <?php if ($error_thumb_width) { ?>
					  <div class="text-danger"><?php echo $error_thumb_width; ?></div>
					  <?php } ?>
				    </div>
				    <div class="col-sm-6">
					  <input type="text" name="s_testimonial_thumb_height" value="<?php echo $s_testimonial_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
					  <?php if ($error_thumb_height) { ?>
					  <div class="text-danger"><?php echo $error_thumb_height; ?></div>
					  <?php } ?>
				    </div>
				  </div>
			    </div>
			  </div>
		    </div>
			<div class="tab-pane" id="tab-seo">
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_keyword; ?></div> 
              <div class="form-group">			  
			    <label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
			    <div class="col-sm-10">
		          <input type="text" name="s_testimonial_keyword" id="input-keyword" value="<?php echo $s_testimonial_keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" class="form-control" />
				  <?php if ($error_keyword) { ?>
				  <div class="text-danger"><?php echo $error_keyword; ?></div>
				  <?php } ?>
			    </div>
			  </div>
            </div>
	      </div>
	    </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script type="text/javascript"><!--
    <?php if ($update) { ?>
	function updateTestimonials() {
	    $.ajax({
			url: 'index.php?route=extension/module/s_testimonial/update_testimonials&token=<?php echo $token; ?>',
		});
	}
	<?php } ?>
	
	$('#language a:first').tab('show');
//--></script>
</div>
<?php echo $footer; ?>