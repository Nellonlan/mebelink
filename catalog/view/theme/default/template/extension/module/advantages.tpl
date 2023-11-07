<?php if ($title_size > 24) { ?>
<?php $bold = ' font-weight: 200'; ?>
<?php } else { ?>
<?php $bold = ' font-weight: 200'; ?>
<?php } ?>
<?php if ($title_show) { ?>
<h2 class="advantages"><?php echo $heading_title; ?></h2>
<?php } ?>
<?php if ($background && !$background_color) { ?>
<div style="background-image:url('/image/<?php echo $background; ?>'); background-position:center" class="advantages-block">
<?php } elseif ($background_color) { ?>
<div style="background-color: <?php echo $background_color; ?>" class="advantages-block">
<?php } else { ?>
<div style="padding: 0" class="advantages-block">
<?php } ?>
        <div class="col-lg-<?php echo $blocks_inline; ?> col-md-<?php echo $blocks_inline; ?> col-sm-6 col-xs-12">
	<?php if ($link1 && !$readmore_show) { ?><a href="<?php echo $link1; ?>" class="advantage_link"><?php } ?>
          <div class="advantage<?php if ($image_position == 'top') { ?> pos-center<?php } ?>">
		<?php if (!$icon1) { ?>
			<?php if ($image1) { ?>
				<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><img src="<?php echo $image1; ?>" alt="" /></div>
			<?php } ?>
		<?php } else { ?>
			<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><i style="font-size: <?php echo $icon_size; ?>px; color: <?php echo $icon_color; ?>" class="fa fa-<?php echo $icon1; ?>" aria-hidden="true"></i></div>
		<?php } ?>
              <div class="caption<?php if ($image_position == 'left') { ?>-right<?php } ?>">
                <h4 style="font-size: <?php echo $title_size; ?>px; color: <?php echo $title_color; ?>;<?php echo $bold; ?>"><?php echo $title1; ?></h4>
                <p style="color: <?php echo $text_color; ?>"><?php echo $description1; ?></p>
              </div>
		<?php if ($link1 && $readmore_show) { ?>
              <div class="readmore">
		<a class="btn" href="<?php echo $link1; ?>"><?php echo $text_readmore; ?></a>
              </div>
		<?php } ?>
          </div>
	<?php if ($link1 && !$readmore_show) { ?></a><?php } ?>
        </div>

        <div class="col-lg-<?php echo $blocks_inline; ?> col-md-<?php echo $blocks_inline; ?> col-sm-6 col-xs-12">
	<?php if ($link2 && !$readmore_show) { ?><a href="<?php echo $link2; ?>" class="advantage_link"><?php } ?>
          <div class="advantage<?php if ($image_position == 'top') { ?> pos-center<?php } ?>">
		<?php if (!$icon2) { ?>
			<?php if ($image2) { ?>
				<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><img src="<?php echo $image2; ?>" alt="" /></div>
			<?php } ?>
		<?php } else { ?>
			<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><i style="font-size: <?php echo $icon_size; ?>px; color: <?php echo $icon_color; ?>" class="fa fa-<?php echo $icon2; ?>" aria-hidden="true"></i></div>
		<?php } ?>
              <div class="caption<?php if ($image_position == 'left') { ?>-right<?php } ?>">
                <h4 style="font-size: <?php echo $title_size; ?>px; color: <?php echo $title_color; ?>;<?php echo $bold; ?>"><?php echo $title2; ?></h4>
                <p style="color: <?php echo $text_color; ?>"><?php echo $description2; ?></p>
              </div>
		<?php if ($link2 && $readmore_show) { ?>
              <div class="readmore">
		<a class="btn" href="<?php echo $link2; ?>"><?php echo $text_readmore; ?></a>
              </div>
		<?php } ?>
          </div>
	<?php if ($link2 && !$readmore_show) { ?></a><?php } ?>
        </div>

        <div class="col-lg-<?php echo $blocks_inline; ?> col-md-<?php echo $blocks_inline; ?> col-sm-6 col-xs-12">
	<?php if ($link3 && !$readmore_show) { ?><a href="<?php echo $link3; ?>" class="advantage_link"><?php } ?>
          <div class="advantage<?php if ($image_position == 'top') { ?> pos-center<?php } ?>">
		<?php if (!$icon3) { ?>
			<?php if ($image3) { ?>
				<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><img src="<?php echo $image3; ?>" alt="" /></div>
			<?php } ?>
		<?php } else { ?>
			<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><i style="font-size: <?php echo $icon_size; ?>px; color: <?php echo $icon_color; ?>" class="fa fa-<?php echo $icon3; ?>" aria-hidden="true"></i></div>
		<?php } ?>
              <div class="caption<?php if ($image_position == 'left') { ?>-right<?php } ?>">
                <h4 style="font-size: <?php echo $title_size; ?>px; color: <?php echo $title_color; ?>;<?php echo $bold; ?>"><?php echo $title3; ?></h4>
                <p style="color: <?php echo $text_color; ?>"><?php echo $description3; ?></p>
              </div>
		<?php if ($link3 && $readmore_show) { ?>
              <div class="readmore">
		<a class="btn" href="<?php echo $link3; ?>"><?php echo $text_readmore; ?></a>
              </div>
		<?php } ?>
          </div>
	<?php if ($link3 && !$readmore_show) { ?></a><?php } ?>
        </div>

<?php if ($blocks_inline != 4) { ?>
        <div class="col-lg-<?php echo $blocks_inline; ?> col-md-<?php echo $blocks_inline; ?> col-sm-6 col-xs-12">
	<?php if ($link4 && !$readmore_show) { ?><a href="<?php echo $link4; ?>" class="advantage_link"><?php } ?>
          <div class="advantage<?php if ($image_position == 'top') { ?> pos-center<?php } ?>">
		<?php if (!$icon4) { ?>
			<?php if ($image4) { ?>
				<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><img src="<?php echo $image4; ?>" alt="" /></div>
			<?php } ?>
		<?php } else { ?>
			<div class="image<?php if ($image_position == 'left') { ?>-left<?php } ?>"><i style="font-size: <?php echo $icon_size; ?>px; color: <?php echo $icon_color; ?>" class="fa fa-<?php echo $icon4; ?>" aria-hidden="true"></i></div>
		<?php } ?>
              <div class="caption<?php if ($image_position == 'left') { ?>-right<?php } ?>">
                <h4 style="font-size: <?php echo $title_size; ?>px; color: <?php echo $title_color; ?>;<?php echo $bold; ?>"><?php echo $title4; ?></h4>
                <p style="color: <?php echo $text_color; ?>"><?php echo $description4; ?></p>
              </div>
		<?php if ($link4 && $readmore_show) { ?>
              <div class="readmore">
		<a class="btn" href="<?php echo $link4; ?>"><?php echo $text_readmore; ?></a>
              </div>
		<?php } ?>
          </div>
	<?php if ($link4 && !$readmore_show) { ?></a><?php } ?>
        </div>
<?php } ?>
</div>