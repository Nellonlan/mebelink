/*
SEO продвижение вашего сайта - https://web-ptica.ru
*/

$(document).ready(function(){
	
$('.modalbox').fancybox();

$('input[name="phone"]').mask('+7 (999) 999-99-99');

/*$('input[type="text"], textarea').focus(function(){var place=$(this).attr('placeholder');
	$(this).removeAttr('placeholder');	$('input[type="text"], textarea').blur(function(){$(this).attr('placeholder',place);});
});*/   /*- если нужно чтобы пропадала подпись при клике на инпут*/

$('.form-valid').each(function(){
	var $formwrap=$(this);var $form=$formwrap.find('#contact',this);var $input=$formwrap.find('#contact #form_phone',this);var $btn=$formwrap.find('#contact input[type="submit"]',this);

$form.submit(function(){if($input.val()===""){
	$input.addClass("error");}
	else{$.ajax({url:'/calc.php',type:'POST',data:$form.serialize(),success:function(result){
	if(result==1)
{$.fancybox.open('<div class="modalbox-wrap"><h3 style="padding: 0 0 15px; float: none;">Спасибо,<br /> наши менеджеры скоро свяжутся с Вами</h3></div>');setTimeout(function(){$.fancybox.close();parent.$.fancybox.close();},4000);}else{$.fancybox.open('<div class="modalbox-wrap"><h3 style="padding: 0 0 15px; float: none;">Вы не ввели каптчу</h3></div>');setTimeout(function(){$.fancybox.close();parent.$.fancybox.close();},4000);}
}
});$input.removeClass("error");}

return false;});
});

$( "#telephone" ).click(function() {
$("#form_mail").addClass('skrytvrv');
$("#form_mail").val('-----');
$("#form_phone").removeClass('skrytvrv');
$("#form_phone").val('');
$("#razrvrv-acc2").val('заказать звонок');
});

$( "#mylo" ).click(function() {
$("#form_phone").addClass('skrytvrv');
$("#form_phone").val('-----');
$("#form_mail").removeClass('skrytvrv');
$("#form_mail").val('');
$("#razrvrv-acc2").val('заказать письмо');
});


try{$.browserSelector();if($("html").hasClass("chrome")){$.smoothScroll();}}catch(err){};

});