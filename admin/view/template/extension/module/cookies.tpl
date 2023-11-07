<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-shipping" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning): ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php endif; ?>    
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shipping" class="form-horizontal">        
      <div class="panel panel-default">
        <div class="panel-heading">
		  <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>
         <div class="panel-body">
          <div class="row">
            <div class="col-sm-3">
              <ul id="method-list" class="nav nav-pills nav-stacked">
                <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?php echo $text_general; ?></a></li>
				<li><a href="#tab-text" data-toggle="tab"><i class="fa fa-header" aria-hidden="true"></i> <?php echo $text_text; ?></a></li>
              </ul>
            </div>
            <div class="col-sm-9">
              <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
              <fieldset>
           <legend class="md-legend"><?php echo $text_general; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="cookies_status" id="input-status" class="form-control">
                <?php if ($cookies_status) { ?>
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
            <label class="col-sm-2 control-label"><?php echo $entry_txttblank; ?><span data-toggle="tooltip" title="<?php echo $entry_txttblank_help; ?>"></span></label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <?php if ($cookies_targetblank) { ?>
                <input type="radio" name="cookies_targetblank" value="1" checked="checked" /><?php echo $text_yes; ?>
                <?php } else { ?>
                <input type="radio" name="cookies_targetblank" value="1" /><?php echo $text_yes; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$cookies_targetblank) { ?>
                <input type="radio" name="cookies_targetblank" value="0" checked="checked" /><?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="cookies_targetblank" value="0" /><?php echo $text_no; ?>
                <?php } ?>
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_txtinfoid; ?><span data-toggle="tooltip" title="<?php echo $entry_txtinfoid_help; ?>"></span></label>
            <div class="col-sm-10">
              <select name="cookies_infoid" class="form-control">
                <?php foreach ($all_info_pages as $all_info_page) { ?>
                <?php if ($all_info_page['id'] == $cookies_infoid) { ?>
                <option value="<?php echo $all_info_page['id']; ?>" selected="selected"><?php echo $all_info_page['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $all_info_page['id']; ?>"><?php echo $all_info_page['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-version"><?php echo $entry_version; ?></label>
            <div class="col-sm-10">
              <input type="text" name="cookies_version" value="<?php echo $cookies_version; ?>" placeholder="<?php echo $entry_version_help; ?>" id="input-version" class="form-control" />
              <br>
              <?php echo $entry_version_help; ?>
            </div>
          </div>	  
		   </fieldset>
                </div>
                <div class="tab-pane" id="tab-text">
                  <fieldset>
              <legend class="md-legend"><?php echo $text_text; ?></legend>  		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_txtnoticetitle; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <?php if ($language['language_id'] == 1) { ?>
                <input type="text" name="cookies_textmsgtitle_1" value="<?php echo $cookies_textmsgtitle_1; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 2) { ?>
                <input type="text" name="cookies_textmsgtitle_2" value="<?php echo $cookies_textmsgtitle_2; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 3) { ?>
                <input type="text" name="cookies_textmsgtitle_3" value="<?php echo $cookies_textmsgtitle_3; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 4) { ?>
                <input type="text" name="cookies_textmsgtitle_4" value="<?php echo $cookies_textmsgtitle_4; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 5) { ?>
                <input type="text" name="cookies_textmsgtitle_5" value="<?php echo $cookies_textmsgtitle_5; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 6) { ?>
                <input type="text" name="cookies_textmsgtitle_6" value="<?php echo $cookies_textmsgtitle_6; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 7) { ?>
                <input type="text" name="cookies_textmsgtitle_7" value="<?php echo $cookies_textmsgtitle_7; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 8) { ?>
                <input type="text" name="cookies_textmsgtitle_8" value="<?php echo $cookies_textmsgtitle_8; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 9) { ?>
                <input type="text" name="cookies_textmsgtitle_9" value="<?php echo $cookies_textmsgtitle_9; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 10) { ?>
                <input type="text" name="cookies_textmsgtitle_10" value="<?php echo $cookies_textmsgtitle_10; ?>" placeholder="<?php echo $entry_txtnoticetitle_help; ?>" id="input-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_txtnotice; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <?php if ($language['language_id'] == 1) { ?>
                <input type="text" name="cookies_textmsg_1" value="<?php echo $cookies_textmsg_1; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 2) { ?>
                <input type="text" name="cookies_textmsg_2" value="<?php echo $cookies_textmsg_2; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 3) { ?>
                <input type="text" name="cookies_textmsg_3" value="<?php echo $cookies_textmsg_3; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 4) { ?>
                <input type="text" name="cookies_textmsg_4" value="<?php echo $cookies_textmsg_4; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 5) { ?>
                <input type="text" name="cookies_textmsg_5" value="<?php echo $cookies_textmsg_5; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 6) { ?>
                <input type="text" name="cookies_textmsg_6" value="<?php echo $cookies_textmsg_6; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 7) { ?>
                <input type="text" name="cookies_textmsg_7" value="<?php echo $cookies_textmsg_7; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 8) { ?>
                <input type="text" name="cookies_textmsg_8" value="<?php echo $cookies_textmsg_8; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 9) { ?>
                <input type="text" name="cookies_textmsg_9" value="<?php echo $cookies_textmsg_9; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 10) { ?>
                <input type="text" name="cookies_textmsg_10" value="<?php echo $cookies_textmsg_10; ?>" placeholder="<?php echo $entry_txtnotice_help; ?>" id="input-msg-<?php echo $language['code']; ?>" class="form-control" />
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_txtbnt; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <?php if ($language['language_id'] == 1) { ?>
                <input type="text" name="cookies_textbtn_1" value="<?php echo $cookies_textbtn_1; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 2) { ?>
                <input type="text" name="cookies_textbtn_2" value="<?php echo $cookies_textbtn_2; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 3) { ?>
                <input type="text" name="cookies_textbtn_3" value="<?php echo $cookies_textbtn_3; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 4) { ?>
                <input type="text" name="cookies_textbtn_4" value="<?php echo $cookies_textbtn_4; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 5) { ?>
                <input type="text" name="cookies_textbtn_5" value="<?php echo $cookies_textbtn_5; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 6) { ?>
                <input type="text" name="cookies_textbtn_6" value="<?php echo $cookies_textbtn_6; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 7) { ?>
                <input type="text" name="cookies_textbtn_7" value="<?php echo $cookies_textbtn_7; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 8) { ?>
                <input type="text" name="cookies_textbtn_8" value="<?php echo $cookies_textbtn_8; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 9) { ?>
                <input type="text" name="cookies_textbtn_9" value="<?php echo $cookies_textbtn_9; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } else if ($language['language_id'] == 10) { ?>
                <input type="text" name="cookies_textbtn_10" value="<?php echo $cookies_textbtn_10; ?>" placeholder="<?php echo $entry_txtbnt_help; ?>" id="input-meta-title-<?php echo $language['code']; ?>" class="form-control" />
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>