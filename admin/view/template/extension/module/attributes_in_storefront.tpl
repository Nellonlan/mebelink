<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button data-toggle="tooltip" title="<?php echo $button_apply; ?>" onclick="$('#form input[name=apply]').val(1); $('#form').submit();" class="btn btn-success"><i class="fa fa-save"></i></button>
                <button data-toggle="tooltip" title="<?php echo $button_save; ?>" onclick="$('#form').submit();" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <button data-toggle="tooltip" title="<?php echo $button_cancel; ?>" onclick="location = '<?php echo $cancel; ?>';"  class="btn btn-default"><i class="fa fa-reply"></i></button>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">  
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                   <div class="row">
                       <div class="col-sm-2">
                        <ul id="method-list" class="nav nav-pills nav-stacked">
                        <li class="active"><a href="#tab-setting" data-toggle="tab"><?php echo $text_setting; ?></a></li>
						<li><a href="#tab-in-category" data-toggle="tab"><?php echo $text_category; ?></a></li>
			            <li><a href="#tab-product" data-toggle="tab"><?php echo $text_product; ?></a></li>
                        <li><a href="#tab-search" data-toggle="tab"><?php echo $text_search; ?></a></li>
                        <li><a href="#tab-manufacturer" data-toggle="tab"><?php echo $text_manufacturer; ?></a></li>
                        <li><a href="#tab-action" data-toggle="tab"><?php echo $text_action; ?></a></li>
                     </ul>
                </div>
            <div class="col-sm-10">
              <div class="tab-content">
			   <div class="tab-pane active" id="tab-setting">
				   <div class="row">
					   <div class="col-sm-12">
					<h3><span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_size_image; ?>"><?php echo $text_size_image; ?></span></h3>   
                <div class="form-group">
            <label class="col-sm-3 control-label"><?php echo $text_size_image_width; ?></label>
            <div class="col-sm-9">
              <input type="text" name="attribute_view_image_size_width" value="<?php if($attribute_view_image_size_width){echo $attribute_view_image_size_width;}?>" placeholder="<?php echo $text_size_image_width; ?>" id="input-width" class="form-control" />
            </div>
			</div>
               <div class="form-group">
            <label class="col-sm-3 control-label"><?php echo $text_size_image_height; ?></label>
            <div class="col-sm-9">
              <input type="text" name="attribute_view_image_size_height" value="<?php if($attribute_view_image_size_height){echo $attribute_view_image_size_height;}?>" placeholder="<?php echo $text_size_image_height; ?>" id="input-height" class="form-control" />
                    </div>
                   </div>
		          </div>
                 </div>
		        </div>
			   <div class="tab-pane" id="tab-in-category">
			    
			    <div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $text_product_block_title; ?></label>
				<div class="col-sm-9">
				    <?php foreach($languages as $language) { ?> 
					<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
					    <input name="attribute_view_category_title[<?php echo $language['language_id']; ?>]"   class="form-control" value="<?php if(!empty($attribute_view_category_title[$language['language_id']])){echo $attribute_view_category_title[$language['language_id']];}?>"/>
					</div>
				    <?php } ?>
				</div>
			    </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_block_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_category_title_block_show" value="1" <?php if ($attribute_view_category_title_block_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_group_attribute; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_category_title_group_attribute" value="1" <?php if ($attribute_view_category_title_group_attribute) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_image_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_category_image_show" value="1" <?php if ($attribute_view_category_image_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_help_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_category_help_show" value="1" <?php if ($attribute_view_category_help_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    
			    
                            <?php $attribute_in_category = 0;?>
                            <?php foreach($attribute_view_output_by_category as $k => $v){?>
                            <div class="form-group" id="attr_in_cat<?php echo $attribute_in_category; ?>">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_category_select_category; ?>"><?php echo $text_select_category; ?></span>
                                </label>
                                <div class="col-sm-3">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                            <?php foreach ($categories as $category) { ?> 
                                            <div class="checkbox">
                                                    <?php if (in_array($category['category_id'], $v)) { ?>
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_output_by_category[<?php echo $attribute_in_category; ?>][]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                                    <?php echo $category['name']; ?>
                                                    </label>
                                                    <?php } else { ?>
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_output_by_category[<?php echo $attribute_in_category; ?>][]" value="<?php echo $category['category_id']; ?>" />
                                                    <?php echo $category['name']; ?> 
                                                    </label>
                                            <?php } ?>
                                            </div>
                                            <?php } ?>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                         
                                                       
                                <label class="col-sm-2 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_action_select_attribute; ?>"><?php echo $text_select_attribute; ?></span>
                                </label>
                                <div class="col-sm-3">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                        <?php foreach ($attributes as $attribute) { ?>
                                            <?php if (in_array($attribute['attribute_id'], $attribute_view_output_by_category_attribute[$k])) { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_output_by_category_attribute[<?php echo $attribute_in_category; ?>][]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
                                                        <?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
                                            <?php } else { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_output_by_category_attribute[<?php echo $attribute_in_category; ?>][]"" value="<?php echo $attribute['attribute_id']; ?>" />
                                                         <?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
                                                <?php } ?>				
                                            <?php } ?>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                               <div class="col-sm-1 text-right">
                                <button type="button" onclick="$('#attr_in_cat<?php echo $attribute_in_category; ?>').remove();" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-minus-circle"></i></button>
                               </div>
                                 </div>
                        <?php $attribute_in_category++;?>
                         <?php }?>
                                                         
                        <div class="col-sm-12">
                            <button type="button" onclick="addAttributeInCategory(this);" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Добавить выбор"><i class="fa fa-plus-circle"></i></button>
                        </div>
                        </div>
			<div class="tab-pane" id="tab-product">
	    
			    <div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $text_product_block_title; ?></label>
				<div class="col-sm-9">
				    <?php foreach($languages as $language) { ?> 
					<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
					    <input name="attribute_view_product_title[<?php echo $language['language_id']; ?>]"   class="form-control" value="<?php if(!empty($attribute_view_product_title[$language['language_id']])){echo $attribute_view_product_title[$language['language_id']];}?>"/>
					</div>
				    <?php } ?>
				</div>
			    </div>
				<div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_show_product; ?>"><?php echo $text_product_activation; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					<input  type="checkbox" name="attribute_view_product_show" value="1" <?php if ($attribute_view_product_show) {
					echo 'checked="checked"';
				    } ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_block_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_product_title_block_show" value="1" <?php if ($attribute_view_product_title_block_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_group_attribute; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_product_title_group_attribute" value="1" <?php if ($attribute_view_product_title_group_attribute) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_image_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_product_image_show" value="1" <?php if ($attribute_view_product_image_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_help_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_product_help_show" value="1" <?php if ($attribute_view_product_help_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			
			    
			    
			    <div class="form-group">
				<label class="col-sm-3 control-label">
				    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_product_select_attribute; ?>"><?php echo $text_select_attribute; ?></span>
				</label>
				<div class="col-sm-9">
				    <div class="well well-sm" style="height: 150px; overflow: auto;">
					<?php foreach ($attributes as $attribute) { ?>
						<?php if (in_array($attribute['attribute_id'], $attribute_view_product_select_attribute)) { ?>
						<div class="checkbox">
						    <label>
							<input type="checkbox" name="attribute_view_product_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
							<?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
						    </label>
						</div>
					    <?php } else { ?>
						<div class="checkbox">
						    <label>
							<input type="checkbox" name="attribute_view_product_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" />
							 <?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
						    </label>
						</div>
					<?php } ?>				
				    <?php } ?>
				    </div>
				    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
				   </div>
			    </div>
			  </div>		
                <div class="tab-pane" id="tab-search">
  
			    <div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $text_product_block_title; ?></label>
				<div class="col-sm-9">
				    <?php foreach($languages as $language) { ?> 
					<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
					    <input name="attribute_view_search_title[<?php echo $language['language_id']; ?>]"   class="form-control" value="<?php if(!empty($attribute_view_search_title[$language['language_id']])){echo $attribute_view_search_title[$language['language_id']];}?>"/>
					</div>
				    <?php } ?>
				</div>
			    </div>
				 <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_show_search; ?>"><?php echo $text_search_activation; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input  type="checkbox" name="attribute_view_search_show" value="1" <?php if ($attribute_view_search_show) {
					    echo 'checked="checked"';
					} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_block_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_search_title_block_show" value="1" <?php if ($attribute_view_search_title_block_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_group_attribute; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_search_title_group_attribute" value="1" <?php if ($attribute_view_search_title_group_attribute) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_image_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_search_image_show" value="1" <?php if ($attribute_view_search_image_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_help_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_search_help_show" value="1" <?php if ($attribute_view_search_help_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_search_select_attribute; ?>"><?php echo $text_select_attribute; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                                <?php foreach ($attributes as $attribute) { ?>
                                                    <?php if (in_array($attribute['attribute_id'], $attribute_view_search_select_attribute)) { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_search_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
							<?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
                                                    <?php } else { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_search_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" />
                                                <?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
					<?php } ?>				
				    <?php } ?>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                        </div>
                  <div class="tab-pane" id="tab-manufacturer">
			    	    			    
			    <div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $text_product_block_title; ?></label>
				<div class="col-sm-9">
				    <?php foreach($languages as $language) { ?> 
					<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
					    <input name="attribute_view_manufacturer_title[<?php echo $language['language_id']; ?>]"   class="form-control" value="<?php if(!empty($attribute_view_manufacturer_title[$language['language_id']])){echo $attribute_view_manufacturer_title[$language['language_id']];}?>"/>
					</div>
				    <?php } ?>
				</div>
			    </div>
				<div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_show_manufacturer; ?>"><?php echo $text_manufacturer_activation; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input  type="checkbox" name="attribute_view_manufacturer_show" value="1" <?php if ($attribute_view_manufacturer_show) {
					    echo 'checked="checked"';
					} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_block_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_manufacturer_title_block_show" value="1" <?php if ($attribute_view_manufacturer_title_block_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_group_attribute; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_manufacturer_title_group_attribute" value="1" <?php if ($attribute_view_manufacturer_title_group_attribute) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_image_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_manufacturer_image_show" value="1" <?php if ($attribute_view_manufacturer_image_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_help_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_manufacturer_help_show" value="1" <?php if ($attribute_view_manufacturer_help_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_manufacturer_select_attribute; ?>"><?php echo $text_select_attribute; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
					    <?php foreach ($attributes as $attribute) { ?>
                                            <?php if (in_array($attribute['attribute_id'], $attribute_view_manufacturer_select_attribute)) { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_manufacturer_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
                                                        <?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
                                            <?php } else { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_manufacturer_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" />
							<?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
					<?php } ?>				
				    <?php } ?>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                        </div>
                    <div class="tab-pane" id="tab-action">
			    
			    <div class="form-group">
				<label class="col-sm-3 control-label"><?php echo $text_product_block_title; ?></label>
				<div class="col-sm-9">
				    <?php foreach($languages as $language) { ?> 
					<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
					    <input name="attribute_view_action_title[<?php echo $language['language_id']; ?>]"   class="form-control" value="<?php if(!empty($attribute_view_action_title[$language['language_id']])){echo $attribute_view_action_title[$language['language_id']];}?>"/>
					</div>
				    <?php } ?>
				</div>
			    </div>
				<div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_show_action; ?>"><?php echo $text_action_activation; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input  type="checkbox" name="attribute_view_action_show" value="1" <?php if ($attribute_view_action_show) {
					    echo 'checked="checked"';
					} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_block_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_action_title_block_show" value="1" <?php if ($attribute_view_action_title_block_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <?php echo $text_product_title_group_attribute; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_action_title_group_attribute" value="1" <?php if ($attribute_view_action_title_group_attribute) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
                            </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_image_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_action_image_show" value="1" <?php if ($attribute_view_action_image_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    <div class="form-group">
			    <label class="col-sm-3 control-label">
                                    <?php echo $text_product_help_show; ?>
                                </label>
                                <div class="col-sm-9">
                                    <div class="checkbox">
                                        <label>
					    <input  type="checkbox" name="attribute_view_action_help_show" value="1" <?php if ($attribute_view_action_help_show) {echo 'checked="checked"';} ?>>
                                        </label>
                                    </div>
                                </div>
			    </div>
			    
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    <span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_action_select_attribute; ?>"><?php echo $text_select_attribute; ?></span>
                                </label>
                                <div class="col-sm-9">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                        <?php foreach ($attributes as $attribute) { ?>
						<?php if (in_array($attribute['attribute_id'], $attribute_view_action_select_attribute)) { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_action_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
							<?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
                                            <?php } else { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="attribute_view_action_select_attribute[]" value="<?php echo $attribute['attribute_id']; ?>" />
							<?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>
                                                    </label>
                                                </div>
					<?php } ?>				
				    <?php } ?>
                                    </div>
                                    <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                                </div>
                            </div>
                        </div>
					</div>
                    <input type="hidden" name="apply" value="0" />
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var attribute_in_category = <?php echo $attribute_in_category;?>;
    function addAttributeInCategory($this){
            html = '<div class="form-group" id="attr_in_cat' + attribute_in_category + '">';
            html += '<label class="col-sm-3 control-label">';
            html += '<span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_category_select_category; ?>"><?php echo $text_select_category; ?></span>';
            html +='</label>';
            html += '<div class="col-sm-3">';
            html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
            <?php foreach ($categories as $category) { ?> 
            html += '<div class="checkbox">';
            html += ' <label>';
            html += '<input type="checkbox" name="attribute_view_output_by_category['+attribute_in_category+'][]" value="<?php echo $category['category_id']; ?>" />';
            html += '<?php echo $category['name']; ?>'; 
            html += '</label>';
            html += '</div>';
            <?php } ?>                               
            html += '</div>';                               
            html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
            html += '</div>';
            html += '<label class="col-sm-2 control-label">';
            html += '<span data-toggle="tooltip" title="" data-original-title="<?php echo $original_title_action_select_attribute; ?>"><?php echo $text_select_attribute; ?></span>';
            html += '</label>';
            html += '<div class="col-sm-3">';
            html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
            <?php foreach ($attributes as $attribute) { ?>
            html += '<div class="checkbox">';
            html += '<label>';
            html += '<input type="checkbox" name="attribute_view_output_by_category_attribute['+attribute_in_category+'][]" value="<?php echo $attribute['attribute_id']; ?>" />';
            html += '<?php echo $attribute['attribute_group']; ?> > <?php echo $attribute['name']; ?>';
            html += '</label>';
            html += '</div>';
            <?php } ?>
            html += '</div>';
            html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
            html += '</div>';
            html += '<div class="col-sm-1 text-right">';
            html += '<button type="button" onclick="$(\'#attr_in_cat'+attribute_in_category+'\').remove();" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-minus-circle"></i></button>';
            html += '</div>'; 
            html += '</div>'; 
    $($this).parent().before(html);
attribute_in_category++;
                        
    }
</script>
<?php echo $footer; ?>