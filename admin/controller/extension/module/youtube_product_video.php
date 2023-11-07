<?php

class ControllerExtensionModuleYouTubeProductVideo extends Controller {

    private $error = array();

    public function index() {
        $data = $this->load->language('extension/module/youtube_product_video');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('youtube_product_video', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

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
            'href' => $this->url->link('extension/module/youtube_product_video', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/youtube_product_video', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if (isset($this->request->post['youtube_product_video'])) {
            $data['youtube_product_video'] = $this->request->post['youtube_product_video'];
        } else {
            $youtube_product_video = $this->model_setting_setting->getSetting('youtube_product_video');
            $data['youtube_product_video'] = ( !empty( $youtube_product_video['youtube_product_video'] ) ) ? $youtube_product_video['youtube_product_video'] : $this->getDefaultSetting();
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/youtube_product_video', $data));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/youtube_product_video')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function install() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('youtube_product_video', $this->getDefaultSetting());

        $this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."youtube_product_video` ( `id` INT(15) NOT NULL AUTO_INCREMENT , `product_id` INT(15) NOT NULL, `product_video` varchar(255) NOT NULL, PRIMARY KEY (`id`)) ENGINE = MyISAM CHARSET=utf8 COLLATE utf8_general_ci;");
    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('youtube_product_video');
        $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."youtube_product_video`;");
    }

    private function getDefaultSetting() {
        return array(
            'youtube_product_video' => array(
                'youtube_product_video_output_type'          => 'button',
                'youtube_product_video_selector'             => '.tab-content',
                'youtube_product_video_position'             => 'before',
                'youtube_product_video_align'                => 'center',
                'youtube_product_video_tab_selector'         => '.nav.nav-tabs li.active',
                'youtube_product_video_tab_position'         => 'after',
                'youtube_product_video_tab_content_selector' => '.tab-content .tab-pane.active'
            )
        );
    }
}
