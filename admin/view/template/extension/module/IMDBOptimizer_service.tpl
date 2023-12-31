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

	if (!function_exists('echoHtmlSelectMany'))
	{
		function echoHtmlSelectMany($name, $data, $append_class = '', 
							$list_allclear = array('all', 'clear'),
							$val_name = 'id', $text_name = 'name')
		{
			$result = '<div class="well well-sm ' . $append_class . '" style="height: 150px; overflow: auto;">';
			$result .= '<input type="hidden" value="-1" name="' . $name . '" />';
			
			foreach($data as $key => $item)
			{
				if (''.$item[$val_name] == '-1')
				{
					continue;
				}
				else
				{
					$result .= '<div class="checkbox">'
		                  	. ' <label> '
								. '<input type="checkbox" name="' . $name . '" value="' . $item[$val_name] . '"> '
		                    	. $item[$text_name]                                      
		                    . ' </label> '
		                . '</div>'
					;
				}
			}

			$result .= '</div>';

			$result .=
				'<a class="imdbo-cursor" onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);">'
					.	( is_array($list_allclear) && count($list_allclear) > 1 ? $list_allclear[0] : 'all' )
				. '</a>'
				. ' / '
				. '<a class="imdbo-cursor" onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);">'
					.	( is_array($list_allclear) && count($list_allclear) > 1 ? $list_allclear[1] : 'clear' )
				.'</a>'
			;

			return $result;
		}
	}

	if (!function_exists('echoLabel'))
	{
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

	if (!function_exists('echoDate'))
	{
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
	
	if (!function_exists('echoTextAreaControl'))
	{
		function echoTextAreaControl($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return 
				'<div class="form-group ">'
	    			. '<label class=" control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="">'
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

	if (!function_exists('echoInputControl'))
	{
		function echoInputControl($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return 
				'<div class="form-group ">'
	    			. '<label class=" control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="">'
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

<!-- ------------ -->
<!-- DBOpt Service -->
<!-- ------------ -->
<div class="tab-pane" id="imdbopt-service">
		
	<form class="form IMDBOptimizer-form" 
		action="<?php echo $replace; ?>" method="post" 
		enctype="multipart/form-data" 
		id="form_inmdbo_service"
	>

		<div class="well">
			<div class="row">

				<!-------------------------->
				<!-- Filter -->
				<!-------------------------->
		
				<div class="col-sm-12">
					<div class="form-group">
					<label class="control-label">
					<?php echo 
						echoLabel($module_label, 'label_filter_tables'); ?>
					</label>
					<?php echo
						echoHtmlSelectMany(
							'tables',
							$list_tables,
							'imdbo-tables-select',
							$label_multiselect_allclear
						);
					?>
					</div>
				</div>

				<div class="col-sm-12">
					<hr/>
				</div>
			
				<!-------------------------->
				<!-- Buttons -->
				<!-------------------------->
				
				<div class="col-sm-12">
					<div class="form-group">
						<div class="buttons">
							<a class="button btn-im-optimize btn btn-success" 
								style="color:white">
								<i class="fa fa-save"></i> &nbsp; 
								<?php echo 
									echoLabel($module_btn_label, 'button_optimize'); ?>
							</a>
							&nbsp;&nbsp;&nbsp;
							<a class="button btn-im-repair btn btn-warning" 
								style="color:white">
								<i class="fa fa-sliders"></i> &nbsp; 
								<?php echo 
									echoLabel($module_btn_label, 'button_repair'); ?>
							</a>
							&nbsp;&nbsp;&nbsp;
							<a class="button btn-im-show-data btn btn-info" 
								style="color:white">
								<i class="fa fa-sliders"></i> &nbsp; 
								<?php echo 
									echoLabel($module_btn_label, 'button_show_data'); ?>
							</a>
							&nbsp;&nbsp;&nbsp;
							<span class="generate-status"></span>
						</div>
					</div>
				</div>

				<div class="col-sm-12">
					<hr/>
				</div>

				<!-------------------------->
				<!-- Log -->
				<!-------------------------->

				<div class="col-sm-12">
					<?php
						echo
						echoTextAreaControl(
							'log',
							$module_label,
							'label_field_log',
							'',
							'imdbo-log-container'
						);
					?>
				</div>
				
				<div class="col-sm-12">
					<hr/>
				</div>
				
			</div>
		</div>

	</form>
</div>

<script type="text/javascript">
	
	
	// Оптимизация индексов для одной таблицы в БД
	function IMDBO_optimizeOneTable(form, data, listTables, currNum, onLoad)
	{
		if (listTables.length <= currNum) {
			if (typeof(onLoad) === 'function') {
				onLoad(form);
				return;
			}
		}
		
		var sendData = [],
			logTextArea = form.find('.imdbo-log-container')
		;
		
		for(var cnt = 0; cnt < data.length; cnt++) {
			sendData.push(data[cnt]);
		}
		
		sendData.push({
			name: 'IMDBOptimizer[table]',
			value: listTables[currNum]
		});
		
		logTextArea.val(
			logTextArea.val()
			+ '\n------------------------\n'
			+ (currNum + 1) + '. ' + listTables[currNum]
			+ '\n------------------------\n'
			+ module_texts.startOptimize
		);
		
		logTextArea[0].scrollTop = logTextArea[0].scrollHeight; 
		
		IMDBO_ajaxOperation({
			form: form,
			data: sendData,
			url: module_links.optimizeTable,
			status: {
				selector: 'not-need',
				text: {
					action: '',
					success: '',
					fail: ''
				}
			},
			onLoad: function (json) {
				var logTextArea = form.find('.imdbo-log-container')
				;
				
				logTextArea.val(
					logTextArea.val() 
					+ '\n'
					+ json['report']
					+ '\n'
					+ (json['success'] ? module_texts.optimizeOk : module_texts.optimizeFail)
					+ '\n------------------------\n'
				);
				
				var count = parseInt(json['count']),
					error = parseInt(json['error']),
					currResults = form.data('results')
				;
				
				currResults.count += isNaN(count) ? 0 : count;
				currResults.error += isNaN(error) ? 0 : error;
				
				form.data('results', currResults);
				
				logTextArea[0].scrollTop = logTextArea[0].scrollHeight;
				
				IMDBO_optimizeOneTable(
					form, data, listTables, currNum + 1, onLoad
				)
			}
		});	
	}
	
	// Рекурсивный обход
	function IMDBO_optimizeTable(form, onLoad)
	{
		var logTextArea = form.find('.imdbo-log-container'),
			sendData = form.serializeArray(),
			tables = form.find('input[name="tables"]:checked'),
			listTables = []
		;
		
		tables.each(function () {
			listTables.push(jQuery(this).val());
		});
		
		logTextArea.val('');
		logTextArea[0].scrollTop = logTextArea[0].scrollHeight; 
		
		imdbo.setTextStatus(form, {
	        selector: '.generate-status',
	        text: module_texts.startOptimize
	    });
	    
	    form.data('results', {
	    	count: 0,
	    	error: 0
	    });
	    
	    IMDBO_optimizeOneTable(
	    	form, sendData, listTables, 0, function (form) {
				imdbo.setTextSuccess(form, {
			        selector: '.generate-status',
			        text: module_texts.optimizeOk
			    });
			    
			    var currResults = form.data('results')
			    ;
			    
			    logTextArea.val(
			    	logTextArea.val()
			    	+ '\n------------------------------------------------\n'
			    	+ module_texts.optimizeAll + currResults.count
			    	+ '\n'
			    	+ module_texts.optimizeAllErr + currResults.error
			    	+ '\n'
			    	+ module_texts.optimizeOk
			    );
			    logTextArea[0].scrollTop = logTextArea[0].scrollHeight;
			}
	    );
	}

	// Оптимизация индексов для одной таблицы в БД
	function IMDBO_repairOneTable(form, data, listTables, currNum, onLoad)
	{
		if (listTables.length <= currNum) {
			if (typeof(onLoad) === 'function') {
				onLoad(form);
				return;
			}
		}
		
		var sendData = [],
			logTextArea = form.find('.imdbo-log-container')
		;
		
		for(var cnt = 0; cnt < data.length; cnt++) {
			sendData.push(data[cnt]);
		}
		
		sendData.push({
			name: 'IMDBOptimizer[table]',
			value: listTables[currNum]
		});
		
		logTextArea.val(
			logTextArea.val()
			+ '\n------------------------\n'
			+ (currNum + 1) + '. ' + listTables[currNum]
			+ '\n------------------------\n'
			+ module_texts.startRepair
		);
		
		logTextArea[0].scrollTop = logTextArea[0].scrollHeight; 
		
		IMDBO_ajaxOperation({
			form: form,
			data: sendData,
			url: module_links.repairTable,
			status: {
				selector: 'not-need',
				text: {
					action: '',
					success: '',
					fail: ''
				}
			},
			onLoad: function (json) {
				var logTextArea = form.find('.imdbo-log-container')
				;
				
				logTextArea.val(
					logTextArea.val() 
					+ '\n'
					+ json['report']
					+ '\n'
					+ (json['success'] ? module_texts.repairOk : module_texts.repairFail)
					+ '\n------------------------\n'
				);
				
				var count = parseInt(json['count']),
					error = parseInt(json['error']),
					currResults = form.data('results')
				;
				
				currResults.count += isNaN(count) ? 0 : count;
				currResults.error += isNaN(error) ? 0 : error;
				
				form.data('results', currResults);
				
				logTextArea[0].scrollTop = logTextArea[0].scrollHeight;
				
				IMDBO_repairOneTable(
					form, data, listTables, currNum + 1, onLoad
				)
			}
		});	
	}
	
	// Рекурсивный обход
	function IMDBO_repairTable(form, onLoad)
	{
		var logTextArea = form.find('.imdbo-log-container'),
			sendData = form.serializeArray(),
			tables = form.find('input[name="tables"]:checked'),
			listTables = []
		;
		
		tables.each(function () {
			listTables.push(jQuery(this).val());
		});
		
		logTextArea.val('');
		logTextArea[0].scrollTop = logTextArea[0].scrollHeight; 
		
		imdbo.setTextStatus(form, {
	        selector: '.generate-status',
	        text: module_texts.startRepair
	    });
	    
	    form.data('results', {
	    	count: 0,
	    	error: 0
	    });
	    
	    IMDBO_repairOneTable(
	    	form, sendData, listTables, 0, function (form) {
				imdbo.setTextSuccess(form, {
			        selector: '.generate-status',
			        text: module_texts.repairOk
			    });
			    
			    var currResults = form.data('results')
			    ;
			    
			    logTextArea.val(
			    	logTextArea.val()
			    	+ '\n------------------------------------------------\n'
			    	+ module_texts.repairAll + currResults.count
			    	+ '\n'
			    	+ module_texts.repairAllErr + currResults.error
			    	+ '\n'
			    	+ module_texts.repairOk
			    );
			    logTextArea[0].scrollTop = logTextArea[0].scrollHeight;
			}
	    );
	}	
	//////////////////////////////////////////////
	// Загрузка DOM
	//////////////////////////////////////////////
	jQuery(function () {
		jQuery('#imdbopt-service .btn-im-repair').click(function () {
			IMDBO_repairTable(jQuery(this).closest('form'));
		});

		jQuery('#imdbopt-service .btn-im-optimize').click(function () {
			IMDBO_optimizeTable(jQuery(this).closest('form'));
		});

		jQuery('#imdbopt-service .btn-im-show-data').click(function () {
			IMDBO_getDBData(jQuery(this).closest('form'));
		});
	});
</script>


<style type="text/css">
	.IMDBOptimizer .form-group 
	{
	    padding-top: 15px;
	    padding-bottom: 15px;
	    margin-bottom: 0;
	}

	.IMDBOptimizer .form-group span.blue
	{
		color: #000042;
    	font-size: 15px;
	}

	.IMDBOptimizer .clear
	{
		clear: both;
	}

	.IMDBOptimizer .well .row .form-group
	{
	    padding-top: 5px;
	    padding-bottom: 8px;
	    margin-bottom: 0;
	}

	.IMDBOptimizer .hidden
	{
		display: none;
	}
	
	select.im-product-list-select 
	{
	    height: 305px;
	}

	.IMDBOptimizer .iml-cursor
	{
		cursor: pointer;
	}
	
	.IMDBOptimizer .save-status.success,
	.IMDBOptimizer .generate-status.success,
	.IMDBOptimizer .generate-schema-status.success,
	.IMDBOptimizer .get-product-status.success,
	.IMDBOptimizer .get-delete-settings-status.success
	{
    	color: green;
	}

	.IMDBOptimizer .save-status.fail,
	.IMDBOptimizer .generate-status.fail,
	.IMDBOptimizer .generate-schema-status.fail,
	.IMDBOptimizer .get-product-status.fail,
	.IMDBOptimizer .get-delete-settings-status.fail
	{
    	color: red;
	}

	.IMDBOptimizer .textcontrol-min-height
	{
		min-height: 100px;
	}

</style>
