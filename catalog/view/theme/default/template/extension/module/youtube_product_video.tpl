<?php if ( $teslafeo_video_code ) { ?>
    <?php if ( $youtube_product_video_setting['youtube_product_video_output_type'] == 'button' ) { ?>
        <style>
            #youtube_product_video_container {
                position: relative;
                padding-bottom: 56.25%; /* задаёт высоту контейнера для 16:9 (если 4:3 — поставьте 75%) */
                padding-top: 30px;
                height: 0;
                overflow: hidden;
            }
            #youtube_product_video_container iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
        </style>
        <div class="modal fade" tabindex="-1" id="youtube_product_video_modal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title"><?php echo $youtube_product_video_modal_title; ?></h3>
                    </div>
                    <div class="modal-body">
                        <div id="youtube_product_video_container"><iframe src="https://www.youtube.com/embed/<?php echo $teslafeo_video_code; ?>?enablejsapi=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <button class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> <?php echo $youtube_product_video_button_close_text; ?></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            (function($){$(document).ready(function(){
                var teslafeo_video_button_html = '<div class="text-<?php echo $youtube_product_video_setting['youtube_product_video_align']; ?>"><button class="btn btn-danger" data-toggle="modal" data-target="#youtube_product_video_modal"><i class="fa fa-play"></i> <?php echo $youtube_product_video_modal_title; ?></button></div>';
                $('<?php echo $youtube_product_video_setting['youtube_product_video_selector']; ?>').<?php echo $youtube_product_video_setting['youtube_product_video_position']; ?>(teslafeo_video_button_html);

                $('#youtube_product_video_modal').on('hidden.bs.modal', function () {
                    var iframe = document.querySelector('#youtube_product_video_container iframe').contentWindow;
                    iframe.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
                });

            });})(jQuery);
        </script>
    <?php } ?>
    <?php if ( $youtube_product_video_setting['youtube_product_video_output_type'] == 'tab' ) { ?>
        <style>
            #youtube_product_video_container {
                position: relative;
                padding-bottom: 56.25%; /* задаёт высоту контейнера для 16:9 (если 4:3 — поставьте 75%) */
                padding-top: 30px;
                height: 0;
                overflow: hidden;
            }
            #youtube_product_video_container iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
        </style>
        <script>
            (function($){$(document).ready(function(){

                var teslafeo_video_tab_title = '<li><a href="#teslafeo_video_tab_content" data-toggle="tab"><?php echo $youtube_product_video_tab_title; ?></a></li>';

                var teslafeo_video_tab_content = '<div class="tab-pane" id="teslafeo_video_tab_content"><div id="youtube_product_video_container"><iframe src="https://www.youtube.com/embed/<?php echo $teslafeo_video_code; ?>?enablejsapi=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div></div>';

                $('<?php echo $youtube_product_video_setting['youtube_product_video_tab_selector']; ?>').<?php echo $youtube_product_video_setting['youtube_product_video_tab_position']; ?>(teslafeo_video_tab_title);

                $('<?php echo $youtube_product_video_setting['youtube_product_video_tab_content_selector']; ?>').after(teslafeo_video_tab_content);

            });})(jQuery);
        </script>
    <?php } ?>
<?php } ?>