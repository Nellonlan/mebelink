$(document).ready(function() {
	if ($('*').is('.openpctab')) {
	$('.pctab').hide();
  	$('.pctab.active').show();
  	$('.openpctab').click(function() {
    	$('.openpctab').removeClass('active');
    	$(this).addClass('active');
    	$(this).parents('.taby').find('.pctab').hide();
    	$('#'+$(this).attr('data')).show();
  	});
}
});