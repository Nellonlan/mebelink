<?php
class ControllerExtensionModuleProscroller extends Controller {
	private $error = array(); 
	
	public function index() {
		$this->load->language('extension/module/proscroller');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
		$this->load->model('catalog/category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('proscroller', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');
		$data['tab_module'] = $this->language->get('tab_module');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['text_root'] = $this->language->get('text_root');
		$data['text_all_manufacturers'] = $this->language->get('text_all_manufacturers');
		$data['text_featured'] = $this->language->get('text_featured');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_date_added'] = $this->language->get('text_date_added');
		$data['text_topsellers'] = $this->language->get('text_topsellers');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_rating'] = $this->language->get('text_rating');
		$data['text_viewed'] = $this->language->get('text_viewed');
		$data['text_sort_order'] = $this->language->get('text_sort_order');
		
		$data['entry_main_options'] = $this->language->get('entry_main_options');
		$data['entry_scroller_options'] = $this->language->get('entry_scroller_options');
		$data['entry_product_options'] = $this->language->get('entry_product_options');
		$data['entry_name'] = $this->language->get('entry_name');
		
		$data['entry_sort'] = $this->language->get('entry_sort');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_source'] = $this->language->get('entry_source');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_title_link'] = $this->language->get('entry_title_link');
		$data['help_title_link'] = $this->language->get('help_title_link');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_count'] = $this->language->get('entry_count');
		$data['entry_visible'] = $this->language->get('entry_visible');
		$data['entry_shownav'] = $this->language->get('entry_shownav');
		$data['entry_autoscroll'] = $this->language->get('entry_autoscroll');
		$data['entry_animationspeed'] = $this->language->get('entry_animationspeed');
		$data['entry_hoverpause'] = $this->language->get('entry_hoverpause');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_show_title'] = $this->language->get('entry_show_title');
		$data['entry_show_price'] = $this->language->get('entry_show_price');
		$data['entry_show_rate'] = $this->language->get('entry_show_rate');
		$data['entry_show_desc'] = $this->language->get('entry_show_desc');
		$data['entry_desc_word'] = $this->language->get('entry_desc_word');
		$data['entry_show_cart'] = $this->language->get('entry_show_cart');
		$data['entry_show_wish'] = $this->language->get('entry_show_wish');
		$data['entry_show_compare'] = $this->language->get('entry_show_compare');
		
