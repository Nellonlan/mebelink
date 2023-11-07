<?php ?>
<div class="sideblock">
	<h3><?php echo $heading_title; ?></h3>
	<div class="row">
		<ul class="manuflist">
			<?php foreach ($manufacturers as $manufacturer) { ?>
				<li>
					<a href="<?php echo $manufacturer['href']; ?>" title="<?php echo $manufacturer['name']; ?>"><?php echo $manufacturer['name']; ?></a>
				</li>
			<?php } ?>
		</ul>
	</div>
</div>