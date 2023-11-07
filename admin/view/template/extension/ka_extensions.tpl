<?php
/*
  Project : Ka Extensions
  Author  : karapuz <support@ka-station.com>

  Version : 3 ($Revision: 72 $)
  
*/
?>

<?php echo $header; ?>
<style>
#service_line {
  width: 100%;
  background-color: #EFEFEF;
}

</style>
<audio id="fireball" src="data:audio/mpeg;base64,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E5VL0PHIkRMRDvG/4DABhEBAjYZY+jsFCqS0bpEaAPuwdQIw//skxPsABmw9K+w8xuDWhmV9hhjcsJiAsvE3QALRZ0l//9fe4zlFFod3dldtvYEAAOCWi4FSpeMuVCpTGMiAhD6o7KvbQ76td0etl0LdQ6ozM4xNvTRKzJ//+sDOeFjZ4h3Z3gegEVgoglQqqRGf6GXlYjCqC4aS//skxPgABsghK+zh4KDThiU9hgzco5uGI8L//xwtxHY4mYl2eH/4AAAGjDBRZ4sIFcSPXY84HDYDAjSj8+xwr33SLsW3e/fZ2bzMRLvAD+0WI3YyAf1StdLTW0DJG3NG0SWtFY6gr6IooxNPKJ+KlnRSNphnh2iP//s0xPOABihDK+wwRODVBGV9h6RcwBGAC4I0gOawRTcIIF0eUBtJJ7kfeegHzg8wL7D4v///kNRjmlb1KakRLzUPD/8UaOiQ1cFML7IvixVq8LiWNC0DTJwykqGn5sOYVYlbFBf61EnUrsV3LmWYdnd3ff2MACHzE0uiy0dIX7QGrmGQVGCccEzJIiDCiZBN//skxP2AB3AxK+zhgmDJCOU9gYmUSRE40sxNWopGnGJoLUSNOPspOEkTjRQcaAoqSNHgqKGgLFUI6P/////////1VUxBTUUzLjk5LjNVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//skxPgABawlK+xhgKDAhOV9h4yUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//skxPqARvhrJ+wwRuCQhiU9gIlNVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//sUxP4ARRQbK+xhImikhmV9hIzUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//skxPqARcwtK+wsxGC9hGV9h6SUVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV//sUxP0DygRrJewkxqAAAD/AAAAEVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"></audio>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $ka_breadcrumbs; ?>
    </div>
  </div>

  <div class="container-fluid">
  
	  <?php echo $ka_top; ?>
  
    <div id="service_line">
			<table>
				<tr>
					<td><b>Ka Extensions Version</b>: <?php echo $extension_version; ?>&nbsp;&nbsp;&nbsp;</td>
					<td><b>Contact Us</b>: <a href="mailto:support@ka-station.com">via email</a>&nbsp;&nbsp;&nbsp;</td>
					<td><a href="https://www.ka-station.com/index.php?route=information/contact" target="_blank">via secure form at www.ka-station.com</a>&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table>
    </div>
    <br />
    
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="">
					<tr>
						<td class="text-left active" style="width: 60%"><?php echo $column_name; ?></td>
						<td class="text-left active" style="width: 10%"><?php echo KaGlobal::t('Version'); ?></td>
						<td class="text-left active" style="width: 10%""><?php echo KaGlobal::t('Show Related'); ?></td>
						<td class="text-left active" style="width: 20%"><?php echo $column_action; ?></td>
					</tr>
				</thead>
				<tbody>
					<?php if ($extensions) { ?>
					<?php foreach ($extensions as $extension) { ?>
					<tr>
						<td class="text-left"><?php echo $extension['name']; ?></td>
						<td class="text-left"><?php echo $extension['version']; ?></td>
						<td class="text-center">
							<?php if (!empty($extension['is_installed'])) { ?>
								<input style="display:none" code="<?php echo $extension['extension']; ?>" type="checkbox" name="extension[<?php echo $extension['extension']; ?>][show_related]"<?php if (!empty($extension['show_related'])) { ?> checked="checked"<?php } ?> />
							<?php } ?>
						</td>
						<td class="text-left"><?php foreach ($extension['action'] as $action) { ?>
							[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
							<?php } ?></td>
					</tr>
					<?php } ?>
					<?php } else { ?>
					<tr>
						<td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
					</tr>
					<?php } ?>
				</tbody>
				<tbody id="container_related">
				</tbody>
			</table>
			<span class="adv">Find more useful extensions at our official <a target="_blank" href="http://www.ka-station.com/extensions-for-opencart-2">www.ka-station.com</a> site</span>
		</div>
  </div>
</div>

<script type="text/javascript"><!--

// array of all related extensions prefetched from ka-station.com server
//
var related_extensions = null;

// keep last state of shown related extensions
//
var shown_extensions = null;

var store_info = {};

store_info['oc_version'] = "<?php echo $oc_version; ?>";
store_info['location']   = "<?php echo $http_catalog; ?>";
store_info['extensions'] = {};

<?php 
if (!empty($extensions)) { 

	foreach ($extensions as $k => $v) { 
		echo "  store_info['extensions']['" . $v['extension'] . "'] = {\n";
		echo "    code: '" . $v['extension'] . "',\n";
		echo "    version: '" . $v['version'] . "',\n";
		echo "    is_installed: " . (!empty($v['is_installed']) ? '1':'0') . "\n";
		echo "  }\n";
	}
}
?>

function prefetchRelated() {

		// send information to ka-station.com in order to get related extensions
		//
		$.ajax({
			url: '<?php echo $ka_station_url; ?>/index.php?route=extension/related/getRelated',
			data: {'data':JSON.stringify(store_info)},
			dataType: 'json',
			type:'post',
			success: function(json) {
				if (json) {
					related_extensions = json;
					if (shown_extensions == null) {
						refreshRelated();
					}
				}
			}
		});  // ajax
}


function getShowRelatedStates() {
	var extensions = {};
	
	$("input[name*='show_related']").each(function(index, element) {

		if (!related_extensions[$(element).attr('code')]) {
			$(element).hide();
			extensions[$(element).attr('code')] = 0;			
		} else {
			$(element).show();
			if ($(element).prop('checked')) {
				extensions[$(element).attr('code')] = 1;
			} else {
				extensions[$(element).attr('code')] = 0;
			}
		}
	});
	
	return extensions;
}


function refreshRelated() {

	var extensions = getShowRelatedStates();
	
	$.ajax({
		url: 'index.php?route=extension/ka_extensions/updateRelated&token=<?php echo $token; ?>',
		data: extensions,
		type:'post',
		dataType: 'json',
		success: function(json) {
		}
	});

	var html = '';
	
	var active_extensions = {};
	for (var parent_code in related_extensions) {
		if (extensions[parent_code] == 1) {
			for (var related_code in related_extensions[parent_code]) {
				if (!active_extensions[related_code]) {
					active_extensions[related_code] = 1;
					html += '<tr>';
					html += '  <td class="text-left" style="opacity: 0.7;">' + related_extensions[parent_code][related_code]['name'] + '</td>';
					html += '  <td class="text-left">&nbsp;</td>';
					html += '  <td class="text-left">&nbsp;</td>';
					html += '  <td class="text-left"><a target="_blank" href="' + related_extensions[parent_code][related_code]['info_url'] + '">View Info</a></td>';
					html += '</tr>';
				}
			}
		}
	}

	
	if (shown_extensions == null) {
	
		$('#container_related').html(html);
		shown_extensions = active_extensions;
		
	} else {
		$('#container_related').fadeOut(500, function(){
			if (Object.keys(active_extensions).length > Object.keys(shown_extensions).length) {
				try {
					document.getElementById('fireball').play();
				} catch (e) {
				}
			}
				
			$('#container_related').html(html);
			$('#container_related').fadeIn(1500);
			shown_extensions = active_extensions;			
		});
	}
}

$(document).ready(function() {

	prefetchRelated();
	
	$(document).on('click', "input[name*='show_related']", function(e) {
		refreshRelated();
	});

});

//--></script>
  
<?php echo $footer; ?>