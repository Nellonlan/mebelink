<div class="blog-module latest blog">

<h3><a class="all" href="<?php echo $blog_show_all; ?>">Новости</a></h3>
    <?php if(!empty($posts)){ ?>
	<div class="blog_grid_holder latest column-<?php echo $columns; ?> carousel-<?php echo $carousel; ?> <?php echo $module; ?>">
    <?php foreach ($posts as $blog) { ?>
				<div class="blog_item">
                
                <div class="summary">
               
                
                <?php if($blog['image'] && $thumb){ ?>
                <div class="image">
				<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
                </div>
				 <h2 class="blog_title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h2>
				<?php } ?>
               
				<div class="blog_stats">
                            
				<?php if($page_view_status){ ?><span><i class="fa fa-eye"></i><b class="text"><?php echo $text_read; ?></b> <b class="hl"><?php echo $blog['count_read']; ?></b></span><a href="<?php echo $blog['href']; ?>">Комментировать</a><?php } ?>
				<?php if($comments_count_status){ ?><span><i class="fa fa-comments"><b class="text"></i><?php echo $text_comments; ?></b> <b class="hl"><?php echo $blog['comment_total']; ?></b></span><?php } ?>
                </div>
                </div>
               </div>
			<?php } ?>
		</div>
	<?php } ?>
</div>

<?php if($carousel) { ?>
<script type="text/javascript">
$(document).ready(function() {
$('.blog_grid_holder.carousel-1.<?php echo $module; ?>').owlCarousel({
itemsCustom: [ [0, 1], [500, 2], [767, <?php echo $columns;?>]],
pagination: false,
navigation:true,
navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
slideSpeed:500
}); });
</script>
<?php } ?>