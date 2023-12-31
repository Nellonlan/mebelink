<?php
class ControllerCommonHeader extends Controller {
	public function index() {

					// XD Stickers start
						$this->load->model('setting/setting');
						$xdstickers = $this->config->get('xdstickers');
						$data['xdstickers_status'] = $xdstickers['status'];
						if ($xdstickers['status']) {
							$data['xdstickers'] = array();
							$data['xdstickers_position'] = $xdstickers['position'];
							$data['xdstickers_inline_styles'] = $xdstickers['inline_styles'];
							$data['xdstickers'][] = array(
								'id'			=> 'xdsticker_sale',
								'bg'			=> $xdstickers['sale']['bg'],
								'color'			=> $xdstickers['sale']['color'],
								'status'		=> $xdstickers['sale']['status'],
							);
							$data['xdstickers'][] = array(
								'id'			=> 'xdsticker_bestseller',
								'bg'			=> $xdstickers['bestseller']['bg'],
								'color'			=> $xdstickers['bestseller']['color'],
								'status'		=> $xdstickers['bestseller']['status'],
							);
							$data['xdstickers'][] = array(
								'id'			=> 'xdsticker_novelty',
								'bg'			=> $xdstickers['novelty']['bg'],
								'color'			=> $xdstickers['novelty']['color'],
								'status'		=> $xdstickers['novelty']['status'],
							);
							$data['xdstickers'][] = array(
								'id'			=> 'xdsticker_last',
								'bg'			=> $xdstickers['last']['bg'],
								'color'			=> $xdstickers['last']['color'],
								'status'		=> $xdstickers['last']['status'],
							);
							$data['xdstickers'][] = array(
								'id'			=> 'xdsticker_freeshipping',
								'bg'			=> $xdstickers['freeshipping']['bg'],
								'color'			=> $xdstickers['freeshipping']['color'],
								'status'		=> $xdstickers['freeshipping']['status'],
							);

							if (isset($xdstickers['stock']) && !empty($xdstickers['stock'])) {
								foreach($xdstickers['stock'] as $key => $value) {
									if (isset($value['status']) && $value['status'] == '1') {
										$data['xdstickers'][] = array(
											'id'			=> 'xdsticker_stock_' . $key,
											'bg'			=> $value['bg'],
											'color'			=> $value['color'],
											'status'		=> $value['status'],
										);
									}
								}
							}

							// CUSTOM stickers
							$this->load->model('extension/module/xdstickers');
							$custom_xdstickers = $this->model_extension_module_xdstickers->getCustomXDStickers();
							if (!empty($custom_xdstickers)) {
								foreach ($custom_xdstickers as $custom_xdsticker) {
									$custom_sticker_id = 'xdsticker_' . $custom_xdsticker['xdsticker_id'];
									$data['xdstickers'][] = array(
										'id'			=> $custom_sticker_id,
										'bg'			=> $custom_xdsticker['bg_color'],
										'color'			=> $custom_xdsticker['color_color'],
										'status'		=> $custom_xdsticker['status'],
									);
								}
							}
						}
					// XD Stickers end
				

        $data['smca_form_data']         = (array)$this->config->get('ocdev_smart_cart_form_data');
        $data['smca_store_id']          = (int)$this->config->get('config_store_id');
        $data['smca_customer_group_id'] = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');
      
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}


					//microdatapro 7.5 start - 1 - main
					$data['tc_og'] = $this->document->getTc_og();
					$data['tc_og_prefix'] = $this->document->getTc_og_prefix();
					$microdatapro_main_flag = 1;
					//microdatapro 7.5 end - 1 - main
					
		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');


					//microdatapro 7.5 start - 2 - extra
					if(!isset($microdatapro_main_flag)){
						$data['tc_og'] = $this->document->getTc_og();
						$data['tc_og_prefix'] = $this->document->getTc_og_prefix();
					}
					//microdatapro 7.5 end - 2 - extra
					
		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');

				$data['config_viber_tel'] = $this->config->get('config_viber_tel');
				$data['config_whatsapp_tel'] = $this->config->get('config_whatsapp_tel');
			
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}


			$megamenu_setting = $this->config->get('megamenu_setting');
			
			if($megamenu_setting['status']=='1'){
				$data['megamenu_status']=true;
				$data['menuvh'] = $this->load->controller('common/menuvh');
			} else { 
				$data['megamenu_status']=false;
			}
			
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
