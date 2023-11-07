<?php
$_['extension_name']                                = 'Admin Quick Edit PRO';

// Heading
$_['heading_title']                                 = '<i class="fa fa-pencil" style="font-size:14px;color:#F7951D;"></i> <strong>' . $_['extension_name'] . '</strong>' . (defined("AQE_STATUS") ? '<span style="display:inline-block;margin-left:20px;">' . (AQE_STATUS ? '<i style="color:#3c763d">[ Enabled ]</i>' : '<i style="color:#a94442">[ Disabled ]</i>') . '</span>' : '');

// Buttons
$_['button_apply']                                  = 'Apply';
$_['button_upgrade']                                = 'Upgrade';

// Tabs
$_['tab_settings']                                  = 'Settings';
$_['tab_support']                                   = 'Support';
$_['tab_about']                                     = 'About';
$_['tab_general']                                   = 'General';
$_['tab_faq']                                       = 'FAQ';
$_['tab_services']                                  = 'Services';
$_['tab_changelog']                                 = 'Changelog';
$_['tab_extension']                                 = 'Extension';
$_['tab_catalog']                                   = 'Catalog';
$_['tab_sales']                                     = 'Sales';
$_['tab_categories']                                = 'Categories';
$_['tab_filters']                                   = 'Filters';
$_['tab_recurrings']                                = 'Recurring Profiles';
$_['tab_products']                                  = 'Products';
$_['tab_attributes']                                = 'Attributes';
$_['tab_attribute_groups']                          = 'Attribute Groups';
$_['tab_options']                                   = 'Options';
$_['tab_manufacturers']                             = 'Manufacturers';
$_['tab_downloads']                                 = 'Downloads';
$_['tab_reviews']                                   = 'Reviews';
$_['tab_information']                               = 'Informations';
$_['tab_coupons']                                   = 'Coupons';
$_['tab_customers']                                 = 'Customers';
$_['tab_orders']                                    = 'Orders';
$_['tab_returns']                                   = 'Returns';
$_['tab_voucher_themes']                            = 'Voucher Themes';
$_['tab_vouchers']                                  = 'Gift Vouchers';
$_['tab_campaigns']                                 = 'Marketing Campaigns';
$_['tab_affiliates']                                = 'Affiliates';
$_['tab_customer']                                  = 'Customer';

// Text
$_['text_extension']                                = 'Extensions';
$_['text_success_upgrade']                          = '<strong>Success!</strong> You have upgraded ' . $_['extension_name'] . ' to version <strong>%s</strong>!';
$_['text_success_update']                           = '<strong>Success!</strong> You have updated ' . $_['extension_name'] . ' settings!';
$_['text_success_hooks_update']                     = '<strong>Success!</strong> ' . $_['extension_name'] . ' event hooks updated!';
$_['text_toggle_navigation']                        = 'Toggle navigation';
$_['text_license']                                  = 'License';
$_['text_extension_information']                    = 'Extension information';
$_['text_legal_notice']                             = 'Legal notice';
$_['text_terms']                                    = 'Terms &amp; Conditions';
$_['text_support_subject']                          = $_['extension_name'] . ' support needed';
$_['text_license_text']                             = 'Please be aware that this product has a <strong>per-installation license</strong>, meaning you can use it <em>only on a single OpenCart installation</em>. <strong>You will need to purchase a separate license for each installation you wish to use this extension on.</strong>';
$_['text_other_extensions']                         = 'If you like this extension you might also be interested in <a href="%s" class="alert-link" target="_blank">my other extensions</a>.';
$_['text_faq']                                      = 'Frequently Asked Questions';
$_['text_display']                                  = 'Display';
$_['text_editable']                                 = 'Editable';
$_['text_column_name']                              = 'Column Name';
$_['text_button']                                   = 'Button';
$_['text_single_click']                             = 'Single-click';
$_['text_double_click']                             = 'Double-click';
$_['text_select_all']                               = 'Select / Deselect all';
$_['text_saving']                                   = 'Saving ...';
$_['text_upgrading']                                = 'Upgrading ...';
$_['text_canceling']                                = 'Canceling ...';
$_['text_loading']                                  = 'Loading ...';

