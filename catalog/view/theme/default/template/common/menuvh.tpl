<script src="catalog/view/javascript/megamenu/megamenu.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megamenu/jquery.menu-aim.js?v3"></script>
<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/megamenu.css">

<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>
<div class="page-no-scroll-bg"></div>
<div class="hidden-md hidden-lg">
	<nav id="menu-mobile-ns" class="<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>navmenu navmenu-default navmenu-fixed-left offcanvas <?php } else { ?>menu-collapse-down<?php } ?>">
		<div class="collapse navbar-collapse navbar-type2-collapse">
		  <ul class="nav navbar-nav">
			<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)){ ?>
			<li><button class="close-menu" data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"><?php echo $text_category; ?><i class="fa fa-close"></i></button></li>
			<?php } ?>
			<?php foreach ($items as $item) { ?>
				<li><a href="<?php echo $item['href']; ?>" rel="nofollow">
					<?php if ($item['children']) { ?><!--<span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span>--><?php } ?>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="mobile-menu-icon <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="mobile-menu-icon hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
					</a>
					<?php if($item['type']=="html"){?>
						<div class="collapse mob-submenu-list">
							<div class="mob-html-block">				
								<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
							</div>
					   </div>	
					<?php } ?>
					<?php if(!empty($item['children']) && ($item['type']!='html')) { ?>
						<div class="collapse mob-submenu-list">
							<ul class="list-unstyled">
								<?php foreach ($item['children'] as $child) { ?>
									<li>
										<a href="<?php echo $child['href']; ?>" rel="nofollow"><?php echo $child['name']; ?>
											<?php if (!empty($child['children'])) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
										</a>
										<?php if (!empty($child['children'])) { ?>
											<div class="collapse mob-submenu-list-3lev">
												<ul class="list-unstyled">
													<?php foreach ($child['children'] as $subchild) { ?>
													<?php if($item['type']=="freelink"){ ?>
														<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
													<?php } else { ?>
														<li><a href="<?php echo $subchild['href']; ?>"> - <?php echo $subchild['name']; ?></a></li>
													<?php } ?>
													<?php } ?>
												</ul>
											</div>
										<?php } ?>
									</li>
								<?php } ?>
							</ul>
							<?php if($item['add_html']){ ?>
								<div class="mob-html-block">
									<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
					
				</li>
			<?php } ?>
			
		  </ul>
		</div>
		<div class="icon-header-mobmen"><a target="_blank" href="https://vk.com/mebeldk40"><img style="width: 30px; margin-right: 10px;" src="/image/vkontakte.svg"></a><a target="_blank" href="https://instagram.com/mebeldk.klg"><img style="width: 30px;" src="/image/instagram.svg"></a></div>
	</nav>
</div>
<script><!--
$("#menu-mobile-ns .show-sc-mobile").click(function () {
	$(this).siblings(".collapsible").toggle();
	$(this).toggleClass("open-sc-mobile");
	$(this).parent().next().toggleClass("in");
});
--></script>
<script>
/*!
 * Jasny Bootstrap v3.1.3 (http://jasny.github.io/bootstrap)
 * Copyright 2012-2014 Arnold Daniels
 * Licensed under Apache-2.0 (https://github.com/jasny/bootstrap/blob/master/LICENSE)
 */
if("undefined"==typeof jQuery)throw new Error("Jasny Bootstrap's JavaScript requires jQuery");+function(a){"use strict";function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(void 0!==a.style[c])return{end:b[c]};return!1}void 0===a.support.transition&&(a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one(a.support.transition.end,function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b()}))}(window.jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.state=null,this.placement=null,this.options.recalc&&(this.calcClone(),a(window).on("resize",a.proxy(this.recalc,this))),this.options.autohide&&a(document).on("click",a.proxy(this.autohide,this)),this.options.toggle&&this.toggle(),this.options.disablescrolling&&(this.options.disableScrolling=this.options.disablescrolling,delete this.options.disablescrolling)};b.DEFAULTS={toggle:!0,placement:"auto",autohide:!0,recalc:!0,disableScrolling:!0},b.prototype.offset=function(){switch(this.placement){case"left":case"right":return this.$element.outerWidth();case"top":case"bottom":return this.$element.outerHeight()}},b.prototype.calcPlacement=function(){function b(a,b){if("auto"===e.css(b))return a;if("auto"===e.css(a))return b;var c=parseInt(e.css(a),10),d=parseInt(e.css(b),10);return c>d?b:a}if("auto"!==this.options.placement)return void(this.placement=this.options.placement);this.$element.hasClass("in")||this.$element.css("visiblity","hidden !important").addClass("in");var c=a(window).width()/this.$element.width(),d=a(window).height()/this.$element.height(),e=this.$element;this.placement=c>=d?b("left","right"):b("top","bottom"),"hidden !important"===this.$element.css("visibility")&&this.$element.removeClass("in").css("visiblity","")},b.prototype.opposite=function(a){switch(a){case"top":return"bottom";case"left":return"right";case"bottom":return"top";case"right":return"left"}},b.prototype.getCanvasElements=function(){var b=this.options.canvas?a(this.options.canvas):this.$element,c=b.find("*").filter(function(){return"fixed"===a(this).css("position")}).not(this.options.exclude);return b.add(c)},b.prototype.slide=function(b,c,d){if(!a.support.transition){var e={};return e[this.placement]="+="+c,b.animate(e,350,d)}var f=this.placement,g=this.opposite(f);b.each(function(){"auto"!==a(this).css(f)&&a(this).css(f,(parseInt(a(this).css(f),10)||0)+c),"auto"!==a(this).css(g)&&a(this).css(g,(parseInt(a(this).css(g),10)||0)-c)}),this.$element.one(a.support.transition.end,d).emulateTransitionEnd(350)},b.prototype.disableScrolling=function(){var b=a("body").width(),c="padding-"+this.opposite(this.placement);if(void 0===a("body").data("offcanvas-style")&&a("body").data("offcanvas-style",a("body").attr("style")||""),a("body").css("overflow","hidden"),a("body").width()>b){var d=parseInt(a("body").css(c),10)+a("body").width()-b;setTimeout(function(){a("body").css(c,d)},1)}},b.prototype.show=function(){if(!this.state){var b=a.Event("show.bs.offcanvas");if(this.$element.trigger(b),!b.isDefaultPrevented()){this.state="slide-in",this.calcPlacement();var c=this.getCanvasElements(),d=this.placement,e=this.opposite(d),f=this.offset();-1!==c.index(this.$element)&&(a(this.$element).data("offcanvas-style",a(this.$element).attr("style")||""),this.$element.css(d,-1*f),this.$element.css(d)),c.addClass("canvas-sliding").each(function(){void 0===a(this).data("offcanvas-style")&&a(this).data("offcanvas-style",a(this).attr("style")||""),"static"===a(this).css("position")&&a(this).css("position","fixed"),"auto"!==a(this).css(d)&&"0px"!==a(this).css(d)||"auto"!==a(this).css(e)&&"0px"!==a(this).css(e)||a(this).css(d,0)}),this.options.disableScrolling&&this.disableScrolling();var g=function(){"slide-in"==this.state&&(this.state="slid",c.removeClass("canvas-sliding").addClass("canvas-slid"),this.$element.trigger("shown.bs.offcanvas"))};setTimeout(a.proxy(function(){this.$element.addClass("in"),this.slide(c,f,a.proxy(g,this))},this),1)}}},b.prototype.hide=function(){if("slid"===this.state){var b=a.Event("hide.bs.offcanvas");if(this.$element.trigger(b),!b.isDefaultPrevented()){this.state="slide-out";var c=a(".canvas-slid"),d=(this.placement,-1*this.offset()),e=function(){"slide-out"==this.state&&(this.state=null,this.placement=null,this.$element.removeClass("in"),c.removeClass("canvas-sliding"),c.add(this.$element).add("body").each(function(){a(this).attr("style",a(this).data("offcanvas-style")).removeData("offcanvas-style")}),this.$element.trigger("hidden.bs.offcanvas"))};c.removeClass("canvas-slid").addClass("canvas-sliding"),setTimeout(a.proxy(function(){this.slide(c,d,a.proxy(e,this))},this),1)}}},b.prototype.toggle=function(){"slide-in"!==this.state&&"slide-out"!==this.state&&this["slid"===this.state?"hide":"show"]()},b.prototype.calcClone=function(){this.$calcClone=this.$element.clone().html("").addClass("offcanvas-clone").removeClass("in").appendTo(a("body"))},b.prototype.recalc=function(){if("none"!==this.$calcClone.css("display")&&("slid"===this.state||"slide-in"===this.state)){this.state=null,this.placement=null;var b=this.getCanvasElements();this.$element.removeClass("in"),b.removeClass("canvas-slid"),b.add(this.$element).add("body").each(function(){a(this).attr("style",a(this).data("offcanvas-style")).removeData("offcanvas-style")})}},b.prototype.autohide=function(b){0===a(b.target).closest(this.$element).length&&this.hide()};var c=a.fn.offcanvas;a.fn.offcanvas=function(c){return this.each(function(){var d=a(this),e=d.data("bs.offcanvas"),f=a.extend({},b.DEFAULTS,d.data(),"object"==typeof c&&c);e||d.data("bs.offcanvas",e=new b(this,f)),"string"==typeof c&&e[c]()})},a.fn.offcanvas.Constructor=b,a.fn.offcanvas.noConflict=function(){return a.fn.offcanvas=c,this},a(document).on("click.bs.offcanvas.data-api","[data-toggle=offcanvas]",function(b){var c,d=a(this),e=d.attr("data-target")||b.preventDefault()||(c=d.attr("href"))&&c.replace(/.*(?=#[^\s]+$)/,""),f=a(e),g=f.data("bs.offcanvas"),h=g?"toggle":d.data();b.stopPropagation(),g?g.toggle():f.offcanvas(h)})}(window.jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.$element.on("click.bs.rowlink","td:not(.rowlink-skip)",a.proxy(this.click,this))};b.DEFAULTS={target:"a"},b.prototype.click=function(b){var c=a(b.currentTarget).closest("tr").find(this.options.target)[0];if(a(b.target)[0]!==c)if(b.preventDefault(),c.click)c.click();else if(document.createEvent){var d=document.createEvent("MouseEvents");d.initMouseEvent("click",!0,!0,window,0,0,0,0,0,!1,!1,!1,!1,0,null),c.dispatchEvent(d)}};var c=a.fn.rowlink;a.fn.rowlink=function(c){return this.each(function(){var d=a(this),e=d.data("bs.rowlink");e||d.data("bs.rowlink",e=new b(this,c))})},a.fn.rowlink.Constructor=b,a.fn.rowlink.noConflict=function(){return a.fn.rowlink=c,this},a(document).on("click.bs.rowlink.data-api",'[data-link="row"]',function(b){if(0===a(b.target).closest(".rowlink-skip").length){var c=a(this);c.data("bs.rowlink")||(c.rowlink(c.data()),a(b.target).trigger("click.bs.rowlink"))}})}(window.jQuery),+function(a){"use strict";var b=void 0!==window.orientation,c=navigator.userAgent.toLowerCase().indexOf("android")>-1,d="Microsoft Internet Explorer"==window.navigator.appName,e=function(b,d){c||(this.$element=a(b),this.options=a.extend({},e.DEFAULTS,d),this.mask=String(this.options.mask),this.init(),this.listen(),this.checkVal())};e.DEFAULTS={mask:"",placeholder:"_",definitions:{9:"[0-9]",a:"[A-Za-z]",w:"[A-Za-z0-9]","*":"."}},e.prototype.init=function(){var b=this.options.definitions,c=this.mask.length;this.tests=[],this.partialPosition=this.mask.length,this.firstNonMaskPos=null,a.each(this.mask.split(""),a.proxy(function(a,d){"?"==d?(c--,this.partialPosition=a):b[d]?(this.tests.push(new RegExp(b[d])),null===this.firstNonMaskPos&&(this.firstNonMaskPos=this.tests.length-1)):this.tests.push(null)},this)),this.buffer=a.map(this.mask.split(""),a.proxy(function(a){return"?"!=a?b[a]?this.options.placeholder:a:void 0},this)),this.focusText=this.$element.val(),this.$element.data("rawMaskFn",a.proxy(function(){return a.map(this.buffer,function(a,b){return this.tests[b]&&a!=this.options.placeholder?a:null}).join("")},this))},e.prototype.listen=function(){if(!this.$element.attr("readonly")){var b=(d?"paste":"input")+".mask";this.$element.on("unmask.bs.inputmask",a.proxy(this.unmask,this)).on("focus.bs.inputmask",a.proxy(this.focusEvent,this)).on("blur.bs.inputmask",a.proxy(this.blurEvent,this)).on("keydown.bs.inputmask",a.proxy(this.keydownEvent,this)).on("keypress.bs.inputmask",a.proxy(this.keypressEvent,this)).on(b,a.proxy(this.pasteEvent,this))}},e.prototype.caret=function(a,b){if(0!==this.$element.length){if("number"==typeof a)return b="number"==typeof b?b:a,this.$element.each(function(){if(this.setSelectionRange)this.setSelectionRange(a,b);else if(this.createTextRange){var c=this.createTextRange();c.collapse(!0),c.moveEnd("character",b),c.moveStart("character",a),c.select()}});if(this.$element[0].setSelectionRange)a=this.$element[0].selectionStart,b=this.$element[0].selectionEnd;else if(document.selection&&document.selection.createRange){var c=document.selection.createRange();a=0-c.duplicate().moveStart("character",-1e5),b=a+c.text.length}return{begin:a,end:b}}},e.prototype.seekNext=function(a){for(var b=this.mask.length;++a<=b&&!this.tests[a];);return a},e.prototype.seekPrev=function(a){for(;--a>=0&&!this.tests[a];);return a},e.prototype.shiftL=function(a,b){var c=this.mask.length;if(!(0>a)){for(var d=a,e=this.seekNext(b);c>d;d++)if(this.tests[d]){if(!(c>e&&this.tests[d].test(this.buffer[e])))break;this.buffer[d]=this.buffer[e],this.buffer[e]=this.options.placeholder,e=this.seekNext(e)}this.writeBuffer(),this.caret(Math.max(this.firstNonMaskPos,a))}},e.prototype.shiftR=function(a){for(var b=this.mask.length,c=a,d=this.options.placeholder;b>c;c++)if(this.tests[c]){var e=this.seekNext(c),f=this.buffer[c];if(this.buffer[c]=d,!(b>e&&this.tests[e].test(f)))break;d=f}},e.prototype.unmask=function(){this.$element.unbind(".mask").removeData("inputmask")},e.prototype.focusEvent=function(){this.focusText=this.$element.val();var a=this.mask.length,b=this.checkVal();this.writeBuffer();var c=this,d=function(){b==a?c.caret(0,b):c.caret(b)};d(),setTimeout(d,50)},e.prototype.blurEvent=function(){this.checkVal(),this.$element.val()!==this.focusText&&this.$element.trigger("change")},e.prototype.keydownEvent=function(a){var c=a.which;if(8==c||46==c||b&&127==c){var d=this.caret(),e=d.begin,f=d.end;return f-e===0&&(e=46!=c?this.seekPrev(e):f=this.seekNext(e-1),f=46==c?this.seekNext(f):f),this.clearBuffer(e,f),this.shiftL(e,f-1),!1}return 27==c?(this.$element.val(this.focusText),this.caret(0,this.checkVal()),!1):void 0},e.prototype.keypressEvent=function(a){var b=this.mask.length,c=a.which,d=this.caret();if(a.ctrlKey||a.altKey||a.metaKey||32>c)return!0;if(c){d.end-d.begin!==0&&(this.clearBuffer(d.begin,d.end),this.shiftL(d.begin,d.end-1));var e=this.seekNext(d.begin-1);if(b>e){var f=String.fromCharCode(c);if(this.tests[e].test(f)){this.shiftR(e),this.buffer[e]=f,this.writeBuffer();var g=this.seekNext(e);this.caret(g)}}return!1}},e.prototype.pasteEvent=function(){var a=this;setTimeout(function(){a.caret(a.checkVal(!0))},0)},e.prototype.clearBuffer=function(a,b){for(var c=this.mask.length,d=a;b>d&&c>d;d++)this.tests[d]&&(this.buffer[d]=this.options.placeholder)},e.prototype.writeBuffer=function(){return this.$element.val(this.buffer.join("")).val()},e.prototype.checkVal=function(a){for(var b=this.mask.length,c=this.$element.val(),d=-1,e=0,f=0;b>e;e++)if(this.tests[e]){for(this.buffer[e]=this.options.placeholder;f++<c.length;){var g=c.charAt(f-1);if(this.tests[e].test(g)){this.buffer[e]=g,d=e;break}}if(f>c.length)break}else this.buffer[e]==c.charAt(f)&&e!=this.partialPosition&&(f++,d=e);return!a&&d+1<this.partialPosition?(this.$element.val(""),this.clearBuffer(0,b)):(a||d+1>=this.partialPosition)&&(this.writeBuffer(),a||this.$element.val(this.$element.val().substring(0,d+1))),this.partialPosition?e:this.firstNonMaskPos};var f=a.fn.inputmask;a.fn.inputmask=function(b){return this.each(function(){var c=a(this),d=c.data("bs.inputmask");d||c.data("bs.inputmask",d=new e(this,b))})},a.fn.inputmask.Constructor=e,a.fn.inputmask.noConflict=function(){return a.fn.inputmask=f,this},a(document).on("focus.bs.inputmask.data-api","[data-mask]",function(){var b=a(this);b.data("bs.inputmask")||b.inputmask(b.data())})}(window.jQuery),+function(a){"use strict";var b="Microsoft Internet Explorer"==window.navigator.appName,c=function(b,c){if(this.$element=a(b),this.$input=this.$element.find(":file"),0!==this.$input.length){this.name=this.$input.attr("name")||c.name,this.$hidden=this.$element.find('input[type=hidden][name="'+this.name+'"]'),0===this.$hidden.length&&(this.$hidden=a('<input type="hidden">').insertBefore(this.$input)),this.$preview=this.$element.find(".fileinput-preview");var d=this.$preview.css("height");"inline"!==this.$preview.css("display")&&"0px"!==d&&"none"!==d&&this.$preview.css("line-height",d),this.original={exists:this.$element.hasClass("fileinput-exists"),preview:this.$preview.html(),hiddenVal:this.$hidden.val()},this.listen()}};c.prototype.listen=function(){this.$input.on("change.bs.fileinput",a.proxy(this.change,this)),a(this.$input[0].form).on("reset.bs.fileinput",a.proxy(this.reset,this)),this.$element.find('[data-trigger="fileinput"]').on("click.bs.fileinput",a.proxy(this.trigger,this)),this.$element.find('[data-dismiss="fileinput"]').on("click.bs.fileinput",a.proxy(this.clear,this))},c.prototype.change=function(b){var c=void 0===b.target.files?b.target&&b.target.value?[{name:b.target.value.replace(/^.+\\/,"")}]:[]:b.target.files;if(b.stopPropagation(),0===c.length)return void this.clear();this.$hidden.val(""),this.$hidden.attr("name",""),this.$input.attr("name",this.name);var d=c[0];if(this.$preview.length>0&&("undefined"!=typeof d.type?d.type.match(/^image\/(gif|png|jpeg)$/):d.name.match(/\.(gif|png|jpe?g)$/i))&&"undefined"!=typeof FileReader){var e=new FileReader,f=this.$preview,g=this.$element;e.onload=function(b){var e=a("<img>");e[0].src=b.target.result,c[0].result=b.target.result,g.find(".fileinput-filename").text(d.name),"none"!=f.css("max-height")&&e.css("max-height",parseInt(f.css("max-height"),10)-parseInt(f.css("padding-top"),10)-parseInt(f.css("padding-bottom"),10)-parseInt(f.css("border-top"),10)-parseInt(f.css("border-bottom"),10)),f.html(e),g.addClass("fileinput-exists").removeClass("fileinput-new"),g.trigger("change.bs.fileinput",c)},e.readAsDataURL(d)}else this.$element.find(".fileinput-filename").text(d.name),this.$preview.text(d.name),this.$element.addClass("fileinput-exists").removeClass("fileinput-new"),this.$element.trigger("change.bs.fileinput")},c.prototype.clear=function(a){if(a&&a.preventDefault(),this.$hidden.val(""),this.$hidden.attr("name",this.name),this.$input.attr("name",""),b){var c=this.$input.clone(!0);this.$input.after(c),this.$input.remove(),this.$input=c}else this.$input.val("");this.$preview.html(""),this.$element.find(".fileinput-filename").text(""),this.$element.addClass("fileinput-new").removeClass("fileinput-exists"),void 0!==a&&(this.$input.trigger("change"),this.$element.trigger("clear.bs.fileinput"))},c.prototype.reset=function(){this.clear(),this.$hidden.val(this.original.hiddenVal),this.$preview.html(this.original.preview),this.$element.find(".fileinput-filename").text(""),this.original.exists?this.$element.addClass("fileinput-exists").removeClass("fileinput-new"):this.$element.addClass("fileinput-new").removeClass("fileinput-exists"),this.$element.trigger("reset.bs.fileinput")},c.prototype.trigger=function(a){this.$input.trigger("click"),a.preventDefault()};var d=a.fn.fileinput;a.fn.fileinput=function(b){return this.each(function(){var d=a(this),e=d.data("bs.fileinput");e||d.data("bs.fileinput",e=new c(this,b)),"string"==typeof b&&e[b]()})},a.fn.fileinput.Constructor=c,a.fn.fileinput.noConflict=function(){return a.fn.fileinput=d,this},a(document).on("click.fileinput.data-api",'[data-provides="fileinput"]',function(b){var c=a(this);if(!c.data("bs.fileinput")){c.fileinput(c.data());var d=a(b.target).closest('[data-dismiss="fileinput"],[data-trigger="fileinput"]');d.length>0&&(b.preventDefault(),d.trigger("click.bs.fileinput"))}})}(window.jQuery);
</script>
<?php } ?>


<?php if($config_fixed_panel_top) { ?>
<script type="text/javascript">
<?php if($config_main_menu_selection =='0') { ?>
jQuery(function($){
		var scrolled = false;
		$(window).scroll(function(){
			    if(200<$(window).scrollTop() && !scrolled){                   
					if(!$('#top-fixed #horizontal-menu').length){
						$('#top-fixed').addClass("sticky-header-2");
						var menu_2 = $('.menu-fixed').html();					
						$('#top-fixed').append('<div>'+ menu_2 +'</div>');					
						scrolled = true;
					$('#top-fixed').hover(function() {
						$('#top-fixed #horizontal-menu .menu-full-width .dropdown-menu').each(function() {
							var menu = $('#horizontal-menu .container').offset();
							var dropdown = $(this).parent().offset();		
							var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#horizontal-menu .container').outerWidth());	
							
							if (i > 0) {
								$(this).css('margin-left', '-' + (i + 10) + 'px');
							} 
							var width = $('#horizontal-menu .container').outerWidth();
							$(this).css('width', '' + (width - 23) + 'px');
						});
					});
						
					}
				}
				if(200>=$(window).scrollTop() && scrolled){
					$('#top-fixed').removeClass("sticky-header-2");
				    $('#top-fixed div').remove();
					scrolled = false;
				}
		});
	});
<?php } ?>
</script>
<?php } ?>

<div id="top-fixed" class="hidden-xs hidden-sm">
	<div class="container"></div>
</div>


<?php if($config_main_menu_selection =='0') { ?>
<?php if ($items) { ?>
<div class="menu-fixed ">
	<?php if($hmenu_type =='1') { ?>
		<nav id="horizontal-menu" class="navbar">
	<?php } ?>
  <div class="container">
  	<?php if($hmenu_type =='0') { ?>
		<nav id="horizontal-menu" class="navbar hmenu_type">
	<?php } ?>
		<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
		  <button type="button" class="btn btn-navbar navbar-toggle" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"<?php } else { ?>data-toggle="collapse" data-target=".navbar-ex1-collapse"<?php } ?>><i class="fa fa-bars"></i></button>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse <?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>hidden-xs hidden-sm<?php } ?>">
		  <ul class="nav navbar-nav rfaz">
		  
			<?php foreach ($items as $item) { ?>
				<?php if ($item['children']) { ?>
				<li class="defde dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
					</a>
					<?php if($item['type']=="freelink"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
						<div class="dropdown-inner">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?><?php echo $child['name']; ?></a>
									<?php if(count($child['children'])){?>
										<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											<?php foreach ($child['children'] as $subchild) { ?>
												<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
											<?php } ?>
										</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>            
					   </div>
					<?php } ?>
					<?php } ?>
					<?php if($item['type']=="freelink"){?>
					<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
						 <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
							<div class="dropdown-inner">
								<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
								 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
									<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
									<div class="row">
										<?php foreach ($children as $child) { ?>
										<div class="nsmenu-parent-block<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
											<?php if($item['subtype']=="full_image"){ ?>
											<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
											<?php } ?>
											<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
											
											<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild">
													<?php foreach ($child['children'] as $subchild) { ?>
													<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
													<?php } ?>
												</ul>
											<?php } ?>	
											
										</div>
										<?php } ?>	
									</div>
									<?php } ?>	
								</div>
								<?php if($item['add_html']){?>
								<div class="col-sm-4 menu-add-html">
									<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
								</div>
								<?php }?>
							</div>             
						</div>
					<?php } ?>
					<?php } ?>	
					<?php if($item['type']=="category"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
						<div class="dropdown-inner">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
									<?php echo $child['name']; ?>
									</a>
									<?php if(!empty($child['children'])){?>
									<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
									 <?php foreach ($child['children'] as $subchild) { ?>
									<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
									<?php } ?>
									</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>
						</div>
						<?php } ?>	
						<?php } ?>
						
							<?php if($item['type']=="category"){?>
							<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
							  <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
								<div class="dropdown-inner">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
													<?php if($item['subtype']=="full_image") { ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
															<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
															<?php } ?>
														</ul>
													<?php } ?>	
													
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>
									</div>  
								</div>
								<?php }?>	
								<?php }?>
								
								<?php if($item['type']=="html"){?>
								  <div class="dropdown-menu nsmenu-type-html nsmenu-bigblock">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">										
											<li class="nsmenu-parent-block">
												<div class="nsmenu-html-block">				
													<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
											</li>
										</ul>									
									</div>            
								   </div>	
								<?php } ?>
								
								<?php if($item['type']=="manufacturer"){?>
									<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock">
										<?php if($item['type_manuf'] == "type_alphabet"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php if ($item['result_manufacturer_a']) { ?>
													<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
													<div class="row">
													<?php foreach ($manufacturer_a as $man_alphabet) { ?>
														<?php if ($man_alphabet['manufacturer']) { ?>
															<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																		<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																	<?php } ?>
																</div>
															<?php } ?>
														
														<?php } ?>
													<?php } ?>
													</div>
													<?php } ?>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if($item['type_manuf'] == "type_image"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div> 
										<?php } ?>	            
									</div>
								<?php } ?>
								
								<?php if($item['type']=="information"){?>	
									<div class="dropdown-menu nsmenu-type-information <?php if($item['add_html']){?>nsmenu-bigblock<?php } ?>">
										<div class="dropdown-inner">
												<?php if($item['add_html']){?>
													<div class="menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
												<?php }?>									  
												<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){?>nsmenu-blockwithimage<?php } ?>">
													<?php foreach ($item['children'] as $child) { ?>
														<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php } ?>
												</ul>
										</div>            
									</div>
								<?php } ?>
								
								<?php if($item['type']=="product"){?>
									<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock">
										<div class="dropdown-inner">
											<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
												<?php if($item['add_html']){?>
													<div class="menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
												<?php } ?>
												<ul class="list-unstyled nsmenu-haschild nsmenu-blockwithimage">
													<?php foreach ($children as $child) { ?>
														<li class="nsmenu-parent-block">
															<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
															<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
															<div class="price">
																<?php if (!$child['special']) { ?>
																	<?php echo $child['price']; ?>
																<?php } else { ?>
																	<span class="price-old"><?php echo $child['price']; ?></span> 
																	<span class="price-new"><?php echo $child['special']; ?></span>
																<?php } ?>
															</div>					
														</li>
													<?php } ?>
												</ul>
											<?php } ?>
										</div>            
									</div>
								<?php } ?>
					</li>
				<?php } else {  ?>
					<li class="defde"><a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>">
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
				<?php } ?>
			<?php } ?>
		  </ul>
		</div>
		<?php if($hmenu_type =='0') { ?>
			</nav>
		<?php } ?>
	</div>
		<?php if($hmenu_type =='1') { ?>
			</nav>
		<?php } ?>
		
 </div>
