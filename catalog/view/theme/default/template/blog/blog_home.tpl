<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="blog">
      <h1><?php echo $heading_title; ?></h1>
      
      <?php if($description){ ?>
      <div class="main_description">
      <?php echo $description; ?>
      </div>
      <?php } ?>
  	
    <?php if($blogs){ ?>
		<div class="blog_grid_holder column-<?php echo $list_columns; ?>">
			<?php foreach ($blogs as $blog) { ?>
				<div class="blog_item">
                
                <div class="summary">
                
                
                <?php if($blog['image']){ ?>
                <div class="image">
				<a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>" title="<?php echo $blog['title']; ?>" /></a>
                </div>
				<h2 class="blog_title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h2>
				<?php } ?>
				<div class="blog_stats">
                
				<?php if($page_view_status){ ?><span><i class="fa fa-eye"></i><b class="text"><?php echo $text_read; ?></b> <b class="hl"><?php echo $blog['count_read']; ?></b></span><?php } ?>
				<?php if($comments_count_status){ ?><span><i class="fa fa-comments"><b class="text"></i><?php echo $text_comments; ?></b> <b class="hl"><?php echo $blog['comment_total']; ?></b></span><?php } ?>
                </div>
				
				
                </div>
               </div>
			<?php } ?>
          </div>
		<div class="row">
        <div class="col-sm-6 text-left"><?php echo $results; ?></div>
        <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
      </div>
	<?php }else{ ?>
		<div><?php echo $text_no_results; ?></div>
	<?php } ?>
    </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 