// Column texts
$_['txt_action']                                    = 'Action';
$_['txt_address_1']                                 = 'Address 1';
$_['txt_address_2']                                 = 'Address 2';
$_['txt_amount']                                    = 'Amount';
$_['txt_approved']                                  = 'Approved';
$_['txt_attribute_group']                           = 'Attribute Group';
$_['txt_author']                                    = 'Author';
$_['txt_balance']                                   = 'Balance';
$_['txt_bottom']                                    = 'Bottom';
$_['txt_categories']                                = 'Categories';
$_['txt_category']                                  = 'Category';
$_['txt_city']                                      = 'City';
$_['txt_clicks']                                    = 'Clicks';
$_['txt_code']                                      = 'Code';
$_['txt_column']                                    = 'Columns';
$_['txt_comment']                                   = 'Comment';
$_['txt_commission']                                = 'Commission';
$_['txt_company']                                   = 'Company';
$_['txt_country']                                   = 'Country';
$_['txt_customer']                                  = 'Customer';
$_['txt_customer_group']                            = 'Customer Group';
$_['txt_customer_id']                               = 'Customer ID';
$_['txt_cycle']                                     = 'Cycle';
$_['txt_date_added']                                = 'Date Added';
$_['txt_date_available']                            = 'Date Available';
$_['txt_date_end']                                  = 'Date End';
$_['txt_date_modified']                             = 'Date Modified';
$_['txt_date_ordered']                              = 'Date Ordered';
$_['txt_date_start']                                = 'Date Start';
$_['txt_description']                               = 'Description';
$_['txt_discount']                                  = 'Discount';
$_['txt_download']                                  = 'Downloads';
$_['txt_duration']                                  = 'Duration';
$_['txt_ean']                                       = 'EAN';
$_['txt_email']                                     = 'E-Mail';
$_['txt_fax']                                       = 'Fax';
$_['txt_filename']                                  = 'Filename';
$_['txt_filter']                                    = 'Filters';
$_['txt_frequency']                                 = 'Frequency';
$_['txt_from_email']                                = 'From E-mail';
$_['txt_from_name']                                 = 'From Name';
$_['txt_group_name']                                = 'Group Name';
$_['txt_height']                                    = 'Height';
$_['txt_image']                                     = 'Картинка';
$_['txt_id']                                        = 'ID';
$_['txt_ip']                                        = 'IP Address';
$_['txt_isbn']                                      = 'ISBN';
$_['txt_jan']                                       = 'JAN';
$_['txt_length']                                    = 'Length';
$_['txt_length_class']                              = 'Length Class';
$_['txt_location']                                  = 'Location';
$_['txt_logged']                                    = 'Customer Login';
$_['txt_manufacturer']                              = 'Manufacturer';
$_['txt_mask']                                      = 'Mask';
$_['txt_message']                                   = 'Message';
$_['txt_minimum']                                   = 'Minimum Quantity';
$_['txt_model']                                     = 'Модель';
$_['txt_mpn']                                       = 'MPN';
$_['txt_name']                                      = 'Название';
$_['txt_newsletter']                                = 'Newsletter';
$_['txt_opened']                                    = 'Opened';
$_['txt_option_value']                              = 'Option Values';
$_['txt_order_id']                                  = 'Order ID';
$_['txt_orders']                                    = 'Orders';
$_['txt_parent']                                    = 'Parent';
$_['txt_points']                                    = 'Points';
$_['txt_postcode']                                  = 'Postcode';
$_['txt_price']                                     = 'Цена';
$_['txt_product']                                   = 'Product';
$_['txt_product_id']                                = 'Product ID';
$_['txt_products']                                  = 'Products';
$_['txt_quantity']                                  = 'Количество';
$_['txt_rating']                                    = 'Rating';
$_['txt_region']                                    = 'Region / State';
$_['txt_requires_shipping']                         = 'Requires Shipping';
$_['txt_return_id']                                 = 'Return ID';
$_['txt_return_action']                             = 'Return Action';
$_['txt_return_reason']                             = 'Return Reason';
$_['txt_return_status']                             = 'Return Status';
$_['txt_safe']                                      = 'Safe';
$_['txt_selector']                                  = '<selector>';
$_['txt_seo']                                       = 'SEO Keyword';
$_['txt_shipping']                                  = 'Free Shipping';
$_['txt_sku']                                       = 'SKU';
$_['txt_sort_order']                                = 'Сортировка';
$_['txt_status']                                    = 'Статус';
$_['txt_stock_status']                              = 'Out Of Stock Status';
$_['txt_store']                                     = 'Stores';
$_['txt_subtract']                                  = 'Subtract Stock';
$_['txt_tag']                                       = 'Product Tags';
$_['txt_tax']                                       = 'Tax ID';
$_['txt_tax_class']                                 = 'Tax Class';
$_['txt_telephone']                                 = 'Telephone';
$_['txt_text']                                      = 'Text';
$_['txt_theme']                                     = 'Theme';
$_['txt_title']                                     = 'Title';
$_['txt_to_email']                                  = 'To E-mail';
$_['txt_to_name']                                   = 'To Name';
$_['txt_top']                                       = 'Top';
$_['txt_total']                                     = 'Total Amount';
$_['txt_tracking_code']                             = 'Tracking Code';
$_['txt_trial_cycle']                               = 'Trial cycle';
$_['txt_trial_duration']                            = 'Trial duration';
$_['txt_trial_frequency']                           = 'Trial frequency';
$_['txt_trial_price']                               = 'Trial price';
$_['txt_trial_status']                              = 'Trial status';
$_['txt_type']                                      = 'Type';
$_['txt_upc']                                       = 'UPC';
$_['txt_uses_customer']                             = 'Uses Per Customer';
$_['txt_uses_total']                                = 'Uses Per Coupon';
$_['txt_view_in_store']                             = 'View In Store';
$_['txt_viewed']                                    = 'Viewed';
$_['txt_weight']                                    = 'Weight';
$_['txt_weight_class']                              = 'Weight Class';
$_['txt_width']                                     = 'Width';