<?php } ?>
<?php } ?>


<?php if($config_main_menu_selection =='1') { ?>
<div class="container">
	<div class="row">   
		<div class="col-md-9 col-md-push-3 hidden-xs hidden-sm clearfix">	   	
		<?php if($additional) {?>
		<nav id="additional-menu" class="navbar hmenu_type">
		<div>
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<?php if($item['children']) { ?>
				<?php if($item['additional_menu']=="additional"){ ?>
				<li class="defde dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
					</a>
				
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
							<?php if($item['subtype']=="simple"){ ?>
							<?php if($item['additional_menu']=="additional"){ ?>
							 <div class="dropdown-menu nsmenu-type-category-simple">
								<div class="dropdown-inner">
									<ul class="list-unstyled nsmenu-haschild">
										<?php foreach ($item['children'] as $child) { ?>
										<li <?php if(!empty($child['children'])){?>class="nsmenu-issubchild"<?php } ?>>
											<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
											<?php if(!empty($child['children'])){?>
											<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											 <?php foreach ($child['children'] as $subchild) { ?>
												<?php if($item['type']=="freelink"){ ?>
													<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
												<?php } else { ?>
													<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></li>
												<?php } ?>
															
											<?php } ?>
											</ul>
											<?php } ?>				
										</li>
										<?php } ?>
									</ul>
								</div>            
								</div>
							<?php } ?>	
							<?php } ?>
							<?php } ?>
					
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
							<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full") ){?>
							<?php if($item['additional_menu']=="additional"){ ?>
								<div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock-additional">
									<div class="dropdown-inner">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
													<?php if($item['subtype']=="full_image"){ ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
																<?php if($item['type']=="freelink"){ ?>
																	<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>	
																<?php } else { ?>
																	<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>	
																<?php } ?>
															<?php } ?>
														</ul>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>
									</div>            
								</div>
								<?php } ?>	
								<?php } ?>
								<?php } ?>
								<?php if($item['type']=="html"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
								  <div class="dropdown-menu nsmenu-type-html nsmenu-bigblock-additional">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">										
											<li class="nsmenu-parent-block">
												<div class="nsmenu-html-block">				
													<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
											</li>
										</ul>									
									</div>            
								   </div>	
								<?php } ?>
								<?php } ?>
								<?php if($item['type']=="manufacturer"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
									<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock-additional">
										<?php if($item['type_manuf'] == "type_alphabet"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php if ($item['result_manufacturer_a']) { ?>
													<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
													<div class="row">
													<?php foreach ($manufacturer_a as $man_alphabet) { ?>
														<?php if ($man_alphabet['manufacturer']) { ?>
															<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																		<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																	<?php } ?>
																</div>
															<?php } ?>
														
														<?php } ?>
													<?php } ?>
													</div>
													<?php } ?>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if($item['type_manuf'] == "type_image"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div> 
										<?php } ?>		
									</div>
								<?php }?>
								<?php }?>
								
								<?php if($item['type']=="information"){?>
								<?php if($item['additional_menu']=="additional"){ ?>								
									<div class="dropdown-menu nsmenu-type-information <?php if($item['add_html']){?>nsmenu-bigblock-additional<?php }?>">
										<div class="dropdown-inner">
												<?php if($item['add_html']){?>
													<div class="menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
												<?php }?>									  
												<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){?>nsmenu-blockwithimage<?php }?>">
													<?php foreach ($item['children'] as $child) { ?>
														<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php } ?>
												</ul>
										</div>            
									</div>
								<?php } ?>
								<?php } ?>
								
								<?php if($item['type']=="product"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
									<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock-additional">
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
														<div class="price">
															<?php if (!$child['special']) { ?>
																<?php echo $child['price']; ?>
															<?php } else { ?>
																<span class="price-old"><?php echo $child['price']; ?></span> 
																<span class="price-new"><?php echo $child['special']; ?></span>
															<?php } ?>
														</div>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php }?>
										</div>             
									</div>
								<?php }?>
								<?php }?>
					</li>
					<?php } ?>
				<?php } else {  ?>
					<?php if($item['additional_menu']=="additional"){ ?>
						<li><a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';}?> class="<?php if(!$item['thumb']){?>no-img-parent-link<?php } ?>" href="<?php echo $item['href']; ?>">
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		  </ul>
		</div>		
	   </nav>   
<?php } ?>	   
	  </div>
		<div class="col-sm-12 col-md-3 col-md-pull-9 menu-box">
			<?php if ($items) { ?>
			<nav id="menu-vertical" class="btn-group btn-block">
				<button type="button" class="btn btn-menu btn-block dropdown-toggle" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"<?php } else { ?>data-toggle="dropdown"<?php } ?>>
					<i class="fa fa-bars"></i>
					<span class="text-category"><?php echo $text_category; ?></span>
				</button>
				<ul id="menu-vertical-list" class="dropdown-menu <?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>hidden-xs hidden-sm<?php } ?>">
					<?php foreach ($items as $item) { ?>
						<?php if ($item['children']) { ?>
							<li class="dropdown <?php if($item['additional_menu']=="additional"){ ?>hidden-md hidden-lg<?php } ?>">
							<span class="toggle-child">
								<i class="fa fa-plus plus"></i>
								<i class="fa fa-minus minus"></i>
							</span>
								<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link" class="parent-link"'; } else {echo 'class="parent-link dropdown-img"';} ?>>
									<?php if($item['thumb']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
									<?php } ?>
									<?php if($item['thumb_hover']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
									<?php } ?>
									
									<i class="fa fa-angle-down arrow"></i>
									<?php if(!empty($item['sticker_parent'])){?>
										<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
									<?php } ?>
									<?php echo $item['name']; ?>
								</a>
								
								<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
								<?php if($item['subtype']=="simple"){ ?>
								  <div class="ns-dd dropdown-menu-simple nsmenu-type-category-simple">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">
											<?php foreach ($item['children'] as $child) { ?>
											<li <?php if(!empty($child['children'])){?> class="nsmenu-issubchild"<?php } ?>>
												<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
												<?php echo $child['name']; ?>
												</a>
												<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
													<?php foreach ($child['children'] as $subchild) { ?>
														<?php if($item['type']=="freelink"){ ?>
															<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
														<?php } else { ?>
															<li class="<?php if(count($subchild['child_4level_data'])){?> ischild_4level_simple<?php } ?>">
																<a href="<?php echo $subchild['href']; ?>"><?php if(count($subchild['child_4level_data'])){?><i class="fa fa-angle-down arrow"></i><?php }?>
																<?php echo $subchild['name']; ?>
																</a>
																<?php if(!empty($subchild['child_4level_data'])){ ?>
																<ul class="list-unstyled child_4level_simple">
																	<?php foreach ($subchild['child_4level_data'] as $child_4level_data) { ?>
																		<li><a href="<?php echo $child_4level_data['href']; ?>"><?php echo $child_4level_data['name']; ?></a></li>
																	<?php } ?>
																</ul>
																<?php } ?>
															</li>				
														<?php } ?>
													<?php } ?>
												</ul>
												<?php } ?>				
											</li>
											<?php } ?>
										</ul>
									</div>            
									</div>
									
									<?php } ?>	
									<?php } ?>
									
										<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
										<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
										<div class="ns-dd dropdown-menu-full-image nsmenu-type-category-full-image box-col-3">
											<div class="dropdown-inner">
												<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
													<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
													<div class="row">
														<?php foreach ($children as $child) { ?>
														<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
															<?php if($item['subtype']=="full_image"){?>
															<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
															<?php } ?>
															<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>">
															<?php echo $child['name']; ?>
															</a>
															
															<?php if(!empty($child['children'])){ ?>
																<ul class="list-unstyled nsmenu-ischild">
																	<?php foreach ($child['children'] as $subchild) { ?>
																		<?php if($item['type']=="freelink"){ ?>
																			<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
																		<?php } else { ?>
																			<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
																		<?php } ?>
																	<?php } ?>
																</ul>
															<?php } ?>	
															
														</div>
														<?php } ?>	
													</div>
													<?php } ?>	
												</div>
												<?php if($item['add_html']){?>
												<div class="col-sm-4 menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
												<?php }?>
											</div>            
										</div>
										<?php }?>
										<?php }?>
										
										<?php if($item['type']=="html"){?>
										  <div class="ns-dd dropdown-menu-html-block nsmenu-type-html box-col-3">
											<div class="dropdown-inner">
												<ul class="list-unstyled nsmenu-haschild">										
													<li class="nsmenu-parent-block">
														<div class="nsmenu-html-block">				
															<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
													</li>
												</ul>									
											</div>            
										   </div>	
										<?php } ?>
										
										<?php if($item['type']=="manufacturer"){ ?>
											<div class="ns-dd dropdown-menu-manufacturer nsmenu-type-manufacturer <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-2 <?php } ?>">
												<?php if($item['type_manuf'] == "type_alphabet"){ ?>
													<div class="dropdown-inner">
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
															<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
															<?php if ($item['result_manufacturer_a']) { ?>
																<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
																<div class="row">
																<?php foreach ($manufacturer_a as $man_alphabet) { ?>
																	<?php if ($man_alphabet['manufacturer']) { ?>
																		<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																			<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																			<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																				<?php foreach ($manufacturers as $manufacturer) { ?>
																					<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																				<?php } ?>
																			</div>
																		<?php } ?>
																	
																	<?php } ?>
																<?php } ?>
																</div>
																<?php } ?>
															<?php } ?>
														</div>
														<?php if($item['add_html']){ ?>
														<div class="col-sm-4 menu-add-html">
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													</div>
													<?php } ?>
													<?php if($item['type_manuf'] == "type_image"){ ?>
													<div class="dropdown-inner">
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
														 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
															<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
															<div class="row">
																<?php foreach ($children as $child) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																	<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
																	<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																</div>
																<?php } ?>	
															</div>
															<?php } ?>	
														</div>
														<?php if($item['add_html']){ ?>
														<div class="col-sm-4 menu-add-html">
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													</div> 
													<?php } ?>	           
											</div>
									
										<?php }?>
										
										<?php if($item['type']=="information"){?>
											<div class="ns-dd dropdown-menu-information nsmenu-type-information <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-1 <?php } ?>">
												<div class="dropdown-inner">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 2 : 1; ?>
														<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / $num_columns)) as $children) { ?>
															<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){ ?>col-xs-12 col-sm-6<?php } ?>">
																<?php foreach ($children as $child) { ?>
																	<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
																<?php } ?>
															</ul>
														<?php } ?>	
													</div>
													<?php if($item['add_html']){ ?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php } ?>
												</div>
											</div>
										<?php } ?>
										
										<?php if($item['type']=="product"){ ?>
											<div class="ns-dd dropdown-menu-product nsmenu-type-product box-col-3">
												<div class="dropdown-inner">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
														<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
														<div class="row">
															<?php foreach ($children as $child) { ?>
															<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
																<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																<div class="price">
																	<?php if (!$child['special']) { ?>
																		<?php echo $child['price']; ?>
																	<?php } else { ?>
																		<span class="price-old"><?php echo $child['price']; ?></span> 
																		<span class="price-new"><?php echo $child['special']; ?></span>
																	<?php } ?>
																</div>
															</div>
															<?php } ?>	
														</div>
														<?php } ?>	
													</div>
													<?php if($item['add_html']){?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php }?>
												</div>          
											</div>
										<?php } ?>
							</li>
						<?php } else {  ?>
								<li <?php if($item['additional_menu']=="additional"){ ?>class="hidden-md hidden-lg"<?php } ?>>						
									<a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>">
										<?php if($item['thumb']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
										<?php } ?>
										<?php if($item['thumb_hover']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
										<?php } ?>
										<?php if(!empty($item['sticker_parent'])){?>
											<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
										<?php } ?>
										<?php echo $item['name']; ?>
									</a>
								</li>							
						<?php } ?>
					<?php } ?>
				</ul>
			</nav>
				<?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
				<div id="maskMenuHC"></div>	
				<?php } ?>
			<?php } ?>
		</div>	
    </div>
    </div>
<?php } ?>
<script>
$('.nsmenu-type-manufacturer a[data-toggle="tooltip"]').tooltip({
	animated: 'fade',
	placement: 'top',
	template: '<div class="tooltip tooltip-manufacturer" role="tooltip"><div class="arrow"></div><div class="tooltip-inner tooltip-manufacturer-inner"></div></div>',
	html: true
});
</script>