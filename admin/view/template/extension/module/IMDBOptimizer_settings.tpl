<?php 
	/*
		Author: Igor Mirochnik
		Site: http://ida-freewares.ru
	    Site: http://im-cloud.ru
		Email: dev.imirochnik@gmail.com
		Type: commercial
	*/

	// Формирование html select
	if (!function_exists('echoHtmlSelect'))
	{
		function echoHtmlSelect($name, $data, $curr_val = '', $append_class = '', 
							$is_multi = false, $val_name = 'id', $text_name = 'name')
		{
			$result = '<select name="' . $name . '" ' 
						. ' class="form-control ' . $append_class . '" '
						. ($is_multi ? ' multiple="multiple" ' : '') 
				. ' >';
			
			foreach($data as $key => $item)
			{
				$result .= '<option value="' . $item[$val_name] . '" '
							. (('' . $item[$val_name] == $curr_val )? ' selected="selected" ' : '')	. '>'
						. $item[$text_name]
					. '</option>';
			}
			
			return $result . '</select>';
		}
	}

	if (!function_exists('echoLabel')) {
		function echoLabel($module_label, $name)
		{
			if (isset($module_label)) {
				if (is_array($module_label)) {
					if (isset($module_label[$name]))
						return $module_label[$name];
				}
			}
			return $name;
		}
	}

	if (!function_exists('echoDate')) {
		function echoDate($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return
				'<div class="form-group">'
				    . '<label class="control-label" for="">'
				    	. echoLabel($module_label, $label)
				    . '</label>'
				    . '<div class="input-group date">'
				      	.' <input type="text" '
				      		. ' name="' . $name . '" '
				      		. ' value="' . $value . '" '
				      		. ' placeholder="' . echoLabel($module_label, $label) . '"'
				      		. ' data-date-format="DD.MM.YYYY"'
				      		. ' class="form-control ' . $append_class . '"/>'
				      	. '<span class="input-group-btn">'
				      	. '<button type="button" class="btn btn-default">'
				      		. '<i class="fa fa-calendar"></i>'
				      	. '</button>'
				      	.'</span>'
				    . '</div>'
			  	. '</div>'
		  	;
		}
	}
	
	if (!function_exists('echoTextAreaControl')) {
		function echoTextAreaControl($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return 
				'<div class="form-group ">'
	    			. '<label class="col-sm-3 control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="col-sm-9">'
	      				. '<textarea '
	      					. ' name="' . $name . '" '
	      					. ' placeholder="' . echoLabel($module_label, $label) . '" '
	      					. ' class="form-control ' . $append_class . '">'
	      						. $value
	      				. '</textarea>'
					. '</div>'
		  		. '</div>'
			;
		}
	}

	if (!function_exists('echoInputControl')) {
		function echoInputControl($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return 
				'<div class="form-group ">'
	    			. '<label class="col-sm-3 control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="col-sm-9">'
	      				. '<input '
	      				
	      					. ' type="textbox"'
	      					. ' name="' . $name . '" '
	      					. ' value="' . $value . '" '
	      					. ' placeholder="' . echoLabel($module_label, $label) . '" '
	      					. ' class="form-control ' . $append_class . '"/>'
					. '</div>'
		  		. '</div>'
			;
		}
	}
	
	if (!function_exists('echoSelectControl'))
	{
		function echoSelectControl($data, $name, $module_label, $label = '', $value = '', $append_class = '',
									$is_multi = false, $val_name = 'id', $text_name = 'name')
		{
			return
				'<div class="form-group ">'
	    			. '<label class=" control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="">'
	      				. echoHtmlSelect($name, $data, $value, $append_class, $is_multi, $val_name, $text_name)
					. '</div>'
		  		. '</div>'
			;
		}
	}
	
