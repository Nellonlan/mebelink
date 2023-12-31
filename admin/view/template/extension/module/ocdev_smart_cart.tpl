<?php echo $header; ?>
<?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" formaction="<?php echo $action; ?>" form="form-cart" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <button type="submit" formaction="<?php echo $action_plus; ?>" form="form-cart" data-toggle="tooltip" title="<?php echo $button_save_and_stay; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
        <h1><?php echo $heading_name; ?></h1>
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
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form method="post" enctype="multipart/form-data" id="form-cart" class="form-horizontal">
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" id="setting_tabs">
            <li class="active dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog"></i> <?php echo $tab_control_panel; ?> <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#general-block" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general_setting; ?></a></li>
                <li><a href="#import-export-block" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_import_export_setting; ?></a></li>
              </ul>
            </li>
            <li><a href="#layout-block" data-toggle="tab"><i class="fa fa-eye"></i> <?php echo $tab_layout_setting; ?></a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-language"></i> <?php echo $tab_language_setting; ?> <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#language-block" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_basic_language_setting; ?></a></li>
              </ul>
            </li>
            <li><a href="#popup-block" data-toggle="tab"><i class="fa fa-desktop"></i> <?php echo $tab_popup_setting; ?></a></li>
            <li><a href="#saved-cart-block" data-toggle="tab"><i class="fa fa-shopping-cart"></i> <?php echo $tab_saved_cart; ?></a></li>
            <li><a href="#marketing-tools-block" data-toggle="tab"><i class="fa fa-thumbs-o-up"></i> <?php echo $tab_marketing_tools_setting; ?></a></li>
          </ul>
          <div class="tab-content">
            <!-- TAB General setting -->
            <div class="tab-pane active" id="general-block">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_activate_module; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-success <?php echo $form_data['activate'] == 1 ? 'active' : ''; ?>">
                      <input type="radio"
                        name="<?php echo $_module_name; ?>_form_data[activate]"
                        value="1"
                        autocomplete="off"
                        <?php echo $form_data['activate'] == 1 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_yes; ?>
                    </label>
                    <label class="btn btn-success <?php echo $form_data['activate'] == 0 ? 'active' : ''; ?>">
                      <input type="radio"
                        name="<?php echo $_module_name; ?>_form_data[activate]"
                        value="0"
                        autocomplete="off"
                        <?php echo $form_data['activate'] == 0 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_no; ?>
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-add_function_selector"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_add_function_selector_faq; ?>"><?php echo $text_add_function_selector; ?></span></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-crosshairs"></i></span>
                    <input value="<?php echo $form_data['add_function_selector']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[add_function_selector]" class="form-control" id="input-add_function_selector" placeholder="<?php echo $text_add_function_selector_ph; ?>" />
                  </div>
                  <?php if ($error_add_function_selector) { ?>
                    <div class="text-danger"><?php echo $error_add_function_selector; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-add_id_selector"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_add_id_selector_faq; ?>"><?php echo $text_add_id_selector; ?></span></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <span class="input-group-addon">#&nbsp;</span>
                    <input value="<?php echo $form_data['add_id_selector']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[add_id_selector]" class="form-control" id="input-add_id_selector" placeholder="<?php echo $text_add_id_selector_ph; ?>" />
                  </div>
                  <?php if ($error_add_id_selector) { ?>
                    <div class="text-danger"><?php echo $error_add_id_selector; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_show_in_stores; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php $row = 0; foreach ($all_stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="<?php echo $_module_name; ?>_form_data[stores][<?php echo $row; ?>]" value="<?php echo $store['store_id']; ?>" <?php echo (isset($form_data['stores']) && in_array($store['store_id'], $form_data['stores'])) ? 'checked' : ''; ?> /> <?php echo $store['name']; ?>
                      </label>
                    </div>
                    <?php $row++; ?>
                    <?php } ?>
                  </div>
                  <a class="btn btn-primary btn-sm" onclick="$(this).parent().find('input[type=checkbox]').attr('checked', true);"><?php echo $text_select_all; ?></a>
                  <a class="btn btn-warning btn-sm" onclick="$(this).parent().find(':checkbox').removeAttr('checked');"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_customer_groups; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php $row = 0; foreach ($all_customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <input
                          type="checkbox"
                          name="<?php echo $_module_name; ?>_form_data[customer_groups][<?php echo $row; ?>]"
                          value="<?php echo $customer_group['customer_group_id']; ?>" <?php echo (!empty($form_data['customer_groups'][$row])) ? 'checked' : ''; ?>
                        /> <?php echo $customer_group['name']; ?>
                      </label>
                    </div>
                    <?php $row++; ?>
                    <?php } ?>
                  </div>
                  <a class="btn btn-primary btn-sm" onclick="$(this).parent().find('input[type=checkbox]').attr('checked', true);"><?php echo $text_select_all; ?></a>
                  <a class="btn btn-warning btn-sm" onclick="$(this).parent().find(':checkbox').removeAttr('checked');"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>
            </div>
            <!-- TAB Display settings -->
            <div class="tab-pane" id="layout-block">
              <fieldset>
                <legend><?php echo $text_product_information; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_main_product_image; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_main_img'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_main_img]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_main_img'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_main_img'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_main_img]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_main_img'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_dementions_of_main_image; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                      <input value="<?php echo $form_data['main_image_width']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[main_image_width]" class="form-control" />
                    </div>
                    <div class="special_margin"></div>
                    <div class="input-group">
                      <span class="input-group-addon">&nbsp;<i class="fa fa-arrows-v"></i>&nbsp;</span>
                      <input value="<?php echo $form_data['main_image_height']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[main_image_height]" class="form-control" />
                    </div>
                    <div class="special_margin"></div>
                    <h5><?php echo $text_warning_dementions_of_main_image; ?></h5>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_model; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_model'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_model]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_model'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_model'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_model]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_model'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_ean; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_ean'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_ean]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_ean'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_ean'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_ean]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_ean'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_ean; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_jan'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_jan]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_jan'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_jan'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_jan]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_jan'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_isbn; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_isbn'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_isbn]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_isbn'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_isbn'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_isbn]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_isbn'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_mpn; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_mpn'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_mpn]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_mpn'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_mpn'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_mpn]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_mpn'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_location; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_location'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_location]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_location'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_location'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_location]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_location'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_reward; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_reward'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_reward]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_reward'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_reward'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_reward]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_reward'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_stock; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_stock'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_stock]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_stock'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_stock'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_stock]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_stock'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_tax; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_tax'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_tax]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_tax'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_tax'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_tax]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_tax'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_option; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_option'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_option]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_option'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_option'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_option]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_option'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_other_options; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_new_saved_cart_admin_alert; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['new_saved_cart_admin_alert'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[new_saved_cart_admin_alert]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['new_saved_cart_admin_alert'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['new_saved_cart_admin_alert'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[new_saved_cart_admin_alert]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['new_saved_cart_admin_alert'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-email_for_notification"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_email_for_notification_faq; ?>"><?php echo $text_email_for_notification; ?></span></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                      <input value="<?php echo $form_data['email_for_notification']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[email_for_notification]" class="form-control" id="input-email_for_notification" />
                    </div>
                    <?php if ($error_email_for_notification) { ?>
                      <div class="text-danger"><?php echo $error_email_for_notification; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_save_cart_button; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_save_cart_button'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_save_cart_button]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_save_cart_button'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_save_cart_button'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_save_cart_button]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_save_cart_button'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_cart_weight; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_cart_weight'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_cart_weight]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_cart_weight'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_cart_weight'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_cart_weight]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_cart_weight'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_coupon; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_coupon'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_coupon]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_coupon'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_coupon'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_coupon]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_coupon'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_voucher; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_voucher'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_voucher]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_voucher'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_voucher'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_voucher]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_voucher'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_reward; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_reward'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_reward]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_reward'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_reward'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_reward]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_reward'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_shipping; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_shipping'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_shipping]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_shipping'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_shipping'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_shipping]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_shipping'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
              </fieldset>
            </div>
            <!-- TAB Marketing tools -->
            <div class="tab-pane" id="marketing-tools-block">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_marketing_type; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-success <?php echo $form_data['marketing_type'] == 1 ? 'active' : ''; ?>">
                      <input type="radio"
                        name="<?php echo $_module_name; ?>_form_data[marketing_type]"
                        value="1"
                        autocomplete="off"
                        <?php echo $form_data['marketing_type'] == 1 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_show_cross_sell; ?>
                    </label>
                    <label class="btn btn-success <?php echo $form_data['marketing_type'] == 2 ? 'active' : ''; ?>">
                      <input type="radio"
                        name="<?php echo $_module_name; ?>_form_data[marketing_type]"
                        value="2"
                        autocomplete="off"
                        <?php echo $form_data['marketing_type'] == 2 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_show_up_sell; ?>
                    </label>
                  </div>
                </div>
              </div>
              <fieldset style="<?php echo $form_data['marketing_type'] == 1 ? '' : 'display:none;'; ?>" id="cross_sell_product_information">
                <legend><?php echo $text_cross_sell_product_information; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_sub_images; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_sub_img'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_sub_img]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_sub_img'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_sub_img'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_sub_img]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_sub_img'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_dementions_of_sub_images; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                      <input value="<?php echo $form_data['sub_images_width']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[sub_images_width]" class="form-control" />
                    </div>
                    <div class="special_margin"></div>
                    <div class="input-group">
                      <span class="input-group-addon">&nbsp;<i class="fa fa-arrows-v"></i>&nbsp;</span>
                      <input value="<?php echo $form_data['sub_images_height']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[sub_images_height]" class="form-control" />
                    </div>
                    <div class="special_margin"></div>
                    <h5><?php echo $text_warning_dementions_of_sub_images; ?></h5>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label"><?php echo $text_limit_cross_sell_products; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                      <input value="<?php echo $form_data['limit_cross_sell_products']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[limit_cross_sell_products]" class="form-control" />
                    </div>
                    <?php if ($error_limit_cross_sell_products) { ?>
                      <div class="text-danger"><?php echo $error_limit_cross_sell_products; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_products_from; ?></label>
                  <div class="col-sm-10">
                    <select name="<?php echo $_module_name; ?>_form_data[check]" class="form-control">
                      <option value="0" <?php echo $form_data['check'] == 0 ? 'selected="selected"' : ''; ?> ><?php echo $text_check_type_1; ?></option>
                      <option value="1" <?php echo $form_data['check'] == 1 ? 'selected="selected"' : ''; ?> ><?php echo $text_check_type_2; ?></option>
                      <option value="2" <?php echo $form_data['check'] == 2 ? 'selected="selected"' : ''; ?> ><?php echo $text_check_type_3; ?></option>
                      <option value="3" <?php echo $form_data['check'] == 3 ? 'selected="selected"' : ''; ?> ><?php echo $text_check_type_4; ?></option>
                    </select>
                  </div>
                </div>
                <div class="form-group" style="<?php echo $form_data['check'] == 1 ? '' : 'display:none;'; ?>" id="cross_sell_categories">
                  <label class="col-sm-2 control-label" for="input-category"><?php echo $text_show_in_categories; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="category" value="" placeholder="<?php echo $text_enter_category; ?>" id="input-category" class="form-control" />
                    <div id="category-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($all_categories as $category) { ?>
                      <div id="category-filter<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
                        <input type="hidden" name="<?php echo $_module_name; ?>_form_data[cross_sell_categories][]" value="<?php echo $category['category_id']; ?>" />
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="form-group" style="<?php echo $form_data['check'] == 2 ? '' : 'display:none;'; ?>" id="cross_sell_manufacturers">
                  <label class="col-sm-2 control-label" for="input-category"><?php echo $text_show_in_brands; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="manufacturer" value="" placeholder="<?php echo $text_enter_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                    <div id="manufacturer-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($all_manufacturers as $manufacturer) { ?>
                      <div id="manufacturer-filter<?php echo $manufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $manufacturer['name']; ?>
                        <input type="hidden" name="<?php echo $_module_name; ?>_form_data[cross_sell_manufacturers][]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="form-group" style="<?php echo $form_data['check'] == 3 ? '' : 'display:none;'; ?>" id="cross_sell_products">
                  <label class="col-sm-2 control-label" for="input-category"><?php echo $text_show_products; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="product" value="" placeholder="<?php echo $text_enter_product; ?>" id="input-product" class="form-control" />
                    <div id="featured-product" class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($all_products as $product) { ?>
                      <div id="featured-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                        <input type="hidden" name="<?php echo $_module_name; ?>_form_data[cross_sell_products][]" value="<?php echo $product['product_id']; ?>" />
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_addto_cart_button; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_addto_cart_button'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_addto_cart_button]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_addto_cart_button'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_addto_cart_button'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_addto_cart_button]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_addto_cart_button'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_show_product_price; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_product_price'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_price]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_price'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_product_price'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_product_price]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_product_price'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
              </fieldset>
              <fieldset style="<?php echo $form_data['marketing_type'] == 2 ? '' : 'display:none;'; ?>" id="up_sell_product_information">
                <legend><?php echo $text_up_sell_product_information; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_up_sell_show_sub_images; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_up_sell_sub_img'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_up_sell_sub_img]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_up_sell_sub_img'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_up_sell_sub_img'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_up_sell_sub_img]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_up_sell_sub_img'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_up_sell_dementions_of_sub_images; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                      <input value="<?php echo $form_data['sub_up_sell_images_width']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[sub_up_sell_images_width]" class="form-control" />
                    </div>
                    <div class="special_margin"></div>
                    <div class="input-group">
                      <span class="input-group-addon">&nbsp;<i class="fa fa-arrows-v"></i>&nbsp;</span>
                      <input value="<?php echo $form_data['sub_up_sell_images_height']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[sub_up_sell_images_height]" class="form-control" />
                    </div>
                    <div class="special_margin"></div>
                    <h5><?php echo $text_warning_dementions_of_sub_images; ?></h5>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label"><?php echo $text_up_sell_limit_cross_sell_products; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-arrows-h"></i></span>
                      <input value="<?php echo $form_data['limit_up_sell_products']; ?>" type="text" name="<?php echo $_module_name; ?>_form_data[limit_up_sell_products]" class="form-control" />
                    </div>
                    <?php if ($error_limit_up_sell_products) { ?>
                      <div class="text-danger"><?php echo $error_limit_up_sell_products; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_up_sell_show_product_addto_cart_button; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_up_sell_product_addto_cart_button'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_up_sell_product_addto_cart_button]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_up_sell_product_addto_cart_button'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_up_sell_product_addto_cart_button'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_up_sell_product_addto_cart_button]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_up_sell_product_addto_cart_button'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_up_sell_show_product_price; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['hide_up_sell_product_price'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_up_sell_product_price]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['hide_up_sell_product_price'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['hide_up_sell_product_price'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[hide_up_sell_product_price]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['hide_up_sell_product_price'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $text_randomize; ?></label>
                  <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons">
                      <label class="btn btn-success <?php echo $form_data['randomize'] == 1 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[randomize]"
                          value="1"
                          autocomplete="off"
                          <?php echo $form_data['randomize'] == 1 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_yes; ?>
                      </label>
                      <label class="btn btn-success <?php echo $form_data['randomize'] == 0 ? 'active' : ''; ?>">
                        <input type="radio"
                          name="<?php echo $_module_name; ?>_form_data[randomize]"
                          value="0"
                          autocomplete="off"
                          <?php echo $form_data['randomize'] == 0 ? 'checked="checked"' : ''; ?>
                        /><?php echo $text_no; ?>
                      </label>
                    </div>
                  </div>
                </div>
                <table id="upsell-blocks" class="table table-bordered">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $column_products_in_cart; ?></td>
                      <td class="text-left"><?php echo $column_recommended_products; ?></td>
                      <td class="text-left"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $upsell_row = 0; ?>
                    <?php foreach ($upsells as $upsell) { ?>
                    <tr id="upsell_row<?php echo $upsell_row; ?>">
                      <td class="text-left" style="vertical-align:top">
                        <input type="text" name="product_cart<?php echo $upsell_row; ?>" value="" placeholder="<?php echo $text_enter_product; ?>" class="form-control" onmousedown="cartautocomplete(<?php echo $upsell_row; ?>);"/>
                        <div id="cart-products<?php echo $upsell_row; ?>" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($upsell['cart_products'] as $product) { ?>
                          <div id="cart-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle" onclick="$(this).parent().remove();"></i> <?php echo $product['name']; ?>
                            <input type="hidden" name="<?php echo $_module_name; ?>_upsell_data[<?php echo $upsell_row; ?>][cart_products][]" value="<?php echo $product['product_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </td>
                      <td class="text-left" style="vertical-align:top">
                        <select name="<?php echo $_module_name; ?>_upsell_data[<?php echo $upsell_row; ?>][type]" class="form-control">
                          <option value="0" <?php echo $upsell['type'] == 0 ? 'selected="selected"' : ''; ?> ><?php echo $text_make_a_choice; ?></option>
                          <option value="1" <?php echo $upsell['type'] == 1 ? 'selected="selected"' : ''; ?> ><?php echo $text_get_from_related_products; ?></option>
                          <option value="2" <?php echo $upsell['type'] == 2 ? 'selected="selected"' : ''; ?> ><?php echo $text_select_products; ?></option>
                          <option value="3" <?php echo $upsell['type'] == 3 ? 'selected="selected"' : ''; ?> ><?php echo $text_combo_products; ?></option>
                        </select>
                        <div class="special_margin"></div>
                        <div style="<?php echo ($upsell['type'] == 2 || $upsell['type'] == 3) ? '' : 'display:none;'; ?>">
                          <input type="text" name="product_upsell<?php echo $upsell_row; ?>" value="" placeholder="<?php echo $text_enter_product; ?>" class="form-control" onmousedown="upsellautocomplete(<?php echo $upsell_row; ?>);"/>
                          <div id="upsell-products<?php echo $upsell_row; ?>" class="well well-sm" style="height: 150px; overflow: auto;">
                            <?php foreach ($upsell['upsell_products'] as $product) { ?>
                            <div id="upsell-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle" onclick="$(this).parent().remove();"></i> <?php echo $product['name']; ?>
                              <input type="hidden" name="<?php echo $_module_name; ?>_upsell_data[<?php echo $upsell_row; ?>][upsell_products][]" value="<?php echo $product['product_id']; ?>" />
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                      </td>
                      <td class="text-left">
                        <button type="button" onclick="$('#upsell_row<?php echo $upsell_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                      </td>
                    </tr>
                    <?php $upsell_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addUpsell();" data-toggle="tooltip" title="<?php echo $button_add_upsell; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </fieldset>
            </div>
            <!-- TAB Language setting -->
            <div class="tab-pane" id="language-block">
              <div class="form-group required">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_module_heading_faq; ?>"><?php echo $text_module_heading; ?></span></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="module_heading">
                    <?php foreach ($languages as $language) { ?>
                      <li>
                        <a href="#tab-module_heading-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                      </li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="tab-module_heading-language<?php echo $language['language_id']; ?>">
                      <input
                        type="text"
                        name="<?php echo $_module_name; ?>_text_data[<?php echo $language['code']; ?>][heading]"
                        value="<?php echo (!empty($text_data[$language['code']]['heading'])) ? $text_data[$language['code']]['heading'] : ''; ?>"
                        class="form-control"
                      />
                      <?php if (isset($error_heading[$language['code']])) { ?>
                        <div class="text-danger"><?php echo $error_heading[$language['code']]; ?></div>
                      <?php } ?>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_module_call_button_faq; ?>"><?php echo $text_module_call_button; ?></span></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="module_call_button">
                    <?php foreach ($languages as $language) { ?>
                      <li>
                        <a href="#tab-module_call_button-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                      </li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="tab-module_call_button-language<?php echo $language['language_id']; ?>">
                      <input
                        type="text"
                        name="<?php echo $_module_name; ?>_text_data[<?php echo $language['code']; ?>][call_button]"
                        value="<?php echo (!empty($text_data[$language['code']]['call_button'])) ? $text_data[$language['code']]['call_button'] : ''; ?>"
                        class="form-control"
                      />
                      <?php if (isset($error_call_button[$language['code']])) { ?>
                        <div class="text-danger"><?php echo $error_call_button[$language['code']]; ?></div>
                      <?php } ?>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_module_call_button_vs_options_faq; ?>"><?php echo $text_module_call_button_vs_options; ?></span></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="module_call_button_vs_options">
                    <?php foreach ($languages as $language) { ?>
                      <li>
                        <a href="#tab-module_call_button_vs_options-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                      </li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="tab-module_call_button_vs_options-language<?php echo $language['language_id']; ?>">
                      <input
                        type="text"
                        name="<?php echo $_module_name; ?>_text_data[<?php echo $language['code']; ?>][call_button_vs_options]"
                        value="<?php echo (!empty($text_data[$language['code']]['call_button_vs_options'])) ? $text_data[$language['code']]['call_button_vs_options'] : ''; ?>"
                        class="form-control"
                      />
                      <?php if (isset($error_call_button_vs_options[$language['code']])) { ?>
                        <div class="text-danger"><?php echo $error_call_button_vs_options[$language['code']]; ?></div>
                      <?php } ?>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-placement="right" title="<?php echo $text_result_message_faq; ?>"><?php echo $text_result_message; ?></span></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs" id="empty_text">
                    <?php foreach ($languages as $language) { ?>
                      <li>
                        <a href="#tab-empty_text-language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                      </li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php foreach ($languages as $language) { ?>
                    <div class="tab-pane" id="tab-empty_text-language<?php echo $language['language_id']; ?>">
                      <textarea
                        class="form-control"
                        style="height:auto;resize:vertical;"
                        rows="3"
                        name="<?php echo $_module_name; ?>_text_data[<?php echo $language['code']; ?>][empty_text]"><?php echo (!empty($text_data[$language['code']]['empty_text'])) ? $text_data[$language['code']]['empty_text'] : '';?></textarea>
                        <?php if (isset($error_empty_text[$language['code']])) { ?>
                          <div class="text-danger"><?php echo $error_empty_text[$language['code']]; ?></div>
                        <?php } ?>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <!-- TAB Saved cart -->
            <div class="tab-pane" id="saved-cart-block">
              <div id="history"></div>
            </div>
            <!-- TAB Popup settings -->
            <div class="tab-pane" id="popup-block">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_background_images; ?></label>
                <div class="col-sm-10">
                  <div class="input-group div_background_images">
                    <?php if ($backgrounds) { ?>
                      <?php $key = 1; foreach ($backgrounds as $background) { ?>
                      <input type="radio" name="<?php echo $_module_name; ?>_form_data[style_beckground]" id="label_img_<?php echo $key; ?>" value="<?php echo $background['name']; ?>" <?php echo (!empty($form_data['style_beckground']) && $form_data['style_beckground'] == $background['name']) ? 'checked' : ''; ?> />
                      <label class="background_for_label" for="label_img_<?php echo $key; ?>" style="background:url(<?php echo $background['src']; ?>);">
                      </label>
                      <?php $key++; } ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_background_opacity; ?> <i class="fa fa-info-sign faq" data-toggle="tooltip" data-placement="right" title="<?php echo $text_background_opacity_faq; ?>"></i></label>
                <div class="col-sm-10">
                  <div class="input-group-sm">
                    <input style="float:left;height:30px;" type="button" value="-" onclick="if(parseInt($(this).next().val())>=1){$(this).next().val(~~$(this).next().val()-1)}" class="btn btn-success btn-sm" />
                    <input type="text" value="<?php echo (!empty($form_data['background_opacity'])) ? $form_data['background_opacity'] : 0; ?>" name="<?php echo $_module_name; ?>_form_data[background_opacity]" class="form-control fix_bacground_opacity" />
                    <input style="float:left;height:30px;" type="button" value="+" onclick="if(parseInt($(this).prev().val())<=9){$(this).prev().val(~~$(this).prev().val()+1)}" class="btn btn-success btn-sm" />
                  </div>
                </div>
              </div>
            </div>
            <!-- TAB Import / Export Block -->
            <div class="tab-pane" id="import-export-block">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_restore; ?></label>
                <div class="col-sm-5">
                  <input type="file" name="import" style="display:none;" id="load-file" />
                  <div class="input-group">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="button" onclick="$('#load-file').click();"><?php echo $text_select_file; ?></button>
                    </span>
                    <input type="text" name="load_file_mask" id="load-file-mask" class="form-control">
                    <span class="input-group-btn">
                      <button id="button-import-file" type="submit" formaction="<?php echo $action_plus; ?>" form="form-cart" data-toggle="tooltip" class="btn btn-success" disabled="disabled"><i class="fa fa-download"></i> <?php echo $button_import; ?></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_export; ?></label>
                <div class="col-sm-5">
                  <a href="<?php echo $export_settings_button; ?>" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $button_export; ?></a>
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" style="display:none;" name="<?php echo $_module_name; ?>_form_data[front_module_name]" value="<?php echo str_replace(array('<b>','</b>'), "", $heading_title); ?>" />
          <input type="hidden" style="display:none;" name="<?php echo $_module_name; ?>_form_data[front_module_version]" value="<?php echo $_module_version; ?>" />
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#history').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#history').load(this.href);
});
$('#history').load('index.php?route=extension/module/ocdev_smart_cart/history&token=<?php echo $token; ?>');
//--></script>
<script type="text/javascript"><!--
function delete_selected(link_id) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/ocdev_smart_cart/delete_selected&token=<?php echo $token; ?>&delete=' + link_id,
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/ocdev_smart_cart/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all() {
  $.ajax({
    type: 'get',
    url:  'index.php?route=extension/module/ocdev_smart_cart/delete_all&token=<?php echo $token; ?>',
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/ocdev_smart_cart/history&token=<?php echo $token; ?>');
    }
  });
}
function delete_all_selected() {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/module/ocdev_smart_cart/delete_all_selected&token=<?php echo $token; ?>',
    data: $('#history input[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
      $('#history').load('index.php?route=extension/module/ocdev_smart_cart/history&token=<?php echo $token; ?>');
    }
  });
}
//--></script>
<script type="text/javascript"><!--
$('input[name=\'manufacturer\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['manufacturer_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'manufacturer\']').val('');

    $('#manufacturer-filter' + item['value']).remove();

    $('#manufacturer-filter').append('<div id="manufacturer-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="<?php echo $_module_name; ?>_form_data[cross_sell_manufacturers][]" value="' + item['value'] + '" /></div>');
  }
});

$('#manufacturer-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'category\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['category_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'category\']').val('');

    $('#category-filter' + item['value']).remove();

    $('#category-filter').append('<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="<?php echo $_module_name; ?>_form_data[cross_sell_categories][]" value="' + item['value'] + '" /></div>');
  }
});

$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['product_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'product\']').val('');
    $('#featured-product' + item['value']).remove();
    $('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="<?php echo $_module_name; ?>_form_data[cross_sell_products][]" value="' + item['value'] + '" /></div>');
  }
});

$('#featured-product').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

var upsell_row = <?php echo $upsell_row; ?>;

function addUpsell() {
  html  = '<tr id="upsell_row' + upsell_row  + '">';
  html += '   <td class="text-left" style="vertical-align:top">';
  html += '   <input type="text" name="product_cart' + upsell_row + '" value="" placeholder="<?php echo $text_enter_product; ?>" class="form-control" />';
  html += '   <div id="cart-products' + upsell_row + '" class="well well-sm" style="height: 150px; overflow: auto;"></div>';
  html += '   </td>';
  html += '   <td class="text-left" style="vertical-align:top">';
  html += '     <select name="<?php echo $_module_name; ?>_upsell_data[' + upsell_row + '][type]" class="form-control">';
  html += '       <option value="0" selected="selected"><?php echo $text_make_a_choice; ?></option>';
  html += '       <option value="1"><?php echo $text_get_from_related_products; ?></option>';
  html += '       <option value="2"><?php echo $text_select_products; ?></option>';
  html += '       <option value="3"><?php echo $text_combo_products; ?></option>';
  html += '     </select>';
  html += '   <div class="special_margin"></div>';
  html += '   <div style="display:none;">';
  html += '     <input type="text" name="product_upsell' + upsell_row + '" value="" placeholder="<?php echo $text_enter_product; ?>" class="form-control" />';
  html += '     <div id="upsell-products' + upsell_row + '" class="well well-sm" style="height: 150px; overflow: auto;"></div>';
  html += '   </div>';
  html += '   </td>';
  html += '   <td class="text-left"><button type="button" onclick="$(\'#upsell_row' + upsell_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
  html += '</tr>';

  $('#upsell-blocks tbody').append(html);

  cartautocomplete(upsell_row);
  upsellautocomplete(upsell_row);

  $('select[name*=type]').change(function() {
    var val = $(this).val();
    if (val == 2 || val == 3) {
      $(this).next().next().show();
    } else {
      $(this).next().next().hide();
    }
  });

  upsell_row++;
}

$('select[name*=type]').change(function() {
  var val = $(this).val();
  if (val == 2 || val == 3) {
    $(this).next().next().show();
  } else {
    $(this).next().next().hide();
  }
});

$('input[name*=marketing_type]').change(function() {
  var val = $(this).val();
  if (val == 1) {
    $('#cross_sell_product_information').show();
    $('#up_sell_product_information').hide();
  } else {
    $('#cross_sell_product_information').hide();
    $('#up_sell_product_information').show();
  }
});

function cartautocomplete(upsell_row) {
  $('input[name=product_cart' + upsell_row + ']').autocomplete({
    source: function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));

        }
      });
    },
    select: function(item) {
      $('input[name=product_cart' + upsell_row + ']').val('');
      // $('#upsell_row'+upsell_row+' .dropdown-menu').remove();
      $('#cart-product' + item['value']).remove();
      $('#cart-products' + upsell_row).append('<div id="cart-product' + item['value'] + '"><i class="fa fa-minus-circle" onclick="$(this).parent().remove();"></i> ' + item['label'] + '<input type="hidden" name="<?php echo $_module_name; ?>_upsell_data['+ upsell_row +'][cart_products][]" value="' + item['value'] + '" /></div>');
    }
  });
}

function upsellautocomplete(upsell_row) {
  $('input[name=product_upsell' + upsell_row + ']').autocomplete({
    source: function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));

        }
      });
    },
    select: function(item) {
      $('input[name=product_upsell' + upsell_row + ']').val('');
      // $('#upsell_row'+upsell_row+' .dropdown-menu').remove();
      $('#upsell-products' + upsell_row).append('<div id="upsell-product' + item['value'] + '"><i class="fa fa-minus-circle" onclick="$(this).parent().remove();"></i> ' + item['label'] + '<input type="hidden" name="<?php echo $_module_name; ?>_upsell_data['+ upsell_row +'][upsell_products][]" value="' + item['value'] + '" /></div>');
    }
  });
}
//--></script>
<script type="text/javascript"><!--
  $('select[name*=check]').change(function() {
    var val = $(this).val();

     if (val == 1) {
      $('#cross_sell_categories').show();
      $('#cross_sell_manufacturers').hide();
      $('#cross_sell_products').hide();
     } else if(val == 2) {
      $('#cross_sell_categories').hide();
      $('#cross_sell_manufacturers').show();
      $('#cross_sell_products').hide();
     } else if (val == 3) {
      $('#cross_sell_categories').hide();
      $('#cross_sell_manufacturers').hide();
      $('#cross_sell_products').show();
     } else {
      $('#cross_sell_categories').hide();
      $('#cross_sell_manufacturers').hide();
      $('#cross_sell_products').hide();
     }
  });
</script>

<script type="text/javascript"><!--
$('#module_heading a:first').tab('show');
$('#module_call_button a:first').tab('show');
$('#module_call_button_vs_options a:first').tab('show');
$('#empty_text a:first').tab('show');

$(function() {
  $('#module li:first-child a').tab('show');
});

function button_loading(id) {
  $('#button-call-modal-'+id).button('loading');
  var $btn = $('#button-call-modal-'+id);
  setTimeout (function() {
    $btn.button('reset');
  }, 500);
}
$("#delete_selected").click(function(event) {
  event.preventDefault();
  var action = $(this).attr('href');
  $('form[id=form-cart]').attr('action', action);
  $('form[id=form-cart]').submit();
});
if (window.localStorage && window.localStorage['last_active_tab']) {
  $('#setting_tabs a[href=' + window.localStorage['last_active_tab'] + ']').trigger('click');
}
$('#setting_tabs a[data-toggle="tab"]').click(function() {
  if (window.localStorage) {
    window.localStorage['last_active_tab'] = $(this).attr('href');
  }
});

$('#load-file').change(function(){
  $('#load-file-mask').val($(this).val());
  $('#button-import-file').attr('disabled', false);
});
//--></script>
<?php echo $footer; ?>
