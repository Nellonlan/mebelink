<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $subject; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;"><a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
  <?php if (isset($name)) { ?>
  <p><?php echo $text_name; ?> <?php echo $name; ?></p>
  <?php } ?>
  <?php if (isset($city)) { ?>
  <p><?php echo $text_city; ?> <?php echo $city; ?></p>
  <?php } ?>
  <?php if (isset($rating)) { ?>
  <p><?php echo $text_rating; ?> <?php echo $rating; ?></p>
  <?php } ?>
  <?php if (isset($text)) { ?>
  <p><?php echo $text_text; ?></p>
  <p><?php echo $text; ?></p>
  <?php } ?>
  <?php if (isset($good)) { ?>
  <p><?php echo $text_good; ?></p>
  <p><?php echo $good; ?></p>
  <?php } ?>
  <?php if (isset($bad)) { ?>
  <p><?php echo $text_bad; ?></p>
  <p><?php echo $bad; ?></p>
  <?php } ?>
  <?php if (isset($avatar)) { ?>
  <p><?php echo $text_avatar; ?></p>
  <p><img src="<?php echo $avatar; ?>"/></p>
  <?php } ?>
  <?php if (isset($image)) { ?>
  <p><?php echo $text_upload_image; ?></p>
  <p>
  <?php foreach ($image as $value) { ?>
    <img src="<?php echo $value; ?>"/>
  <?php } ?>
  </p>
  <?php } ?>
</div>
</body>
</html>
