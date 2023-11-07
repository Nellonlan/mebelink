<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
              <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li><a  href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
              <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
    <style>
        .small_text{
            font-size: 9px;
            color: darkgray;
        }
        .small_text:hover{
            font-size: 9px;
            color: black;
        }
        .table_zebra tbody tr td:nth-child(2n+1){
           background: lemonchiffon;
        }
        .table_zebra tbody tr td:nth-child(2){
           background: none;
        }
        
    </style>
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        
    <div class="panel panel-default">
    
    <div class="panel-body">
        
        <ul  class="nav nav-tabs" >
            <li class="active"><a  data-toggle="tab"  href="#tab-migration" ><?php echo $tab_migration; ?></a></li>
            <li><a  data-toggle="tab" href="#tab-setting"  ><?php echo $tab_setting; ?></a></li>
            <li onclick="getWelcomeWindow();"><a  data-toggle="tab" href="#tab-welcome-extecom"  ><?php echo $tab_welcome_extecom; ?></a></li>
        </ul>
        
        <div class="tab-content">
        
        <div id="tab-welcome-extecom" class="tab-pane" >
            
            <div id="tab-welcome-extecom-window"></div>
                <hr>
                <?php if ((!$error_warning) && (!$success)) { ?>
                <div id="ocext_notification" class="alert alert-info"><i class="fa fa-info-circle"></i>
                        <div id="ocext_loading"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
            
            </div>
            
            <div id="tab-migration" class="tab-pane" >
                <?php if($amigration_setting){ ?>
                
                
                
                
                <form id="form-migration" action="<?php echo $action_migration; ?>" method="post" enctype="multipart/form-data">
                    
                <div class="row">
                    <div class="col-sm-2">
                        <ul class="nav nav-pills nav-stacked" id="tab-pvz-rows-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-attributes" > <?php echo $tab_attributes; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-options"> <?php echo $tab_options; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-categories"> <?php echo $tab_categories; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-manufacturer"> <?php echo $tab_manufacturer; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-products"> <?php echo $tab_products; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-customers"> <?php echo $tab_customers; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-orders"> <?php echo $tab_orders; ?></a></li>
                            
                            <li><a data-toggle="tab" href="#tab-articles"> <?php echo $tab_articles; ?></a></li>
                            <li><a data-toggle="tab" href="#tab-seo-ulrs"> <?php echo $tab_seo_urls; ?></a></li>
                            
                        </ul>
                    </div>
                    <div class="col-sm-10">				
                        <div class="tab-content">
                            
                            <div id='tab-manufacturer' class="tab-pane" >
                                
                                <?php if($text_only_new_manufacturers){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f"><?php echo $text_only_new_manufacturers ?></div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info manufacturer_notice"><b><?php echo $text_press_migrate ?></b></div>
                                
                                
                                <?php if($text_copy_files_no_curl){ ?>
                                
                                <div class="alert alert-danger"><b><?php echo $text_copy_files_no_curl ?></b></div>
                                
                                <?php }else{ ?>
                                
                                <input id="copy_image_manufacturer" type="checkbox" value="1" />&nbsp;&nbsp;<?php echo $text_copy_files_status ?><br><br>
                                
                                <?php } ?>
                                
                                
                                    <a onclick="migrate('manufacturer');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            
                            <div id='tab-categories' class="tab-pane" >
                                
                                <?php if($text_only_new_categories){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_new_categories ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info category_notice"><b><?php echo $text_press_migrate ?></b></div>
                                
                                <?php if($text_copy_files_no_curl){ ?>
                                
                                <div class="alert alert-danger"><b><?php echo $text_copy_files_no_curl ?></b></div>
                                
                                <?php }else{ ?>
                                
                                <input id="copy_image_category" type="checkbox" value="1" />&nbsp;&nbsp;<?php echo $text_copy_files_status ?><br><br>
                                
                                <?php } ?>
                                
                                    <a onclick="migrate('category');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            
                            <div id='tab-seo-ulrs' class="tab-pane" >
                                
                                <?php if($text_only_seo_urls){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_seo_urls ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info url_alias_notice"><b><?php echo $text_press_migrate ?></b></div>
                                    <a onclick="migrate('url_alias');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            
                            
                            <div id='tab-articles' class="tab-pane" >
                                
                                <?php if($text_only_new_articles){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_new_articles ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info information_notice"><b><?php echo $text_press_migrate ?></b></div>
                                    <a onclick="migrate('information');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            
                            <div id='tab-orders' class="tab-pane" >
                                
                                <?php if($text_only_new_orders){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_new_orders ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info order_notice"><b><?php echo $text_press_migrate ?></b></div>
                                    <a onclick="migrate('order');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            <div id='tab-customers' class="tab-pane" >
                                
                                <?php if($text_only_new_customers){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_new_customers ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info customer_notice"><b><?php echo $text_press_migrate ?></b></div>
                                    <a onclick="migrate('customer');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            <div id='tab-options' class="tab-pane" >
                                
                                <?php if($text_only_new_options){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_new_options ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info option_notice"><b><?php echo $text_press_migrate ?></b></div>
                                
                                <?php if($text_copy_files_no_curl){ ?>
                                
                                <div class="alert alert-danger"><b><?php echo $text_copy_files_no_curl ?></b></div>
                                
                                <?php }else{ ?>
                                
                                <input id="copy_image_option" type="checkbox" value="1" />&nbsp;&nbsp;<?php echo $text_copy_files_status ?><br><br>
                                
                                <?php } ?>
                                
                                
                                    <a onclick="migrate('option');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            
                            
                            <div id='tab-attributes' class="tab-pane active" >
                                
                                <?php if($text_only_new_attributes){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f">
                                            <?php echo $text_only_new_attributes ?>
                                        </div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info attribute_notice"><b><?php echo $text_press_migrate ?></b></div>
                                    <a onclick="migrate('attribute');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                            <div id='tab-products' class="tab-pane" >
                                
                                <?php if($text_only_new_products){ ?>
                                
                                
                                        <div class="alert alert-danger" style="background: #ffa; border: solid 1px #ec971f; color: #ec971f"><?php echo $text_only_new_products ?></div>
                                
                                
                                <?php } ?>
                                        
                                <div class="alert alert-info product_notice"><b><?php echo $text_press_migrate ?></b></div>
                                
                                <?php if($text_copy_files_no_curl){ ?>
                                
                                <div class="alert alert-danger"><b><?php echo $text_copy_files_no_curl ?></b></div>
                                
                                <?php }else{ ?>
                                
                                <input id="copy_image_product" type="checkbox" value="1" />&nbsp;&nbsp;<?php echo $text_copy_files_status ?><br><br>
                                
                                <?php } ?>
                                
                                    <a onclick="migrate('product');" title="<?php echo $button_migrate; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_migrate; ?></a>
                                <br><br>
                                
                            </div>
                        </div>
                    </div>
                </div>
                
                </form>
                
                
                
                
                <?php }else{ ?>
                
                
                    <div class="alert alert-info"><?php echo $text_no_migration_setting ?></div>
                    
                    
                <?php } ?>
            </div>
            
        <div id="tab-setting" class="tab-pane" >
                <div align="right">
                    <a onclick="$('#form-setting').submit();" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>  <?php echo $button_save; ?></a>
                    <br><br>
                </div>
            
                <?php if(!$amigration_setting){ ?>
            
                        <div class="alert alert-info"><?php echo $text_no_migration_setting_2 ?></div>
                        
                <?php } ?>
                        
                <form action="<?php echo $action_setting; ?>" method="post" enctype="multipart/form-data" id="form-setting">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <td><?php echo $text_user_key; ?></td>
                            <td><input class="form-control" name="amigration_user_key" value='<?php echo $amigration_user_key ?>'/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $text_user_email; ?></td>
                            <td>
                                <input class="form-control" name="amigration_user_email" value='<?php echo $amigration_user_email ?>'/>
                                
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $text_db_prefix; ?></td>
                            <td>
                                <input class="form-control" name="amigration_db_prefix" value='<?php echo $amigration_db_prefix ?>'/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $text_copy_files_site_from; ?></td>
                            <td>
                                <input class="form-control" name="amigration_site_from" value='<?php echo $amigration_site_from ?>'/>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $text_copy_files_site_from_path; ?></td>
                            <td>
                                <div style="float: left; padding-top: 10px;">/image/</div><input style="width: 60%;" class="form-control" name="amigration_site_from_path" value='<?php echo $amigration_site_from_path ?>'/>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-bordered table-hover" >
                        <?php if(!$text_warning_db_prefix){ ?>
                            <thead>
                                <td><?php echo $column_from_to_table; ?></td>
                                <td  width='33%'><?php echo $column_from_db_value; ?></td>
                                <td  width='33%'><?php echo $column_to_db_value; ?></td>
                            </thead>
                            <tr>
                                <td><?php echo $text_languages; ?></td>
                                <td colspan="2">
                                    <?php if($amigration_languages_from && $amigration_languages_to){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach($amigration_languages_from as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if($amigration_languages_to){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_languages[<?php echo $element_from['language_id'] ?>]">
                                                                
                                                                
                                                                        <option value="0" ><?php echo $text_select_data ?></option>
                                                                        
                                                                        
                                                            <?php foreach($amigration_languages_to as $element_to_key=>$element_to){ ?>
                                                                
                                                                        <?php if (isset($amigration_languages[ $element_from['language_id'] ]) && $amigration_languages[ $element_from['language_id'] ] == $element_to['language_id'] ) { ?>
                                                                            <option value="<?php echo $element_to['language_id'] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                        <?php } else { ?>
                                                                            <option value="<?php echo $element_to['language_id'] ?>"><?php echo $element_to['name'] ?></option>
                                                                        <?php } ?>
                                                                
                                                            <?php } ?>
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!$amigration_languages_from){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_languages[<?php echo $element_from['language_id'] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                        
                                    <?php }elseif(!$amigration_languages_to){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_languages[<?php echo $element_from['language_id'] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            <tr>
                                <?php
                                
                                $table_var = 'tax_classes';
                                $table_id_var = 'tax_class_id';
                                
                                ?>
                                <td><?php echo ${'text_'.$table_var}; ?></td>
                                <td colspan="2">
                                    <?php if(${'amigration_'.$table_var.'_from'} && ${'amigration_'.$table_var.'_to'}){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach(${'amigration_'.$table_var.'_from'} as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if(${'amigration_'.$table_var.'_to'}){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                                                    <option value="0" ><?php echo $text_select_data ?></option> 
                                                                    
                                                                    <?php foreach(${'amigration_'.$table_var.'_to'} as $element_to_key=>$element_to){ ?>

                                                                                <?php if (isset(${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ]) && ${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ] == $element_to[ $table_id_var ] ) { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                                <?php } else { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>"><?php echo $element_to['name'] ?></option>
                                                                                <?php } ?>

                                                                    <?php } ?>
                                                                    
                                                                    
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!${'amigration_'.$table_var.'_from'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php }elseif(!${'amigration_'.$table_var.'_to'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            <tr>
                                <?php
                                
                                $table_var = 'length_classes';
                                $table_id_var = 'length_class_id';
                                
                                ?>
                                <td><?php echo ${'text_'.$table_var}; ?></td>
                                <td colspan="2">
                                    <?php if(${'amigration_'.$table_var.'_from'} && ${'amigration_'.$table_var.'_to'}){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach(${'amigration_'.$table_var.'_from'} as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if(${'amigration_'.$table_var.'_to'}){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                                                    <option value="0" ><?php echo $text_select_data ?></option> 
                                                                    
                                                                    <?php foreach(${'amigration_'.$table_var.'_to'} as $element_to_key=>$element_to){ ?>

                                                                                <?php if (isset(${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ]) && ${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ] == $element_to[ $table_id_var ] ) { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                                <?php } else { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>"><?php echo $element_to['name'] ?></option>
                                                                                <?php } ?>

                                                                    <?php } ?>
                                                                    
                                                                    
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!${'amigration_'.$table_var.'_from'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php }elseif(!${'amigration_'.$table_var.'_to'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            <tr>
                                <?php
                                
                                $table_var = 'weight_classes';
                                $table_id_var = 'weight_class_id';
                                
                                ?>
                                <td><?php echo ${'text_'.$table_var}; ?></td>
                                <td colspan="2">
                                    <?php if(${'amigration_'.$table_var.'_from'} && ${'amigration_'.$table_var.'_to'}){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach(${'amigration_'.$table_var.'_from'} as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if(${'amigration_'.$table_var.'_to'}){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                                                    <option value="0" ><?php echo $text_select_data ?></option> 
                                                                    
                                                                    <?php foreach(${'amigration_'.$table_var.'_to'} as $element_to_key=>$element_to){ ?>

                                                                                <?php if (isset(${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ]) && ${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ] == $element_to[ $table_id_var ] ) { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                                <?php } else { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>"><?php echo $element_to['name'] ?></option>
                                                                                <?php } ?>

                                                                    <?php } ?>
                                                                    
                                                                    
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!${'amigration_'.$table_var.'_from'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php }elseif(!${'amigration_'.$table_var.'_to'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            <tr>
                                <?php
                                
                                $table_var = 'customer_groups';
                                $table_id_var = 'customer_group_id';
                                
                                ?>
                                <td><?php echo ${'text_'.$table_var}; ?></td>
                                <td colspan="2">
                                    <?php if(isset(${'amigration_'.$table_var.'_from'}) && ${'amigration_'.$table_var.'_from'} && ${'amigration_'.$table_var.'_to'}){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach(${'amigration_'.$table_var.'_from'} as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if(${'amigration_'.$table_var.'_to'}){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                                                    <option value="0" ><?php echo $text_select_data ?></option> 
                                                                    
                                                                    <?php foreach(${'amigration_'.$table_var.'_to'} as $element_to_key=>$element_to){ ?>

                                                                                <?php if (isset(${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ]) && ${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ] == $element_to[ $table_id_var ] ) { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                                <?php } else { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>"><?php echo $element_to['name'] ?></option>
                                                                                <?php } ?>

                                                                    <?php } ?>
                                                                    
                                                                    
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!${'amigration_'.$table_var.'_from'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php }elseif(!${'amigration_'.$table_var.'_to'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            <tr>
                                <?php
                                
                                $table_var = 'order_statuses';
                                $table_id_var = 'order_status_id';
                                
                                ?>
                                <td><?php echo ${'text_'.$table_var}; ?></td>
                                <td colspan="2">
                                    <?php if(isset(${'amigration_'.$table_var.'_from'}) && ${'amigration_'.$table_var.'_from'} && ${'amigration_'.$table_var.'_to'}){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach(${'amigration_'.$table_var.'_from'} as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if(${'amigration_'.$table_var.'_to'}){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                                                    <option value="0" ><?php echo $text_select_data ?></option> 
                                                                    
                                                                    <?php foreach(${'amigration_'.$table_var.'_to'} as $element_to_key=>$element_to){ ?>

                                                                                <?php if (isset(${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ]) && ${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ] == $element_to[ $table_id_var ] ) { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                                <?php } else { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>"><?php echo $element_to['name'] ?></option>
                                                                                <?php } ?>

                                                                    <?php } ?>
                                                                    
                                                                    
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!${'amigration_'.$table_var.'_from'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php }elseif(!${'amigration_'.$table_var.'_to'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            <tr>
                                <?php
                                
                                $table_var = 'stock_statuses';
                                $table_id_var = 'stock_status_id';
                                
                                ?>
                                <td><?php echo ${'text_'.$table_var}; ?></td>
                                <td colspan="2">
                                    <?php if(${'amigration_'.$table_var.'_from'} && ${'amigration_'.$table_var.'_to'}){ ?>
                                        <table width='100%' class="table" style="margin-bottom: 0px;">
                                            <?php foreach(${'amigration_'.$table_var.'_from'} as $element_from){ ?>
                                                <tr>
                                                    <td width='50%'><?php echo $element_from['name'] ?></td>
                                                    <td width='50%'>
                                                        
                                                        <?php if(${'amigration_'.$table_var.'_to'}){ ?>
                                                        
                                                        
                                                            <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                                                    <option value="0" ><?php echo $text_select_data ?></option> 
                                                                    
                                                                    <?php foreach(${'amigration_'.$table_var.'_to'} as $element_to_key=>$element_to){ ?>

                                                                                <?php if (isset(${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ]) && ${'amigration_'.$table_var}[ $element_from[ $table_id_var ] ] == $element_to[ $table_id_var ] ) { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>" selected="selected"><?php echo $element_to['name'] ?></option>
                                                                                <?php } else { ?>
                                                                                    <option value="<?php echo $element_to[ $table_id_var ] ?>"><?php echo $element_to['name'] ?></option>
                                                                                <?php } ?>

                                                                    <?php } ?>
                                                                    
                                                                    
                                                            </select>
                                                        
                                                        
                                                        <?php } ?>
                                                        
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php unset($element_to);unset($element_from); ?>
                                        </table>
                                    <?php }elseif(!${'amigration_'.$table_var.'_from'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_from_data; ?></div>
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php }elseif(!${'amigration_'.$table_var.'_to'}){ ?>
                                        <div class="alert alert-danger"><?php echo $text_no_to_data; ?></div>
                                        <select  class="form-control" name="amigration_<?php echo $table_var ?>[<?php echo $element_from[ $table_id_var ] ?>]">
                                            <option value="0" ><?php echo $text_select_data ?></option>
                                        </select>
                                    <?php } ?>
                                </td>
                            </tr>
                            
                            
                        <?php }else{ ?>
                            <tr>
                                <td colspan="3">
                                    <div class="alert alert-danger"><?php echo $text_warning_db_prefix; ?></div>
                                </td>
                            </tr>
                        <?php } ?>
                    </table>
                </form>
                
                
            </div>        
        
        </div>
        
    </div>        
    </div>
</div>
</div>
<script type="text/javascript"><!--
    
$(document).ready(function() {
    $("a[href=\'#<?php echo $open_tab ?>\']").click();
});

var start = 0;
var finished = 0;
var limit = 1;
var total = 0;
function migrate(table) {
        if(start==0){
            $('.'+table+'_notice').html('<i class="fa fa-info-circle"></i>&nbsp;&nbsp;<img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /><button type="button" class="close" data-dismiss="alert">&times;</button>&nbsp;&nbsp;<?php echo $text_migrate ?>: <b><?php echo $text_wite ?></b> / <b><?php echo $text_wite ?></b> ');
        }
        $('a.btn.btn-primary').hide();
        
        var copy_image = '';
        if($("#copy_image_"+table).prop('checked')){
            copy_image = '&copy_image=1';
        }
	$.ajax({
            type: 'GET',
            url: 'index.php?route=extension/module/amigration/migrate&table='+table+copy_image+'&limit='+limit+'&start='+start+'&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                    if (json['error'] && json['error']!='') {
                            $('.'+table+'_notice').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['error']);
                            $('a.btn.btn-primary').show();
                    } else {
                        finished = start + limit;
                        total = json['total'];
                        start = finished;
                        if(start<=total){
                            $('.'+table+'_notice').html('<i class="fa fa-info-circle"></i>&nbsp;&nbsp;<img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /><button type="button" class="close" data-dismiss="alert">&times;</button>&nbsp;&nbsp;<?php echo $text_migrate ?>: <b>'+finished+'</b> / <b>'+total+'</b>');
                            migrate(table);
                        }else{
                            $('.'+table+'_notice').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['message']);
                            finished = 0;
                            total = 0;
                            start = 0;
                            $('a.btn.btn-primary').show();
                        }
                    }
            },
            failure: function(){
                
            },
            error: function() {
                
            }
    });
}

function getNotifications() {
	$.ajax({
            type: 'GET',
            url: 'index.php?route=extension/module/amigration/getNotifications&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                    if (json['error']) {
                            $('#ocext_notification').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['error']);
                    } else if (json['message'] && json['message']!='' ) {
                            $('#ocext_notification').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['message']);
                    }else{
                        $('#ocext_notification').remove();
                    }
            },
            failure: function(){
                    $('#ocext_notification').remove();
            },
            error: function() {
                    $('#ocext_notification').remove();
            }
    });
}
getNotifications();

function getWelcomeWindow() {
	$.ajax({
            type: 'GET',
            url: 'index.php?route=extension/module/amigration/getWelcomeWindow&token=<?php echo $token; ?>',
            dataType: 'html',
            success: function(html) {
                $('#tab-welcome-extecom-window').html(html);
            },
            failure: function(){
                $('#tab-welcome-extecom-window').html();
            },
            error: function() {
                $('#tab-welcome-extecom-window').html();
            }
    });
}

//--></script> 
<?php echo $footer; ?>