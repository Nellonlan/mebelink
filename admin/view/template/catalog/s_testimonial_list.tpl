<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-testimonial').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-testimonial">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
			  <thead>
                <tr>
				  <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
				  <?php if ($field_title) { ?>
				  <td class="text-left"><?php if ($sort == 'title') { ?>
                    <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                    <?php } ?></td>		
				  <?php } ?>
				  <?php if ($field_city) { ?>
				  <td class="text-left"><?php if ($sort == 'city') { ?>
                    <a href="<?php echo $sort_city; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_city; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_city; ?>"><?php echo $column_city; ?></a>
                    <?php } ?></td>		
				  <?php } ?>
				  <?php if ($field_name) { ?>
				  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
				  <?php } ?>
				  <?php if ($field_email) { ?>
				  <td class="text-left"><?php if ($sort == 'email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?></td>
				  <?php } ?>
				  <?php if ($field_text) { ?>
				  <td class="text-left"><?php if ($sort == 'text') { ?>
                    <a href="<?php echo $sort_text; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_text; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_text; ?>"><?php echo $column_text; ?></a>
                    <?php } ?></td>
				  <?php } ?>
				  <?php if ($field_good) { ?>
				  <td class="text-left"><?php if ($sort == 'good') { ?>
                    <a href="<?php echo $sort_good; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_good; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_good; ?>"><?php echo $column_good; ?></a>
                    <?php } ?></td>
				  <?php } ?>
				  <?php if ($field_bad) { ?>
				  <td class="text-left"><?php if ($sort == 'bad') { ?>
                    <a href="<?php echo $sort_bad; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_bad; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_bad; ?>"><?php echo $column_bad; ?></a>
                    <?php } ?></td>
				  <?php } ?>
				  <?php if ($field_rating) { ?>
				  <td class="text-center"><?php if ($sort == 'rating') { ?>
                    <a href="<?php echo $sort_rating; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_rating; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_rating; ?>"><?php echo $column_rating; ?></a>
                    <?php } ?></td>
				  <?php } ?>
				  <?php if ($field_avatar) { ?>
				  <td class="text-center"><?php echo $column_avatar; ?></td>
				  <?php } ?>
				  <?php if ($field_image) { ?>
				  <td class="text-left"><?php echo $column_image; ?></td>
				  <?php } ?>
				  <td class="text-left"><?php if ($sort == 'language_id') { ?>
                    <a href="<?php echo $sort_language_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_language; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_language_id; ?>"><?php echo $column_language; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?></td>
                  <td class="text-center"><?php if ($sort == 'status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($testimonials) { ?>
                <?php foreach ($testimonials as $testimonial) { ?>
                <tr>
                  <td class="text-center">
				  <?php if (in_array($testimonial['testimonial_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $testimonial['testimonial_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $testimonial['testimonial_id']; ?>" />
                  <?php } ?>
				  </td>
				  <?php if ($field_title) { ?>
				  <td class="text-left"><?php echo $testimonial['title']; ?></td>
				  <?php } ?>
				  <?php if ($field_city) { ?>
				  <td class="text-left"><?php echo $testimonial['city']; ?></td>
				  <?php } ?>
				  <?php if ($field_name) { ?>
				  <td class="text-left"><?php echo $testimonial['name']; ?></td>
				  <?php } ?>
				  <?php if ($field_email) { ?>
				  <td class="text-left"><?php echo $testimonial['email']; ?></td>
				  <?php } ?>
				  <?php if ($field_text) { ?>
				  <td class="text-left"><?php echo $testimonial['text']; ?></td>
				  <?php } ?>
				  <?php if ($field_good) { ?>
				  <td class="text-left"><?php echo $testimonial['good']; ?></td>
				  <?php } ?>
				  <?php if ($field_bad) { ?>
				  <td class="text-left"><?php echo $testimonial['bad']; ?></td>
				  <?php } ?>
				  <?php if ($field_rating) { ?>
				  <td class="text-center"><?php echo $testimonial['rating']; ?></td>
				  <?php } ?>
				  <?php if ($field_avatar) { ?>
				  <td class="text-center"><img src="<?php echo $testimonial['avatar']; ?>" alt="" class="img-thumbnail"></td>
				  <?php } ?>
				  <?php if ($field_image) { ?>
				  <td class="text-left">
				    <?php if ($testimonial['image']) { ?>
			        <?php foreach ($testimonial['image'] as $value) { ?>
			        <img src="<?php echo $value; ?>" alt="" class="img-thumbnail">
			        <?php } ?>
			        <?php } ?>
				  </td>
				  <?php } ?>
				  <td class="text-left">
				  <?php foreach ($languages as $language) { ?>
                  <?php if ($language['language_id'] == $testimonial['language_id']) { ?><?php echo $language['name']; ?>
                  <?php } ?>
                  <?php } ?>
				  </td>
				  <td class="text-left"><?php echo $testimonial['date_added']; ?></td>
				  <td class="text-center">
				    <?php if ($testimonial['status']) { ?>
				    <span data-toggle="tooltip" title="<?php echo $text_enabled; ?>" class="fa-2 fa fa-toggle-on text-success"></span>
				    <?php } else { ?>
				    <span data-toggle="tooltip" title="<?php echo $text_disabled; ?>" class="fa-2 fa fa-toggle-off text-danger"></span>
				    <?php } ?>
				  </td>
				  <td class="text-right"><a href="<?php echo $testimonial['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } ?>
              </tbody>
            </table>
	      </div>
		</form>
		<?php if (!$testimonials) { ?>
		<div class="row">
          <div class="text-center"><?php echo $text_no_results; ?></div>
        </div>
		<?php } ?>
		<div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>