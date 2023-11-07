<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-httpmprodtc" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-httpmprodtc" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-displaytitle"><?php echo $entry_displaytitle; ?></label>
            <div class="col-sm-10">
              <select name="displaytitle" id="input-displaytitle" class="form-control">
                <?php if ($displaytitle) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

          <?php foreach ($tabs as $tab) { ?>
          <div class="form-group type-var" id="bsl<?php echo $tab['id']; ?>">
            <div class="col-sm-1"><p class="num"><?php echo $tab['id']; ?></p><p><span class="rem btn btn-danger btn-xs" data="bsl<?php echo $tab['id']; ?>"><i class="fa fa-close"></i></span></p></div>
            <div class="col-lg-2 col-md-3 col-sm-4">
              <label class="control-label"><?php echo $entry_display; ?></label><br />

              <label for="tab<?php echo $tab['id']; ?>-1" data="products<?php echo $tab['id']; ?>" class="tab"><input name="tabs[<?php echo $tab['id']; ?>][tab][]" type="radio" value="1" id="tab<?php echo $tab['id']; ?>-1"<?php if ($tab['tab'] == '1') { echo ' checked="checked"'; } ?> /><?php echo $tab_product; ?></label><br />

              <label for="tab<?php echo $tab['id']; ?>-2" data="categories<?php echo $tab['id']; ?>" class="tab"><input name="tabs[<?php echo $tab['id']; ?>][tab][]" type="radio" value="2" id="tab<?php echo $tab['id']; ?>-2"<?php if ($tab['tab'] == '2') { echo ' checked="checked"'; } ?> /><?php echo $tab_category; ?></label><br />

              <label for="tab<?php echo $tab['id']; ?>-3" data="no" class="tab"><input name="tabs[<?php echo $tab['id']; ?>][tab][]" type="radio" value="3" id="tab<?php echo $tab['id']; ?>-3"<?php if ($tab['tab'] == '3') { echo ' checked="checked"'; } ?> /><?php echo $tab_inactive; ?></label><br />

              <label for="tab<?php echo $tab['id']; ?>-4" data="no" class="tab"><input name="tabs[<?php echo $tab['id']; ?>][tab][]" type="radio" value="4" id="tab<?php echo $tab['id']; ?>-4"<?php if ($tab['tab'] == '4') { echo ' checked="checked"'; } ?> /><?php echo $tab_special; ?></label><br />

              <label for="tab<?php echo $tab['id']; ?>-5" data="no" class="tab"><input name="tabs[<?php echo $tab['id']; ?>][tab][]" type="radio" value="5" id="tab<?php echo $tab['id']; ?>-5"<?php if ($tab['tab'] == '5') { echo ' checked="checked"'; } ?> /><?php echo $tab_latest; ?></label>
              <label for="tab<?php echo $tab['id']; ?>-6" data="no" class="tab"><input name="tabs[<?php echo $tab['id']; ?>][tab][]" type="radio" value="6" id="tab<?php echo $tab['id']; ?>-6"<?php if ($tab['tab'] == '6') { echo ' checked="checked"'; } ?> /><?php echo $tab_viewed; ?></label>
            </div>
            <div class="col-sm-3">
              <label class="control-label" for="input-tname<?php echo $tab['id']; ?>"><?php echo $entry_tname; ?></label>
              <input type="text" name="tabs[<?php echo $tab['id']; ?>][tname]" value="<?php echo $tab['tname']; ?>" placeholder="<?php echo $entry_tname; ?>" id="input-tname<?php echo $tab['id']; ?>" class="form-control" />
              <small>Используется только если есть 2 вкладки</small>
            </div>
            
            <div class="col-lg-6 col-md-5 col-sm-4 bl-display<?php if ($tab['tab'] == '1') { echo ' active'; } ?>" id="products<?php echo $tab['id']; ?>">
              <input type="text" name="tabs[<?php echo $tab['id']; ?>][product]" value="" placeholder="<?php echo $entry_product; ?>" id="input-product<?php echo $tab['id']; ?>" class="form-control prodsinp" data="fc-product<?php echo $tab['id']; ?>" data-id="<?php echo $tab['id']; ?>" />
              <div id="fc-product<?php echo $tab['id']; ?>" class="well fc-product well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($tab['product'] as $product) { ?>
                  <div id="fc-product<?php echo $tab['id']; ?>-<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                    <input type="hidden" name="tabs[<?php echo $tab['id']; ?>][product][]" value="<?php echo $product['product_id']; ?>" />
                  </div>
                <?php } ?>
              </div>
            </div>

            <div class="col-lg-6 col-md-5 col-sm-4 bl-display<?php if ($tab['tab'] == '2') { echo ' active'; } ?>" id="categories<?php echo $tab['id']; ?>">
              <select name="tabs[<?php echo $tab['id']; ?>][category]" class="form-control">
                <option value="0">Категория товара</option>
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['category_id']==$tab['category']) { ?>
                  <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option> 
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <input type="hidden" name="tabs[<?php echo $tab['id']; ?>][id]" value="<?php echo $tab['id']; ?>" class="inp-id-tab" />
          </div>
          <?php } ?>

