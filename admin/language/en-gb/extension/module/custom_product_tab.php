<?php
$_['extension_name']                    = 'Custom Product Tabs PRO';

// Heading
$_['heading_title']                     = '<i class="fa fa-folder-o" style="font-size:14px;color:#F7951D;"></i> <strong>' . $_['extension_name'] . '</strong>' . (defined("CPT_STATUS") ? '<span style="display:inline-block;margin-left:20px;">' . (CPT_STATUS ? '<i style="color:#3c763d">[ Enabled ]</i>' : '<i style="color:#a94442">[ Disabled ]</i>') . '</span>' : '');

// Buttons
$_['button_apply']                      = 'Apply';
$_['button_upgrade']                    = 'Upgrade';
$_['button_fix_db']                     = 'Fix database';
$_['button_purchase_license']           = 'Purchase Additional License';

// Tabs
$_['tab_settings']                      = 'Settings';
$_['tab_tabs']                          = 'Tabs';
$_['tab_support']                       = 'Support';
$_['tab_about']                         = 'About';
$_['tab_general']                       = 'General';
$_['tab_faq']                           = 'FAQ';
$_['tab_services']                      = 'Services';
$_['tab_changelog']                     = 'Changelog';
$_['tab_extension']                     = 'Extension';

$_['tab_description']                   = 'Description';
$_['tab_attribute']                     = 'Specification';
$_['tab_review']                        = 'Reviews (%s)';

// Text
$_['text_extension']                    = 'Extensions';
$_['text_success_upgrade']              = '<strong>Success!</strong> You have upgraded ' . $_['extension_name'] . ' to version <strong>%s</strong>!';
$_['text_success_update']               = '<strong>Success!</strong> You have updated ' . $_['extension_name'] . ' settings!';
$_['text_success_hooks_update']         = '<strong>Success!</strong> ' . $_['extension_name'] . ' event hooks updated!';
$_['text_success_fix_db']               = '<strong>Success!</strong> Database inconsistencies have been fixed!';
$_['text_success_tab_delete']           = '<strong>Success!</strong> Custom tab \'%s\' has been deleted!';
$_['text_success_tab_add']              = '<strong>Success!</strong> Custom tab \'%s\' has been added!';
$_['text_toggle_navigation']            = 'Toggle navigation';
$_['text_confirm_delete']               = 'Confirm Tab Deletion!';
$_['text_are_you_sure']                 = 'Deletion <strong>cannot</strong> be undone! Are you sure you want to do delete the tab?';
$_['text_license']                      = 'License';
$_['text_extension_information']        = 'Extension information';
$_['text_legal_notice']                 = 'Legal notice';
$_['text_terms']                        = 'Terms &amp; Conditions';
$_['text_support_subject']              = $_['extension_name'] . ' support needed';
$_['text_license_text']                 = 'Please be aware that this product has a <strong>per-domain license</strong>, meaning you can use it <em>only on a single domain</em> (sub-domains count as separate domains). <strong>You will need to purchase a separate license for each domain you wish to use this extension on.</strong>';
$_['text_other_extensions']             = 'If you like this extension you might also be interested in <a href="%s" class="alert-link" target="_blank">my other extensions</a>.';
$_['text_faq']                          = 'Frequently Asked Questions';
$_['text_add_tab']                      = 'Add a new tab';
$_['text_delete_tab']                   = 'Delete this tab';
$_['text_no_products']                  = 'No products';
$_['text_all_products']                 = 'All products';
$_['text_all_empty_products']           = 'All products with empty content';
$_['text_all_category_products']        = 'All products from the following category';
$_['text_all_manufacturer_products']    = 'All products from the following manufacturer';
$_['text_selected_products']            = 'Selected products';
$_['text_default_tab']                  = 'Default';
$_['text_reserved_tab']                 = 'Reserved';
$_['text_regular_tab']                  = 'Regular';
$_['text_custom_tab_name']              = 'Custom tab name';
$_['text_autocomplete']                 = '(Autocomplete)';
$_['text_remove']                       = 'Remove';
$_['text_overwrite_tab_content']        = 'Overwrite tab content';
$_['text_change_product_tab_status']    = 'Change product tab status';
$_['text_enable']                       = 'Enable';
$_['text_disable']                      = 'Disable';
$_['text_no_action']                    = 'No Action';
$_['text_saving']                       = 'Saving ...';
$_['text_fixing']                       = 'Fixing ...';
$_['text_upgrading']                    = 'Upgrading ...';
$_['text_canceling']                    = 'Canceling ...';
$_['text_loading']                      = 'Loading ...';
$_['text_no_records_found']             = 'No matching products found';
$_['text_default_login_required_text']  = 'You need to <a href="%s">log in</a> to see the content.';