// Action column texts
$_['txt_attributes']                                = 'Attributes (A)';
$_['txt_discounts']                                 = 'Discounts (D)';
$_['txt_images']                                    = 'Images (I)';
$_['txt_filters']                                   = 'Filters (F)';
$_['txt_options']                                   = 'Options (O)';
$_['txt_recurrings']                                = 'Recurrings (C)';
$_['txt_related']                                   = 'Related Products (RP)';
$_['txt_downloads']                                 = 'Related Downloads (RD)';
$_['txt_specials']                                  = 'Specials (S)';
$_['txt_descriptions']                              = 'Descriptions (T)';
$_['txt_view']                                      = 'View (V)';
$_['txt_edit']                                      = 'Edit (E)';

// Help texts
$_['help_match_anywhere']                           = 'Match filter strings anywhere in the phrase (e.g. \'cinema\' will match \'Apple Cinema 30"\')';
$_['help_alternate_row_colour']                     = 'Alternate the table row colours in the list views of categories, products, etc.';
$_['help_row_hover_highlighting']                   = 'Highlight the table row when you mouse over it in the list views of categories, products, etc.';
$_['help_highlight_status']                         = 'Display disabled items in red in categories, products, reviews, informations, customers and coupons list views.';
$_['help_highlight_actions']                        = 'Display actions which have related data with a different colour.';
$_['help_interval_filter']                          = 'Enable interval filter for numeric and temporal values like quantity, sort order, amount, date available etc (e.g. \'0.5 < 1.3\', \'1 <= 103\', \'< 3000\' or \'3 <=\').';
$_['help_batch_edit']                               = 'Edit the current value for all selected items. This sets the default value for batch editing control on <em>Catalog</em>, <em>Sales</em> and <em>Marketing</em> pages.';
$_['help_filter_sub_category']                      = 'Used with category filtering.';
$_['help_columns']                                  = 'Select which columns to show, in which order they appear and whether they are editable in place.';
$_['help_actions']                                  = 'Select which actions to show for the Action column.';

