<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ( $breadcrumbs as $breadcrumb ) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ( $error_warning ) { ?>
            <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
           <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-apc" class="form-horizontal">
          <div class="row">
            <div class="col-sm-3">
              <ul id="method-list" class="nav nav-pills nav-stacked">
                <li class="active"><a href="#tab-general" data-toggle="tab"> <?php echo $text_output_type; ?></a></li>
				<li><a href="#tab-button" data-toggle="tab"> <?php echo $text_button_title; ?></a></li>
				<li><a href="#tab-tab" data-toggle="tab"> <?php echo $text_tab_title ; ?></a></li>
              </ul>
            </div>
            <div class="col-sm-9">
              <div class="tab-content">
                <div class="tab-pane active" id="tab-general">
              <fieldset>
              <legend class="md-legend"><?php echo $text_output_type; ?></legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-position"><?php echo $entry_output_type; ?></label>
                        <div class="col-sm-10">
                            <select name="youtube_product_video[youtube_product_video_output_type]" id="input-position" class="form-control">
                                <?php if ( $youtube_product_video['youtube_product_video_output_type'] == 'tab' ) { ?>
                                    <option value="button"><?php echo $text_output_type_button; ?></option>
                                    <option value="tab" selected="selected"><?php echo $text_output_type_tab; ?></option>
                                <?php } else { ?>
                                    <option value="button" selected="selected"><?php echo $text_output_type_button; ?></option>
                                    <option value="tab"><?php echo $text_output_type_tab; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
				 </fieldset>
                </div>
                <div class="tab-pane" id="tab-button">
                  <fieldset>
               <legend class="md-legend"><?php echo $text_button_title; ?></legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-selector"><?php echo $entry_selector; ?></label>
                        <div class="col-sm-10">
                            <input name="youtube_product_video[youtube_product_video_selector]" value="<?php echo $youtube_product_video['youtube_product_video_selector']; ?>" id="input-selector" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-position"><?php echo $entry_position; ?></label>
                        <div class="col-sm-10">
                            <select name="youtube_product_video[youtube_product_video_position]" id="input-position" class="form-control">
                                <?php if ( $youtube_product_video['youtube_product_video_position'] == 'after' ) { ?>
                                    <option value="before"><?php echo $text_position_before; ?></option>
                                    <option value="after" selected="selected"><?php echo $text_position_after; ?></option>
                                <?php } else { ?>
                                    <option value="before" selected="selected"><?php echo $text_position_before; ?></option>
                                    <option value="after"><?php echo $text_position_after; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-align"><?php echo $entry_align; ?></label>
                        <div class="col-sm-10">
                            <select name="youtube_product_video[youtube_product_video_align]" id="input-align" class="form-control">
                                <option value="left" <?php if ( $youtube_product_video['youtube_product_video_align'] == 'left' ) { ?>selected="selected"<?php } ?>><?php echo $text_align_left; ?></option>
                                <option value="right" <?php if ( $youtube_product_video['youtube_product_video_align'] == 'right' ) { ?>selected="selected"<?php } ?>><?php echo $text_align_right; ?></option>
                                <option value="center" <?php if ( $youtube_product_video['youtube_product_video_align'] == 'center' ) { ?>selected="selected"<?php } ?>><?php echo $text_align_center; ?></option>
                            </select>
                        </div>
                    </div>
				</fieldset>
                </div>
                <div class="tab-pane" id="tab-tab">
                  <fieldset>
              <legend class="md-legend"><?php echo $text_tab_title; ?></legend>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-tab_selector"><?php echo $entry_tab_selector; ?></label>
                        <div class="col-sm-10">
                            <input name="youtube_product_video[youtube_product_video_tab_selector]" value="<?php echo $youtube_product_video['youtube_product_video_tab_selector']; ?>" id="input-tab_selector" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-position"><?php echo $entry_tab_position; ?></label>
                        <div class="col-sm-10">
                            <select name="youtube_product_video[youtube_product_video_tab_position]" id="input-position" class="form-control">
                                <?php if ( $youtube_product_video['youtube_product_video_tab_position'] == 'after' ) { ?>
                                    <option value="before"><?php echo $text_position_before; ?></option>
                                    <option value="after" selected="selected"><?php echo $text_position_after; ?></option>
                                <?php } else { ?>
                                    <option value="before" selected="selected"><?php echo $text_position_before; ?></option>
                                    <option value="after"><?php echo $text_position_after; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-tab_content_selector"><?php echo $entry_tab_content_selector; ?></label>
                        <div class="col-sm-10">
                            <input name="youtube_product_video[youtube_product_video_tab_content_selector]" value="<?php echo $youtube_product_video['youtube_product_video_tab_content_selector']; ?>" id="input-tab_content_selector" class="form-control">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>