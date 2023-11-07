<?php
class ControllerExtensionModuleHttpmprodtc extends Controller {
	public function index($setting) {
		static $module = 0;
		$this->load->language('extension/module/httpmprodtc');

$data['class'] = $setting['class'];
$data['items'] = $setting['items'];
$data['prodview'] = $setting['prodview'];
$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
$this->document->addStyle('catalog/view/javascript/jquery/httpmprodtc.css');
$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
$this->document->addScript('catalog/view/javascript/jquery/httpmprodtc.js');


		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_more'] = $this->language->get('text_more');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
		$data['tabs'] = array();
		$products = '';
		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}
		$name = $setting['name'];
		$i=0;
		foreach ($setting['tabs'] as $tab) {
		$module++;
		$i++;
		if ($i == 1) {
			$act = ' active';
		} else {
			$act = '';
		}
		$name = str_replace('//'.$tab['id'].'/', '<span class="openpctab'.$act.'" data="prodcarousel'.$module.'-'.$tab['id'].'">'.$tab['tname'].'</span>', $name);
		$products = array();
		if ($tab['tab'][0] == 1 && !empty($tab['product'])) {
			$products = array_slice($tab['product'], 0, (int)$setting['limit']);
		} else if ($tab['tab'][0] == 2) {
			if (!$tab['category']) {
				$tab['category'] = 0;
			}
			$filter_data = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'filter_category_id' => $tab['category'],
				'limit' => $setting['limit']
			);
			$products = $this->model_catalog_product->getProducts($filter_data);
		} else if ($tab['tab'][0] == 4) {
			$filter_data = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'limit' => $setting['limit']
			);
			$products = $this->model_catalog_product->getProductSpecials($filter_data);
		} else if ($tab['tab'][0] == 5) {
			$filter_data = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'limit' => $setting['limit']
			);
			$products = $this->model_catalog_product->getProducts($filter_data);
		} else if ($tab['tab'][0] == 6) {
			$products = $this->model_catalog_product->getPopularProducts($setting['limit']);
		}
		
		$prods = array();
		if ($products) {
			$i=0;
			foreach ($products as $product) {
				$i++;
				if ($tab['tab'][0] == 1 && !empty($tab['product'])) {
					$product_info = $this->model_catalog_product->getProduct($product);
				} else {
					$product_info = $product;
				}
				if ($setting['height'] && $setting['width']) {
					$ih = $setting['height'];
					$iw = $setting['width'];
				} else {
					$ih = $this->config->get($this->config->get('config_theme') . '_image_product_height');
					$iw = $this->config->get($this->config->get('config_theme') . '_image_product_width');
				}

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $iw, $ih);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $iw, $ih);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					} else {
						$price = false;
					}
					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						$percent = 100 - ($product_info['special'] * 100 / $product_info['price']);
					} else {
						$special = false;
						$percent = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					if ($product_info['quantity'] <= 0) {
						$stock = $product_info['stock_status'];
					} elseif ($this->config->get('config_stock_display')) {
						$stock = $product_info['quantity'];
					} else {
						$stock = $this->language->get('text_instock');
					}

					$prods[] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'manufacturer'        => $product_info['manufacturer'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'quantity'    => $product_info['quantity'],
						'stock'    => $stock,
						'percent'     => round($percent),
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
			unset($products);
			$data['tabs'][] = array(
				'id' => $tab["id"],
				'module' => $module,
				'product' => $prods,
			);
			unset($prods);
		}
		}
		if ($setting['displaytitle'] == '1') {
			$data['heading_title'] = $name;
		} else {
			$data['heading_title'] = false;
		}

		if ($data['tabs']) {
			return $this->load->view('extension/module/httpmprodtc', $data);
		}
	}
}