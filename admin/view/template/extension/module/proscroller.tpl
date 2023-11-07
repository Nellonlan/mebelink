<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<button type="submit" form="form-proscroller" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-proscroller" class="form-horizontal">
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
        </div>    
		<div class="tab-pane">
			<ul class="nav nav-tabs" id="language">
				  <?php foreach ($languages as $language) { ?>
				  <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
				  <?php } ?>
			</ul>
			<div class="tab-content">
				  <?php foreach ($languages as $language) { ?>
				  <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
					<div class="form-group">
					  <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
					  <div class="col-sm-10">
						<input type="text" name="module_description[<?php echo $language['language_id']; ?>][title]" id="input-heading<?php echo $language['language_id']; ?>" value="<?php echo isset($module_description[$language['language_id']]['title']) ? $module_description[$language['language_id']]['title'] : ''; ?>" class="form-control" />
					  </div>
					</div>
				  </div>
				  <?php } ?>
			</div>
		</div>
		<div class="form-group">
			 <label class="col-sm-2 control-label" for="input-title_link"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_title_link; ?>"></span> <?php echo $entry_title_link; ?></label>
				 <div class="col-sm-10">
					<input type="text" name="title_link" id="input-title_link" value="<?php echo $title_link; ?>" class="form-control" />
				</div>
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_source; ?>"></span> <?php echo $entry_source; ?></label>
            <div class="col-sm-10">
              <select name="category_id" id="input-category" class="form-control" onchange="showhide();">
				<option value="featured" <?php if ($category_id=='featured') { ?>selected="selected"<?php } ?>><?php echo $text_featured; ?></option>
				<option value="0" <?php if ($category_id=='0') { ?>selected="selected"<?php } ?>><?php echo $text_root; ?></option>
                <?php foreach ($rootcats as $rootcat) { ?>
                <?php if ($rootcat['category_id'] == $category_id) { ?>
                <option value="<?php echo $rootcat['category_id']; ?>" selected="selected"><?php echo $rootcat['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $rootcat['category_id']; ?>"><?php echo $rootcat['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
        </div>
			
		<?php if ($category_id=='featured') { $featured_style="block";} else {$featured_style="none";}?>
		<div class="form-group" id="rowfeatured" style="display:<?php echo $featured_style; ?>">
			<label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product" value="" id="input-product" class="form-control" />
              <div id="featured-product" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products as $product) { ?>
                <div id="featured-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                  <input type="hidden" name="product[]" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
        </div>
			
		<?php if ($category_id=='featured') { $catonlyStyle="none";} else {$catonlyStyle="block";}?>
		<div id="catonly" style="display:<?php echo $catonlyStyle;?>">
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_manufacturer; ?>"></span> <?php echo $entry_manufacturer; ?></label>
            <div class="col-sm-10">
              <select name="manufacturer_id" id="input-manufacturer" class="form-control">
				<option value="0" <?php if ($manufacturer_id=='0') { ?>selected="selected"<?php } ?>><?php echo $text_all_manufacturers; ?></option>
                <?php if (isset($manufacturers)){ 
					foreach ($manufacturers as $manufacturer) { ?>
                <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
                <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
                <?php } ?>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
			</div>
			
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_sort; ?>"></span> <?php echo $entry_sort; ?></label>
            <div class="col-sm-10">
				<select name="sort" id="input-sort" class="form-control">
                <?php if ($sort == 'p.date_added') { ?>
                <option value="p.date_added" selected="selected"><?php echo $text_date_added; ?></option>
                <?php } else { ?>
                <option value="p.date_added"><?php echo $text_date_added; ?></option>
                <?php } ?>
				<?php if ($sort == 'topsellers') { ?>
                <option value="topsellers" selected="selected"><?php echo $text_topsellers; ?></option>
                <?php } else { ?>
                <option value="topsellers"><?php echo $text_topsellers; ?></option>
                <?php } ?>
                <?php if ($sort == 'special') { ?>
                <option value="special" selected="selected"><?php echo $text_special; ?></option>
                <?php } else { ?>
                <option value="special"><?php echo $text_special; ?></option>
                <?php } ?>
				<?php if ($sort == 'rating') { ?>
                <option value="rating" selected="selected"><?php echo $text_rating; ?></option>
                <?php } else { ?>
                <option value="rating"><?php echo $text_rating; ?></option>
                <?php } ?>
				<?php if ($sort == 'p.viewed') { ?>
                <option value="p.viewed" selected="selected"><?php echo $text_viewed; ?></option>
                <?php } else { ?>
                <option value="p.viewed"><?php echo $text_viewed; ?></option>
                <?php } ?>
                <?php if ($sort == 'p.sort_order') { ?>
                <option value="p.sort_order" selected="selected"><?php echo $text_sort_order; ?></option>
                <?php } else { ?>
                <option value="p.sort_order"><?php echo $text_sort_order; ?></option>
                <?php } ?>
              </select>
			</div>
			</div>
			
		  	<div class="form-group">
				<label class="col-sm-2 control-label" for="input-count"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_count; ?>"></span> <?php echo $entry_count; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="count" value="<?php echo $count; ?>" id="input-count" class="form-control" />
				  <?php if ($error_count) { ?>
					<div class="text-danger"><?php echo $error_count; ?></div>
				  <?php } ?>
				</div>
			</div>
		</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-visible"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_visible; ?>"></span> <?php echo $entry_visible; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="visible" value="<?php echo $visible; ?>" id="input-visible" class="form-control" />
				  <?php if ($error_visible) { ?>
					<div class="text-danger"><?php echo $error_visible; ?></div>
				  <?php } ?>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-shownav"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_shownav; ?>"></span> <?php echo $entry_shownav; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_shownav" type="radio" name="shownav" value="1" <?php if(!isset($shownav) || $shownav == '1') echo " checked='checked'"?>>
					<label for="input-yes_shownav"><?php echo $text_yes?></label>
					<input id="input-no_shownav" type="radio" name="shownav" value="0" <?php if(isset($shownav) && $shownav == '0') echo " checked='checked'"?>>
					<label for="input-no_shownav"><?php echo $text_no?></label>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-autoscroll"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_autoscroll; ?>"></span> <?php echo $entry_autoscroll; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="autoscroll" value="<?php echo $autoscroll; ?>" id="input-autoscroll" class="form-control" size="3"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-animationspeed"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_animationspeed; ?>"></span> <?php echo $entry_animationspeed; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="animationspeed" value="<?php echo $animationspeed; ?>" id="input-animationspeed" class="form-control" size="5"/>
				  <?php if ($error_animationspeed) { ?>
					<div class="text-danger"><?php echo $error_animationspeed; ?></div>
				  <?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-hoverpause"><?php echo $entry_hoverpause; ?></label>
				<div class="col-sm-10">
					<input id="input-yes_hoverpause"  type="radio" name="hoverpause" value="1" <?php if(!isset($hoverpause) || $hoverpause == '1') echo " checked='checked'"?>>
					<label for="input-yes_hoverpause"><?php echo $text_yes?></label>
					<input id="input-no_hoverpause"  type="radio" name="hoverpause" value="0" <?php if(isset($hoverpause) && $hoverpause == '0') echo " checked='checked'"?>>
					<label for="input-no_hoverpause"><?php echo $text_no?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image_width"><?php echo $entry_image; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="image_width" value="<?php echo $image_width; ?>" id="input-image_width" size="3"/> x <input type="text" name="image_height" value="<?php echo $image_height; ?>"  id="input-image_height" size="3"/>
				  <?php if ($error_width) { ?>
					<div class="text-danger"><?php echo $error_width; ?></div>
				  <?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_title"><?php echo $entry_show_title; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_title" type="radio" name="show_title" value="1" <?php if(!isset($show_title) || $show_title == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_title"><?php echo $text_yes?></label>
					<input id="input-no_show_title" type="radio" name="show_title" value="0" <?php if(isset($show_title) && $show_title == '0') echo " checked='checked'"?>>
					<label for="input-no_show_title"><?php echo $text_no?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_price"><?php echo $entry_show_price; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_price" type="radio" name="show_price" value="1" <?php if(!isset($show_price) || $show_price == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_price"><?php echo $text_yes?></label>
					<input id="input-no_show_price" type="radio" name="show_price" value="0" <?php if(isset($show_price) && $show_price == '0') echo " checked='checked'"?>>
					<label for="input-no_show_price"><?php echo $text_no?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_rate"><?php echo $entry_show_rate; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_rate" type="radio" name="show_rate" value="1" <?php if(!isset($show_rate) || $show_rate == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_rate"><?php echo $text_yes?></label>
					<input id="input-no_show_rate" type="radio" name="show_rate" value="0" <?php if(isset($show_rate) && $show_rate == '0') echo " checked='checked'"?>>
					<label for="input-no_show_rate"><?php echo $text_no?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_desc"><?php echo $entry_show_desc; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_desc" type="radio" name="show_desc" value="1" <?php if(!isset($show_desc) || $show_desc == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_desc"><?php echo $text_yes?></label>
					<input id="input-no_show_desc" type="radio" name="show_desc" value="0" <?php if(isset($show_desc) && $show_desc == '0') echo " checked='checked'"?>>
					<label for="input-no_show_desc"><?php echo $text_no?></label>
					 <?php echo "&nbsp;&nbsp;&nbsp;"; ?> <input type="text" name="desc_word" value="<?php echo $desc_word; ?>" id="input-desc_word" size="4"/><?php echo "&nbsp;&nbsp;".$entry_desc_word; ?>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_cart"><?php echo $entry_show_cart; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_cart" type="radio" name="show_cart" value="1" <?php if(!isset($show_cart) || $show_cart == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_cart"><?php echo $text_yes?></label>
					<input id="input-no_show_cart" type="radio" name="show_cart" value="0" <?php if(isset($show_cart) && $show_cart == '0') echo " checked='checked'"?>>
					<label for="input-no_show_cart"><?php echo $text_no?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_cart"><?php echo $entry_show_wish; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_wish" type="radio" name="show_wish" value="1" <?php if(!isset($show_wish) || $show_wish == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_wish"><?php echo $text_yes?></label>
					<input id="input-no_show_wish" type="radio" name="show_wish" value="0" <?php if(isset($show_wish) && $show_wish == '0') echo " checked='checked'"?>>
					<label for="input-no_show_wish"><?php echo $text_no?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-show_compare"><?php echo $entry_show_compare; ?></label>
				<div class="col-sm-10">		  
					<input id="input-yes_show_compare" type="radio" name="show_compare" value="1" <?php if(!isset($show_compare) || $show_compare == '1') echo " checked='checked'"?>>
					<label for="input-yes_show_compare"><?php echo $text_yes?></label>
					<input id="input-no_show_compare" type="radio" name="show_compare" value="0" <?php if(isset($show_compare) && $show_compare == '0') echo " checked='checked'"?>>
					<label for="input-no_show_compare"><?php echo $text_no?></label>
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


<script type="text/javascript">

function showhide() {
	//alert($("#select"+ modid).val());
    var selectedValue = $("#input-category").val();
    //alert();
	if (selectedValue == "featured") {
	$("#rowfeatured").show();
	$("#catonly").hide();
	} else {
	$("#rowfeatured").hide();
	$("#catonly").show();
	}
	
   }
</script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
  <script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
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
		$('input[name=\'product\']').val('');
		
		$('#featured-product' + item['value']).remove();
		
		$('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#featured-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script></div>
<?php echo $footer; ?>