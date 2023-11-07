<?php

class ControllerExtensionModuleYouTubeProductVideo extends Controller {
    public function index($product_id) {
        $data = $this->load->language('extension/module/youtube_product_video');
        $product_video_row = $this->db->query("SELECT `product_video` FROM `".DB_PREFIX."youtube_product_video` WHERE `product_id`='".(int)$product_id."'")->row;
        $product_video = (!empty($product_video_row['product_video'])) ? $product_video_row['product_video'] : '';
        if ( !empty( $product_video ) ) {
            $tmp = explode('?', html_entity_decode( $product_video ));
            foreach (explode('&', $tmp[1]) as $param){
                $tmp = explode('=', $param);
                if ( $tmp[0] == 'v' ){
                    $code = $tmp[1];
                }
            }
            $data['teslafeo_video_code'] = (!empty($code)) ? $code : '';
            if ( $data['teslafeo_video_code'] ) {
                $this->load->model('setting/setting');
                $youtube_product_video = $this->model_setting_setting->getSetting('youtube_product_video');
                $data['youtube_product_video_setting'] = $youtube_product_video['youtube_product_video'];
            }
        } else {
            $data['teslafeo_video_code'] = '';
        }
        return $this->load->view('extension/module/youtube_product_video', $data);
    }
}