// Entry
$_['entry_extension_status']                        = 'Extension status';
$_['entry_installed_version']                       = 'Installed version';
$_['entry_extension_name']                          = 'Name';
$_['entry_extension_compatibility']                 = 'Compatibility';
$_['entry_extension_store_url']                     = 'Store URL';
$_['entry_copyright_notice']                        = 'Copyright notice';
$_['entry_match_anywhere']                          = 'Match anywhere';
$_['entry_alternate_row_colour']                    = 'Alternate row colour';
$_['entry_row_hover_highlighting']                  = 'Hover row highlighting';
$_['entry_highlight_status']                        = 'Highlight status';
$_['entry_highlight_actions']                       = 'Highlight actions';
$_['entry_interval_filter']                         = 'Interval filtering';
$_['entry_quick_edit_on']                           = 'Quick edit on';
$_['entry_batch_edit']                              = 'Batch editing';
$_['entry_list_view_image_size']                    = 'List view image size (W x H)';
$_['entry_fields']                                  = 'Column settings';
$_['entry_actions']                                 = 'Action settings';
$_['entry_single_language_editing']                 = 'Use single language editing';
$_['entry_catalog_categories_status']               = 'Catalog -> Categories status';
$_['entry_catalog_products_status']                 = 'Catalog -> Products status';
$_['entry_catalog_products_filter_sub_category']    = 'Search in subcategories';
$_['entry_catalog_recurrings_status']               = 'Catalog -> Recurring Profiles status';
$_['entry_catalog_filters_status']                  = 'Catalog -> Filters status';
$_['entry_catalog_attributes_status']               = 'Catalog -> Attributes status';
$_['entry_catalog_attribute_groups_status']         = 'Catalog -> Attribute Groups status';
$_['entry_catalog_options_status']                  = 'Catalog -> Options status';
$_['entry_catalog_manufacturers_status']            = 'Catalog -> Manufacturers status';
$_['entry_catalog_downloads_status']                = 'Catalog -> Downloads status';
$_['entry_catalog_reviews_status']                  = 'Catalog -> Reviews status';
$_['entry_catalog_information_status']              = 'Catalog -> Information status';
$_['entry_customer_customers_status']               = 'Customer -> Customers status';
$_['entry_sales_orders_status']                     = 'Sales -> Orders status';
$_['entry_sales_returns_status']                    = 'Sales -> Returns status';
$_['entry_sales_voucher_themes_status']             = 'Sales -> Voucher Themes status';
$_['entry_sales_vouchers_status']                   = 'Sales -> Gift Vouchers status';
$_['entry_marketing_campaigns_status']              = 'Marketing -> Marketing status';
$_['entry_marketing_affiliates_status']             = 'Marketing -> Affiliates status';
$_['entry_marketing_coupons_status']                = 'Marketing -> Coupons status';
$_['entry_notify_customer']                         = 'Notify customer';

// Error
$_['error_permission']                              = '<strong>Error!</strong> You do not have permission to modify extension ' . $_['extension_name'] . '!';
$_['error_warning']                                 = '<strong>Warning!</strong> Please check the form carefully for errors!';
$_['error_unsaved_settings']                        = '<strong>Warning!</strong> There are unsaved settings! Please save the settings.';
$_['error_version']                                 = '<strong>Info!</strong> ' . $_['extension_name'] . ' version <strong>%s</strong> installation files found. You need to upgrade ' . $_['extension_name'] . '!';
$_['error_ajax_request']                            = 'An AJAX error occured!';
$_['error_image_width']                             = 'Image width must be positive integer greater than 0!';
$_['error_image_height']                            = 'Image height must be positive integer greater than 0!';
$_['error_modification']                            = '<strong>Warning!</strong> The extension OCMOD script is not working. Please check that it exists, is not disabled and the modification cache has been updated. The extension will not work without this script.';
$_['error_php_version']                             = '<strong>Error!</strong> The extension is not compatible with your current PHP version - %s. Please upgrade your PHP at least to version <strong>%s</strong>.';
