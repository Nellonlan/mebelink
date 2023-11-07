<?php
class ControllerExtensionModuleCookies extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/cookies');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cookies', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['text_general'] = $this->language->get('text_general');
        $data['text_text'] = $this->language->get('text_text');

		$data['entry_txtnoticetitle'] = $this->language->get('entry_txtnoticetitle');
		$data['entry_txtnoticetitle_help'] = $this->language->get('entry_txtnoticetitle_help');
		$data['entry_txtnotice'] = $this->language->get('entry_txtnotice');
		$data['entry_txtnotice_help'] = $this->language->get('entry_txtnotice_help');
		$data['entry_txtinfoid'] = $this->language->get('entry_txtinfoid');
		$data['entry_txtinfoid_help'] = $this->language->get('entry_txtinfoid_help');
		$data['entry_txtbnt'] = $this->language->get('entry_txtbnt');
		$data['entry_txtbnt_help'] = $this->language->get('entry_txtbnt_help');
		$data['entry_txttblank'] = $this->language->get('entry_txttblank');
		$data['entry_txttblank_help'] = $this->language->get('entry_txttblank_help');
		$data['entry_version'] = $this->language->get('entry_version');
		$data['entry_version_help'] = $this->language->get('entry_version_help');


		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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
			'href' => $this->url->link('extension/module/cookies', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/cookies', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if (isset($this->request->post['cookies_status'])) {
            $data['cookies_status'] = $this->request->post['cookies_status'];
        } else {
            $data['cookies_status'] = $this->config->get('cookies_status');
        }

        if (isset($this->request->post['cookies_infoid'])) {
            $data['cookies_infoid'] = $this->request->post['cookies_infoid'];
        } else {
            $data['cookies_infoid'] = $this->config->get('cookies_infoid');
        }

        if (isset($this->request->post['cookies_version'])) {
            $data['cookies_version'] = $this->request->post['cookies_version'];
        } elseif ($this->config->has('cookies_version')) {
            $data['cookies_version'] = $this->config->get('cookies_version');
        } else {
            $data['cookies_version'] = 1;
        }

        if (isset($this->request->post['cookies_targetblank'])) {
            $data['cookies_targetblank'] = $this->request->post['cookies_targetblank'];
        } else {
            $data['cookies_targetblank'] = $this->config->get('cookies_targetblank');
        }

        $this->load->model('extension/module/cookies');
        $all_info_pages = $this->model_extension_module_cookies->getAllInfoPages();

        foreach ($all_info_pages as $resulti) {
            $data['all_info_pages'][] = array(
                'id' => $resulti['information_id'],
                'name' => $resulti['title']
            );
        }


        $this->load->model('localisation/language');
        $results = $this->model_localisation_language->getLanguages();

        $data['cookies_textmsg'] = array();
        $data['cookies_textbtn'] = array();
        $data['languages'] = array();

        foreach ($results as $result) {
            $data['languages'][] = array(
                'name'  => $result['name'],
                'code'  => $result['code'],
                'language_id'  => $result['language_id'],
                'image' => $result['image']
            );

            $cookies_textmsgtitle = "cookies_textmsgtitle_" . $result['language_id'];
            $cookies_textmsg = "cookies_textmsg_" . $result['language_id'];
            $cookies_textbtn = "cookies_textbtn_" . $result['language_id'];

            if (isset($this->request->post[$cookies_textmsgtitle])) {
                $data['cookies_textmsgtitle_' . $result['language_id']] = $this->request->post[$cookies_textmsgtitle];
            } else {
                $data['cookies_textmsgtitle_' . $result['language_id']] = $this->config->get($cookies_textmsgtitle);
            }

            if (isset($this->request->post[$cookies_textmsg])) {
                $data['cookies_textmsg_' . $result['language_id']] = $this->request->post[$cookies_textmsg];
            } else {
                $data['cookies_textmsg_' . $result['language_id']] = $this->config->get($cookies_textmsg);
            }

            if (isset($this->request->post[$cookies_textbtn])) {
                $data['cookies_textbtn_' . $result['language_id']] = $this->request->post[$cookies_textbtn];
            } else {
                $data['cookies_textbtn_' . $result['language_id']] = $this->config->get($cookies_textbtn);
            }
        }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/cookies', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/cookies')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}