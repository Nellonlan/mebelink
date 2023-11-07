<?php if (isset($product_mrps) && count($product_mrps)) { ?>
	<?php if ($product_mrps) { ?>
		<div class="row">
			<div class="col-sm-12">
				<?php $mrp_row = 1; ?>
				<?php foreach ($product_mrps as $product_mrp) { ?>
					<h3 class="box-heading"><?php echo $product_mrp['title']; ?></h3>
					<?php if ($desc_status) { ?>
						<?php echo $product_mrp['description']; ?>
					<?php } ?>
						<div class="row caras">
							<?php foreach ($product_mrp['table_product'] as $product) { ?>
								  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
									<div class="product-thumb transition">
									  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
									  <div class="caption">
										<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
										
										
										
									  </div>
									  
									</div>
								  </div>
							<?php } ?>
						</div>
					<?php $mrp_row++; ?>
				<?php } ?>
			</div>
		</div>
	<?php } ?>
<?php } ?>