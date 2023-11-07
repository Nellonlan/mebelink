<?php
class ControllerExtensionModuleSTestimonial extends Controller {
	private $error = array(); 
	
	public function index() {  
		$this->load->language('extension/module/s_testimonial');
		
		$this->load->model('catalog/s_testimonial');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('s_testimonial', $this->request->post);
			
			$this->model_catalog_s_testimonial->editTestimonialUrlAlias($this->request->post['s_testimonial_keyword']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}
		
		$data['token'] = $this->session->data['token'];
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_description'] = $this->language->get('tab_description');
		$data['tab_form'] = $this->language->get('tab_form');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_seo'] = $this->language->get('tab_seo');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_language_all'] = $this->language->get('text_language_all');
		$data['text_language_select'] = $this->language->get('text_language_select');
		$data['text_required'] = $this->language->get('text_required');
		$data['text_no_required'] = $this->language->get('text_no_required');
		$data['text_wysibb'] = $this->language->get('text_wysibb');
		$data['text_no_editor'] = $this->language->get('text_no_editor');
		$data['text_simple'] = $this->language->get('text_simple');
		$data['text_accordeon'] = $this->language->get('text_accordeon');
		$data['text_top'] = $this->language->get('text_top');
		$data['text_bottom'] = $this->language->get('text_bottom');
		$data['text_keyword'] = $this->language->get('text_keyword');
		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_link_order'] = $this->language->get('entry_link_order');
		$data['entry_guest'] = $this->language->get('entry_guest');
		$data['entry_all_store'] = $this->language->get('entry_all_store');
		$data['entry_mail'] = $this->language->get('entry_mail');
		$data['entry_moderation'] = $this->language->get('entry_moderation');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_field'] = $this->language->get('entry_field');
		$data['entry_cut'] = $this->language->get('entry_cut');
		$data['entry_text_limit'] = $this->language->get('entry_text_limit');
		$data['entry_title_testimonial'] = $this->language->get('entry_title_testimonial');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_editor'] = $this->language->get('entry_editor');
		$data['entry_smile_theme'] = $this->language->get('entry_smile_theme');
		$data['entry_form'] = $this->language->get('entry_form');
		$data['entry_form_position'] = $this->language->get('entry_form_position');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_good'] = $this->language->get('entry_good');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_upload_avatar'] = $this->language->get('entry_upload_avatar');
		$data['entry_upload_image'] = $this->language->get('entry_upload_image');
		$data['entry_avatar'] = $this->language->get('entry_avatar');
		$data['entry_avatar_size'] = $this->language->get('entry_avatar_size');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_popup_image_size'] = $this->language->get('entry_popup_image_size');
		$data['entry_thumbnail_image_size'] = $this->language->get('entry_thumbnail_image_size');
		$data['entry_captcha'] = $this->language->get('entry_captcha');
		$data['entry_avatar'] = $this->language->get('entry_avatar');
		$data['entry_avatar_size'] = $this->language->get('entry_avatar_size');
		$data['entry_avatar_info'] = $this->language->get('entry_avatar_info');
		$data['entry_thumbnail'] = $this->language->get('entry_thumbnail');
		$data['entry_image_limit'] = $this->language->get('entry_image_limit');
		$data['entry_thumbnail_info'] = $this->language->get('entry_thumbnail_info');
		$data['entry_thumb'] = $this->language->get('entry_thumb');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_update'] = $this->language->get('button_update');
		
		$data['update'] = $this->model_catalog_s_testimonial->getOldTable();
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}
		
		if (isset($this->error['text_limit'])) {
			$data['error_text_limit'] = $this->error['text_limit'];
		} else {
			$data['error_text_limit'] = '';
		}
		
		if (isset($this->error['image_limit'])) {
			$data['error_image_limit'] = $this->error['image_limit'];
		} else {
			$data['error_image_limit'] = '';
		}
		
		if (isset($this->error['upload_avatar_width'])) {
			$data['error_upload_avatar_width'] = $this->error['upload_avatar_width'];
		} else {
			$data['error_upload_avatar_width'] = '';
		}

		if (isset($this->error['upload_avatar_height'])) {
			$data['error_upload_avatar_height'] = $this->error['upload_avatar_height'];
		} else {
			$data['error_upload_avatar_height'] = '';
		}
		
		if (isset($this->error['upload_image_width'])) {
			$data['error_upload_image_width'] = $this->error['upload_image_width'];
		} else {
			$data['error_upload_image_width'] = '';
		}

		if (isset($this->error['upload_image_height'])) {
			$data['error_upload_image_height'] = $this->error['upload_image_height'];
		} else {
			$data['error_upload_image_height'] = '';
		}
		
		if (isset($this->error['avatar_width'])) {
			$data['error_avatar_width'] = $this->error['avatar_width'];
		} else {
			$data['error_avatar_width'] = '';
		}

		if (isset($this->error['avatar_height'])) {
			$data['error_avatar_height'] = $this->error['avatar_height'];
		} else {
			$data['error_avatar_height'] = '';
		}
		
		if (isset($this->error['avatar_info_width'])) {
			$data['error_avatar_info_width'] = $this->error['avatar_info_width'];
		} else {
			$data['error_avatar_info_width'] = '';
		}

		if (isset($this->error['avatar_info_height'])) {
			$data['error_avatar_info_height'] = $this->error['avatar_info_height'];
		} else {
			$data['error_avatar_info_height'] = '';
		}
		
		if (isset($this->error['thumbnail_width'])) {
			$data['error_thumbnail_width'] = $this->error['thumbnail_width'];
		} else {
			$data['error_thumbnail_width'] = '';
		}

		if (isset($this->error['thumbnail_height'])) {
			$data['error_thumbnail_height'] = $this->error['thumbnail_height'];
		} else {
			$data['error_thumbnail_height'] = '';
		}
		
		if (isset($this->error['thumbnail_info_width'])) {
			$data['error_thumbnail_info_width'] = $this->error['thumbnail_info_width'];
		} else {
			$data['error_thumbnail_info_width'] = '';
		}

		if (isset($this->error['thumbnail_info_height'])) {
			$data['error_thumbnail_info_height'] = $this->error['thumbnail_info_height'];
		} else {
			$data['error_thumbnail_info_height'] = '';
		}
		
		if (isset($this->error['thumb_width'])) {
			$data['error_thumb_width'] = $this->error['thumb_width'];
		} else {
			$data['error_thumb_width'] = '';
		}

		if (isset($this->error['thumb_height'])) {
			$data['error_thumb_height'] = $this->error['thumb_height'];
		} else {
			$data['error_thumb_height'] = '';
		}
		
		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/s_testimonial', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/s_testimonial', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['s_testimonial_status'])) {
			$data['s_testimonial_status'] = $this->request->post['s_testimonial_status'];
		} else {
			$data['s_testimonial_status'] = $this->config->get('s_testimonial_status');
		}
		
		if (isset($this->request->post['s_testimonial_link'])) {
			$data['s_testimonial_link'] = $this->request->post['s_testimonial_link'];
		} else {
			$data['s_testimonial_link'] = $this->config->get('s_testimonial_link');
		}
		
		if (isset($this->request->post['s_testimonial_link_order'])) {
			$data['s_testimonial_link_order'] = $this->request->post['s_testimonial_link_order'];
		} else {
			$data['s_testimonial_link_order'] = $this->config->get('s_testimonial_link_order');
		}
		
		if (isset($this->request->post['s_testimonial_guest'])) {
			$data['s_testimonial_guest'] = $this->request->post['s_testimonial_guest'];
		} else {
			$data['s_testimonial_guest'] = $this->config->get('s_testimonial_guest');
		}
		
		if (isset($this->request->post['s_testimonial_all_store'])) {
			$data['s_testimonial_all_store'] = $this->request->post['s_testimonial_all_store'];
		} else {
			$data['s_testimonial_all_store'] = $this->config->get('s_testimonial_all_store');
		}

		if (isset($this->request->post['s_testimonial_mail'])) {
			$data['s_testimonial_mail'] = $this->request->post['s_testimonial_mail'];
		} else {
			$data['s_testimonial_mail'] = $this->config->get('s_testimonial_mail');
		}
		
		if (isset($this->request->post['s_testimonial_moderation'])) {
			$data['s_testimonial_moderation'] = $this->request->post['s_testimonial_moderation'];
		} else {
			$data['s_testimonial_moderation'] = $this->config->get('s_testimonial_moderation');
		}
		
		if (isset($this->request->post['s_testimonial_language'])) {
			$data['s_testimonial_language'] = $this->request->post['s_testimonial_language'];
		} else {
			$data['s_testimonial_language'] = $this->config->get('s_testimonial_language');
		}
		
		if (isset($this->request->post['s_testimonial_date_added'])) {
			$data['s_testimonial_date_added'] = $this->request->post['s_testimonial_date_added'];
		} else {
			$data['s_testimonial_date_added'] = $this->config->get('s_testimonial_date_added');
		}
		
		if (isset($this->request->post['s_testimonial_limit'])) {
			$data['s_testimonial_limit'] = $this->request->post['s_testimonial_limit'];
		} elseif ($this->config->get('s_testimonial_limit')) {
			$data['s_testimonial_limit'] = $this->config->get('s_testimonial_limit');
		} else {
			$data['s_testimonial_limit'] = '10,20,30,40,50';
		}
		
		if (isset($this->request->post['s_testimonial_field'])) {
			$data['s_testimonial_field'] = $this->request->post['s_testimonial_field'];
		} else {
			$data['s_testimonial_field'] = $this->config->get('s_testimonial_field');
		}
		
		if (isset($this->request->post['s_testimonial_cut'])) {
			$data['s_testimonial_cut'] = $this->request->post['s_testimonial_cut'];
		} else {
			$data['s_testimonial_cut'] = $this->config->get('s_testimonial_cut');
		}
		
		if (isset($this->request->post['s_testimonial_text_limit'])) {
			$data['s_testimonial_text_limit'] = $this->request->post['s_testimonial_text_limit'];
		} elseif ($this->config->get('s_testimonial_text_limit')) {
			$data['s_testimonial_text_limit'] = $this->config->get('s_testimonial_text_limit');
		} else {
			$data['s_testimonial_text_limit'] = 500;
		}
		
		if (isset($this->request->post['s_testimonial_editor'])) {
			$data['s_testimonial_editor'] = $this->request->post['s_testimonial_editor'];
		} else {
			$data['s_testimonial_editor'] = $this->config->get('s_testimonial_editor');
		}
		
		if (isset($this->request->post['s_testimonial_smile_theme'])) {
			$data['s_testimonial_smile_theme'] = $this->request->post['s_testimonial_smile_theme'];
		} else {
			$data['s_testimonial_smile_theme'] = $this->config->get('s_testimonial_smile_theme');
		}
		
		$folder = DIR_IMAGE . 'catalog/s_testimonial/smile/';

		$smile_themes = array_diff(scandir($folder), array('..', '.'));
		$data['smile_themes'] = array();
		
		if ($smile_themes) {
			foreach ($smile_themes as $smile_theme) {
				if (is_dir($folder . $smile_theme)) {
					$data['smile_themes'][] = $smile_theme;
				}
			}
		}
		
		if (isset($this->request->post['s_testimonial_form'])) {
			$data['s_testimonial_form'] = $this->request->post['s_testimonial_form'];
		} else {
			$data['s_testimonial_form'] = $this->config->get('s_testimonial_form');
		}
		
		if (isset($this->request->post['s_testimonial_form_position'])) {
			$data['s_testimonial_form_position'] = $this->request->post['s_testimonial_form_position'];
		} else {
			$data['s_testimonial_form_position'] = $this->config->get('s_testimonial_form_position');
		}
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['s_testimonial_description'])) {
			$data['s_testimonial_description'] = $this->request->post['s_testimonial_description'];
		} else {
			$data['s_testimonial_description'] = $this->config->get('s_testimonial_description');
		}
		
		if (isset($this->request->post['s_testimonial_title'])) {
			$data['s_testimonial_title'] = $this->request->post['s_testimonial_title'];
		} else {
			$data['s_testimonial_title'] = $this->config->get('s_testimonial_title');
		}
		
		if (isset($this->request->post['s_testimonial_city'])) {
			$data['s_testimonial_city'] = $this->request->post['s_testimonial_city'];
		} else {
			$data['s_testimonial_city'] = $this->config->get('s_testimonial_city');
		}
		
		if (isset($this->request->post['s_testimonial_name'])) {
			$data['s_testimonial_name'] = $this->request->post['s_testimonial_name'];
		} else {
			$data['s_testimonial_name'] = $this->config->get('s_testimonial_name');
		}
		
		if (isset($this->request->post['s_testimonial_email'])) {
			$data['s_testimonial_email'] = $this->request->post['s_testimonial_email'];
		} else {
			$data['s_testimonial_email'] = $this->config->get('s_testimonial_email');
		}
		
		if (isset($this->request->post['s_testimonial_text'])) {
			$data['s_testimonial_text'] = $this->request->post['s_testimonial_text'];
		} else {
			$data['s_testimonial_text'] = $this->config->get('s_testimonial_text');
		}
		
		if (isset($this->request->post['s_testimonial_good'])) {
			$data['s_testimonial_good'] = $this->request->post['s_testimonial_good'];
		} else {
			$data['s_testimonial_good'] = $this->config->get('s_testimonial_good');
		}
		
		if (isset($this->request->post['s_testimonial_bad'])) {
			$data['s_testimonial_bad'] = $this->request->post['s_testimonial_bad'];
		} else {
			$data['s_testimonial_bad'] = $this->config->get('s_testimonial_bad');
		}
		
		if (isset($this->request->post['s_testimonial_rating'])) {
			$data['s_testimonial_rating'] = $this->request->post['s_testimonial_rating'];
		} else {
			$data['s_testimonial_rating'] = $this->config->get('s_testimonial_rating');
		}
		
		if (isset($this->request->post['s_testimonial_avatar'])) {
			$data['s_testimonial_avatar'] = $this->request->post['s_testimonial_avatar'];
		} else {
			$data['s_testimonial_avatar'] = $this->config->get('s_testimonial_avatar');
		}
		
		if (isset($this->request->post['s_testimonial_image'])) {
			$data['s_testimonial_image'] = $this->request->post['s_testimonial_image'];
		} else {
			$data['s_testimonial_image'] = $this->config->get('s_testimonial_image');
		}
		
		if (isset($this->request->post['s_testimonial_image_limit'])) {
			$data['s_testimonial_image_limit'] = $this->request->post['s_testimonial_image_limit'];
		} elseif ($this->config->get('s_testimonial_image_limit')) {
			$data['s_testimonial_image_limit'] = $this->config->get('s_testimonial_image_limit');
		} else {
			$data['s_testimonial_image_limit'] = 5;
		}
		
		if (isset($this->request->post['s_testimonial_captcha'])) {
			$data['s_testimonial_captcha'] = $this->request->post['s_testimonial_captcha'];
		} else {
			$data['s_testimonial_captcha'] = $this->config->get('s_testimonial_captcha');
		}
		
		if (isset($this->request->post['s_testimonial_upload_avatar_width'])) {
			$data['s_testimonial_upload_avatar_width'] = $this->request->post['s_testimonial_upload_avatar_width'];
		} elseif ($this->config->get('s_testimonial_upload_avatar_width')) {
			$data['s_testimonial_upload_avatar_width'] = $this->config->get('s_testimonial_upload_avatar_width');
		} else {
			$data['s_testimonial_upload_avatar_width'] = 1440;
		}
		
		if (isset($this->request->post['s_testimonial_upload_avatar_height'])) {
			$data['s_testimonial_upload_avatar_height'] = $this->request->post['s_testimonial_upload_avatar_height'];
		} elseif ($this->config->get('s_testimonial_upload_avatar_height')) {
			$data['s_testimonial_upload_avatar_height'] = $this->config->get('s_testimonial_upload_avatar_height');
		} else {
			$data['s_testimonial_upload_avatar_height'] = 900;
		}
		
		if (isset($this->request->post['s_testimonial_upload_image_width'])) {
			$data['s_testimonial_upload_image_width'] = $this->request->post['s_testimonial_upload_image_width'];
		} elseif ($this->config->get('s_testimonial_upload_image_width')) {
			$data['s_testimonial_upload_image_width'] = $this->config->get('s_testimonial_upload_image_width');
		} else {
			$data['s_testimonial_upload_image_width'] = 1440;
		}
		
		if (isset($this->request->post['s_testimonial_upload_image_height'])) {
			$data['s_testimonial_upload_image_height'] = $this->request->post['s_testimonial_upload_image_height'];
		} elseif ($this->config->get('s_testimonial_upload_image_height')) {
			$data['s_testimonial_upload_image_height'] = $this->config->get('s_testimonial_upload_image_height');
		} else {
			$data['s_testimonial_upload_image_height'] = 900;
		}
		
		if (isset($this->request->post['s_testimonial_avatar_width'])) {
			$data['s_testimonial_avatar_width'] = $this->request->post['s_testimonial_avatar_width'];
		} elseif ($this->config->get('s_testimonial_avatar_width')) {
			$data['s_testimonial_avatar_width'] = $this->config->get('s_testimonial_avatar_width');
		} else {
			$data['s_testimonial_avatar_width'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_avatar_height'])) {
			$data['s_testimonial_avatar_height'] = $this->request->post['s_testimonial_avatar_height'];
		} elseif ($this->config->get('s_testimonial_avatar_height')) {
			$data['s_testimonial_avatar_height'] = $this->config->get('s_testimonial_avatar_height');
		} else {
			$data['s_testimonial_avatar_height'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_avatar_info_width'])) {
			$data['s_testimonial_avatar_info_width'] = $this->request->post['s_testimonial_avatar_info_width'];
		} elseif ($this->config->get('s_testimonial_avatar_info_width')) {
			$data['s_testimonial_avatar_info_width'] = $this->config->get('s_testimonial_avatar_info_width');
		} else {
			$data['s_testimonial_avatar_info_width'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_avatar_info_height'])) {
			$data['s_testimonial_avatar_info_height'] = $this->request->post['s_testimonial_avatar_info_height'];
		} elseif ($this->config->get('s_testimonial_avatar_info_height')) {
			$data['s_testimonial_avatar_info_height'] = $this->config->get('s_testimonial_avatar_info_height');
		} else {
			$data['s_testimonial_avatar_info_height'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_thumbnail_width'])) {
			$data['s_testimonial_thumbnail_width'] = $this->request->post['s_testimonial_thumbnail_width'];
		} elseif ($this->config->get('s_testimonial_thumbnail_width')) {
			$data['s_testimonial_thumbnail_width'] = $this->config->get('s_testimonial_thumbnail_width');
		} else {
			$data['s_testimonial_thumbnail_width'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_thumbnail_height'])) {
			$data['s_testimonial_thumbnail_height'] = $this->request->post['s_testimonial_thumbnail_height'];
		} elseif ($this->config->get('s_testimonial_thumbnail_height')) {
			$data['s_testimonial_thumbnail_height'] = $this->config->get('s_testimonial_thumbnail_height');
		} else {
			$data['s_testimonial_thumbnail_height'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_thumbnail_info_width'])) {
			$data['s_testimonial_thumbnail_info_width'] = $this->request->post['s_testimonial_thumbnail_info_width'];
		} elseif ($this->config->get('s_testimonial_thumbnail_info_width')) {
			$data['s_testimonial_thumbnail_info_width'] = $this->config->get('s_testimonial_thumbnail_info_width');
		} else {
			$data['s_testimonial_thumbnail_info_width'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_thumbnail_info_height'])) {
			$data['s_testimonial_thumbnail_info_height'] = $this->request->post['s_testimonial_thumbnail_info_height'];
		} elseif ($this->config->get('s_testimonial_thumbnail_info_height')) {
			$data['s_testimonial_thumbnail_info_height'] = $this->config->get('s_testimonial_thumbnail_info_height');
		} else {
			$data['s_testimonial_thumbnail_info_height'] = 100;
		}
		
		if (isset($this->request->post['s_testimonial_thumb_width'])) {
			$data['s_testimonial_thumb_width'] = $this->request->post['s_testimonial_thumb_width'];
		} elseif ($this->config->get('s_testimonial_thumb_width')) {
			$data['s_testimonial_thumb_width'] = $this->config->get('s_testimonial_thumb_width');
		} else {
			$data['s_testimonial_thumb_width'] = 500;
		}
		
		if (isset($this->request->post['s_testimonial_thumb_height'])) {
			$data['s_testimonial_thumb_height'] = $this->request->post['s_testimonial_thumb_height'];
		} elseif ($this->config->get('s_testimonial_thumb_height')) {
			$data['s_testimonial_thumb_height'] = $this->config->get('s_testimonial_thumb_height');
		} else {
			$data['s_testimonial_thumb_height'] = 500;
		}
		
		if (isset($this->request->post['s_testimonial_keyword'])) {
			$data['s_testimonial_keyword'] = $this->request->post['s_testimonial_keyword'];
		} else {
			$data['s_testimonial_keyword'] = $this->config->get('s_testimonial_keyword');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/s_testimonial', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/s_testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['s_testimonial_limit']) {
			$this->error['limit'] = $this->language->get('error_limit');
		}
		
		if (!$this->request->post['s_testimonial_text_limit']) {
			$this->error['text_limit'] = $this->language->get('error_limit');
		}
		
		if (!$this->request->post['s_testimonial_image_limit']) {
			$this->error['image_limit'] = $this->language->get('error_limit');
		}
		
		if (!$this->request->post['s_testimonial_upload_avatar_width']) {
			$this->error['upload_avatar_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_upload_avatar_height']) {
			$this->error['upload_avatar_height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['s_testimonial_upload_image_width']) {
			$this->error['upload_image_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_upload_image_height']) {
			$this->error['upload_image_height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['s_testimonial_avatar_width']) {
			$this->error['avatar_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_avatar_height']) {
			$this->error['avatar_height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['s_testimonial_avatar_info_width']) {
			$this->error['avatar_info_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_avatar_info_height']) {
			$this->error['avatar_info_height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['s_testimonial_thumbnail_width']) {
			$this->error['thumbnail_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_thumbnail_height']) {
			$this->error['thumbnail_height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['s_testimonial_thumbnail_info_width']) {
			$this->error['popup_testimonial_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_thumbnail_info_height']) {
			$this->error['thumbnail_info_height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['s_testimonial_thumb_width']) {
			$this->error['thumb_width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['s_testimonial_thumb_height']) {
			$this->error['thumb_height'] = $this->language->get('error_height');
		}
		
		if (utf8_strlen($this->request->post['s_testimonial_keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['s_testimonial_keyword']);

			if ($url_alias_info && $url_alias_info['query'] != 'information/testimonial') {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}
	
	public function update_testimonials() {
		$this->load->language('extension/module/s_testimonial');
		
		$this->load->model('catalog/s_testimonial');
		$this->model_catalog_s_testimonial->updateTestimonials();
		
		$this->session->data['success'] = $this->language->get('text_update');
	}
	
	public function install() {
		$this->load->model('catalog/s_testimonial');
		$this->model_catalog_s_testimonial->createDatabaseTables();
	}
}