<?php
class ControllerExtensionModuleAMigration extends Controller {
	private $error = array();
        private $this_version = '5.0.0.0';
        private $this_extension = 'ocext_amigration';
        private $this_ocext_host = 'oc2101.ocext';

        public function index() {   
		$this->load->language('extension/module/amigration');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
                $this->load->model('tool/amigration');
                $synchronization = $this->model_tool_amigration->getSynchronization();
                $data['open_tab'] = 'tab-setting';
                
                $data['column_id'] = $this->language->get('column_id');
                $data['column_keyword'] = $this->language->get('column_keyword');
                $data['column_used'] = $this->language->get('column_used');
                $data['column_index_elements'] = $this->language->get('column_index_elements');
                $data['column_date_added'] = $this->language->get('column_date_added');
                $data['text_no_results'] = $this->language->get('text_no_results');
                $data['text_no_db_prefix'] = $this->language->get('text_no_db_prefix');
                $data['text_no_to_data'] = $this->language->get('text_no_to_data');
                $data['text_no_from_data'] = $this->language->get('text_no_from_data');
                $data['text_select_data'] = $this->language->get('text_select_data'); 
                $data['text_error_selected_element'] = $this->language->get('text_error_selected_element'); 
                $data['text_no_migration_setting'] = $this->language->get('text_no_migration_setting');
                $data['text_no_migration_setting_2'] = $this->language->get('text_no_migration_setting_2');
                $data['text_press_migrate'] = $this->language->get('text_press_migrate');
                $data['text_migrate'] = $this->language->get('text_migrate');
                $data['text_wite'] = $this->language->get('text_wite');
                
                
                $data['text_only_new_products'] = $this->model_tool_amigration->countRows('product',$this->language->get('text_only_new_products'));
                $data['text_only_new_categories'] = $this->model_tool_amigration->countRows('category',$this->language->get('text_only_new_categories'));
                $data['text_only_new_attributes'] = $this->model_tool_amigration->countRows('attribute',$this->language->get('text_only_new_attributes'));
                $data['text_only_new_options'] = $this->model_tool_amigration->countRows('option',$this->language->get('text_only_new_options'));
                $data['text_only_new_customers'] = $this->model_tool_amigration->countRows('customer',$this->language->get('text_only_new_customers'));
                $data['text_only_new_orders'] = $this->model_tool_amigration->countRows('order',$this->language->get('text_only_new_orders'));
                $data['text_only_new_articles'] = $this->model_tool_amigration->countRows('information',$this->language->get('text_only_new_articles'));
                $data['text_only_seo_urls'] = $this->model_tool_amigration->countRows('url_alias',$this->language->get('text_only_seo_urls'));
                $data['text_only_new_manufacturers'] = $this->model_tool_amigration->countRows('manufacturer',$this->language->get('text_only_new_manufacturers'));
                
                $data['text_db_prefix'] = sprintf($this->language->get('text_db_prefix'), DB_PREFIX);
                
                $data['text_copy_files'] = $this->language->get('text_copy_files');
                $data['text_copy_files_site_from'] = $this->language->get('text_copy_files_site_from');
                $data['text_copy_files_site_from_path'] = $this->language->get('text_copy_files_site_from_path');
                $data['text_user_email'] = $this->language->get('text_user_email');
                $data['text_user_key'] = $this->language->get('text_user_key');
                
                $data['text_copy_files_status'] = $this->language->get('text_copy_files_status');
                
                
                $data['text_copy_files_no_curl'] = '';
                if(!$this->getCurlStatus()){
                    $data['text_copy_files_no_curl'] = $this->language->get('text_copy_files_no_curl');
                }elseif (!$this->config->get('amigration_site_from')) {
                    $data['text_copy_files_no_curl'] = $this->language->get('text_copy_files_no_site_from');
                }
                
                
                $data['column_from_db_value'] = $this->language->get('column_from_db_value');
                $data['column_to_db_value'] = $this->language->get('column_to_db_value');
                $data['column_from_to_table'] = $this->language->get('column_from_to_table');
                $data['heading_title'] = $this->language->get('heading_title');
                $data['tab_setting'] = $this->language->get('tab_setting');
                $data['tab_migration'] = $this->language->get('tab_migration');
                $data['tab_categories'] = $this->language->get('tab_categories');
                $data['tab_products'] = $this->language->get('tab_products');
                $data['tab_attributes'] = $this->language->get('tab_attributes');
                $data['tab_options'] = $this->language->get('tab_options');
                $data['tab_customers'] = $this->language->get('tab_customers');
                $data['tab_orders'] = $this->language->get('tab_orders');
                $data['tab_articles'] = $this->language->get('tab_articles');
                $data['tab_seo_urls'] = $this->language->get('tab_seo_urls');
                $data['tab_manufacturer'] = $this->language->get('tab_manufacturer');
                $data['tab_welcome_extecom'] = $this->language->get('tab_welcome_extecom');
                
                $data['button_save'] = $this->language->get('button_save');
                $data['button_cancel'] = $this->language->get('button_cancel');
                $data['button_migrate'] = $this->language->get('button_migrate');
                
                $data['amigration_setting'] = TRUE;
                
                $data['amigration_db_prefix'] = '';
                $data['text_warning_db_prefix'] = '';
                
                $show_tables = FALSE;
                
                if($this->config->get('amigration_db_prefix')){
                    $data['amigration_db_prefix'] = $this->config->get('amigration_db_prefix');
                    $db_prefix = $data['amigration_db_prefix'];
                    $show_tables = $this->model_tool_amigration->showTable('product',$db_prefix);
                    if(!$show_tables){
                        $data['text_warning_db_prefix'] = sprintf($this->language->get('text_no_db_tables'),$this->config->get('amigration_db_prefix'),DB_DATABASE,$this->config->get('amigration_db_prefix'),DB_DATABASE);
                        $data['amigration_setting'] = FALSE;
                    }
                }else{
                    $data['text_warning_db_prefix'] = $this->language->get('text_no_db_prefix');
                    $data['amigration_setting'] = FALSE;
                }
                if(isset ($this->request->post['amigration_db_prefix']) && $this->request->post['amigration_db_prefix']===DB_PREFIX){
                    $this->error['warning'] = $this->language->get('text_error_db_prefix');
                    $data['amigration_db_prefix'] = $this->request->post['amigration_db_prefix'];
                }
                
                $data['amigration_site_from'] = '';
                if($this->config->get('amigration_site_from')){
                    $data['amigration_site_from'] = $this->config->get('amigration_site_from');
                }
                
                $data['amigration_site_from_path'] = '';
                if($this->config->get('amigration_site_from_path')){
                    $data['amigration_site_from_path'] = $this->config->get('amigration_site_from_path');
                }
                
                $data['amigration_user_email'] = '';
                if($this->config->get('amigration_user_email')){
                    $data['amigration_user_email'] = $this->config->get('amigration_user_email');
                }
                
                $data['amigration_user_key'] = '';
                if($this->config->get('amigration_user_key')){
                    $data['amigration_user_key'] = $this->config->get('amigration_user_key');
                }
                
                $data['text_empty_synchronization'] = '';
                
                if(!$data['amigration_user_key'] || !$data['amigration_user_email'] || !$synchronization){
                    
                    $data['text_empty_synchronization'] = $this->language->get('text_empty_synchronization');
                    $data['amigration_setting'] = FALSE;
                    $data['text_warning_db_prefix'] = $data['text_empty_synchronization'];
                    
                }
                
                if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                    if(isset($this->request->get['setting'])){
                        $this->model_setting_setting->editSetting('amigration', $this->request->post);
                    }
                    $this->session->data['success'] = $this->language->get('text_success');
                    $this->response->redirect($this->url->link('extension/module/amigration', 'token=' . $this->session->data['token'], 'SSL'));
		}
                