?>
<div class="tab-pane" id="imdbosettings">
<div class="">
<form class="form imdbo-form-settings">
	<div class="well">
		<div class="row">
			<!------------------>
			<!-- SecretKey -->
			<!------------------>
			<div class="col-sm-12">
				<hr/>
				<h3>
					<?php echo
						echoLabel($module_label, 'label_settings_secret_key');
					?>
				</h3>
			</div>

			<div class="col-sm-12">
				<hr/>
			</div>
			<div class="col-sm-12">
				<?php
					echo echoInputControl(
						'IMDBOptimizer[IMDBOptimizerData_api_secret_key]',
						$module_label,
						'label_api_secret_key',
						$settings_info["api_secret_key"],
						'imdbo-api-secret-key'
					);
				?>
			</div>
			<div class="col-sm-12">
				<?php
					echo echoInputControl(
						'module_actions',
						$module_label,
						'label_settings_module_actions',
						'',
						'imdbo-module-actions'
					);
				?>
			</div>
			<div class="col-sm-12">
				<!-- Small button group -->
				<div class="btn-group imdbo-module-actions-btn-group">
					<button class="btn btn-default btn-sm" type="button" >
						<i class="fa fa-thumbs-up"></i>
						EnableSQLCache
					</button>
					<button class="btn btn-default btn-sm" type="button" >
						<i class="fa fa-refresh"></i>
						ClearSQLCache
					</button>
					<button class="btn btn-default btn-sm" type="button" >
						<i class="fa fa-thumbs-down"></i>
						DisableSQLCache
					</button>
				</div>
				<div class="btn-group imdbo-module-actions-btn-group">
					<button class="btn btn-default btn-sm" type="button" >
						<i class="fa fa-thumbs-up"></i>
						EnableSQLLog
					</button>
					<button class="btn btn-default btn-sm" type="button" >
						<i class="fa fa-refresh"></i>
						ClearSQLLog
					</button>
					<button class="btn btn-default btn-sm" type="button" >
						<i class="fa fa-thumbs-down"></i>
						DisableSQLLog
					</button>
				</div>
			</div>
			<div class="col-sm-12">
				<hr/>
			</div>
			<div class="col-sm-12">
				<?php
					echo echoInputControl(
						'link_api_secret_key',
						$module_label,
						'label_api_secret_key_sample',
						'',
						'imdbo-api-secret-key-sample'
					);
				?>
			</div>
			<div class="col-sm-12">
				<hr/>
			</div>
			<!------------------>
			<!-- Lic -->
			<!------------------>
			<div class="col-sm-12">
				<h3>
					<?php echo
						echoLabel($module_label, 'label_settings_lic');
					?>
				</h3>
			</div>

			<div class="col-sm-12">
				<hr/>
			</div>
			<div class="col-sm-12">
				<?php
					echo echoTextAreaControl(
						'IMDBOptimizer[IMDBOptimizerData_key]',
						$module_label,
						'label_lic_key',
						$lic_info["key"],
						''
					);
				?>
			</div>
			<div class="col-sm-12">
				<?php
					echo echoInputControl(
						'IMDBOptimizer[IMDBOptimizerData_enc_mess]',
						$module_label,
						'label_lic_enc_mess',
						$lic_info["enc_mess"],
						''
					);
				?>
			</div>

			<div class="col-sm-12">
				<?php
					echo echoInputControl(
						'date_until',
						$module_label,
						'label_lic_date_until',
						$lic_info["date_until"],
						''
					);
				?>
			</div>
			<div class="col-sm-12">
				<hr/>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<div class="buttons">
						<a class="button btn-imdbo-settings-save btn btn-primary" 
							style="color:white">
							<i class="fa fa-save"></i> &nbsp; 
							<?php echo 
								echoLabel($module_btn_label, 'button_save_settings'); ?>
						</a>
						&nbsp;&nbsp;&nbsp;
						<a class="button btn-imdbo-settings-save-no-reload btn btn-warning" 
							style="color:white">
							<i class="fa fa-save"></i> &nbsp; 
							<?php echo 
								echoLabel($module_btn_label, 'button_save_settings_no_reload'); ?>
						</a>
						<span class="save-imdbo-settings-status"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</div>
</div>

<script type="text/javascript" lang="javascript">
	function IMDBO_str_endsWith(str, suffix) {
	    return str.indexOf(suffix, str.length - suffix.length) !== -1;
	}

	jQuery(function () {
		jQuery('.IMDBOptimizer .imdbo-api-secret-key').keyup(function () {
			var sample = jQuery('.IMDBOptimizer .imdbo-api-secret-key-sample'),
				item = jQuery(this),
				moduleActions = jQuery('.IMDBOptimizer .imdbo-module-actions').val()
			;

			sample.val(
				module_links.apiLink
				+ '&apikey=' + encodeURIComponent(item.val())
				+ '&actions=' + moduleActions
			);
		});

		jQuery('.IMDBOptimizer .imdbo-module-actions').keyup(function () {
			jQuery('.IMDBOptimizer .imdbo-api-secret-key').trigger('keyup');
		});

		jQuery('.IMDBOptimizer .btn-group.imdbo-module-actions-btn-group button')
		.click(function () {
			var item = jQuery(this),
				itemText = jQuery.trim(item.text()),
				moduleActions = jQuery('.IMDBOptimizer .imdbo-module-actions'),
				moduleActionsText = jQuery.trim(moduleActions.val())
			;

			moduleActions.val(
				moduleActionsText
				+ (
					moduleActionsText != '' && IMDBO_str_endsWith(moduleActionsText, ',')
					? ''
					: (moduleActionsText == '' ? '' : ', ')
				)
				+ itemText
			);

			jQuery('.IMDBOptimizer .imdbo-api-secret-key').trigger('keyup');
		});

		jQuery('.IMDBOptimizer .imdbo-api-secret-key').trigger('keyup');
	});
</script>

<style type="text/css">
	.form-group span.blue
	{
		color: #000042;
    	font-size: 15px;
	}
	
	.IMDBOptimizer .imdbo-form-settings textarea
	{
		height: 100px;
	}
	
	.IMDBOptimizer .save-status.success,
	.IMDBOptimizer .generate-status.success,
	.IMDBOptimizer .get-product-status.success
	{
    	color: green;
	}

	.IMDBOptimizer .save-status.fail,
	.IMDBOptimizer .generate-status.fail,
	.IMDBOptimizer .get-product-status.fail
	{
    	color: red;
	}

	.IMDBOptimizer .form-group label.col-sm-3.control-label 
	{
	    line-height: 35px;
	    margin: 0px;
	}

	.IMDBOptimizer .well .row .form-group
	{
	    padding-top: 5px;
	    padding-bottom: 8px;
	    margin-bottom: 0;
	}

</style>