		$data['help_sort'] = $this->language->get('help_sort');
		$data['help_source'] = $this->language->get('help_source');
		$data['help_manufacturer'] = $this->language->get('help_manufacturer');
		$data['help_product'] = $this->language->get('help_product');
		$data['help_count'] = $this->language->get('help_count');
		$data['help_visible'] = $this->language->get('help_visible');
		$data['help_shownav'] = $this->language->get('help_shownav');
		$data['help_autoscroll'] = $this->language->get('help_autoscroll');
		$data['help_animationspeed'] = $this->language->get('help_animationspeed');
		
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		if (isset($this->error['count'])) {
					$data['error_count'] = $this->error['count'];
				} else {
					$data['error_count'] = '';
		}
		if (isset($this->error['visible'])) {
					$data['error_visible'] = $this->error['visible'];
				} else {
					$data['error_visible'] = '';
		}
		if (isset($this->error['width'])) {
					$data['error_width'] = $this->error['width'];
				} else {
					$data['error_width'] = '';
		}
		if (isset($this->error['scroll'])) {
					$data['error_scroll'] = $this->error['scroll'];
				} else {
					$data['error_scroll'] = '';
		}
		if (isset($this->error['animationspeed'])) {
					$data['error_animationspeed'] = $this->error['animationspeed'];
				} else {
					$data['error_animationspeed'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true),
      		'separator' => ' :: '
   		);
		
   		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/proscroller', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/proscroller', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/proscroller', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/proscroller', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = null;
		}
		
		if (isset($this->request->post['title_link'])) {
			$data['title_link'] = $this->request->post['title_link'];
		} elseif (!empty($module_info)) {
			$data['title_link'] = $module_info['title_link'];
		} else {
			$data['title_link'] = '';
		}
		
		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (!empty($module_info)) {
			$data['category_id'] = $module_info['category_id'];
		} else {
			$data['category_id'] = '0';
		}
		
		$this->load->model('catalog/product');
		
		$data['products'] = array();
		
		if (isset($this->request->post['product'])) {
			$products = $this->request->post['product'];
		} elseif (!empty($module_info)) {
			$products = $module_info['product'];
		} else {
			$products = array();
		}	
		if(!empty($module_info['product'])){
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					$data['products'][] = array(
						'product_id' => $product_info['product_id'],
						'name'       => $product_info['name']
					);
				}
			}
		}
		
		if (isset($this->request->post['manufacturer_id'])) {
			$data['manufacturer_id'] = $this->request->post['manufacturer_id'];
		} elseif (!empty($module_info)) {
			$data['manufacturer_id'] = $module_info['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}
		
		if (isset($this->request->post['sort'])) {
			$data['sort'] = $this->request->post['sort'];
		} elseif (!empty($module_info)) {
			$data['sort'] = $module_info['sort'];
		} else {
			$data['sort'] = '';
		}
		
		if (isset($this->request->post['count'])) {
			$data['count'] = $this->request->post['count'];
		} elseif (!empty($module_info)) {
			$data['count'] = $module_info['count'];
		} else {
			$data['count'] = 10;
		}
		
		if (isset($this->request->post['visible'])) {
			$data['visible'] = $this->request->post['visible'];
		} elseif (!empty($module_info)) {
			$data['visible'] = $module_info['visible'];
		} else {
			$data['visible'] = 4;
		}
		
		if (isset($this->request->post['shownav'])) {
			$data['shownav'] = $this->request->post['shownav'];
		} elseif (!empty($module_info)) {
			$data['shownav'] = $module_info['shownav'];
		} else {
			$data['shownav'] = 1;
		}
		
		if (isset($this->request->post['autoscroll'])) {
			$data['autoscroll'] = $this->request->post['autoscroll'];
		} elseif (!empty($module_info)) {
			$data['autoscroll'] = $module_info['autoscroll'];
		} else {
			$data['autoscroll'] = 3000;
		}
		
		if (isset($this->request->post['animationspeed'])) {
			$data['animationspeed'] = $this->request->post['animationspeed'];
		} elseif (!empty($module_info)) {
			$data['animationspeed'] = $module_info['animationspeed'];
		} else {
			$data['animationspeed'] = 200;
		}
		
		
		if (isset($this->request->post['hoverpause'])) {
			$data['hoverpause'] = $this->request->post['hoverpause'];
		} elseif (!empty($module_info)) {
			$data['hoverpause'] = $module_info['hoverpause'];
		} else {
			$data['hoverpause'] = 1;
		}
		
		if (isset($this->request->post['image_width'])) {
			$data['image_width'] = $this->request->post['image_width'];
		} elseif (!empty($module_info)) {
			$data['image_width'] = $module_info['image_width'];
		} else {
			$data['image_width'] = 200;
		}
		
		if (isset($this->request->post['image_height'])) {
			$data['image_height'] = $this->request->post['image_height'];
		} elseif (!empty($module_info)) {
			$data['image_height'] = $module_info['image_height'];
		} else {
			$data['image_height'] = 200;
		}
		
		if (isset($this->request->post['show_title'])) {
			$data['show_title'] = $this->request->post['show_title'];
		} elseif (!empty($module_info)) {
			$data['show_title'] = $module_info['show_title'];
		} else {
			$data['show_title'] = 1;
		}
		
		if (isset($this->request->post['show_price'])) {
			$data['show_price'] = $this->request->post['show_price'];
		} elseif (!empty($module_info)) {
			$data['show_price'] = $module_info['show_price'];
		} else {
			$data['show_price'] = 1;
		}
		
		if (isset($this->request->post['show_rate'])) {
			$data['show_rate'] = $this->request->post['show_rate'];
		} elseif (!empty($module_info)) {
			$data['show_rate'] = $module_info['show_rate'];
		} else {
			$data['show_rate'] = 1;
		}
		
		if (isset($this->request->post['show_desc'])) {
			$data['show_desc'] = $this->request->post['show_desc'];
		} elseif (!empty($module_info)) {
			$data['show_desc'] = $module_info['show_desc'];
		} else {
			$data['show_desc'] = 1;
		}
		
		if (isset($this->request->post['desc_word'])) {
			$data['desc_word'] = $this->request->post['desc_word'];
		} elseif (!empty($module_info)) {
			$data['desc_word'] = $module_info['desc_word'];
		} else {
			$data['desc_word'] = 100;
		}
		
		if (isset($this->request->post['show_cart'])) {
			$data['show_cart'] = $this->request->post['show_cart'];
		} elseif (!empty($module_info)) {
			$data['show_cart'] = $module_info['show_cart'];
		} else {
			$data['show_cart'] = 1;
		}
		
		if (isset($this->request->post['show_wish'])) {
			$data['show_wish'] = $this->request->post['show_wish'];
		} elseif (!empty($module_info)) {
			$data['show_wish'] = $module_info['show_wish'];
		} else {
			$data['show_wish'] = 1;
		}
		
		if (isset($this->request->post['show_compare'])) {
			$data['show_compare'] = $this->request->post['show_compare'];
		} elseif (!empty($module_info)) {
			$data['show_compare'] = $module_info['show_compare'];
		} else {
			$data['show_compare'] = 1;
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('catalog/manufacturer');

		$results = $this->model_catalog_manufacturer->getManufacturers();

		foreach ($results as $result) {
							
			$data['manufacturers'][] = array(
				'manufacturer_id' => $result['manufacturer_id'],
				'name'        => $result['name']
			);
		}
		
		$data['rootcats'] = $this->model_catalog_category->getCategories(0);
		
		$this->load->model('catalog/product');
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/proscroller', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/proscroller')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if ($this->request->post['count'] < 1) {
			$this->error['count'] = $this->language->get('error_count');
		}
		if ($this->request->post['visible'] < 1) {
			$this->error['visible'] = $this->language->get('error_visible');
		}
		if ((!$this->request->post['image_width'] || !$this->request->post['image_height'])||(($this->request->post['image_height']< 1) || ($this->request->post['image_width'] < 1))) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['animationspeed'] || $this->request->post['animationspeed'] < 1) {
			$this->error['animationspeed'] = $this->language->get('error_animationspeed');
		}

		return !$this->error;
	}
}
?>