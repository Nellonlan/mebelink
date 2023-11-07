<?php
// Heading
$_['heading_title']    = 'A-Migration is the automatic data migration from opencart 1.5.1 (and above) to opencart 2.* (all version 2.*)';

$_['text_module']      = 'Modules';
$_['text_success']     = 'Success: You have modified account module!';
$_['text_edit']        = 'Edit A-Migration Module';
$_['text_no_migration_setting']        = 'Before data migration adjust the Settings';
$_['text_no_migration_setting_2']        = 'Synchronize the directory data and press Save. Then data migration will be available';

$_['text_db_prefix']        = 'Specify the prefix of the data base tables the data shall be transferred from. It shall not be the same as the prefix of the table on this website: <b style="font-size:18px;">%s</b>';
$_['text_no_db_prefix']        = 'Before you proceed with the settings, enter the prefix of the tables the data shall be transferred from';
$_['text_no_db_tables']        = 'Tables with this prefix: %s are not found in the current data base (%s). Import the tables with %s prefix with the original website data to the current data base %s';
$_['text_error_db_prefix']        = 'The entered prefix is the same as the prefix of the tables of the current website. The data may not be transferred to themselves';
$_['text_no_from_data']        = 'No table in the original website data base. Or the similar data have not been established on the previous website. After the migration, the new data will not have any connection to these data';
$_['text_no_to_data']        = 'Similar data are absent from the current website. Enter them on this website. If they may not be created nor synchronized. After the migration the new data will not have any connection to these data';
$_['text_error_selected_element']        = 'This value has already been selected. Select another value. If there is no other value, set it or select “Do not transfer”';
$_['text_select_data']        = 'Do not transfer';
$_['text_languages']        = 'Languages (from %slanguage table to %slanguage table)';
$_['text_stock_statuses']        = 'Stock status (from %sstock_status table to %sstock_status table)';
$_['text_tax_classes']        = 'Taxes (from %stax_class table to %stax_class table)';
$_['text_weight_classes']        = 'Weight units (from %sweight_class table to %sweight_class table)';
$_['text_length_classes']        = 'Length units (from %slenght_class table to %slenght_class table)';
$_['text_customer_groups']        = 'Customer groups (from %scustomer_groups table to %scustomer_groups table)';
$_['text_order_statuses']        = 'Order status (from %sorder_status table to %sorder_status table)';
$_['text_empty_synchronization']        = 'Migration is impossible. The main data synchronization parameters are not set or the license key/e-mail address is incorrect';


//Column
$_['column_from_db_value']        = 'The value in the data base the data will be transferred from';
$_['column_to_db_value']        = 'The value in the data base of the current website';
$_['column_from_to_table']        = 'Directory synchronization';

// Button
$_['button_cancel'] = 'Cancel';
$_['button_migrate'] = 'Migrate data';

// Entry
$_['entry_status']     = 'Status';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify account module!';
$_['error_no_from_table'] = 'These data may not be transferred. The original website table with the following data is absent: %s';

//Tab
$_['tab_migration'] = 'Data migration (STEP 2)';
$_['tab_setting'] = 'Settings before migration (STEP 1)';

$_['tab_document'] = 'DB preparation (STEP 1)';
$_['tab_categories'] = 'Categories (step 2.3)';
$_['tab_products'] = 'Products (step 2.5)';
$_['tab_attributes'] = 'Attributes (step 2.1)';
$_['tab_options'] = 'Options (step 2.2)';
$_['tab_customers'] = 'Customers (step 2.6)';
$_['tab_orders'] = 'Orders (step 2.7)';
$_['tab_articles'] = 'Articles (step 2.8)';
$_['tab_seo_urls'] = 'Seo Url (step 2.9)';
$_['tab_manufacturer'] = 'Manufacturers (step 2.4)';
$_['tab_welcome_extecom'] = 'Information and support';


$_['text_press_migrate'] = 'To start migration, press Transfer the data';
$_['text_only_new_products'] = 'There are established products in the product table on this website. Only the products with available id will be added during migration. To transfer all the data, delete the products on this website if they are not required';
$_['text_only_new_categories'] = 'There are established categories in the category table on this website. Only the categories with available id will be added during migration. 
To transfer all the data, delete the categories on this website if they are not required';
$_['text_only_new_attributes'] = 'There are established attributes in the attribute table on this website. Only the attributes with available id will be added during migration. 
To transfer all the data, delete the attributes on this website if they are not required
';
$_['text_only_new_options'] = 'There are established options in the option table on this website. Only the options with available id will be added during migration. 
To transfer all the data, delete the options on this website if they are not required
';
$_['text_only_new_customers'] = 'There are established customers in the customer table on this website. Only the customers with available id will be added during migration. 
To transfer all the data, delete the customers on this website if they are not required
';
$_['text_only_new_orders'] = 'There are established orders in the order table on this website. Only the orders with available id will be added during migration. 
To transfer all the data, delete the orders on this website if they are not required
';
$_['text_only_new_articles'] = 'There are established articles in the article table on this website. Only the articles with available id will be added during migration. 
To transfer all the data, delete the articles on this website if they are not required
';
$_['text_only_seo_urls'] = 'There are established seo-url in the seo-url table on this website. Only the seo-url with available id will be added during migration. 
To transfer all the data, delete the seo-url on this website if they are not required
';

$_['text_migrate'] = 'Do not reload this page! Data migration is on: ';
$_['text_wite'] = 'Wait...';


$_['text_only_new_manufacturers'] = 'There are established manufacturers in the manufacturer table on this website. Only the manufacturers with available id will be added during migration. 
To transfer all the data, delete the manufacturers on this website if they are not required.
';
$_['text_copy_files'] = 'КCopy the images with the data? ATTENTION! Only the new images will be copied (files will not be overwritten)';
$_['text_copy_files_no_curl'] =  'It is impossible to copy the image. The php-extension CURL is disabled on your hosting. Enable it to make it possible to copy the images with the data';
$_['text_copy_files_no_site_from'] =  'It is impossible to copy the images. The original website domain the image shall be copied from is not specified';
$_['text_copy_files_site_from'] =  'The domain name of the original website (used to copy the images), for instance: <b>http://site.com</b>';
$_['text_copy_files_site_from_path'] =  'The path with regard to the image folder, for new images, for instance: <b>catalog/new_iamges</b>';
$_['text_copy_files_status'] =  'Copy the images?';
$_['text_user_email'] = 'Customer license email (sent by mail upon request for license key to welcome@ocext.com)';
$_['text_user_key'] = 'License key (sent upon request to welcome@ocext.com)';
