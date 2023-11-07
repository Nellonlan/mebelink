<?php
class ControllerCommonFooter extends Controller {
	public function index() {

        $data['smca_form_data']         = (array)$this->config->get('ocdev_smart_cart_form_data');
        $data['smca_store_id']          = (int)$this->config->get('config_store_id');
        $data['smca_customer_group_id'] = ($this->customer->isLogged()) ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');
      
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();




        $this->load->model('localisation/language');
        $data['language_code'] = $this->session->data['language'];
        $data['language_id'] = $this->model_localisation_language->getCookieLanguage($data['language_code']);

        $cookies_textmsgtitle = "cookies_textmsgtitle_" . $data['language_id'];
        $cookies_textmsg = "cookies_textmsg_" . $data['language_id'];
        $cookies_textbtn = "cookies_textbtn_" . $data['language_id'];

        $data['cookies_textmsgtitle'] = $this->config->get($cookies_textmsgtitle);
        $data['cookies_textmsg'] = $this->config->get($cookies_textmsg);
        $data['cookies_textbtn'] = $this->config->get($cookies_textbtn);

        $data['policy_page_id'] = $this->config->get('cookies_infoid');
        $data['cookies_version'] = $this->config->get('cookies_version');
        $data['cookies_key'] = "spekaerpp_ver" . $data['cookies_version'];
        $data['cookies_visible'] = 1;
        $data['cookies_status'] = $this->config->get('cookies_status');
        $data['cookies_targetblank'] = $this->config->get('cookies_targetblank');


        if(empty($_COOKIE[$data['cookies_key']])) {
            setcookie($data['cookies_key'], 0, time() + (86400 * 30), "/");
        } else {
            if($_COOKIE[$data['cookies_key']] == 1) {
                $data['cookies_visible'] = 0;
            } else {
                $data['cookies_visible'] = 0;
            }
        }

        $cookies_infopage = $this->model_catalog_information->getCookies($data['policy_page_id']);

        foreach ($cookies_infopage as $result) {
            $data['cookies_informations'][] = array(
                'title' => $result['title'],
                'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
            );
        }
        
        

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}


					//microdatapro 7.5 start - 1 - main
					$data['microdatapro'] = $this->load->controller('extension/module/microdatapro/company');
					$microdatapro_main_flag = 1;
					//microdatapro 7.5 end - 1 - main
					

				if ($this->config->get('s_testimonial_status') && $this->config->get('s_testimonial_link')) {
					$this->load->language('common/testimonial');
					
					$testimonial_description = $this->config->get('s_testimonial_description');
					$testimonial_language_id = $this->config->get('config_language_id');
				
					if ($testimonial_description[$testimonial_language_id]['title']) {
						$data['testimonial_title'] = $testimonial_description[$testimonial_language_id]['title'];
					} else {
						$data['testimonial_title'] = $this->language->get('text_testimonial');
					}

					$data['testimonial'] = $this->url->link('information/testimonial');
				}
			
		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);


					//microdatapro 7.5 start - 2 - extra
					if(!isset($microdatapro_main_flag)){
						$data['microdatapro'] = $this->load->controller('extension/module/microdatapro/company');
					}
					//microdatapro 7.5 end - 2 - extra
					
		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
