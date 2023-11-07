<?php
class ModelToolAMigration extends Model {
	
    protected $registry;
    protected $synchronization = array();
    protected $l_data;

    public function __construct($registry) {
        $this->registry = $registry;                                                                                                                                                                                                                                                                                                                                                                                                                                               eval(base64_decode('JHRoaXMtPmNoZWNrbGljZW5zZSgpOw=='));//OCext.com: do not delete this line | не удаляйте эту строку
        //$this->migrate('order',0,30,TRUE);
    }
    
    public function getSynchronization() {
        return $this->synchronization;
    }

    public function showTable($table,$prefix) {
        $query = $query = $this->db->query('SHOW TABLES from `'.DB_DATABASE.'` like "'.$prefix.$table.'" ');
        if($query->num_rows){
            return TRUE;
        }else{
            return FALSE;
        }
    }
    
    public function migrate($table,$start,$limit,$copy_image=FALSE) {
        $this->load->language('module/amigration');
        if(!$this->synchronization){
            $result['error'] = $this->language->get('text_empty_synchronization');
            return $result;
        }
        $DB_PREFIX_FROM = $this->config->get('amigration_db_prefix');
        $DB_PREFIX_TO = DB_PREFIX;
        $result['total'] = 0;
        $result['error'] = '';
        
        $show_table = $this->showTable($table, $DB_PREFIX_FROM);
        
        if(!$show_table){
            $result['error'] = sprintf($this->language->get('error_no_from_table'),$DB_PREFIX_FROM.$table);
            return $result;
        }
        
        
        if($table=='category'){
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    
                    if($copy_image){
                        $row['image'] =  $this->copyImageContent($row['image'], $this->config->get('amigration_site_from'), $this->config->get('amigration_site_from_path'));
                    }
                    
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['category_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'category_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        //descr
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_description WHERE category_id=' . $id );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_description' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'category_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$description['language_id']);
                                $check_au = $this->checkId($table. '_description', $where_au);
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if($set){
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_description SET ".  implode(', ', $set));
                                    }
                                    
                                }
                            }
                        }
                        //path
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_path');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_path WHERE category_id=' . $id );
                            $columns_category_path = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_path' );
                        }
                        if($show_table && $query->rows){
                            foreach ($query->rows as $category_path) {
                                $where_au = array();
                                $where_au[] = array('id'=>'category_id','value'=>$id);
                                $where_au[] = array('id'=>'path_id','value'=>$category_path['path_id']);
                                $check_au = $this->checkId($table. '_path', $where_au);
                                
                                $set = array();
                                foreach ($columns_category_path->rows as $column_category_path) {
                                    if(  isset(  $category_path[$column_category_path['Field']] ) ){
                                        $set[] = " `".$column_category_path['Field']."` = '".$this->db->escape($category_path[$column_category_path['Field']])."' ";
                                    }
                                }
                                
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_path SET ".  implode(', ', $set));
                                }
                            }
                        }else{
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_path SET category_id = ".$id );
                            $this->load->model('catalog/category');
                            $this->model_catalog_category->repairCategories();
                        }
                        //layout
                        $where_au = array();
                        $where_au[] = array('id'=>'category_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_layout', $where_au);
                        
                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_layout SET `store_id` = 0, `layout_id`=0, `category_id` = ".$id);
                        }
                        
                        //store
                        $where_au = array();
                        $where_au[] = array('id'=>'category_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_store', $where_au);
                        
                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_store SET `store_id` = 0, `category_id` = ".$id);
                        }
                    }
                }
            }
        }
        elseif($table=='product'){
            
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    
                    if($copy_image){
                        $row['image'] =  $this->copyImageContent($row['image'], $this->config->get('amigration_site_from'), $this->config->get('amigration_site_from_path'));
                    }
                    
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            //Данные из справочников
                            if( $column['Field'] == 'stock_status_id' && isset($this->synchronization['stock_status_id'][$row['stock_status_id']]) && $this->synchronization['stock_status_id'][$row['stock_status_id']] ){
                                $row[$column['Field']] = $this->synchronization['stock_status_id'][$row['stock_status_id']];
                            }
                            if( $column['Field'] == 'tax_class_id' && isset($this->synchronization['tax_class_id'][$row['tax_class_id']]) && $this->synchronization['tax_class_id'][$row['tax_class_id']] ){
                                $row[$column['Field']] = $this->synchronization['tax_class_id'][$row['tax_class_id']];
                            }
                            if( $column['Field'] == 'weight_class_id' && isset($this->synchronization['weight_class_id'][$row['weight_class_id']]) && $this->synchronization['weight_class_id'][$row['weight_class_id']] ){
                                $row[$column['Field']] = $this->synchronization['weight_class_id'][$row['weight_class_id']];
                            }
                            if( $column['Field'] == 'length_class_id' && isset($this->synchronization['length_class_id'][$row['length_class_id']]) && $this->synchronization['length_class_id'][$row['length_class_id']] ){
                                $row[$column['Field']] = $this->synchronization['length_class_id'][$row['length_class_id']];
                            }
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['product_id'];
                    
                    $where_au = array();
                    $where_au[] = array('id'=>'product_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        //descr
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_description WHERE product_id=' . $id );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_description' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                
                                $where_au = array();
                                $where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$description['language_id']);
                                $check_au = $this->checkId($table . '_description', $where_au);
                                
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if(!$check_au){
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_description SET ".  implode(', ', $set));
                                    }
                                }
                            }
                        }
                        //attr
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_attribute WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_attribute' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$query_row['language_id']);
                                $where_au[] = array('id'=>'attribute_id','value'=>$query_row['attribute_id']);
                                $check_au = $this->checkId($table . '_attribute', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_attribute SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //opt
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_option WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_option' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'product_option_id','value'=>$query_row['product_option_id']);
                                $check_au = $this->checkId($table . '_option', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_option SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //option_value
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_option_value WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_option_value' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'product_option_value_id','value'=>$query_row['product_option_value_id']);
                                $check_au = $this->checkId($table . '_option_value', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_option_value SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_to_category
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_to_category WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_to_category' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'category_id','value'=>$query_row['category_id']);
                                $check_au = $this->checkId($table . '_to_category', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_category SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_to_download
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_to_download WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_to_download' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'download_id','value'=>$query_row['download_id']);
                                $check_au = $this->checkId($table . '_to_download', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_download SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //image
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_image WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_image' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                
                                if($copy_image){
                                    $query_row['image'] = $this->copyImageContent($query_row['image'], $this->config->get('amigration_site_from'), $this->config->get('amigration_site_from_path'));
                                }
                                
                                $set = array();
                                $where_au = array();
                                //$where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'product_image_id','value'=>$query_row['product_image_id']);
                                $check_au = $this->checkId($table . '_image', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_image SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //discount
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_discount WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_discount' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                //$where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'product_discount_id','value'=>$query_row['product_discount_id']);
                                $check_au = $this->checkId($table . '_discount', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        
                                        //customer_group_id
                                        if( $query_row[$column_row['Field']] == 'customer_group_id' && isset($this->synchronization['customer_group_id'][$query_row['customer_group_id']]) && $this->synchronization['customer_group_id'][$query_row['customer_group_id']] ){
                                            $query_row[$column_row['Field']] = $this->synchronization['customer_group_id'][$query_row['customer_group_id']];
                                        }
                                        
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_discount SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //special
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_special WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_special' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                //$where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'product_special_id','value'=>$query_row['product_special_id']);
                                $check_au = $this->checkId($table . '_special', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        
                                        //customer_group_id
                                        if( $query_row[$column_row['Field']] == 'customer_group_id' && isset($this->synchronization['customer_group_id'][$query_row['customer_group_id']]) && $this->synchronization['customer_group_id'][$query_row['customer_group_id']] ){
                                            $query_row[$column_row['Field']] = $this->synchronization['customer_group_id'][$query_row['customer_group_id']];
                                        }
                                        
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_special SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_reward
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_reward WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_reward' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                //$where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'product_reward_id','value'=>$query_row['product_reward_id']);
                                $check_au = $this->checkId($table . '_reward', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        
                                        //customer_group_id
                                        if( $query_row[$column_row['Field']] == 'customer_group_id' && isset($this->synchronization['customer_group_id'][$query_row['customer_group_id']]) && $this->synchronization['customer_group_id'][$query_row['customer_group_id']] ){
                                            $query_row[$column_row['Field']] = $this->synchronization['customer_group_id'][$query_row['customer_group_id']];
                                        }
                                        
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_reward SET ".  implode(', ', $set));
                                }
                            }
                        }
                        
                        //_related
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_related WHERE product_id=' . $id );
                        $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_related' );
                        if($query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'related_id','value'=>$query_row['related_id']);
                                $check_au = $this->checkId($table . '_related', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_related SET ".  implode(', ', $set));
                                }
                            }
                        }
                        
                        
                        //_recurring
                        
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_recurring');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_recurring WHERE product_id=' . $id );
                            $columns_rows = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_recurring' );
                        }
                        
                        if($show_table && $query->rows){
                            foreach ($query->rows as $query_row) {
                                $set = array();
                                $where_au = array();
                                $customer_group_id = 0;
                                if( isset($this->synchronization['customer_group_id'][$query_row['customer_group_id']]) && $this->synchronization['customer_group_id'][$query_row['customer_group_id']] ){
                                        $customer_group_id = $this->synchronization['customer_group_id'][$query_row['customer_group_id']];
                                }
                                $where_au[] = array('id'=>'product_id','value'=>$id);
                                $where_au[] = array('id'=>'recurring_id','value'=>$query_row['recurring_id']);
                                $where_au[] = array('id'=>'customer_group_id','value'=>$customer_group_id);
                                $check_au = $this->checkId($table . '_recurring', $where_au);
                                foreach ($columns_rows->rows as $column_row) {
                                    if(  isset(  $query_row[$column_row['Field']] ) ){
                                        $set[] = " `".$column_row['Field']."` = '".$this->db->escape($query_row[$column_row['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_recurring SET ".  implode(', ', $set));
                                }
                            }
                        }
                        
                        //layout
                        $where_au = array();
                        $where_au[] = array('id'=>'product_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_layout', $where_au);
                        
                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_layout SET `store_id` = 0, `layout_id`=0, `product_id` = ".$id);
                        }
                        
                        //store
                        $where_au = array();
                        $where_au[] = array('id'=>'product_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_store', $where_au);
                        
                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_store SET `store_id` = 0, `product_id` = ".$id);
                        }
                    }
                }
            }
            
        }
        elseif($table=='attribute'){
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['attribute_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'attribute_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        //descr
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_description WHERE attribute_id=' . $id );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_description' );
                        if($query->rows){
                            
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'attribute_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$description['language_id']);
                                $check_au = $this->checkId($table. '_description', $where_au);
                                
                                
                                
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    
                                    $set = array();
                                    foreach ($columns_description->rows as $column_description) {
                                        if(  isset(  $description[$column_description['Field']] ) ){
                                            if($column_description['Field']=='language_id'){
                                                $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                            }elseif(isset ($description[$column_description['Field']])){
                                                $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                            }
                                            
                                        }
                                    }
                                    
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_description SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //attribute_group_id
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group_description WHERE attribute_group_id=' . $row['attribute_group_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_group_description' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    $where_au = array();
                                    $where_au[] = array('id'=>'attribute_group_id','value'=>$description['attribute_group_id']);
                                    $where_au[] = array('id'=>'language_id','value'=>$language_id);
                                    $check_au = $this->checkId($table. '_group_description', $where_au);
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if(!$check_au){
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group_description SET ".  implode(', ', $set));
                                    }
                                }
                            }
                        }
                        //attribute_group_id
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group WHERE attribute_group_id=' . $row['attribute_group_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_group' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'attribute_group_id','value'=>$description['attribute_group_id']);
                                $check_au = $this->checkId($table. '_group', $where_au);
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group SET ".  implode(', ', $set));
                                }
                            }
                        }
                    }
                }
            }
        }
        elseif($table=='option'){
            $query = $this->db->query("SELECT * FROM `" . $DB_PREFIX_FROM . $table ."` " );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM `" . $DB_PREFIX_FROM . $table . "` LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM `' . $DB_PREFIX_TO . $table .'` ');
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['option_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'option_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO `" . $DB_PREFIX_TO . $table. "` SET ".  implode(', ', $set));
                        //descr
                        $query = $this->db->query("SELECT * FROM `" . $DB_PREFIX_FROM . $table . '_description` WHERE option_id=' . $id );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM `' . $DB_PREFIX_TO . $table . '_description`' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'option_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$description['language_id']);
                                $check_au = $this->checkId($table. '_description', $where_au);
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    $query = $this->db->query("REPLACE INTO `" . $DB_PREFIX_TO . $table. "_description` SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_value_description
                        $query = $this->db->query("SELECT * FROM `" . $DB_PREFIX_FROM . $table . '_value_description` WHERE option_id=' . $row['option_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM `' . $DB_PREFIX_TO . $table . '_value_description`' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    $where_au = array();
                                    $where_au[] = array('id'=>'option_value_id','value'=>$description['option_value_id']);
                                    $where_au[] = array('id'=>'language_id','value'=>$language_id);
                                    $check_au = $this->checkId($table. '_value_description', $where_au);
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if(!$check_au){
                                        $query = $this->db->query("REPLACE INTO `" . $DB_PREFIX_TO . $table. "_value_description` SET ".  implode(', ', $set));
                                    }
                                }
                            }
                        }
                        //option_value
                        $query = $this->db->query("SELECT * FROM `" . $DB_PREFIX_FROM . $table . '_value` WHERE option_id=' . $row['option_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM `' . $DB_PREFIX_TO . $table . '_value`' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                
                                if($copy_image){
                                    $description['image'] = $this->copyImageContent($description['image'], $this->config->get('amigration_site_from'), $this->config->get('amigration_site_from_path'));
                                }
                                
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'option_value_id','value'=>$description['option_value_id']);
                                $check_au = $this->checkId($table. '_value', $where_au);
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO `" . $DB_PREFIX_TO . $table. "_value` SET ".  implode(', ', $set));
                                }
                            }
                        }
                    }
                }
            }
        }
        elseif($table=='attribute'){
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['attribute_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'attribute_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        //descr
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_description WHERE attribute_id=' . $id );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_description' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'attribute_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$description['language_id']);
                                $check_au = $this->checkId($table. '_description', $where_au);
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if(!$check_au){
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_description SET ".  implode(', ', $set));
                                    }
                                }
                            }
                        }
                        //attribute_group_id
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group_description WHERE attribute_group_id=' . $row['attribute_group_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_group_description' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    $where_au = array();
                                    $where_au[] = array('id'=>'attribute_group_id','value'=>$description['attribute_group_id']);
                                    $where_au[] = array('id'=>'language_id','value'=>$language_id);
                                    $check_au = $this->checkId($table. '_group_description', $where_au);
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if(!$check_au){
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_description SET ".  implode(', ', $set));
                                    }
                                }
                            }
                        }
                        //attribute_group_id
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group WHERE attribute_group_id=' . $row['attribute_group_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_group' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $set = array();
                                $where_au = array();
                                $where_au[] = array('id'=>'attribute_group_id','value'=>$description['attribute_group_id']);
                                $check_au = $this->checkId($table. '_group', $where_au);
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group SET ".  implode(', ', $set));
                                }
                            }
                        }
                    }
                }
            }
        }
        elseif($table=='customer'){
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['customer_id'];
                    $address_id= $row['address_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'customer_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        
                        //_address
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . 'address WHERE address_id=' . $address_id );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . 'address' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'address_id','value'=>$address_id);
                                $check_au = $this->checkId('address', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . "address SET ".  implode(', ', $set));
                                }
                            }
                        }
                        
                        //_group
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group WHERE customer_group_id=' . $row['customer_group_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_group' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'customer_group_id','value'=>$row['customer_group_id']);
                                $check_au = $this->checkId($table. '_group', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //group_description
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_group_description');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group_description WHERE customer_group_id=' . $row['customer_group_id'] );
                            $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_group_description' );
                        }
                        if($show_table && $query->rows){
                            foreach ($query->rows as $description) {
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    $where_au = array();
                                    $where_au[] = array('id'=>'customer_group_id','value'=>$description['customer_group_id']);
                                    $where_au[] = array('id'=>'language_id','value'=>$language_id);
                                    $check_au = $this->checkId($table. '_group_description', $where_au);
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    if(!$check_au){
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group_description SET ".  implode(', ', $set));
                                    }
                                }
                            }
                        }else{
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_group WHERE customer_group_id=' . $row['customer_group_id'] );
                            if($query->row){
                                $description = $query->row;
                                
                                if( isset($description['name']) && $description['name'] && isset($this->synchronization['language_id']) && $this->synchronization['language_id'] ){
                                    foreach ($this->synchronization['language_id'] as $language_id=>$language_id_row) {
                                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group_description SET ".' customer_group_id=' . $row['customer_group_id']  . ", name = '".$description['name']."',  language_id = ".$language_id  );
                                    }
                                }elseif( isset($description['name']) && $description['name']){
                                    $language_id = $this->config->get('config_language_id');
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_group_description SET ".' customer_group_id=' . $row['customer_group_id']  . ", name = '".$description['name']."',  language_id = ".$language_id  );
                                }
                                
                            }
                        }
                        //_history
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_history');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_history WHERE customer_id=' . $row['customer_id'] );
                            $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_history' );
                        }
                        
                        if($show_table && $query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'customer_history_id','value'=>$description['customer_history_id']);
                                $check_au = $this->checkId($table. '_history', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_history SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_transaction
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_transaction WHERE customer_id=' . $row['customer_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_transaction' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'customer_transaction_id','value'=>$description['customer_transaction_id']);
                                $check_au = $this->checkId($table. '_transaction', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_transaction SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_reward
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_reward WHERE customer_id=' . $row['customer_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_reward' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'customer_reward_id','value'=>$description['customer_reward_id']);
                                $check_au = $this->checkId($table. '_reward', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_reward SET ".  implode(', ', $set));
                                }
                            }
                        }
                    }
                }
            }
        }
        elseif($table=='order'){
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            
                            if( $column['Field'] == 'customer_group_id' && isset($this->synchronization['customer_group_id'][$row['customer_group_id']]) && $this->synchronization['customer_group_id'][$row['customer_group_id']] ){
                                $row[$column['Field']] = $this->synchronization['customer_group_id'][$row['customer_group_id']];
                            }
                            
                            if( $column['Field'] == 'order_status_id' && isset($this->synchronization['order_status_id'][$row['order_status_id']]) && $this->synchronization['order_status_id'][$row['order_status_id']] ){
                                $row[$column['Field']] = $this->synchronization['order_status_id'][$row['order_status_id']];
                            }
                            
                            if( $column['Field'] == 'language_id' && isset($this->synchronization['language_id'][$row['language_id']]) && $this->synchronization['language_id'][$row['language_id']] ){
                                $row[$column['Field']] = $this->synchronization['language_id'][$row['language_id']];
                            }
                            
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    
                    $id = $row['order_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'order_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        /*
                        //_group
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_custom_field WHERE order_id=' . $row['order_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_custom_field' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_custom_field_id','value'=>$row['order_custom_field_id']);
                                $check_au = $this->checkId($table. '_custom_field', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_custom_field SET ".  implode(', ', $set));
                                }
                            }
                        }
                        */
                        //_history
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_history WHERE order_id=' . $row['order_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_history' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_history_id','value'=>$description['order_history_id']);
                                $check_au = $this->checkId($table. '_history', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_history SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_option
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_option WHERE order_id=' . $row['order_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_option' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_option_id','value'=>$description['order_option_id']);
                                $check_au = $this->checkId($table. '_option', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_option SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_product
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_product WHERE order_id=' . $row['order_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_product' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_product_id','value'=>$description['order_product_id']);
                                $check_au = $this->checkId($table. '_product', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_product SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_recurring
                        
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_recurring');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_recurring WHERE order_id=' . $row['order_id'] );
                            $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_recurring' );
                        }
                        if($show_table && $query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_recurring_id','value'=>$description['order_recurring_id']);
                                $check_au = $this->checkId($table. '_recurring', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_recurring SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_recurring_transaction
                        
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_recurring_transaction');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_recurring_transaction ');
                            $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_recurring_transaction' );
                        }
                        if($show_table && $query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_recurring_transaction_id','value'=>$description['order_recurring_transaction_id']);
                                $check_au = $this->checkId($table. '_recurring_transaction', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_recurring_transaction SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_total
                        $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_total WHERE order_id=' . $row['order_id'] );
                        $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_total' );
                        if($query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_total_id','value'=>$description['order_total_id']);
                                $check_au = $this->checkId($table. '_total', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_total SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //_voucher
                        
                        $show_table = $this->showTable($table, $DB_PREFIX_FROM. $table . '_voucher');
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_voucher WHERE order_id=' . $row['order_id'] );
                            $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_voucher' );
                        }
                        if($show_table && $query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'order_voucher_id','value'=>$description['order_voucher_id']);
                                $check_au = $this->checkId($table. '_voucher', $where_au);
                                $set = array();
                                foreach ($columns_description->rows as $column_description) {
                                    if(  isset(  $description[$column_description['Field']] ) ){
                                        $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                    }
                                }
                                if(!$check_au){
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_voucher SET ".  implode(', ', $set));
                                }
                            }
                        }
                    }
                }
            }
        }
        elseif($table=='manufacturer'){
            
            $show_table = $this->showTable($table, $DB_PREFIX_FROM);
            if(!$show_table){
                $this->load->language('module/amigration');
                $result['error'] = sprintf($this->language->get('error_no_from_table'),$DB_PREFIX_FROM.$table);
                return $result;
            }
            
            
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    
                    if($copy_image){
                        $row['image'] =  $this->copyImageContent($row['image'], $this->config->get('amigration_site_from'), $this->config->get('amigration_site_from_path'));
                    }
                    
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['manufacturer_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'manufacturer_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        //to_store
                        $where_au = array();
                        $where_au[] = array('id'=>'manufacturer_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_store', $where_au);

                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_store SET `store_id` = 0, `manufacturer_id` = ".$id);
                        }
                    }
                }
            }
        }
        elseif($table=='information'){
            
            $show_table = $this->showTable($table, $DB_PREFIX_FROM);
            if(!$show_table){
                $this->load->language('module/amigration');
                $result['error'] = sprintf($this->language->get('error_no_from_table'),$DB_PREFIX_FROM.$table);
                return $result;
            }
            
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['information_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'information_id','value'=>$id);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                        
                        
                        //descr
                        $query = FALSE;
                        $show_table = $this->showTable($table.'_description', $DB_PREFIX_FROM);
                        if($show_table){
                            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . '_description WHERE information_id=' . $id );
                            $columns_description = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table . '_description' );
                        }
                        if($query && $query->rows){
                            foreach ($query->rows as $description) {
                                $where_au = array();
                                $where_au[] = array('id'=>'information_id','value'=>$id);
                                $where_au[] = array('id'=>'language_id','value'=>$description['language_id']);
                                $check_au = $this->checkId($table. '_description', $where_au);
                                if( isset($this->synchronization['language_id'][$description['language_id']]) && $this->synchronization['language_id'][$description['language_id']] ){
                                    $language_id = $this->synchronization['language_id'][$description['language_id']];
                                    $set = array();
                                    foreach ($columns_description->rows as $column_description) {
                                        if($column_description['Field']=='language_id'){
                                            $set[] = " `".$column_description['Field']."` = '".$language_id."' ";
                                        }elseif(isset ($description[$column_description['Field']])){
                                            $set[] = " `".$column_description['Field']."` = '".$this->db->escape($description[$column_description['Field']])."' ";
                                        }
                                    }
                                    $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_description SET ".  implode(', ', $set));
                                }
                            }
                        }
                        //layout
                        $where_au = array();
                        $where_au[] = array('id'=>'information_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_layout', $where_au);
                        
                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_layout SET `store_id` = 0, `layout_id`=0, `information_id` = ".$id);
                        }
                        
                        //store
                        $where_au = array();
                        $where_au[] = array('id'=>'information_id','value'=>$id);
                        $where_au[] = array('id'=>'store_id','value'=>0);
                        $check_au = $this->checkId($table. '_to_store', $where_au);
                        
                        if(!$check_au){
                            $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. "_to_store SET `store_id` = 0, `information_id` = ".$id);
                        }
                    }
                }
            }
        }
        elseif($table=='url_alias'){
            
            $show_table = $this->showTable($table, $DB_PREFIX_FROM);
            if(!$show_table){
                $this->load->language('module/amigration');
                $result['error'] = sprintf($this->language->get('error_no_from_table'),$DB_PREFIX_FROM.$table);
                return $result;
            }
            
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table );
            $result['total'] = count($query->rows);
            $query = $this->db->query("SELECT * FROM " . $DB_PREFIX_FROM . $table . " LIMIT ".$start.", ".$limit);
            if($query->rows){
                $rows = $query->rows;
                $columns = $this->db->query('SHOW COLUMNS FROM ' . $DB_PREFIX_TO . $table);
                foreach ($rows as $row) {
                    $set = array();
                    foreach ($columns->rows as $column) {
                        if(  isset(  $row[$column['Field']]  )  ){
                            $set[] = " `".$column['Field']."` = '".$this->db->escape($row[$column['Field']])."' ";
                        }
                    }
                    $id = $row['url_alias_id'];
                    $where_au = array();
                    $where_au[] = array('id'=>'url_alias_id','value'=>$id);
                    $where_au[] = array('id'=>'query','value'=>$row['query']);
                    $check_au = $this->checkId($table, $where_au);
                    if($set && !$check_au){
                        $query = $this->db->query("REPLACE INTO " . $DB_PREFIX_TO . $table. " SET ".  implode(', ', $set));
                    }
                }
            }
        }
        $result['message'] = 'Success!';
        return $result;
    }
    
    public function checkId($table,$au_id){
        $where = array();
        foreach($au_id as $au_id_row){
            $where[] = " `" . $au_id_row['id'] . "` = '" . $au_id_row['value'] . "' ";
        }
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . $table . ' WHERE '.  implode(' AND ', $where) );
        if($query->rows){
            return TRUE;
        }else{
            return FALSE;
        }
    }
    
    public function getImageByLink($site_from_image,$product_setting) {
        
        $only_image=FALSE;
        if(isset($product_setting['image_upload']) && $product_setting['image_upload']){
            $only_image=TRUE;
        }
        
        $new_image_name=FALSE;
        if(isset($product_setting['image_new_name']) && $product_setting['image_new_name']){
            $new_image_name=TRUE;
        }
        
        $image_new_path_parts=array();
        if(isset($product_setting['image_new_path']) && $product_setting['image_new_path']){
            $image_new_path =  trim($product_setting['image_new_path']);
            if($image_new_path){
                $image_new_path_parts = explode('/', $image_new_path);
            }
            if($image_new_path_parts){
                foreach ($image_new_path_parts as $key => $value) {
                    if(!$value){
                        unset($image_new_path_parts[$key]);
                    }
                }
            }
            
        }
        
        $image_parts = explode('/', $site_from_image);
        
        $path_whis_path_array = array(); 
        
        if($image_parts && is_array($image_parts)){
            
            $check_url = array('http:'=>0,'https:'=>0);
            
            foreach ($image_parts as $key => $image_parts_check_http) {
                if(isset($check_url[$image_parts_check_http])){
                    unset($check_url[$image_parts_check_http]);
                }
                
            }
            
            if(count($check_url)>1){
                return '';
            }else{
                unset($image_parts[0]);
                unset($image_parts[1]);
                unset($image_parts[2]);
            }
            
        }
        
        if($image_new_path_parts){
            foreach ($image_new_path_parts as $url_part) {
                $path_whis_path_array[] = $url_part;
            }
        }
        
        if($image_parts){
            foreach ($image_parts as $url_part) {
                $path_whis_path_array[] = $url_part;
            }
        }
        
        if(!$path_whis_path_array){
            return '';
        }
        
        $image_name = $path_whis_path_array[count($path_whis_path_array)-1];
        unset($path_whis_path_array[count($path_whis_path_array)-1]);
        $image_path = '';
        if($path_whis_path_array){
            $image_path = implode('/', $path_whis_path_array).'/';
        }
        if($new_image_name){

            $image_name_parts = explode('.',$image_name);
            
            $image_name = md5($site_from_image).'.'.end($image_name_parts);
            
        }
        
        $image = $image_path.$image_name;
        
        $server_path_and_image = DIR_IMAGE.$image;
        
        if(!file_exists(dirname($server_path_and_image))){
            
            if($image_path){
                
                $image_path_parts = explode('/', $image_path);
                
                $dir_name = DIR_IMAGE;
                
                foreach ($image_path_parts as $new_dir_name) {
                    
                    $dir_name .= $new_dir_name.'/';
                    
                    if(!file_exists($dir_name)){
                        
                        mkdir($dir_name,0777);
                        
                    }
                    
                }
                
            }
            
        }
        if(!file_exists(dirname($server_path_and_image))){
            
            return '';
            
        }elseif (file_exists($server_path_and_image)) {
            
            return $image;
            
        }
        
        
        
        $b = get_headers($site_from_image);
        $imt = array('Content-Type: image/png'=>'.png',
                'Content-Type: image/jpeg'=>'.jpg',
                'Content-Type: image/gif'=>'.gif',
                'Content-Type: image/jpeg'=>'.jpeg',
                'Content-Type: image/vnd.wap.wbmp'=>'.bmp');
        if($b && is_array($b)){
            
            $get_image = FALSE;
            
            foreach ($b as $key => $b_value) {
                
                if(isset($imt[$b_value])){
                    
                    $get_image = TRUE;
                    
                }

            }
            
            if($get_image){
                
                $a = file_get_contents($site_from_image);
                
                if($a){
                    file_put_contents($server_path_and_image, $a);
                    return $image;
                }
                
            }
            
        }
        return '';
    }
    
    
    
        private function copyImageContent($image,$site_from,$image_new_path){
            
            if(!$image || !$site_from){
                return $image;
            }
            $new_file = DIR_IMAGE . $image;
            if(is_file( $new_file )){
                return $image;
            }
            
            $site_from_image = $site_from.'/image/'.$image;
            
            $result = $this->getImageByLink($site_from_image, array('image_upload'=>1,'image_new_name'=>0,'image_new_path'=>$image_new_path,'image_whis_path'=>$image));
            
            if(!$result){
                return $image;
            }
            
            return $result;
        }

        public function getLanguages($DB_PREFIX) {
            $language_data = array();

            if($DB_PREFIX){
                $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "language");
                foreach ($query->rows as $result) {
                    $language_data[$result['code']] = array(
                            'language_id' => $result['language_id'],
                            'name'        => $result['name'],
                            'code'        => $result['code'],
                            'locale'      => $result['locale'],
                            'image'       => $result['image'],
                            'directory'   => $result['directory'],
                            'sort_order'  => $result['sort_order'],
                            'status'      => $result['status']
                    );
                }
            }
            return $language_data;
    }
    public function getStockStatuses($DB_PREFIX) {
            $result = array();
            $show_table = $this->showTable('stock_status', $DB_PREFIX);
            if($DB_PREFIX && $show_table){
                $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "stock_status");
                foreach ($query->rows as $row) {
                    $result[$row['stock_status_id']] = array(
                            'stock_status_id' => $row['stock_status_id'],
                            'name'        => $row['name']
                    );
                }
            }
            return $result;
    }
    public function getTaxClasses($DB_PREFIX) {
            $result = array();
            $show_table = $this->showTable('tax_class', $DB_PREFIX);
            if($DB_PREFIX && $show_table){
                $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "tax_class");
                foreach ($query->rows as $row) {
                    $result[$row['tax_class_id']] = array(
                            'tax_class_id' => $row['tax_class_id'],
                            'name'        => $row['title']
                    );
                }
            }
            return $result;
    }
    
    public function checklicense() {
        //asjudfgfdf
        eval(base64_decode('JGFtaWdyYXRpb25fdXNlcl9rZXkgPSAkdGhpcy0+Y29uZmlnLT5nZXQoImFtaWdyYXRpb25fdXNlcl9rZXkiKTsKICAgICAgICAkYW1pZ3JhdGlvbl91c2VyX2VtYWlsID0gJHRoaXMtPmNvbmZpZy0+Z2V0KCJhbWlncmF0aW9uX3VzZXJfZW1haWwiKTsKICAgICAgICBpZigkYW1pZ3JhdGlvbl91c2VyX2VtYWlsICYmICRhbWlncmF0aW9uX3VzZXJfa2V5KXsKICAgICAgICAgICAgJHRoaXMtPmxfZGF0YVsidSJdID0gJGFtaWdyYXRpb25fdXNlcl9rZXk7CiAgICAgICAgICAgICR0aGlzLT5sX2RhdGFbImUiXSA9ICRhbWlncmF0aW9uX3VzZXJfZW1haWw7CiAgICAgICAgfWVsc2V7CiAgICAgICAgICAgICR0aGlzLT5sX2RhdGFbInUiXSA9IG1kNSh0aW1lKCkpOwogICAgICAgICAgICAkdGhpcy0+bF9kYXRhWyJlIl0gPSB0aW1lKCk7CiAgICAgICAgfQ=='));//OCext.com: do not delete this line | не удаляйте эту строку
        //indjdsadsasd
        eval(base64_decode('JG1vZHVsZSA9ICJhbWlncmF0aW9uIjsKICAgICAgICBpZihmaWxlX2V4aXN0cygkX1NFUlZFUlsiRE9DVU1FTlRfUk9PVCJdLiIvc3lzdGVtL2xpYnJhcnkvdmVuZG9yL29jZXh0LyIuJG1vZHVsZS4iLnBocCIpKXsKICAgICAgICAgICAgaW5jbHVkZV9vbmNlICRfU0VSVkVSWyJET0NVTUVOVF9ST09UIl0uIi9zeXN0ZW0vbGlicmFyeS92ZW5kb3Ivb2NleHQvIi4kbW9kdWxlLiIucGhwIjsKICAgICAgICB9'));//OCext.com: do not delete this line | не удаляйте эту строку
    }
    
    public function getWeightClasses($DB_PREFIX) {
            $result = array();
            $show_table = $this->showTable('weight_class', $DB_PREFIX);
            
            if($show_table){
                $show_table = $this->showTable('weight_class_description', $DB_PREFIX);
            }
            
            if($DB_PREFIX && $show_table){
                
                if(isset($this->synchronization['language_id'][$this->config->get('config_language_id')]) && $this->synchronization['language_id'][$this->config->get('config_language_id')]){
                    $language_id = $this->synchronization['language_id'][$this->config->get('config_language_id')];
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "weight_class_description WHERE language_id = '" . $language_id . "'");
                }else{
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "weight_class_description ");
                }
                
                if($query->rows){
                    foreach ($query->rows as $row) {
                        $result[$row['weight_class_id']] = array(
                                'weight_class_id' => $row['weight_class_id'],
                                'name'        => $row['title']
                        );
                    }
                }
                
            }
            return $result;
    }

    public function getLengthClasses($DB_PREFIX) {
            $result = array();
            
            $show_table = $this->showTable('length_class', $DB_PREFIX);
            
            if($show_table){
                $show_table = $this->showTable('length_class_description', $DB_PREFIX);
            }
            
            if($DB_PREFIX && $show_table){
                //$query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "length_class_description WHERE language_id = '" . $this->config->get('config_language_id') . "'");
                
                if(isset($this->synchronization['language_id'][$this->config->get('config_language_id')]) && $this->synchronization['language_id'][$this->config->get('config_language_id')]){
                    $language_id = $this->synchronization['language_id'][$this->config->get('config_language_id')];
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "length_class_description WHERE language_id = '" . $language_id . "'");
                }else{
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "length_class_description ");
                }
                
                if($query->rows){
                    foreach ($query->rows as $row) {
                        $result[$row['length_class_id']] = array(
                                'length_class_id' => $row['length_class_id'],
                                'name'        => $row['title']
                        );
                    }
                }
                
            }
            return $result;
    }

    public function getCustomerGroups($DB_PREFIX) {
            $result = array();
            
            $show_table = $this->showTable('customer_group', $DB_PREFIX);
            
            if($show_table){
                $show_table = $this->showTable('customer_group_description', $DB_PREFIX);
            }
            
            if($DB_PREFIX && $show_table){
                //$query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "customer_group_description WHERE language_id = '" . $this->config->get('config_language_id') . "'");
                
                if(isset($this->synchronization['language_id'][$this->config->get('config_language_id')]) && $this->synchronization['language_id'][$this->config->get('config_language_id')]){
                    $language_id = $this->synchronization['language_id'][$this->config->get('config_language_id')];
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "customer_group_description WHERE language_id = '" . $language_id . "'");
                }else{
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "customer_group_description ");
                }
                
                if($query->rows){
                    foreach ($query->rows as $row) {
                        $result[$row['customer_group_id']] = array(
                                'customer_group_id' => $row['customer_group_id'],
                                'name'        => $row['name']
                        );
                    }
                }
                
            }
            return $result;
    }
    
    public function getOrderStatuses($DB_PREFIX) {
            $result = array();
            
            $show_table = $this->showTable('order_status', $DB_PREFIX);
            
            if($DB_PREFIX && $show_table){
                $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "order_status WHERE language_id = '" . $this->config->get('config_language_id') . "'");
                
                if(isset($this->synchronization['language_id'][$this->config->get('config_language_id')]) && $this->synchronization['language_id'][$this->config->get('config_language_id')]){
                    $language_id = $this->synchronization['language_id'][$this->config->get('config_language_id')];
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "order_status WHERE language_id = '" . $language_id . "'");
                }else{
                    $query = $this->db->query("SELECT * FROM " . $DB_PREFIX . "order_status ");
                }
                
                if($query->rows){
                    foreach ($query->rows as $row) {
                        $result[$row['order_status_id']] = array(
                                'order_status_id' => $row['order_status_id'],
                                'name'        => $row['name']
                        );
                    }
                }
            }
            return $result;
    }
    
    public function countRows($table,$message){
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . $table . " ");
        if(!$query->rows){
            $message = '';
        }
        return $message;
    }
        
}
?>