// Help texts
$_['help_show_always']                  = 'The custom tabs are visible even if they do not contain any data.';
$_['help_global_status']                = 'Controls the tab status globally. Tab status can be individually controlled on product page or by using the <strong>Change product tab status</strong> control below. <em>Note!</em> New tabs are automatically enabled for all products.';
$_['help_remove_sql_changes']           = 'Remove all SQL changes when <strong>uninstalling</strong> the module.';
$_['help_use_admin_language_value']     = 'If secondary language field is left blank, use the value from the admin language field.';
$_['help_use_default_value_for_new']    = 'Prefill custom tab content with default values for new products.';
$_['help_show_login_required_text']     = 'Show a \'login required\' text to customers who are not logged in for tabs that require login.';
$_['help_tab_type']                     = '\'Reserved\' type custom tab does not have a regular custom tab content. Only the tab name is inserted into the template. It is meant to be used together with \'Tab key\' value for linking the tab name to a custom tab content of another third party extension.';
$_['help_tab_key']                      = 'Tab key will be used as the custom tab\'s ID in linking this custom tab name to the custom tab content of another third party extension. Make sure the value corresponds to the actual third party custom tab ID (without the starting #).';
$_['help_tab_key_alt']                  = '<em>(Optional)</em> This can be used to give the custom tab a more SEO friendly tab ID (without the starting #). If left empty, a generic tab key will be used.<br/><span class="label label-info">Note!</span> All tabs must have unique tab keys.';
$_['help_condition']                    = '<em>(Optional, Advanced)</em> PHP variable or PHP code to evaluate to check whether the custom tab should be displayed. Evaluation is done in the context of product.tpl file.<br/><span class="label label-info">Note!</span> The content must be empty or contain only valid PHP code without the trailing semicolon.';
$_['help_overwrite']                    = 'Overwrite the custom tab content of the following products with the above default value. <em>This is a one-time operation!</em>';
$_['help_require_login']                = 'Display the custom tab only to logged in customers.';
$_['help_change_product_tab_status']    = 'Enable or Disable the tab for the following products. <em>This is a one-time operation!</em>';
$_['help_purchase_additional_licenses'] = 'You need to purchase additional extension licenses to activate the extension on these stores';

// Entry
$_['entry_installed_version']           = 'Installed version';
$_['entry_extension_status']            = 'Extension status';
$_['entry_show_always']                 = 'Show always';
$_['entry_use_admin_language_value']    = 'Use admin language value if empty';
$_['entry_use_default_value_for_new']   = 'Use default value for new';
$_['entry_show_login_required_text']    = 'Show login required text';
$_['entry_login_required_text']         = 'Login required text';
$_['entry_remove_sql_changes']          = 'Remove SQL changes';
$_['entry_tab_status']                  = 'Tab status';
$_['entry_tab_name']                    = 'Tab name';
$_['entry_sort_order']                  = 'Sort order';
$_['entry_require_login']               = 'Require login';
$_['entry_tab_type']                    = 'Tab type';
$_['entry_tab_key']                     = 'Tab key';
$_['entry_condition']                   = 'Condition';
$_['entry_default_value']               = 'Default value';
$_['entry_action']                      = 'Action';
$_['entry_products']                    = 'Products';
$_['entry_extension_name']              = 'Name';
$_['entry_extension_compatibility']     = 'Compatibility';
$_['entry_extension_store_url']         = 'Store URL';
$_['entry_copyright_notice']            = 'Copyright notice';
$_['entry_active_on']                   = 'Active on';
$_['entry_inactive_on']                 = 'Inactive on';

// Error
$_['error_permission']                  = '<strong>Error!</strong> You do not have permission to modify extension ' . $_['extension_name'] . '!';
$_['error_warning']                     = '<strong>Warning!</strong> Please check the form carefully for errors!';
$_['error_vqmod']                       = '<strong>Warning!</strong> VQMod class cannot be found. Please verify that vQmod has been installed. You can download vQmod for free from the official website <a href="http://www.vqmod.com" class="alert-link">www.vqmod.com</a>!';
$_['error_vqmod_script']                = '<strong>Warning!</strong> The extension vQmod script is not working. Please check that it exists and is not disabled. The extension will not work without this script.';
$_['error_missing_table']               = '<strong>Error!</strong> Your SQL database seems to be missing table \'%s\'!';
$_['error_missing_column']              = '<strong>Error!</strong> Your SQL table \'%s\' seems to be missing column \'%s\'!';
$_['error_unsaved_settings']            = '<strong>Warning!</strong> There are unsaved settings! Please save the settings.';
$_['error_version']                     = '<strong>Info!</strong> ' . $_['extension_name'] . ' version <strong>%s</strong> installation files found. You need to upgrade ' . $_['extension_name'] . '!';
$_['error_upgrade_database']            = '<strong>Error!</strong> Failed to upgrade database structure!';
$_['error_ajax_request']                = 'An AJAX error occured!';
$_['error_tab_name']                    = 'Please enter a tab name!';
$_['error_tab_key']                     = 'Please enter a tab key!';
$_['error_required']                    = 'This is required!';
$_['error_add_tab']                     = '<strong>Warning!</strong> Error adding a new tab!';
$_['error_delete_tab']                  = '<strong>Warning!</strong> Error deleting the tab!';
$_['error_delete_default_tab']          = '<strong>Warning!</strong> You cannot delete a default tab!';
$_['error_upgrade_database']            = '<strong>Error!</strong> Failed to upgrade database structure!';
$_['error_db_inconsistency']            = '<strong>Warning!</strong> Database inconsistencies found!';
$_['error_fix_db_inconsistency']        = '<strong>Error!</strong> Failed to fix database inconsistencies!';
$_['error_php_version']                 = '<strong>Error!</strong> The extension is not compatible with your current PHP version - %s. Please upgrade your PHP at least to version <strong>%s</strong>.';
