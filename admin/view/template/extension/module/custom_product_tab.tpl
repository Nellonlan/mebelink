<?php echo $header; ?>
<div class="modal fade" id="legal_text" tabindex="-1" role="dialog" aria-labelledby="legal_text_label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="legal_text_label"><?php echo $text_terms; ?></h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default cancel" data-dismiss="modal"><i class="fa fa-times"></i> <?php echo $button_close; ?></button>
			</div>
		</div>
	</div>
</div>
<!-- confirm deletion -->
<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="confirmDeleteLabel"><?php echo $text_confirm_delete; ?></h4>
			</div>
			<div class="modal-body">
				<p><?php echo $text_are_you_sure; ?></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban"></i> <?php echo $button_cancel; ?></button>
				<button type="button" class="btn btn-danger delete"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<ul class="breadcrumb bull5i-breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li<?php echo ($breadcrumb['active']) ? ' class="active"' : ''; ?>><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>

			<div class="navbar-placeholder">
				<nav class="navbar navbar-bull5i" role="navigation" id="bull5i-navbar">
					<div class="nav-container">

						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bull5i-navbar-collapse">
								<span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<h1 class="bull5i-navbar-brand"><i class="fa fa-folder-o fa-fw ext-icon"></i> <?php echo $heading_title; ?></h1>
						</div>
						<div class="collapse navbar-collapse" id="bull5i-navbar-collapse">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#settings" data-toggle="tab"><!-- ko if: general_errors() --><i class="fa fa-exclamation-circle text-danger hidden" data-bind="css:{'hidden': !general_errors()}"></i> <!-- /ko --><?php echo $tab_settings; ?></a></li>
								<li><a href="#tabs" data-toggle="tab"><!-- ko if: tab_errors() --><i class="fa fa-exclamation-circle text-danger hidden" data-bind="css:{'hidden': !tab_errors()}"></i> <!-- /ko --><?php echo $tab_tabs; ?></a></li>
								<li class="hidden"><a href="#ext-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
								<li><a href="#about-ext" data-toggle="tab"><?php echo $tab_about; ?></a></li>
							</ul>
							<div class="nav navbar-nav btn-group navbar-right">
								<?php if ($update_pending) { ?><button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_upgrade; ?>" class="btn btn-info" id="btn-upgrade" data-url="<?php echo $upgrade; ?>" data-form="#sForm" data-context="#content" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_upgrading; ?></span>"><i class="fa fa-arrow-circle-up"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_upgrade; ?></span></button><?php } ?>
								<?php if (!$update_pending && $db_errors) { ?><button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_fix_db; ?>" class="btn btn-info" id="btn-fix-db" data-url="<?php echo $fix_db; ?>" data-form="#sForm" data-context="#content" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_fixing; ?></span>"><i class="fa fa-wrench"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_fix_db; ?></span></button><?php } ?>
								<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_apply; ?>" class="btn btn-success" id="btn-apply" data-url="<?php echo $save; ?>" data-form="#sForm" data-context="#content" data-vm="ExtVM" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_saving; ?></span>"<?php echo $update_pending ? ' disabled': ''; ?>><i class="fa fa-check"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_apply; ?></span></button>
								<button type="submit" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_save; ?>" class="btn btn-primary" id="btn-save" data-url="<?php echo $save; ?>" data-form="#sForm" data-context="#content" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_saving; ?></span>"<?php echo $update_pending ? ' disabled': ''; ?>><i class="fa fa-save"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_save; ?></span></button>
								<a href="<?php echo $cancel; ?>" class="btn btn-default" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_cancel; ?>" id="btn-cancel" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_canceling; ?></span>"><i class="fa fa-ban"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_cancel; ?></span></a>
							</div>
						</div>

					</div>
				</nav>
			</div>
		</div>
	</div>

	<div class="alerts">
		<div class="container-fluid" id="alerts">
			<?php foreach ($alerts as $type => $_alerts) { ?>
				<?php foreach ((array)$_alerts as $alert) { ?>
					<?php if ($alert) { ?>
			<div class="alert alert-<?php echo ($type == "error") ? "danger" : $type; ?> fade in">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa <?php echo $alert_icon($type); ?>"></i><?php echo $alert; ?>
			</div>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		</div>
	</div>

	<div class="container-fluid bull5i-content bull5i-container">
		<div id="page-overlay" class="bull5i-overlay fade in">
			<div class="page-overlay-progress"><i class="fa fa-refresh fa-spin fa-5x text-muted"></i></div>
		</div>

		<form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" id="sForm" class="form-horizontal" role="form">
			<div class="tab-content">
				<div class="tab-pane active" id="settings">
					<div class="panel panel-default">
						<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-cog fa-fw"></i> <?php echo $tab_settings; ?></h3></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12">
									<fieldset>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="cpt_status"><?php echo $entry_extension_status; ?></label>
											<div class="col-sm-2 fc-auto-width">
												<select name="cpt_status" id="cpt_status" data-bind="value: status" class="form-control">
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												</select>
												<input type="hidden" name="cpt_installed" value="1" />
												<input type="hidden" name="cpt_installed_version" value="<?php echo $installed_version; ?>" />
												<input type="hidden" name="cpt_as" data-bind="value: as" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="cpt_show_always1"><?php echo $entry_show_always; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="cpt_show_always" id="cpt_show_always1" value="1" data-bind="checked: show_always"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="cpt_show_always" id="cpt_show_always0" value="0" data-bind="checked: show_always"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_show_always; ?></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="cpt_use_admin_language_value1"><?php echo $entry_use_admin_language_value; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="cpt_use_admin_language_value" id="cpt_use_admin_language_value1" value="1" data-bind="checked: use_admin_language_value"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="cpt_use_admin_language_value" id="cpt_use_admin_language_value0" value="0" data-bind="checked: use_admin_language_value"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_use_admin_language_value; ?></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="cpt_use_default_for_new1"><?php echo $entry_use_default_value_for_new; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="cpt_use_default_for_new" id="cpt_use_default_for_new1" value="1" data-bind="checked: use_default_for_new"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="cpt_use_default_for_new" id="cpt_use_default_for_new0" value="0" data-bind="checked: use_default_for_new"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_use_default_value_for_new; ?></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="cpt_show_login_required_text0"><?php echo $entry_show_login_required_text; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="cpt_show_login_required_text" id="cpt_show_login_required_text1" value="1" data-bind="checked: show_login_required_text"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="cpt_show_login_required_text" id="cpt_show_login_required_text0" value="0" data-bind="checked: show_login_required_text"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_show_login_required_text; ?></span>
											</div>
										</div>
										<div class="form-group" data-bind="visible: show_login_required_text() == '1'">
											<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'login_required_text<?php echo $default_language; ?>'}, css: {'has-error': login_required_texts.hasError}"><?php echo $entry_login_required_text; ?></label>
											<!-- ko foreach: login_required_texts -->
											<div class="col-sm-9 col-md-8 col-lg-6" data-bind="css: {'multi-row col-sm-offset-3 col-md-offset-2': $index() != 0, 'has-error': text.hasError}">
												<div class="input-group">
													<span class="input-group-addon" data-bind="attr: {title: $root.languages[language_id()].name}"><img data-bind="attr: {src: $root.languages[language_id()].flag, title: $root.languages[language_id()].name}" /></span>
													<input data-bind="attr: {name: 'cpt_login_required_text[' + language_id() + ']', id: 'login_required_text' + language_id()}, value: text" class="form-control">
												</div>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 has-error" data-bind="visible: text.hasError">
												<span class="help-block" data-bind="text: text.errorMsg"></span>
											</div>
											<!-- /ko -->
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="cpt_remove_sql_changes0"><?php echo $entry_remove_sql_changes; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="cpt_remove_sql_changes" id="cpt_remove_sql_changes1" value="1" data-bind="checked: remove_sql_changes"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="cpt_remove_sql_changes" id="cpt_remove_sql_changes0" value="0" data-bind="checked: remove_sql_changes"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_remove_sql_changes; ?></span>
											</div>
										</div>
										<!-- ko if: _sas() == 1 -->
										<div class="form-group">
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-6 col-md-5 col-lg-4">
												<select class="form-control" data-bind="selectedOptions: _as" multiple>
													<?php foreach ($stores as $store_id => $store) { ?>
													<option value="<?php echo $store_id; ?>"><?php echo $store['name']; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
										<!-- /ko -->
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tabs">
					<div class="panel panel-default">
						<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-cog fa-fw"></i> <?php echo $tab_tabs; ?></h3></div>
						<div class="panel-body" id="custom-tabs">
							<div class="row">
								<fieldset>
									<div class="col-xs-4 col-md-3 col-lg-2 tabs-left">
										<ul class="nav nav-tabs nav-stacked" id="custom-tabs-header">
											<!-- ko foreach: sortedTabs -->
											<li data-bind="css: {'has-error': hasError, 'is-disabled': !+status()}"><a data-bind="attr: {href: '#custom-tab-' + tab_id()}" data-toggle="tab"><span data-bind="html: name"></span><!-- /ko --><!-- ko if: type() != 'default' --> <button type="button" class="btn btn-xs btn-link delete-tab" data-toggle="tooltip" data-original-title="<?php echo $text_delete_tab; ?>" data-container="body" data-url="<?php echo addslashes($delete); ?>" data-form="#sForm" data-context="#content" data-vm="ExtVM" data-overlay="#page-overlay"><i class="fa fa-minus-circle text-danger"></i></button><!-- /ko --></a></li>
											<!-- /ko -->
											<li>
												<div class="input-group">
													<input type="text" class="form-control" id="new-tab-name" placeholder="<?php echo $text_custom_tab_name; ?>" data-bind="value: newTabName">
													<span class="input-group-btn">
														<button type="button" id="add-new-tab" class="btn btn-default" data-toggle="tooltip" data-original-title="<?php echo $text_add_tab; ?>" data-container="body" data-url="<?php echo addslashes($add); ?>" data-form="#sForm" data-context="#content" data-vm="ExtVM" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i>"><i class="fa fa-plus-circle text-success"></i></button>
													</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="col-xs-8 col-md-9 col-lg-10">
										<div class="tab-content" id="custom-tabs-content">
											<!-- ko foreach: tabs -->
											<div class="tab-pane" data-bind="attr: {id: 'custom-tab-' + tab_id()}">
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_status'}"><?php echo $entry_tab_status; ?></label>
													<div class="col-sm-2 fc-auto-width">
														<select data-bind="attr: {name: 'tabs[' + tab_id() + '][status]', id: 'tab_' + tab_id() + '_status'}, value: status" class="form-control">
															<option value="1"><?php echo $text_enabled; ?></option>
															<option value="0"><?php echo $text_disabled; ?></option>
														</select>
														<input type="hidden" data-bind="attr: {name: 'tabs[' + tab_id() + '][name]'}, value: name">
														<input type="hidden" data-bind="attr: {name: 'tabs[' + tab_id() + '][tab_id]'}, value: tab_id">
														<!-- ko if: type() == 'default' -->
														<input type="hidden" data-bind="attr: {name: 'tabs[' + tab_id() + '][key]'}, value: key">
														<!-- /ko -->
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
														<span class="help-block help-text"><?php echo $help_global_status; ?></span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab' + tab_id() + '_name<?php echo $default_language; ?>'}, css: {'has-error': names.hasError}"><?php echo $entry_tab_name; ?></label>
													<!-- ko foreach: names -->
													<div class="col-sm-6 col-md-6 col-lg-5" data-bind="css: {'multi-row col-sm-offset-3 col-md-offset-2': $index() != 0, 'has-error': name.hasError}">
														<div class="input-group">
															<span class="input-group-addon" data-bind="attr: {title: $root.languages[language_id()].name}"><img data-bind="attr: {src: $root.languages[language_id()].flag, title: $root.languages[language_id()].name}" /></span>
															<input data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][names][' + language_id() + ']', id: 'tab' + $parent.tab_id() + '_name' + language_id()}, value: name" class="form-control">
														</div>
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 has-error" data-bind="visible: name.hasError">
														<span class="help-block" data-bind="text: name.errorMsg"></span>
													</div>
													<!-- /ko -->
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_sort_order'}"><?php echo $entry_sort_order; ?></label>
													<div class="col-sm-2 col-md-2 col-lg-1">
														<input data-bind="attr: {name: 'tabs[' + tab_id() + '][sort_order]', id: 'tab_' + tab_id() + '_sort_order'}, value: sort_order" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_login1'}"><?php echo $entry_require_login; ?></label>
													<div class="col-sm-9 col-md-10">
														<label class="radio-inline">
															<input type="radio" value="1" data-bind="attr: {name: 'tabs[' + tab_id() + '][login]', id: 'tab_' + tab_id() + '_login1'}, checked: login"> <?php echo $text_yes; ?>
														</label>
														<label class="radio-inline">
															<input type="radio" value="0" data-bind="attr: {name: 'tabs[' + tab_id() + '][login]', id: 'tab_' + tab_id() + '_login0'}, checked: login"> <?php echo $text_no; ?>
														</label>
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
														<span class="help-block help-text"><?php echo $help_require_login; ?></span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_type'}"><?php echo $entry_tab_type; ?></label>
													<!-- ko if: type() == 'default' -->
													<div class="col-sm-9 col-md-10">
														<p class="form-control-static"><?php echo $text_default_tab; ?></p>
														<input type="hidden" data-bind="attr: {name: 'tabs[' + tab_id() + '][type]'}, value: type">
													</div>
													<!-- /ko -->
													<!-- ko ifnot: type() == 'default' -->
													<div class="col-sm-2 fc-auto-width">
														<select data-bind="attr: {name: 'tabs[' + tab_id() + '][type]', id: 'tab_' + tab_id() + '_type'}, value: type" class="form-control">
															<option value="regular"><?php echo $text_regular_tab; ?></option>
															<option value="reserved"><?php echo $text_reserved_tab; ?></option>
														</select>
													</div>
													<!-- /ko -->
													<!-- ko if: type() == 'reserved' -->
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
														<span class="help-block help-text"><?php echo $help_tab_type; ?></span>
													</div>
													<!-- /ko -->
												</div>
												<div class="form-group" data-bind="css: {'has-error': key.hasError()}">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_key'}"><?php echo $entry_tab_key; ?></label>
													<div class="col-sm-4 col-md-4 col-lg-3">
														<!-- ko if: type() == 'default' -->
														<p class="form-control-static" data-bind="text: key"></p>
														<input type="hidden" data-bind="attr: {name: 'tabs[' + tab_id() + '][key]', id: 'tab_' + tab_id() + '_key'}, value: key">
														<!-- /ko -->
														<!-- ko ifnot: type() == 'default' -->
														<input data-bind="attr: {name: 'tabs[' + tab_id() + '][key]', id: 'tab_' + tab_id() + '_key'}, value: key" class="form-control">
														<!-- /ko -->
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 has-error" data-bind="visible: key.hasError">
														<span class="help-block" data-bind="text: key.errorMsg"></span>
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container" data-bind="visible: type() == 'reserved'">
														<span class="help-block help-text"><?php echo $help_tab_key; ?></span>
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container" data-bind="visible: type() == 'regular'">
														<span class="help-block help-text"><?php echo $help_tab_key_alt; ?></span>
													</div>
												</div>
												<!-- ko if: type() == 'reserved' -->
												<div class="form-group" data-bind="css: {'has-error': condition.hasError()}">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_condition'}"><?php echo $entry_condition; ?></label>
													<div class="col-sm-12 col-md-10 col-lg-8">
														<input data-bind="attr: {name: 'tabs[' + tab_id() + '][condition]', id: 'tab_' + tab_id() + '_condition'}, value: condition" class="form-control">
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 has-error" data-bind="visible: condition.hasError && condition.errorMsg">
														<span class="help-block" data-bind="text: condition.errorMsg"></span>
													</div>
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
														<span class="help-block help-text"><?php echo $help_condition; ?></span>
													</div>
												</div>
												<!-- /ko -->
												<!-- ko ifnot: type() == 'reserved' -->
												<input type="hidden" data-bind="attr: {name: 'tabs[' + tab_id() + '][condition]', id: 'tab_' + tab_id() + '_condition'}, value: condition">
												<!-- /ko -->
												<!-- ko if: type() == 'regular' -->
												<div class="form-group">
													<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10">
														<ul class="nav nav-pills">
															<!-- ko foreach: defaults -->
															<li data-bind="css: { active: $index() == 0 }"><a data-bind="attr: {href: '#tabs' + $parent.tab_id() + '_default' + language_id()}" data-toggle="pill"><img data-bind="attr: {src: $root.languages[language_id()].flag, title: $root.languages[language_id()].name}" /> <!-- ko text: $root.languages[language_id()].name --><!-- /ko --></a></li>
															<!-- /ko -->
														</ul>
													</div>
												</div>
												<div class="form-group">
													<div class="tab-content">
														<!-- ko foreach: {data: defaults } -->
														<div data-bind="attr: {id: 'tabs' + $parent.tab_id() + '_default' + language_id()}, css: { active: $index() == 0 }" class="tab-pane">
															<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + $parent.tab_id() + '_default' + language_id()}"><?php echo $entry_default_value; ?></label>
															<div class="col-sm-9 col-md-10">
																<textarea data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][defaults][' + language_id() + ']', id: 'tab' + $parent.tab_id() + '_default' + language_id()}, value: value, summernote: {height: 300}" class="form-control" rows="5"></textarea>
															</div>
														</div>
														<!-- /ko -->
													</div>
												</div>
												<legend><?php echo $text_overwrite_tab_content; ?></legend>
												<div class="row">
													<div class="col-sm-9 col-md-10 help-container">
														<span class="help-block help-text"><?php echo $help_overwrite; ?></span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_overwritenull'}"><?php echo $entry_products; ?></label>
													<div class="col-sm-9 col-md-10">
														<label class="radio">
															<input type="radio" value="" data-bind="attr: {name: 'tabs[' + tab_id() + '][overwrite]', id: 'tab_' + tab_id() + '_overwritenull'}, checked: overwrite"> <?php echo $text_no_products; ?>
														</label>
														<label class="radio">
															<input type="radio" value="0" data-bind="attr: {name: 'tabs[' + tab_id() + '][overwrite]', id: 'tab_' + tab_id() + '_overwrite0'}, checked: overwrite"> <?php echo $text_all_products; ?>
														</label>
														<label class="radio">
															<input type="radio" value="1" data-bind="attr: {name: 'tabs[' + tab_id() + '][overwrite]', id: 'tab_' + tab_id() + '_overwrite1'}, checked: overwrite"> <?php echo $text_all_empty_products; ?>
														</label>
														<label class="radio">
															<input type="radio" value="2" data-bind="attr: {name: 'tabs[' + tab_id() + '][overwrite]', id: 'tab_' + tab_id() + '_overwrite2'}, checked: overwrite"> <?php echo $text_all_category_products; ?>
														</label>
														<div class="row">
															<div class="col-sm-12">
																<select data-bind="attr: {name: 'tabs[' + tab_id() + '][ow_category]'}, disable: overwrite() != '2', value: ow_category" class="form-control fc-auto-width">
																	<?php foreach ($categories as $category) { ?>
																	<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
														<label class="radio">
															<input type="radio" value="3" data-bind="attr: {name: 'tabs[' + tab_id() + '][overwrite]', id: 'tab_' + tab_id() + '_overwrite3'}, checked: overwrite"> <?php echo $text_all_manufacturer_products; ?>
														</label>
														<div class="row">
															<div class="col-sm-12">
																<select data-bind="attr: {name: 'tabs[' + tab_id() + '][ow_manufacturer]'}, disable: overwrite() != '3', value: ow_manufacturer" class="form-control fc-auto-width">
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																	<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
														<label class="radio">
															<input type="radio" value="4" data-bind="attr: {name: 'tabs[' + tab_id() + '][overwrite]', id: 'tab_' + tab_id() + '_overwrite4'}, checked: overwrite"> <?php echo $text_selected_products; ?>
														</label>
														<div class="row">
															<div class="col-sm-6 col-md-5 col-lg-4">
																<input class="form-control typeahead product" placeholder="<?php echo $text_autocomplete; ?>" autocomplete="off" data-method="addOwProduct" data-bind="typeahead: { options:{ autoSelect: true }, datasets: $root.ta_dataset}">
															</div>
														</div>
														<div class="row">
															<div class="col-sm-12 col-md-8 col-lg-6 multi-row">
																<div class="well well-sm well-scroll-box form-control" data-bind="css: {disabled: overwrite() != '4'}">
																<!-- ko foreach: ow_products -->
																	<div>
																			<button type="button" data-bind="click: $parent.removeOwProduct, tooltip: {}" class="btn btn-link btn-xs" data-original-title="<?php echo $text_remove; ?>"><i class="fa fa-minus-circle text-danger"></i></button>
																			<!-- ko text: name --><!-- /ko --> <small class="text-muted" data-bind="text: model"></small>
																			<input type="hidden" data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][ow_products][' + $index() + '][product_id]'}, value: id" />
																			<input type="hidden" data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][ow_products][' + $index() + '][name]'}, value: name" />
																			<input type="hidden" data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][ow_products][' + $index() + '][model]'}, value: model" />
																	</div>
																<!-- /ko -->
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- /ko -->
												<legend><?php echo $text_change_product_tab_status; ?></legend>
												<div class="row">
													<div class="col-sm-9 col-md-10 help-container">
														<span class="help-block help-text"><?php echo $help_change_product_tab_status; ?></span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_change_action'}"><?php echo $entry_action; ?></label>
													<div class="col-sm-3 fc-auto-width">
														<select data-bind="attr: {name: 'tabs[' + tab_id() + '][change_action]', id: 'tab_' + tab_id() + '_change_action'}, value: change_action" class="form-control">
															<option value=""><?php echo $text_no_action; ?></option>
															<option value="1"><?php echo $text_enable; ?></option>
															<option value="0"><?php echo $text_disable; ?></option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 col-md-2 control-label" data-bind="attr: {for: 'tab_' + tab_id() + '_change0'}"><?php echo $entry_products; ?></label>
													<div class="col-sm-9 col-md-10">
														<label class="radio">
															<input type="radio" value="0" data-bind="attr: {name: 'tabs[' + tab_id() + '][change]', id: 'tab_' + tab_id() + '_change0'}, checked: change"> <?php echo $text_all_products; ?>
														</label>
														<label class="radio">
															<input type="radio" value="1" data-bind="attr: {name: 'tabs[' + tab_id() + '][change]', id: 'tab_' + tab_id() + '_change1'}, checked: change"> <?php echo $text_all_category_products; ?>
														</label>
														<div class="row">
															<div class="col-sm-12">
																<select data-bind="attr: {name: 'tabs[' + tab_id() + '][ch_category]'}, disable: change() != '1', value: ch_category" class="form-control fc-auto-width">
																	<?php foreach ($categories as $category) { ?>
																	<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
														<label class="radio">
															<input type="radio" value="2" data-bind="attr: {name: 'tabs[' + tab_id() + '][change]', id: 'tab_' + tab_id() + '_change2'}, checked: change"> <?php echo $text_all_manufacturer_products; ?>
														</label>
														<div class="row">
															<div class="col-sm-12">
																<select data-bind="attr: {name: 'tabs[' + tab_id() + '][ch_manufacturer]'}, disable: change() != '2', value: ch_manufacturer" class="form-control fc-auto-width">
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																	<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
																	<?php } ?>
																</select>
															</div>
														</div>
														<label class="radio">
															<input type="radio" value="3" data-bind="attr: {name: 'tabs[' + tab_id() + '][change]', id: 'tab_' + tab_id() + '_change3'}, checked: change"> <?php echo $text_selected_products; ?>
														</label>
														<div class="row">
															<div class="col-sm-6 col-md-5 col-lg-4">
																<input class="form-control typeahead product" placeholder="<?php echo $text_autocomplete; ?>" autocomplete="off" data-method="addChProduct" data-bind="typeahead: { options:{ autoSelect: true }, datasets: $root.ta_dataset}">
															</div>
														</div>
														<div class="row">
															<div class="col-sm-12 col-md-8 col-lg-6 multi-row">
																<div class="well well-sm well-scroll-box form-control" data-bind="css: {disabled: change() != '3'}">
																<!-- ko foreach: ch_products -->
																	<div>
																			<button type="button" data-bind="click: $parent.removeChProduct, tooltip: {}" class="btn btn-link btn-xs" data-original-title="<?php echo $text_remove; ?>"><i class="fa fa-minus-circle text-danger"></i></button>
																			<!-- ko text: name --><!-- /ko --> <small class="text-muted" data-bind="text: model"></small>
																			<input type="hidden" data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][ch_products][' + $index() + '][product_id]'}, value: id" />
																			<input type="hidden" data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][ch_products][' + $index() + '][name]'}, value: name" />
																			<input type="hidden" data-bind="attr: {name: 'tabs[' + $parent.tab_id() + '][ch_products][' + $index() + '][model]'}, value: model" />
																	</div>
																<!-- /ko -->
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /ko -->
										</div>
									</div>
								</fieldset>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane hidden" id="ext-support">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#support-navbar-collapse">
									<span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<h3 class="panel-title"><i class="fa fa-phone fa-fw"></i> <?php echo $tab_support; ?></h3>
							</div>
							<div class="collapse navbar-collapse" id="support-navbar-collapse">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
									<li><a href="#faq" data-toggle="tab" title="<?php echo $text_faq; ?>"><?php echo $tab_faq; ?></a></li>
									<li class="hidden"><a href="#services" data-toggle="tab"><?php echo $tab_services; ?></a></li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="general">
									<div class="row">
										<div class="col-sm-12">
											<h3>Getting support</h3>
											<p>I consider support a priority of mine, so if you need any help with your purchase you can contact me in one of the following ways:</p>
											<ul>
												<li>Send an email to <a href="mailto:<?php echo $ext_support_email; ?>?subject='<?php echo $text_support_subject; ?>'"><?php echo $ext_support_email; ?></a></li>
												<li>Post in the <a href="<?php echo $ext_support_forum; ?>" target="_blank">extension forum thread</a> or send me a <a href="http://forum.opencart.com/ucp.php?i=pm&mode=compose&u=17771">private message</a></li>
												<!--li><a href="<?php echo $ext_store_url; ?>" target="_blank">Leave a comment</a> in the extension store comments section</li-->
											</ul>
											<p>I usually reply within a few hours, but can take up to 36 hours.</p>
											<p>Please note that all support is free if it is an issue with the product. Only issues due conflicts with other third party extensions/modules or custom front end theme are the exception to free support. Resolving such conflicts, customizing the extension or doing additional bespoke work will be provided with the hourly rate of <span id="hourly_rate">USD 50 / EUR 40</span>.</p>

											<h4>Things to note when asking for help</h4>
											<p>Please describe your problem in as much detail as possible. When contacting, please provide the following information:</p>
											<ul>
												<li>The OpenCart version you are using: <strong><?php echo $oc_version; ?></strong></li>
												<li>The extension name and version: <strong><?php echo $ext_name; ?> v<?php echo $ext_version; ?></strong></li>
												<li>If you got any error messages, please include them in the message.</li>
												<li>In case the error message is generated by a vQmod cached file, please also attach that file.</li>
											</ul>
											<p>Any additional information that you can provide about the issue is greatly appreciated and will make problem solving much faster.</p>

											<h3 class="page-header">Happy with <?php echo $ext_name; ?>?</h3>
											<p>I would appreciate it very much if you could <a href="<?php echo $ext_store_url; ?>" target="_blank">rate the extension</a> once you've had a chance to try it out. Why not tell everybody how great this extension is by <a href="<?php echo $ext_store_url; ?>" target="_blank">leaving a comment</a> as well.</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="alert alert-info">
												<p><?php echo $text_other_extensions; ?></p>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="faq">
									<h3><?php echo $text_faq; ?></h3>
									<ul class="media-list" id="faqs">
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">Why aren't the custom tabs showing in store front end?</h4>

												<p class="short-answer">Verify that VQMod is working. If you are using a custom theme please make sure you have properly integrated the extension with your theme. Check for any <a href="#" class="external-tab-link" data-target="#about-ext">license issues</a>.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#not_working" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="not_working">
													<p>There may be several causes due to which the custom tabs may not appear to be working in the store front end.</p>

													<ol>
														<li>
															<p>Verify that VQMod is working (for the store front end), proper vqmod cached files are being generated and none of the <?php echo $ext_name; ?> vqmod script files are reporting any errors in the vqmod error log files.</p>
															<p>If VQMod reports errors then these must be addressed. In case proper VQMod cached files are not being generated then VQMod installation needs to be fixed.</p>
														</li>

														<li>
															<p>If you are using a custom theme please make sure you have properly integrated the extension with your theme. See <a href="#theme_integration" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="theme_integration">"How to integrate the extension with a custom theme?"</a> FAQ below.</p>
														</li>

														<li>
															<p>If you have a multi store installation, you need to verify that proper amount of licenses have been purchased. Check the <a href="#" class="external-tab-link" data-target="#about-ext">About tab</a> License section to see whether <?php echo $ext_name; ?> is activated on all of your stores.</p>
															<p>In case <?php echo $ext_name; ?> is inactive on some of your stores, you will need to purchase additional licenses for each inactive store you wish to enable the extension on.</p>
														</li>
													</ol>

													<p>In case none of the above helped you to get the extension working please contact me on the support email given on the <a href="#" class="external-tab-link" data-target="#general">General Support</a> section.</p>
												</div>
											</div>
										</li>
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">How to translate the extension to another language?</h4>

												<p class="short-answer">Copy the extension language file <em>admin/language/en-gb/extension/module/custom_product_tab.php</em> to your language folder and translate the string inside the copied file.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#translation" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="translation">
													<ol>
														<li>
															<p><strong>Copy</strong> the following language file <strong>to YOUR_LANGUAGE folder</strong> under the appropriate location as shown below:</p>
															<div class="btm-mgn">
																<em class="text-muted"><small>FROM:</small></em>
																<ul class="list-unstyled">
																	<li>admin/language/en-gb/extension/module/custom_product_tab.php</li>
																</ul>
																<em class="text-muted"><small>TO:</small></em>
																<ul class="list-unstyled">
																	<li>admin/language/YOUR_LANGUAGE/extension/module/custom_product_tab.php</li>
																</ul>
															</div>
														</li>

														<li>
															<p><strong>Open</strong> the copied <strong>language file</strong> with a text editor such as <a href="http://www.sublimetext.com/">Sublime Text</a> or <a href="http://notepad-plus-plus.org/">Notepad++</a> and <strong>make the required translations</strong>. You can also leave the files in English.</p>
															<p><span class="label label-info">Note</span> You only need to translate the parts that are to the right of the equal sign.</p>
														</li>

													</ol>
												</div>
											</div>
										</li>
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">How to integrate the extension with a custom theme?</h4>

												<p class="short-answer">If you are using a custom theme and the extension is not working out of the box then the first thing to do is to make a copy of the <em>vqmod/xml/custom_product_tab_default_theme_patch.xml</em> vQmod script file and change the theme name to point to your custom theme folder.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#theme_integration" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="theme_integration">
													<p>In order to integrate the <?php echo $ext_name; ?> extension with your custom theme you need to make a copy of the <em>vqmod/xml/custom_product_tab_default_theme_patch.xml</em> file and give it a different name (eg. <em>custom_product_tab_custom_theme_patch.xml</em>). Then open the copied vqmod file with a text editor such as <a href="http://www.sublimetext.com/">Sublime Text</a> or <a href="http://notepad-plus-plus.org/">Notepad++</a> and change the theme name from 'default' to your custom theme (folder name) for the block that edits the default theme <em>product.tpl</em>.</p>
													<p>If changing the theme name does not make it work, then your custom theme structure must differ in some way from the default theme. In this case you need to further tailor the vqmod search &amp; replace/insert patterns for the <em>product.tpl</em> template file to deal with the structural peculiarities of your custom theme. Please see the comments in the vqmod script file to better understand the meaning of each modification.</p>
													<p>As due to the very nature of a custom theme there does not exist a universal solution. Custom themes may have a different way of displaying tabs. Take a look at the changes made to the default theme and work out adjustments to the search &amp; replace patterns to suit your theme.</p>
													<p>If you do not know how the vqmod script works, I kindly suggest you read about it from the vqmod <a href="https://github.com/vqmod/vqmod/wiki" target="_blank">wiki pages</a>. vQmod log files (<em>vqmod/logs/*.log</em>) are helpful for debugging. They will tell you where the script fails (meaning which vqmod search line it does not find in the referenced file), so you need to adjust that part of the script.</p>
													<p>Should you find yourself in trouble with the changes I can offer commercial custom theme integration service. Please refer to the <a href="#" class="external-tab-link" data-target="#services">Services</a> section.</p>
												</div>
											</div>
										</li>
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">How to upgrade the extension?</h4>
												<p class="short-answer">Back up your system, disable the extension, overwrite the current extension files with new ones and click Upgrade on the extension settings page. After upgrade is complete enable the extension again.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#upgrade" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="upgrade">
													<ol>
														<li>
															<p><strong>Back up your system</strong> before making any upgrades or changes.</p>
															<p><span class="label label-info">Note</span> Although <?php echo $ext_name; ?> does not overwrite any OpenCart core files, it is always a good practice to create a system backup before making any changes to the system.</p>
														</li>
														<li><strong>Disable</strong> <?php echo $ext_name; ?> <strong>extension</strong> on the module settings page (<em>Extensions > Extensions > Modules > <?php echo $ext_name; ?></em>) by changing <em>Extension status</em> setting to "Disabled".</li>

														<li>
															<p><strong>Upload</strong> the <strong>extension archive</strong> <em>CustomProductTabsPRO-x.x.x.ocmod.zip</em> using the <a href="<?php echo $extension_installer; ?>" target="_blank">Extension Installer</a>.</p>
															<p><span class="label label-info">Note</span> Do not worry, no OpenCart core files will be replaced! Only the previously installed <?php echo $ext_name; ?> files will be overwritten.</p>
															<p><span class="label label-danger">Important</span> If you have done custom modifications to the extension (for example customized it for your theme) then back up the modified files and re-apply the modifications after upgrade. To see which files have changed, please take a look at the <a href="#" class="external-tab-link" data-target="#changelog,#about-ext">Changelog</a>.</p>
														</li>

														<li>
															<p><strong>Open</strong> the <?php echo $ext_name; ?> <strong>module settings page</strong> <small>(<em>Extensions > Extensions > Modules > <?php echo $ext_name; ?></em>)</small> and <strong>refresh the page</strong> by pressing <em>Ctrl + F5</em> twice to force the browser to update the css changes.</p>
														</li>

														<li><p>You should see a notice stating that new version of extension files have been found. <strong>Upgrade the extension</strong> by clicking on the 'Upgrade' button.</p></li>

														<li>After the extension has been successfully upgraded <strong>enable the extension</strong> by changing <em>Extension status</em> setting to "Enabled".</li>
													</ol>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="tab-pane hidden" id="services">
									<h3>Premium Services<button type="button" class="btn btn-default btn-sm pull-right" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_refresh; ?>" id="btn-refresh-services" data-loading-text="<i class='fa fa-refresh fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_loading; ?></span>"><i class="fa fa-refresh"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_refresh; ?></span></button></h3>
									<div id="service-container">
										<p data-bind="visible: service_list_loading()">Loading service list ... <i class="fa fa-refresh fa-spin"></i></p>
										<p data-bind="visible: service_list_loaded() && services().length == 0">There are currently no available services for this extension.</p>
										<table class="table table-hover">
											<tbody data-bind="foreach: services">
												<tr class="srvc">
													<td>
														<h4 class="service" data-bind="html: name"></h4>
														<span class="help-block">
															<p class="description" data-bind="visible: description != '', html: description"></p>
															<p data-bind="visible: turnaround != ''"><strong>Turnaround time</strong>: <span class="turnaround" data-bind="html: turnaround"></span></p>
															<span class="hidden code" data-bind="html: code"></span>
														</span>
													</td>
													<td class="nowrap text-right top-pad"><span class="currency" data-bind="html: currency"></span> <span class="price" data-bind="html: price"></span></td>
													<td class="text-right"><button type="button" class="btn btn-sm btn-primary purchase"><i class="fa fa-shopping-cart"></i> Buy Now</button></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="about-ext">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#about-navbar-collapse">
									<span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<h3 class="panel-title"><i class="fa fa-info fa-fw"></i> <?php echo $tab_about; ?></h3>
							</div>
							<div class="collapse navbar-collapse" id="about-navbar-collapse">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#ext-info" data-toggle="tab"><?php echo $tab_extension; ?></a></li>
									<li class="hidden"><a href="#changelog" data-toggle="tab"><?php echo $tab_changelog; ?></a></li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="ext-info">
									<div class="row">
										<div class="col-sm-12">
											<h3><?php echo $text_extension_information; ?></h3>

											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_extension_name; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><?php echo $ext_name; ?></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_installed_version; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><strong><?php echo $installed_version; ?></strong></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_extension_compatibility; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><?php echo $ext_compatibility; ?></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_extension_store_url; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><a href="<?php echo $ext_store_url; ?>" target="_blank"><?php echo htmlspecialchars($ext_store_url); ?></a></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_copyright_notice; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static">&copy; <?php echo date("Y"); ?> opencart2x.ru</p>
												</div>
											</div>
											<div class="form-group hidden">
												<div class="col-sm-offset-3 col-sm-9 col-md-offset-2 col-md-10">
													<p class="form-control-static"><a href="#legal_text" id="legal_notice" data-toggle="modal"><?php echo $text_terms; ?></a></p>
												</div>
											</div>

											<h3 class="page-header hidden"><?php echo $text_license; ?></h3>
											<p class="hidden"><?php echo $text_license_text; ?></p>

											<div class="form-group has-success hidden">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_active_on; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static" data-bind="text: asn"></p>
												</div>
											</div>
											<div class="form-group has-error hidden" data-bind="visible: iasn() != ''">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_inactive_on; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static" data-bind="text: iasn"></p>
												</div>
												<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 error-container">
													<span class="help-block error-text"><?php echo $help_purchase_additional_licenses; ?></span>
													<a href="<?php echo $ext_purchase_url; ?>" class="btn btn-sm btn-danger" target="_blank"><i class="fa fa-shopping-cart"></i> <?php echo $button_purchase_license; ?></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane hidden" id="changelog">
									<div class="row">
										<div class="col-sm-12">
											<div class="release">
												<h3>Version 2.4.3 <small class="release-date text-muted">15 Dec 2016</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Description tab content is not shown on some installations</li>
														<li><em class="text-success">Fixed:</em> Language icon does not correctly display on some installations</li>
														<li><em class="text-success">Fixed:</em> Notifications are not always properly shown</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/extension/module/custom_product_tab.php</li>
														<li>admin/model/module/extension/custom_product_tab.php</li>
														<li>admin/view/template/extension/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.4.2 <small class="release-date text-muted">08 Jul 2016</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Support for OpenCart 2.3.0.0</li>
														<li><em class="text-success">Fixed:</em> Iframes are stripped out</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/controller/extension/module/custom_product_tab.php</li>
														<li>admin/language/en-gb/extension/module/custom_product_tab.php</li>
														<li>admin/model/module/extension/custom_product_tab.php</li>
														<li>admin/view/template/extension/module/custom_product_tab.tpl</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/en-gb/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.4.1 <small class="release-date text-muted">03 Mar 2016</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Support for OpenCart 2.2.0.0</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/language/en-gb/module/custom_product_tab.php</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.4.0 <small class="release-date text-muted">12 Dec 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Tab names can contain HTML code</li>
														<li><em class="text-primary">New:</em> Reviews tab can show reviews count</li>
														<li><em class="text-primary">New:</em> Improved dependency checking</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.3.0 <small class="release-date text-muted">28 Aug 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Conditional displaying of reserved type of tabs (third party tabs)</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>system/helper/cpt.php</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.2.1 <small class="release-date text-muted">28 Jul 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Overwrite tab content and change tab status product selection</li>
														<li><em class="text-success">Fixed:</em> PHP notice about an undefined variable</li>
														<li><em class="text-success">Fixed:</em> A JavaScript error during extension upgrade</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.2.0 <small class="release-date text-muted">05 Jul 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Option to mass-apply changes to all products from the selected manufacturer</li>
														<li><em class="text-primary">New:</em> Option to show 'login required' text to customers who are not logged in for tabs that require login</li>
														<li><em class="text-primary">New:</em> Option to manually set tab key for all regular type tabs to improve SEO</li>
														<li><em class="text-primary">New:</em> Improved empty tab detection by stripping HTML from content</li>
														<li><em class="text-info">Changed:</em> Minor UI fixes</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/view/stylesheet/cpt/custom.min.css</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/stylesheet/cpt/css/custom.min.css</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.1.4 <small class="release-date text-muted">02 Apr 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> PHP notice about an undefined variable</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>

												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.1.3 <small class="release-date text-muted">17 Feb 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Custom tabs content lost on copied products</li>
														<li><em class="text-info">Changed:</em> Moved theme changes to a separate vqmod</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/stylesheet/cpt/css/custom.min.css</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>vqmod/xml/custom_product_tab_default_theme_patch.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.1.2 <small class="release-date text-muted">15 Dec 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> CPT PRO improperly listed as a module on the layouts pages</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/stylesheet/cpt/css/custom.min.css</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>system/helper/cpt.php</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.1.1 <small class="release-date text-muted">01 Oct 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Support for OpenCart 2.0</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/stylesheet/cpt/css/custom.min.css</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>system/helper/cpt.php</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/stylesheet/cpt/fonts/*</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.1.0 <small class="release-date text-muted">23 Feb 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Revamped admin interface</li>
														<li><em class="text-primary">New:</em> Option to disable/enable custom tabs per product</li>
														<li><em class="text-success">Fixed:</em> Custom tab updated content was lost when product save failed due to validation errors</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/static/bull5i_cpt_pro_extension_terms.htm</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/view/javascript/cpt/custom.min.js</li>
														<li>admin/view/stylesheet/cpt/css/*</li>
														<li>admin/view/stylesheet/cpt/fonts/*</li>
														<li>system/helper/cpt.php</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/image/cpt-pro/*</li>
														<li>admin/view/javascript/cpt/bootstrap.min.js</li>
														<li>admin/view/javascript/cpt/bootstrapx-typeahead.min.js</li>
														<li>admin/view/javascript/cpt/cpt.pro.js</li>
														<li>admin/view/static/bull5i_cpt_pro_extension_help.htm</li>
														<li>admin/view/stylesheet/cpt/bootstrap.min.css</li>
														<li>admin/view/stylesheet/cpt/cpt.pro.css</li>
														<li>admin/view/stylesheet/cpt/font-awesome.min.css</li>
														<li>admin/view/stylesheet/cpt/font/*</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.0.1 <small class="release-date text-muted">22 Sep 2013</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Product 'reserved' type of tabs disappear after editing product details</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/stylesheet/cpt/cpt.pro.css</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 2.0.0 <small class="release-date text-muted">12 Aug 2013</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Redesigned the whole extension</li>
														<li><em class="text-primary">New:</em> Option to require customer to be logged in to see the tab</li>
														<li><em class="text-primary">New:</em> Full tab sorting (including default tabs)</li>
														<li><em class="text-primary">New:</em> 'Reserved' tab type for integrating with other extensions</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/view/javascript/cpt/bootstrap.min.js</li>
														<li>admin/view/javascript/cpt/bootstrapx-typeahead.min.js</li>
														<li>admin/view/javascript/cpt/cpt.pro.js</li>
														<li>admin/view/stylesheet/cpt/bootstrap.min.css</li>
														<li>admin/view/stylesheet/cpt/cpt.pro.css</li>
														<li>admin/view/stylesheet/cpt/font-awesome.min.css</li>
														<li>admin/view/stylesheet/font/fontawesome*</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/javascript/jquery.idTabs.min.js</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.1.3 <small class="release-date text-muted">18 Sep 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> AceShop 1.4 integration patch</li>
														<li><em class="text-primary">New:</em> HTML documentation</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/view/image/cpt-pro/loading_47x39.gif</li>
														<li>admin/view/javascript/jquery.idTabs.min.js</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/image/loading_47x39.gif</li>
														<li>admin/view/javascript/jquery/jquery.idTabs.min.js</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.1.2 <small class="release-date text-muted">30 Aug 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> A JavaScript escaping issue</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.1.1 <small class="release-date text-muted">13 Jul 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Database query escaping</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.1.0 <small class="release-date text-muted">15 Jun 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Default value option for custom tabs</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>admin/language/english/module/custom_product_tab.php</li>
														<li>admin/model/module/custom_product_tab.php</li>
														<li>admin/view/template/module/custom_product_tab.tpl</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/view/image/loading_47x39.gif</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.0.2 <small class="release-date text-muted">12 Apr 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Changed database charset to utf8 and collation to utf8_bin</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.0.1 <small class="release-date text-muted">26 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Missing database prefixes in module install handler</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/custom_product_tab.php</li>
														<li>vqmod/xml/custom_product_tab.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.0.0 <small class="release-date text-muted">19 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li>Initial release</li>
													</ul>
												</blockquote>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript"><!--
!function(e,t,o){var a,r=<?php echo json_encode($errors); ?>,s=<?php echo json_encode($tabs); ?>,n=<?php echo json_encode(array_map("html_entity_decode", $cpt_login_required_text)); ?>,i=<?php echo json_encode($languages); ?>,c=<?php echo json_encode($stores); ?>,d="<?php echo (int)$default_language; ?>";e.token="<?php echo $token; ?>",e.texts=t.extend({},e.texts,{error_ajax_request:"<?php echo addslashes($error_ajax_request); ?>",error_tab_name:"<?php echo addslashes($error_tab_name); ?>",error_required:"<?php echo addslashes($error_required); ?>",error_tab_key:"<?php echo addslashes($error_tab_key); ?>",default_login_required_text:"<?php echo addslashes($text_default_login_required_text); ?>"});var l=new Bloodhound({remote:'<?php echo str_replace("%TYPE%", "product", $autocomplete); ?>',datumTokenizer:Bloodhound.tokenizers.obj.whitespace("value"),queryTokenizer:Bloodhound.tokenizers.whitespace,dupDetector:function(e,t){return e.id&&t.id&&e.id==t.id},limit:10});l.initialize(),e.load_service_list=function(e){var e=e!==o?1*e:0,r=t.Deferred();return a.service_list_loaded()&&!e||a.service_list_loading()?r.reject():(a.service_list_loading(!0),t.when(t.ajax({url:"<?php echo $services; ?>",data:{force:e},dataType:"json"})).then(function(e){a.service_list_loaded(!0),a.service_list_loading(!1),a.clearServices(),e.services&&t.each(e.services,function(e,t){var o=t.code,r=t.name,s=t.description||"",n=t.currency,i=t.price,c=t.turnaround;a.addService(o,r,s,n,i,c)}),e.rate&&t("#hourly_rate").html(e.rate),r.resolve()},function(e,t,o){a.service_list_loaded(!0),a.service_list_loading(!1),r.reject(),window.console&&window.console.log&&window.console.log("Failed to load services list: "+o)})),r.promise()},validateTabKey=function(e){this.context&&this.context.type&&"reserved"==this.context.type()?(this.target.hasError(e?!1:!0),this.target.errorMsg(e?"":this.message)):(this.target.hasError(!1),this.target.errorMsg(""))};var h=function(e,t,o,a,r,s){this.code=e,this.name=t,this.description=o,this.currency=a,this.price=r,this.turnaround=s},u=function(e,t,o){this.id=e,this.name=t,this.flag=o},p=function(e,t,o){this.id=e,this.name=t,this.model=o},_=function(e,t){this.language_id=ko.observable(e),this.value=ko.observable(t)},b=function(t,o,a){var r=this;this.language_id=ko.observable(t),this.name=ko.observable(o).extend({required:{message:e.texts.error_tab_name,context:r}}),this.hasError=ko.computed(this.hasError,this)};b.prototype=new e.observable_object_methods;var v=function(t,o,a){var r=this;this.language_id=ko.observable(t),this.text=ko.observable(o).extend({required:{message:e.texts.error_required,context:r}}),this.hasError=ko.computed(this.hasError,this)};v.prototype=new e.observable_object_methods;var f=function(o,a,r,s,n,i,c,l,h,u,v,f,m,g,y,w,k,x){var j=this;this.tab_id=ko.observable(o),this.names=ko.observableArray(t.map(a,function(e,t){return new b(t,e,j)})).withIndex("language_id").extend({hasError:{check:!0,context:j},applyErrors:{context:j}}),this.name=ko.computed(function(){var e="";return ko.utils.arrayForEach(j.names(),function(t){t.language_id()==d&&(e=t.name())}),e}),this.status=ko.observable(r),this.sort_order=ko.observable(s).extend({numeric:{precision:0,context:j}}),this.login=ko.observable(n),this.type=ko.observable(i),this.key=ko.observable(c).extend({required:{message:e.texts.error_tab_key,context:j,method:validateTabKey},notify:"always"}),this.condition=ko.observable(l).extend({validate:{context:j}}),this.defaults=ko.observableArray(t.map(h,function(e,t){return new _(t,e)})),this.overwrite=ko.observable(u).extend({hasError:{check:!0,context:j},applyErrors:{context:j}}),this.ow_category=ko.observable(v),this.ow_manufacturer=ko.observable(f),this.ow_products=ko.observableArray(ko.utils.arrayMap(m,function(e){return new p(e.product_id,e.name,e.model)})),this.change_action=ko.observable(g),this.change=ko.observable(y),this.ch_category=ko.observable(w),this.ch_manufacturer=ko.observable(k),this.ch_products=ko.observableArray(ko.utils.arrayMap(x,function(e){return new p(e.product_id,e.name,e.model)})),this.type.subscribe(function(e){j.key.notifySubscribers(j.key())}),this.removeOwProduct=function(e){j.ow_products.remove(e)},this.removeChProduct=function(e){j.ch_products.remove(e)},this.addOwProduct=function(e,o,a){if("4"==j.overwrite()){var r=!1;t.each(j.ow_products(),function(t,o){return o.id==e?void(r=!0):void 0}),r||j.ow_products.push(new p(e,o,a))}},this.addChProduct=function(e,o,a){if("3"==j.change()){var r=!1;t.each(j.ch_products(),function(t,o){return o.id==e?void(r=!0):void 0}),r||j.ch_products.push(new p(e,o,a))}},this.hasError=ko.computed(this.hasError,this)};f.prototype=new e.observable_object_methods;var m=function(){var o=this,a={};this.languages={},t.each(i,function(t,r){o.languages[t]=new u(r.language_id,r.name,r.hasOwnProperty("image")&&r.image?"view/image/flags/"+r.image:"language/"+r.code+"/"+r.code+".png"),n.hasOwnProperty(r.language_id)&&""!=n[r.language_id]?a[r.language_id]=n[r.language_id]:a[r.language_id]=e.texts.default_login_required_text}),this.status=ko.observable("<?php echo $cpt_status; ?>"),this.show_always=ko.observable("<?php echo $cpt_show_always; ?>"),this.use_admin_language_value=ko.observable("<?php echo $cpt_use_admin_language_value; ?>"),this.use_default_for_new=ko.observable("<?php echo $cpt_use_default_for_new; ?>"),this.show_login_required_text=ko.observable("<?php echo $cpt_show_login_required_text; ?>"),this.login_required_texts=ko.observableArray(t.map(a,function(e,t){return new v(t,e,o)})).withIndex("language_id").extend({hasError:{check:!0,context:o},checkErrors:{context:o},applyErrors:{context:o}}),this.remove_sql_changes=ko.observable("<?php echo $cpt_remove_sql_changes; ?>"),this._sas=ko.observable(0),this._as=ko.observableArray(JSON.parse(atob("<?php echo $cpt_as; ?>"))),this.as=ko.computed(function(){return btoa(JSON.stringify(o._as()))}),this.asn=ko.computed(function(){var e=[];return ko.utils.arrayForEach(o._as(),function(t){c.hasOwnProperty(t)&&e.push(c[t].name)}),e.join(", ")}),this.iasn=ko.computed(function(){var e=[];return t.map(c,function(t,a){-1==o._as().indexOf(a.toString())&&e.push(t.name)}),e.join(", ")}),this.general_errors=ko.computed(function(){return o.login_required_texts.hasError()}),o.tabs=ko.observableArray(t.map(s,function(e){return new f(e.tab_id,e.names,e.status,e.sort_order,e.login,e.type,e.key,e.hasOwnProperty("condition")?e.condition:"",e.hasOwnProperty("defaults")?e.defaults:[],e.hasOwnProperty("overwrite")?e.overwrite:"",e.hasOwnProperty("ow_category")?e.ow_category:null,e.hasOwnProperty("ow_manufacturer")?e.ow_manufacturer:null,e.hasOwnProperty("ow_products")?e.ow_products:[],e.hasOwnProperty("change_action")?e.change_action:"",e.hasOwnProperty("change")?e.change:"3",e.hasOwnProperty("ch_category")?e.ch_category:null,e.hasOwnProperty("ch_manufacturer")?e.ch_manufacturer:null,e.hasOwnProperty("ch_products")?e.ch_products:[])})).withIndex("tab_id").extend({hasError:{check:!0,context:o},applyErrors:{context:o}}),o.newTabName=ko.observable(""),this.tab_errors=ko.computed(function(){return o.tabs.hasError()}),o.service_list_loaded=ko.observable(!1),o.service_list_loading=ko.observable(!1),o.services=ko.observableArray([]),this.ta_dataset={name:"product",source:l.ttAdapter(),templates:{empty:['<div class="tt-no-suggestion"><?php echo addslashes($text_no_records_found); ?></div>'].join("\n"),suggestion:Handlebars.compile(['<p><span class="tt-nowrap">{{value}}<span class="tt-secondary-right">{{model}}</span></span></p>'].join(""))}},o.addService=function(e,t,a,r,s,n){o.services.push(new h(e,t,a,r,s,n))},o.clearServices=function(){o.services.removeAll()},o.sortTabs=function(e,t){return parseInt(e.sort_order())>parseInt(t.sort_order())?1:-1},o.addTab=function(a){var r=o.newTabName();r&&a.url&&t.ajax({type:"POST",url:a.url,dataType:"json",data:{name:r},beforeSend:function(){e.onBeforeSend(a.overlay,a.context),a.btn.data("loading-text")?a.btn.button("loading"):a.btn.prop("disabled",!0)}}).done(function(s){if(e.ajax_success.call(a,s),s&&s.tab_id){var n={},i={};t.each(o.languages,function(e,t){n[t.id]=r,i[t.id]=""}),o.tabs.push(new f(s.tab_id,n,0,0,"0","regular","","",i,"",null,null,[],"","3",null,null,[])),o.newTabName("")}}).fail(t.proxy(e.ajax_fail,a)).always(t.proxy(e.ajax_always,a))},o.deleteTab=function(a,r){var s=!1,n=t.Deferred();r.url&&a&&(t("#confirmDelete").length?(t("#confirmDelete").modal("show"),t("#confirmDelete button.delete").click(function(){t("#confirmDelete").modal("hide"),s=!0}),t("#confirmDelete").on("hidden.bs.modal",function(){s?n.resolve():n.reject()})):(s=!0,n.resolve()),t.when(n).done(function(){s&&t.ajax({type:"POST",url:r.url,dataType:"json",data:{tab_id:a.tab_id()},beforeSend:function(){e.onBeforeSend(r.overlay,r.context),r.btn.data("loading-text")?r.btn.button("loading"):r.btn.prop("disabled",!0)}}).done(function(s){e.ajax_success.call(r,s),s&&s.deleted&&(o.tabs.remove(a),t("#custom-tabs-header a:first").trigger("click"))}).fail(t.proxy(e.ajax_fail,r)).always(t.proxy(e.ajax_always,r))}))},this.checkErrors=function(){for(var e in o)ko.isObservable(o[e])&&"function"==typeof o[e].checkErrors&&o[e].checkErrors()},o.sortedTabs=ko.computed(function(){return o.tabs.slice().sort(o.sortTabs)})};m.prototype=new e.observable_object_methods,t(function(){var o=window.location.hash,s=o.split("?")[0];a=e.view_model=new m,e.view_models=t.extend({},e.view_models,{ExtVM:e.view_model}),a.checkErrors(),a.applyErrors(r),ko.applyBindings(a,t("#content")[0]),t("#legal_text .modal-body").load("view/static/bull5i_cpt_pro_extension_terms.htm"),t("body").on("shown.bs.tab","a[data-toggle='tab'][href='#ext-support'],a[data-toggle='tab'][href='#services']",function(t){e.load_service_list()}).on("keydown","#cpt_status",function(e){if(e.altKey&&e.shiftKey&&e.ctrlKey&&83==e.keyCode){var t=ko.dataFor(this);t._sas(0==t._sas()?1:0)}}).on("click","#add-new-tab",function(e){var o=ko.dataFor(this),a=this,r={self:a,btn:t(this),form:t(t(this).data("form")),url:t(this).data("url"),alerts:t("#alerts"),context:t(t(this).data("context")),vm:t(this).data("vm"),overlay:t(t(this).data("overlay"))};e.preventDefault(),o.addTab(r)}).on("keyup","#new-tab-name",function(e){if(13==e.which){var o=ko.dataFor(this),a=t("#add-new-tab"),r={self:a,btn:a,form:t(a.data("form")),url:a.data("url"),alerts:t("#alerts"),context:t(a.data("context")),vm:a.data("vm"),overlay:t(a.data("overlay"))};e.preventDefault(),o.addTab(r)}}).on("click",".delete-tab",function(e){var o=ko.dataFor(this),a=ko.contextFor(this).$parent;self=this,options={self:self,btn:t(this),form:t(t(this).data("form")),url:t(this).data("url"),alerts:t("#alerts"),context:t(t(this).data("context")),vm:t(this).data("vm"),overlay:t(t(this).data("overlay"))},e.preventDefault(),a.deleteTab(o,options)}).on("typeahead:selected",".typeahead",function(e,o,a){var r=(ko.contextFor(this),ko.dataFor(this)),s=t(this).data("method");s&&(r[s](o.id,o.value,o.model),t(this).typeahead("val",""))}),t("#custom-tabs-header a:first").tab("show"),e.activateTab(s),e.onComplete(t("#page-overlay"),t("#content"))})}(window.bull5i=window.bull5i||{},jQuery);
//--></script>
<?php echo $footer; ?>
