<span><?php echo $total; ?></span>
<?php if ($field_rating) { ?>
<span><?php echo $rating_total; ?></span>
<?php if ($rating) { ?>
<span>
  <span><?php echo $text_rating; ?></span>
  <span class="rating">
    <?php for ($i = 1; $i <= 5; $i++) { ?>
    <?php if ($rating < $i) { ?>
    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
    <?php } else { ?>
    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
    <?php } ?>
    <?php } ?>
  </span>
</span>
<?php } ?>
<?php } ?>