                if($show_tables){
                    $data['text_languages'] = sprintf($this->language->get('text_languages'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_languages_from'] = $this->model_tool_amigration->getLanguages($data['amigration_db_prefix']);
                    $data['amigration_languages_to'] = $this->model_tool_amigration->getLanguages(DB_PREFIX);
                    $data['amigration_languages'] = array();
                    if($this->config->get('amigration_languages')){
                        $data['amigration_languages'] = $this->config->get('amigration_languages');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }

                    $data['text_stock_statuses'] = sprintf($this->language->get('text_stock_statuses'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_stock_statuses_from'] = $this->model_tool_amigration->getStockStatuses($data['amigration_db_prefix']);
                    
                    $data['amigration_stock_statuses_to'] = $this->model_tool_amigration->getStockStatuses(DB_PREFIX);
                    $data['amigration_stock_statuses'] = array();
                    if($this->config->get('amigration_stock_statuses')){
                        $data['amigration_stock_statuses'] = $this->config->get('amigration_stock_statuses');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }

                    $data['text_tax_classes'] = sprintf($this->language->get('text_tax_classes'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_tax_classes_from'] = $this->model_tool_amigration->getTaxClasses($data['amigration_db_prefix']);
                    $data['amigration_tax_classes_to'] = $this->model_tool_amigration->getTaxClasses(DB_PREFIX);
                    $data['amigration_tax_classes'] = array();
                    if($this->config->get('amigration_tax_classes')){
                        $data['amigration_tax_classes'] = $this->config->get('amigration_tax_classes');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }

                    $data['text_weight_classes'] = sprintf($this->language->get('text_weight_classes'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_weight_classes_from'] = $this->model_tool_amigration->getWeightClasses($data['amigration_db_prefix']);
                    $data['amigration_weight_classes_to'] = $this->model_tool_amigration->getWeightClasses(DB_PREFIX);
                    $data['amigration_weight_classes'] = array();
                    if($this->config->get('amigration_weight_classes')){
                        $data['amigration_weight_classes'] = $this->config->get('amigration_weight_classes');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }

                    $data['text_length_classes'] = sprintf($this->language->get('text_length_classes'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_length_classes_from'] = $this->model_tool_amigration->getLengthClasses($data['amigration_db_prefix']);
                    $data['amigration_length_classes_to'] = $this->model_tool_amigration->getLengthClasses(DB_PREFIX);
                    $data['amigration_length_classes'] = array();
                    if($this->config->get('amigration_length_classes')){
                        $data['amigration_length_classes'] = $this->config->get('amigration_length_classes');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }

                    $data['text_customer_groups'] = sprintf($this->language->get('text_customer_groups'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_customer_groups_from'] = $this->model_tool_amigration->getCustomerGroups($data['amigration_db_prefix']);
                    $data['amigration_customer_groups_to'] = $this->model_tool_amigration->getCustomerGroups(DB_PREFIX);
                    $data['amigration_customer_groups'] = array();
                    if($this->config->get('amigration_customer_groups')){
                        $data['amigration_customer_groups'] = $this->config->get('amigration_customer_groups');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }

                    $data['text_order_statuses'] = sprintf($this->language->get('text_order_statuses'),$this->config->get('amigration_db_prefix'), DB_PREFIX);
                    $data['amigration_order_statuses_from'] = $this->model_tool_amigration->getOrderStatuses($data['amigration_db_prefix']);
                    $data['amigration_order_statuses_to'] = $this->model_tool_amigration->getOrderStatuses(DB_PREFIX);
                    $data['amigration_order_statuses'] = array();
                    if($this->config->get('amigration_order_statuses')){
                        $data['amigration_order_statuses'] = $this->config->get('amigration_order_statuses');
                    }else{
                        $data['amigration_setting'] = FALSE;
                    }
                }
                
                
                
                if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
                if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
                }elseif(isset ($this->session->data['error'])){
                        $data['error_warning'] = $this->session->data['error'];
                        unset($this->session->data['error']);
                } else {
			$data['error_warning'] = '';
		}
                $data['token'] = $this->session->data['token'];
  		$data['breadcrumbs'] = array();
   		$data['breadcrumbs'][] = array(
                    'text'      => $this->language->get('text_home'),
                    'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                    'separator' => false
   		);
   		$data['breadcrumbs'][] = array(
                    'text'      => $this->language->get('text_module'),
                    'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
                    'separator' => ' :: '
   		);
   		$data['breadcrumbs'][] = array(
                    'text'      => $this->language->get('heading_title'),
                    'href'      => $this->url->link('extension/module/amigration', 'token=' . $this->session->data['token'], 'SSL'),
                    'separator' => ' :: '
   		);
                
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');
                
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
                $data['action_setting'] = $this->url->link('extension/module/amigration&setting=1', 'token=' . $this->session->data['token'], 'SSL');
                $data['action_migration'] = $this->url->link('extension/module/amigration&migration=1', 'token=' . $this->session->data['token'], 'SSL');
                
		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
                
                $data['back'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['button_back'] = $this->language->get( 'button_back' );
                $data['header'] = $this->load->controller('common/header');
                $data['column_left'] = $this->load->controller('common/column_left');
                $data['footer'] = $this->load->controller('common/footer');
                
                $this->response->setOutput($this->load->view('extension/module/amigration.tpl', $data));
	}
	
	private function validate() {
            
		if (!$this->user->hasPermission('modify', 'extension/module/amigration')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
        
        public function migrate(){
            $this->load->model('tool/amigration');
            $table = $this->request->get['table'];
            $limit = $this->request->get['limit'];
            $start = $this->request->get['start'];
            $copy_image = FALSE;
            if(isset($this->request->get['copy_image']) && $this->request->get['copy_image'] && $this->config->get('amigration_site_from')){
                $copy_image = TRUE;
            }
            $result = $this->model_tool_amigration->migrate($table,$start,$limit,$copy_image);
            $result = json_encode($result);
            echo $result;
        }

        public function getNotifications() {
		sleep(1);
		$this->load->language('extension/module/amigration');
		$response = $this->getNotificationsCurl();
		$json = array();
		if ($response===false) {
			$json['message'] = '';
			$json['error'] = $this->language->get( 'error_notifications' );
		} else {
			$json['message'] = $response;
			$json['error'] = '';
		}
		$this->response->setOutput(json_encode($json));
	}
        
        protected function getCurlStatus(){
            if(function_exists('curl_version')){
                return TRUE;
            }else{
                return FALSE;
            }
        }

        public function getWelcomeWindow(){
            
            if(function_exists('curl_version')){
                
                $language_code = $this->config->get( 'config_admin_language' );
                $url = "https://api.e-distributer.com/v1/welcome/?license=".HTTP_SERVER."&version_opencart=".VERSION."&version_ocext=".$this->this_version."&extension=".$this->this_extension."&language_code=".$language_code;
                $curl = curl_init($url);
                $curloptions = array(
                    CURLOPT_CUSTOMREQUEST  =>"GET",  
                    CURLOPT_POST           =>FALSE,      
                    CURLOPT_USERPWD     =>":",
                    CURLOPT_RETURNTRANSFER => TRUE,  
                    CURLOPT_HEADER         => FALSE,
                );
                curl_setopt_array($curl, $curloptions);
                curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); 
                $welcome = curl_exec($curl);
                $errmsg  = curl_error($curl);
                curl_close($curl);
                if(!$errmsg){
                    
                    echo $welcome;
                    
                }
                
            }else{
                
                echo "РУС: Расширение php CURL выключено. Включите расширение, чтобы получать важную информацию об этом продукте<br>ENG: Extension php CURL off. Turn the extension to receive important information on this product<br>DE: Extension php CURL off. Turn the extension to receive important information on this product<br>FR: Extension cURL de PHP off. Tournez l'extension pour recevoir des informations importantes sur ce produit";
                
            }
            
            exit();
            
        }

        protected function curl_get_contents($url) {
            if(function_exists('curl_version')){
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
                $output = curl_exec($ch);
                curl_close($ch);
                return $output;
            }else{
                $output['ru'] = 'Проверка версии недоступна. Включите php расширение - CURL на Вашем хостинге';
                $output['en'] = 'You can not check the version. Enable php extension - CURL on your hosting';
                $language_code = $this->config->get( 'config_admin_language' );
                if(isset($output[$language_code])){
                    return $output[$language_code];
                }else{
                    return $output['en'];
                }
            }
	}


	public function getNotificationsCurl() {
		$language_code = $this->config->get( 'config_admin_language' );
		$result = $this->curl_get_contents("http://www.".$this->this_ocext_host.".com/index.php?route=information/check_update_version&license=".HTTP_SERVER."&version_opencart=".VERSION."&version_ocext=".$this->this_version."&extension=".$this->this_extension."&language_code=$language_code");
		if (stripos($result,'<html') !== false) {
			return '';
		}
		return $result;
	}
        
}
?>