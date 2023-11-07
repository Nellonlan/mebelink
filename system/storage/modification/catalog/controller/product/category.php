<?php
class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {

			if ($category_info['meta_title']) {
				$this->document->setTitle($category_info['meta_title']);
			} else {
				$this->document->setTitle($category_info['name']);
			}

			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			if ($category_info['meta_h1']) {
				$data['heading_title'] = $category_info['meta_h1'];
			} else {
				$data['heading_title'] = $category_info['name'];
			}

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');

		$this->load->language('product/extra_description_category');
		$data['text_rm_sh_description'] = $this->language->get('text_rm_sh_description');
		$data['text_rm_hd_description'] = $this->language->get('text_rm_hd_description');
		$data['text_rmm_sh_description'] = $this->language->get('text_rmm_sh_description');
		$data['text_rmm_hd_description'] = $this->language->get('text_rmm_hd_description');
	  
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);


		if ($category_info['hd_description']) {
		if (!isset($this->request->get['page']) || $this->request->get['page'] == 1) {
	  
			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
				$this->document->setOgImage($data['thumb']);
			} else {
				$data['thumb'] = '';
			}

		  }else{
			$data['thumb'] = '';
		  }
		}else{
		  if ($category_info['image']) {
			$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
		  } else {
			$data['thumb'] = '';
		  }
		}
	  

			
		$data['rm_description'] = $category_info['rm_description'];
		$data['ht_description'] = $category_info['ht_description'];
		$data['ht_ext_description'] = $category_info['ht_ext_description'];
		$data['rm_ext_description'] = $category_info['rm_ext_description'];
		$data['rmm_ext_description'] = $category_info['rmm_ext_description'];

		if ($category_info['hd_description']) {
		  if (!isset($this->request->get['page']) || $this->request->get['page'] == 1) {
			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
		  }else{
			$data['description'] = '';
		  }
		}else{
		  $data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
		}

		if ($category_info['hd_ext_description']) {
		  if (!isset($this->request->get['page']) || $this->request->get['page'] == 1) {
			$data['ext_description'] = html_entity_decode($category_info['ext_description'], ENT_QUOTES, 'UTF-8');
		  }else{
			$data['ext_description'] = '';
		  }
		}else{
		  $data['ext_description'] = html_entity_decode($category_info['ext_description'], ENT_QUOTES, 'UTF-8');
		}
	  
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);

			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 150, 150);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 150, 150);
				}
				
				$data['categories'][] = array(
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url),
					'thumb' => $image
				);
            
			}

			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);


			//Dream filter start
			$filter_data['rdrf'] = isset($this->request->get['rdrf']) ? $this->request->get['rdrf'] : array();
			//Dream filter end
			
			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}


					// XD Stickers start
						$this->load->model('setting/setting');
						$xdstickers = $this->config->get('xdstickers');
						$current_language_id = $this->config->get('config_language_id');
						$product_xdstickers = array();
						$data['xdstickers_position'] = ($xdstickers['position'] == '0') ? ' position_upleft' : ' position_upright';
						if ($xdstickers['status']) {
							if ($xdstickers['sale']['status'] == '1' && $special) {
								if ($xdstickers['sale']['discount_status'] == '1') {
									$sale_value = ceil(((float)$result['price'] - (float)$result['special']) / ((float)$result['price'] * 0.01));
									$sale_text = $xdstickers['sale']['text'][$current_language_id] . ' -' . strval($sale_value) . '%';
								} else {
									$sale_text = $xdstickers['sale']['text'][$current_language_id];
								}								
								$product_xdstickers[] = array(
									'id'			=> 'xdsticker_sale',
									'text'			=> $sale_text
								);
							}
							if ($xdstickers['bestseller']['status'] == '1') {
								$bestsellers = $this->model_catalog_product->getBestSellerProducts((int)$xdstickers['bestseller']['property']);
								foreach ($bestsellers as $bestseller) {
									if ($bestseller['product_id'] == $result['product_id']) {
										$product_xdstickers[] = array(
											'id'			=> 'xdsticker_bestseller',
											'text'			=> $xdstickers['bestseller']['text'][$current_language_id]
										);
									}
								}
							}
							if ($xdstickers['novelty']['status'] == '1') {
								if ((strtotime($result['date_added']) + intval($xdstickers['novelty']['property']) * 24 * 3600) > time()) {
									$product_xdstickers[] = array(
										'id'			=> 'xdsticker_novelty',
										'text'			=> $xdstickers['novelty']['text'][$current_language_id]
									);
								}
							}
							if ($xdstickers['last']['status'] == '1') {
								if ($result['quantity'] <= intval($xdstickers['last']['property']) && $result['quantity'] > 0) {
									$product_xdstickers[] = array(
										'id'			=> 'xdsticker_last',
										'text'			=> $xdstickers['last']['text'][$current_language_id]
									);
								}
							}
							if ($xdstickers['freeshipping']['status'] == '1') {
								if ((float)$result['special'] >= intval($xdstickers['freeshipping']['property'])) {
									$product_xdstickers[] = array(
										'id'			=> 'xdsticker_freeshipping',
										'text'			=> $xdstickers['freeshipping']['text'][$current_language_id]
									);
								} else if ((float)$result['price'] >= intval($xdstickers['freeshipping']['property'])) {
									$product_xdstickers[] = array(
										'id'			=> 'xdsticker_freeshipping',
										'text'			=> $xdstickers['freeshipping']['text'][$current_language_id]
									);
								}
							}

							// STOCK stickers
							if (isset($xdstickers['stock']) && !empty($xdstickers['stock'])) {
								foreach($xdstickers['stock'] as $key => $value) {
									if (isset($value['status']) && $value['status'] == '1' && $key == $result['stock_status_id'] && $result['quantity'] <= 0) {
										$product_xdstickers[] = array(
											'id'			=> 'xdsticker_stock_' . $key,
											'text'			=> $result['stock_status']
										);
									}
								}
							}

							// CUSTOM stickers
							$this->load->model('extension/module/xdstickers');
							$custom_xdstickers_id = $this->model_extension_module_xdstickers->getCustomXDStickersProduct($result['product_id']);
							if (!empty($custom_xdstickers_id)) {
								foreach ($custom_xdstickers_id as $custom_xdsticker_id) {
									$custom_xdsticker = $this->model_extension_module_xdstickers->getCustomXDSticker($custom_xdsticker_id['xdsticker_id']);
									$custom_xdsticker_text = json_decode($custom_xdsticker['text'], true);
									// var_dump($custom_xdsticker);
									if ($custom_xdsticker['status'] == '1') {
										$custom_sticker_class = 'xdsticker_' . $custom_xdsticker_id['xdsticker_id'];
										$product_xdstickers[] = array(
											'id'			=> $custom_sticker_class,
											'text'			=> $custom_xdsticker_text[$current_language_id]
										);
									}
								}
							}
						}
					// XD Stickers end
				
				$data['products'][] = array(

					'product_xdstickers'  => $product_xdstickers,
				
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => ($result['minimum'] > 0) ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			//Dream filter start
			if (isset($this->request->get['rdrf'])) {
				$url .= '&' . http_build_query(array('rdrf' => $this->request->get['rdrf']));
			}
			//Dream filter end
			
			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}


			//Dream filter start
			if (isset($this->request->get['rdrf'])) {
				$url .= '&' . http_build_query(array('rdrf' => $this->request->get['rdrf']));
			}
			//Dream filter end
			
			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			//Dream filter start
			if (isset($this->request->get['rdrf'])) {
				$url .= '&' . http_build_query(array('rdrf' => $this->request->get['rdrf']));
			}
			//Dream filter end
			

					//microdatapro 7.5 start - 1 - main
					$data['microdatapro_data'] = $category_info;
					$data_mpd = $data;
					$data_mpd['results'] = $results;
					$this->document->setTc_og($this->load->controller('extension/module/microdatapro/tc_og', $data_mpd));
					$this->document->setTc_og_prefix($this->load->controller('extension/module/microdatapro/tc_og_prefix'));
					$data['microdatapro'] = $this->load->controller('extension/module/microdatapro/category', $data_mpd);
					$microdatapro_main_flag = 1;
					//microdatapro 7.5 end - 1 - main
				
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');


			//Dream filter start
			if(!empty($this->request->get['rdf-ajax'])) {
				$rdr_tpl = 'category';


					//microdatapro 7.5 start - 2 - extra
					if(!isset($microdatapro_main_flag)){
						if(isset($category_info) && $category_info){
							$data['microdatapro_data'] = $category_info;
							$data_mpd = $data;
							$data_mpd['results'] = $results;
							$this->document->setTc_og($this->load->controller('extension/module/microdatapro/tc_og', $data_mpd));
							$this->document->setTc_og_prefix($this->load->controller('extension/module/microdatapro/tc_og_prefix'));
							$data['microdatapro'] = $this->load->controller('extension/module/microdatapro/category', $data_mpd);
						}
					}
					//microdatapro 7.5 end - 2 - extra
				
				$data['column_left'] = '';
				$data['column_right'] = '';
				$data['content_top'] = '';
				$data['content_bottom'] = '';
				$data['footer'] = '';
				$data['header'] = '';

				$html = '<div>' . $this->load->view('product/' . $rdr_tpl, $data) . '</div>';
				if(!empty($this->request->get['rdf-reload']) && !empty($this->request->get['rdf-module'])) {
					$this->load->model('extension/dream_filter');
					if($this->config->get('rdrf_sub_categories')) {
						$filter_data['filter_sub_category'] = 1;
					}
					$filters = empty($filter_data) ? array() : $this->model_extension_dream_filter->getFiltersJSON($filter_data, $this->request->get['rdf-module']);
					$output = json_encode(array(
						'html' => $html,
						'filters' => $filters
					));
					if(($json_error = json_last_error()) !== JSON_ERROR_NONE) {
						$output = 'JSON ERROR ' . $json_error;
					}
					//Отсылаем в ответ данные в формате json
					$this->response->addHeader('Content-Type: application/json; charset=utf-8');
					$this->response->setOutput($output);
				} else {
					$this->response->setOutput($html);
				}
				$this->response->output();
				exit;
			}
			//Dream filter end
			

					//microdatapro 7.5 start - 2 - extra
					if(!isset($microdatapro_main_flag)){
						if(isset($category_info) && $category_info){
							$data['microdatapro_data'] = $category_info;
							$data_mpd = $data;
							$data_mpd['results'] = $results;
							$this->document->setTc_og($this->load->controller('extension/module/microdatapro/tc_og', $data_mpd));
							$this->document->setTc_og_prefix($this->load->controller('extension/module/microdatapro/tc_og_prefix'));
							$data['microdatapro'] = $this->load->controller('extension/module/microdatapro/category', $data_mpd);
						}
					}
					//microdatapro 7.5 end - 2 - extra
				
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/category', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');


					//microdatapro 7.5 start - 2 - extra
					if(!isset($microdatapro_main_flag)){
						if(isset($category_info) && $category_info){
							$data['microdatapro_data'] = $category_info;
							$data_mpd = $data;
							$data_mpd['results'] = $results;
							$this->document->setTc_og($this->load->controller('extension/module/microdatapro/tc_og', $data_mpd));
							$this->document->setTc_og_prefix($this->load->controller('extension/module/microdatapro/tc_og_prefix'));
							$data['microdatapro'] = $this->load->controller('extension/module/microdatapro/category', $data_mpd);
						}
					}
					//microdatapro 7.5 end - 2 - extra
				
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
}
