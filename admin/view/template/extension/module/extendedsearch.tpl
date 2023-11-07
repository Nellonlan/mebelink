<?php echo $header; ?>
<style type="text/css">
.toggle,.toggle:after,.toggle:before{-webkit-transition:all .2s cubic-bezier(.445,.05,.55,.95)}.addpad{padding-top:0;padding-bottom:0}.toggleWrapper{position:absolute;top:50%;overflow:hidden}.toggleWrapper input{position:absolute;left:-99em}.toggle{cursor:pointer;display:inline-block;position:relative;width:120px;height:30px;background:#ccc;border-radius:5px;transition:all .2s cubic-bezier(.445,.05,.55,.95)}.toggle:after,.toggle:before{position:absolute;line-height:30px;font-size:14px;z-index:2;transition:all .2s cubic-bezier(.445,.05,.55,.95)}.toggle:before{content:"OFF";left:20px;color:#ccc}.toggle:after{content:"ON";right:20px;color:#fff}.toggle__handler{display:inline-block;position:relative;z-index:1;background:#fff;width:65px;height:24px;border-radius:3px;top:3px;left:3px;-webkit-transition:all .2s cubic-bezier(.445,.05,.55,.95);transition:all .2s cubic-bezier(.445,.05,.55,.95);-webkit-transform:translateX(0);transform:translateX(0)}input:checked+.toggle{background:#66B317}input:checked+.toggle:before{color:#fff}input:checked+.toggle:after{color:#66B317}input:checked+.toggle .toggle__handler{width:54px;-webkit-transform:translateX(60px);transform:translateX(60px);border-color:#fff} fieldset legend {padding-top: 20px;}
</style>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<span style="padding-right:20px;">
		<a href="https://opencartforum.com/profile/688391-alexdw/?do=content&type=downloads_file" target="_blank" data-toggle="tooltip" title="Другие дополнения" class="btn btn-info"><i class="fa fa-download"></i></a></span>
        <button type="submit" form="form-latest" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1>ExtendedSearch 1.05</h1>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-latest" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 col-xs-4 control-label"><?php echo $entry_status; ?></label>
            <div class="col-sm-4 col-xs-2">
			<div class="toggleWrapper">
                <?php if ($extendedsearch_status) { ?>
				<input type="checkbox" id="input-status" name="extendedsearch_status" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-status" name="extendedsearch_status" value="1" />
                <?php } ?>
			<label class="toggle" for="input-status"><span class="toggle__handler"></span>
			</label>
			</div>
			</div>
		  </div>

          <fieldset>
          <legend><?php echo $text_extsearch; ?></legend>

          <div class="form-group">
            <label class="col-sm-2 col-xs-4 control-label"><?php echo $entry_model; ?></label>
            <div class="col-sm-4 col-xs-2">
			<div class="toggleWrapper">
                <?php if ($extendedsearch_model) { ?>
				<input type="checkbox" id="input-model" name="extendedsearch_model" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-model" name="extendedsearch_model" value="1" />
                <?php } ?>
			<label class="toggle" for="input-model"><span class="toggle__handler"></span>
			</label>
			</div>
			</div>
		  </div>
		  
<div class="form-group addpad">		
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_sku; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_sku) { ?>
				<input type="checkbox" id="input-sku" name="extendedsearch_sku" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-sku" name="extendedsearch_sku" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-sku"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_upc; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_upc) { ?>
				<input type="checkbox" id="input-upc" name="extendedsearch_upc" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-upc" name="extendedsearch_upc" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-upc"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">		
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_ean; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_ean) { ?>
				<input type="checkbox" id="input-ean" name="extendedsearch_ean" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-ean" name="extendedsearch_ean" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-ean"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_jan; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_jan) { ?>
				<input type="checkbox" id="input-jan" name="extendedsearch_jan" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-jan" name="extendedsearch_jan" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-jan"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_isbn; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_isbn) { ?>
				<input type="checkbox" id="input-isbn" name="extendedsearch_isbn" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-isbn" name="extendedsearch_isbn" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-isbn"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_mpn; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_mpn) { ?>
				<input type="checkbox" id="input-mpn" name="extendedsearch_mpn" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-mpn" name="extendedsearch_mpn" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-mpn"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>

<div class="form-group addpad">
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_location; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_location) { ?>
				<input type="checkbox" id="input-location" name="extendedsearch_location" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-location" name="extendedsearch_location" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-location"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
        <div class="col-sm-6">
		<div class="form-group">
            <label class="col-sm-4 col-xs-4 control-label"><?php echo $entry_attr; ?></label>
            <div class="col-sm-8 col-xs-2">
			 <div class="toggleWrapper">
                <?php if ($extendedsearch_attr) { ?>
				<input type="checkbox" id="input-attr" name="extendedsearch_attr" value="1" checked="checked" />
                <?php } else { ?>
				<input type="checkbox" id="input-attr" name="extendedsearch_attr" value="1" />
                <?php } ?>
			 <label class="toggle" for="input-attr"><span class="toggle__handler"></span></label>
			 </div>
			</div>
		</div>
		</div>
</div>
          </fieldset>

        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>