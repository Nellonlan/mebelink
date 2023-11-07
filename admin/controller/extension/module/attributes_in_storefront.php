<?php
class ControllerExtensionModuleAttributesInStorefront extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('extension/module/attributes_in_storefront');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			if ((int)$this->request->post['apply'] > 0) {
				$url = $this->url->link('extension/module/attributes_in_storefront', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$url = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
			}
			
			unset($this->request->post['apply']);
                        
                        $this->model_setting_setting->editSetting('attribute_view', $this->request->post);
		
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($url);
		}
                
     		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
                
                $conf_language = array(
                    'text_size_image_width','text_size_image_height','text_size_image','text_view_help','text_view_image',
                    'text_setting','text_select_catagory','text_form','text_select_on1','text_select_off1',
                    'text_action','text_manufacturer','text_category','text_search','text_product','text_product_block_title',
		    'text_product_title_group_attribute','text_product_title_block_show','text_product_image_show',
		    'text_product_help_show',
                    'heading_title','button_cancel','button_save',
                    'button_apply','button_remove',
                    'text_category_activation','text_select_attribute','text_select_category','text_select_on',
                    'text_select_off','text_select_all','text_unselect_all',
                    'text_search_activation','text_manufacturer_activation','text_action_activation','text_product_activation',
                    'original_title_show_category', 'original_title_show_search','original_title_select_attribute',
                    'original_title_show_manufacturer','original_title_show_action','original_title_show_product',
                    'original_title_category_select_category','original_title_category_select_attribute','original_title_product_select_attribute',
                    'original_title_search_select_attribute','original_title_manufacturer_select_attribute','original_title_action_select_attribute',
                    'original_title_view_image','original_title_view_help','original_title_size_image'
                );
                
                foreach($conf_language as $l) {
                    $data[$l] = $this->language->get($l);
                }
                
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/attributes_in_storefront', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('extension/module/attributes_in_storefront', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
                
                $data['modules'] = array();
		
		if (isset($this->request->post['attributes_in_storefront_module'])) {
			$data['modules'] = $this->request->post['attributes_in_storefront_module'];
		} elseif ($this->config->get('attributes_in_storefront_module')) { 
			$data['modules'] = $this->config->get('attributes_in_storefront_module');
		}
		
		$this->load->model('catalog/category');		
		$data['categories'] = $this->model_catalog_category->getCategories(0);
		
		$this->load->model('catalog/attribute');
	        $data['attributes'] = $this->model_catalog_attribute->getAttributes();
		
		$conf_params = array(
                    'attribute_view_help_show',
                    'attribute_view_image_show',
                    'attribute_view_image_size_height',
                    'attribute_view_image_size_width',
		    
		    'attribute_view_product_show',
		    'attribute_view_product_title_group_attribute',
		    'attribute_view_product_title_block_show',
		    'attribute_view_product_image_show',
		    'attribute_view_product_help_show',
		    'attribute_view_product_title',
		    
		    'attribute_view_category_show',
		    'attribute_view_category_title_group_attribute',
		    'attribute_view_category_title_block_show',
		    'attribute_view_category_image_show',
		    'attribute_view_category_help_show',
		    'attribute_view_category_title',
		    
		    'attribute_view_action_show',
		    'attribute_view_action_title_group_attribute',
		    'attribute_view_action_title_block_show',
		    'attribute_view_action_image_show',
		    'attribute_view_action_help_show',
		    'attribute_view_action_title',
		    
		    'attribute_view_manufacturer_show',
		    'attribute_view_manufacturer_title_group_attribute',
		    'attribute_view_manufacturer_title_block_show',
		    'attribute_view_manufacturer_image_show',
		    'attribute_view_manufacturer_help_show',
		    'attribute_view_manufacturer_title',
		    
		    'attribute_view_search_show',
		    'attribute_view_search_title_group_attribute',
		    'attribute_view_search_title_block_show',
		    'attribute_view_search_image_show',
		    'attribute_view_search_help_show',
		    'attribute_view_search_title'
		    
		);
	
		
		foreach ($conf_params as $config_var) {
			if (isset($this->request->post[$config_var])) {
				$data[$config_var] = $this->request->post[$config_var];
			} elseif ($this->config->get($config_var)) {
				$data[$config_var] = $this->config->get($config_var);
			} else {
				$data[$config_var] = '0';
			}
		}
	
                
		if (isset($this->request->post['attribute_view_category_select_attribute'])) {
			$data['attribute_view_category_select_attribute'] = $this->request->post['attribute_view_category_select_attribute'];
		} elseif ($this->config->get('attribute_view_category_select_attribute')) { 
			$data['attribute_view_category_select_attribute'] = $this->config->get('attribute_view_category_select_attribute');
		} else {
			$data['attribute_view_category_select_attribute'] = array();
		}

		if (isset($this->request->post['attribute_view_category_select_category'])) {
			$data['attribute_view_category_select_category'] = $this->request->post['attribute_view_category_select_category'];
		} elseif ($this->config->get('attribute_view_category_select_category')) { 
			$data['attribute_view_category_select_category'] = $this->config->get('attribute_view_category_select_category');
		} else {
			$data['attribute_view_category_select_category'] = array();
		}

		if (isset($this->request->post['attribute_view_manufacturer_select_attribute'])) {
			$data['attribute_view_manufacturer_select_attribute'] = $this->request->post['attribute_view_manufacturer_select_attribute'];
		} elseif ($this->config->get('attribute_view_manufacturer_select_attribute')) { 
			$data['attribute_view_manufacturer_select_attribute'] = $this->config->get('attribute_view_manufacturer_select_attribute');
		} else {
			$data['attribute_view_manufacturer_select_attribute'] = array();
		} 
               
	
		if (isset($this->request->post['attribute_view_search_select_attribute'])) {
			$data['attribute_view_search_select_attribute'] = $this->request->post['attribute_view_search_select_attribute'];
		} elseif ($this->config->get('attribute_view_search_select_attribute')) { 
			$data['attribute_view_search_select_attribute'] = $this->config->get('attribute_view_search_select_attribute');
		} else {
			$data['attribute_view_search_select_attribute'] = array();
		} 
                
                if (isset($this->request->post['attribute_view_action_select_attribute'])) {
			$data['attribute_view_action_select_attribute'] = $this->request->post['attribute_view_action_select_attribute'];
		} elseif ($this->config->get('attribute_view_action_select_attribute')) { 
			$data['attribute_view_action_select_attribute'] = $this->config->get('attribute_view_action_select_attribute');
		} else {
			$data['attribute_view_action_select_attribute'] = array();
		}
		
		if (isset($this->request->post['attribute_view_product_select_attribute'])) {
			$data['attribute_view_product_select_attribute'] = $this->request->post['attribute_view_product_select_attribute'];
		} elseif ($this->config->get('attribute_view_product_select_attribute')) { 
			$data['attribute_view_product_select_attribute'] = $this->config->get('attribute_view_product_select_attribute');
		} else {
			$data['attribute_view_product_select_attribute'] = array();
		}
                
                if (isset($this->request->post['attribute_view_output_by_category'])) {
			$data['attribute_view_output_by_category'] = $this->request->post['attribute_view_output_by_category'];
		} elseif ($this->config->get('attribute_view_output_by_category')) { 
			$data['attribute_view_output_by_category'] = $this->config->get('attribute_view_output_by_category');
		} else {
			$data['attribute_view_output_by_category'] = array();
		}
                
                if (isset($this->request->post['attribute_view_output_by_category_attribute'])) {
			$data['attribute_view_output_by_category_attribute'] = $this->request->post['attribute_view_output_by_category_attribute'];
		} elseif ($this->config->get('attribute_view_output_by_category_attribute')) { 
			$data['attribute_view_output_by_category_attribute'] = $this->config->get('attribute_view_output_by_category_attribute');
		} else {
			$data['attribute_view_output_by_category_attribute'] = array();
		}

                $this->load->model('catalog/category');

		$filter_data = array(
			'sort'        => 'name',
			'order'       => 'ASC'
		);

		$data['categories'] = $this->model_catalog_category->getCategories($filter_data);
		$this->load->model('localisation/language');
                $data['languages'] = $this->model_localisation_language->getLanguages();
           				
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
                
                $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/attributes_in_storefront', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/attributes_in_storefront')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>