<p style="text-align:center"><span class="add-item btn btn-success"><i class="fa fa-plus"></i></span></p>
          

       







          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-items"><?php echo $entry_items; ?></label>
            <div class="col-sm-10">
              <input type="text" name="items" value="<?php echo $items; ?>" placeholder="<?php echo $entry_items; ?>" id="input-items" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          

      

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-prodview"><?php echo $entry_prodview; ?></label>
            <div class="col-sm-10">
              <select name="prodview" id="input-prodview" class="form-control">
                <?php if ($prodview == 2) { ?>
                <option value="0"><?php echo $text_pstandart; ?></option>
                <option value="1"><?php echo $text_nodeskmore; ?></option>
                <option value="2" selected="selected"><?php echo $text_nodesc; ?></option>
                <option value="3"><?php echo $text_deskmore; ?></option>
                <?php } else if ($prodview == 1) { ?>
                <option value="0"><?php echo $text_pstandart; ?></option>
                <option value="1" selected="selected"><?php echo $text_nodeskmore; ?></option>
                <option value="2"><?php echo $text_nodesc; ?></option>
                <option value="3"><?php echo $text_deskmore; ?></option>
                 <?php } else if ($prodview == 3) { ?>
                <option value="0"><?php echo $text_pstandart; ?></option>
                <option value="1"><?php echo $text_nodeskmore; ?></option>
                <option value="2"><?php echo $text_nodesc; ?></option>
                <option value="3" selected="selected"><?php echo $text_deskmore; ?></option>
                <?php } else  { ?>
                <option value="0" selected="selected"><?php echo $text_pstandart; ?></option>
                <option value="1"><?php echo $text_nodeskmore; ?></option>
                <option value="2"><?php echo $text_nodesc; ?></option>
                <option value="3"><?php echo $text_deskmore; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-class"><?php echo $text_class; ?></label>
            <div class="col-sm-10">
              <input type="text" name="class" value="<?php echo $class; ?>" placeholder="<?php echo $text_class; ?>" id="input-class" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <style>
    .bl-display {display: none;}
    .bl-display.active {display: block;}
  </style>
  <script type="text/javascript"><!--
$('.prodsinp').autocomplete({
  
	source: function(request, response) {
    
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
    var nid = $(this).attr('data');
    var tid = $(this).attr('data-id');
		$('.prodsinp').val('');
		
		$('#' + nid + '-' + item['value']).remove();
		
		$('#' + nid).append('<div id="' + nid + '-' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="tabs[' + tid + '][product][]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('.fc-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

$('.tab').on('click', function() {
  var tsid = $(this).parents('.form-group').attr('id');
  var dispid = $(this).attr('data');
  $('#'+tsid+' .bl-display').removeClass('active');
  $('#'+dispid).addClass('active');

});
$('span.rem').on('click', function() {
  var id = $(this).attr('data');
  $('#'+id).hide(30).remove();
});
$('.add-item').on('click', function() {
  var lastid = $('.type-var').filter(':last').find('.inp-id-tab').attr('value');
  var cid = parseFloat(lastid) + 1;
  html = '<div class="form-group type-var" id="bsl' + cid + '">';
  html += '  <div class="col-sm-1"><p class="num">' + cid + '</p><p><span class="rem btn btn-danger btn-xs" data="bsl' + cid + '"><i class="fa fa-close"></i></span></p></div>';
  html += '  <div class="col-lg-2 col-md-3 col-sm-4">';
  html += '    <label class="control-label"><?php echo $entry_display; ?></label><br />';
  html += '    <label for="tab' + cid + '-1" data="products' + cid + '" class="tab"><input name="tabs[' + cid + '][tab][]" type="radio" value="1" id="tab' + cid + '-1" /><?php echo $tab_product; ?></label><br />';
  html += '    <label for="tab' + cid + '-2" data="categories' + cid + '" class="tab"><input name="tabs[' + cid + '][tab][]" type="radio" value="2" id="tab' + cid + '-2" /><?php echo $tab_category; ?></label><br />';
  html += '    <label for="tab' + cid + '-3" data="no" class="tab"><input name="tabs[' + cid + '][tab][]" type="radio" value="3" id="tab' + cid + '-3" checked="checked" /><?php echo $tab_inactive; ?></label><br />';
  html += '    <label for="tab' + cid + '-4" data="no" class="tab"><input name="tabs[' + cid + '][tab][]" type="radio" value="4" id="tab' + cid + '-4" /><?php echo $tab_special; ?></label><br />';
  html += '    <label for="tab' + cid + '-5" data="no" class="tab"><input name="tabs[' + cid + '][tab][]" type="radio" value="5" id="tab' + cid + '-5" /><?php echo $tab_latest; ?></label>';
  html += '    <label for="tab' + cid + '-6" data="no" class="tab"><input name="tabs[' + cid + '][tab][]" type="radio" value="6" id="tab' + cid + '-6" /><?php echo $tab_viewed; ?></label>';
  html += '  </div>';
  html += '  <div class="col-sm-3">';
  html += '    <label class="control-label" for="input-tname' + cid + '"><?php echo $entry_tname; ?></label>';
  html += '    <input type="text" name="tabs[' + cid + '][tname]" value="<?php echo $tab['tname']; ?>" placeholder="<?php echo $entry_tname; ?>" id="input-tname' + cid + '" class="form-control" />';
  html += '    <small>Используется только если есть 2 вкладки</small>';
  html += '  </div>';
  html += '  <div class="col-lg-6 col-md-5 col-sm-4 bl-display" id="products' + cid + '">';
  html += '    <input type="text" name="tabs[' + cid + '][product][]" value="" placeholder="<?php echo $entry_product; ?>" id="input-product' + cid + '" class="form-control prodsinp" data="fc-product' + cid + '" />';
  html += '    <div id="fc-product' + cid + '" class="well fc-product well-sm" style="height: 150px; overflow: auto;"></div>';
  html += '  </div>';
  html += '  <div class="col-lg-6 col-md-5 col-sm-4 bl-display" id="categories' + cid + '">';
  html += '    <select name="tabs[' + cid + '][category]" class="form-control">';
  html += '      <option value="0">Категория товара</option>';
  html += '      <?php foreach ($categories as $category) { ?>';
  html += '        <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option> ';
  html += '      <?php } ?>';
  html += '    </select>';
  html += '  </div>';
  html += '  <input type="hidden" name="tabs[' + cid + '][id]" value="' + cid + '" class="inp-id-tab" />';
  html += '</div>';
  $('#bsl' + lastid).after(html);
  $('.tab').on('click', function() {
  var tsid = $(this).parents('.form-group').attr('id');
  var dispid = $(this).attr('data');
  $('#'+tsid+' .bl-display').removeClass('active');
  $('#'+dispid).addClass('active');

});
});
//--></script></div>
<?php echo $footer; ?>