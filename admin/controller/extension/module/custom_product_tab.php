<?php
define('EXTENSION_NAME',            'Custom Product Tabs PRO');
define('EXTENSION_VERSION',         '2.4.3');
define('EXTENSION_ID',              '5555');
define('EXTENSION_COMPATIBILITY',   'OpenCart 2.3.x.x');
define('EXTENSION_MIN_PHP_VERSION', '5.3.0');

class ControllerExtensionModuleCustomProductTab extends Controller {
	private $error = array();
	protected $alert = array(
		'error'     => array(),
		'warning'   => array(),
		'success'   => array(),
		'info'      => array()
	);

	private static $config_defaults = array(
		'cpt_installed'                     => 1,
		'cpt_installed_version'             => EXTENSION_VERSION,
		'cpt_status'                        => 0,
		'cpt_show_always'                   => 0,
		'cpt_use_admin_language_value'      => 1,
		'cpt_use_default_for_new'           => 1,
		'cpt_show_login_required_text'      => 0,
		'cpt_login_required_text'      		=> array(),
		'cpt_remove_sql_changes'            => 0,
		'cpt_services'                      => "W10=",
		'cpt_as'                            => "WyIwIl0=",
	);

	private static $language_texts = array(
		// Texts
		'text_enabled', 'text_disabled', 'text_yes', 'text_no', 'text_toggle_navigation', 'text_legal_notice', 'text_license', 'text_extension_information',
		'text_terms', 'text_license_text', 'text_support_subject', 'text_faq', 'text_remove', 'text_autocomplete', 'text_confirm_delete', 'text_are_you_sure',
		'text_custom_tab_name', 'text_regular_tab', 'text_reserved_tab', 'text_default_tab', 'text_selected_products', 'text_all_manufacturer_products',
		'text_all_category_products', 'text_all_empty_products', 'text_all_products', 'text_no_products', 'text_add_tab', 'text_delete_tab',
		'text_overwrite_tab_content', 'text_change_product_tab_status', 'text_enable', 'text_disable', 'text_no_action', 'text_saving', 'text_fixing',
		'text_upgrading', 'text_canceling', 'text_loading', 'text_no_records_found', 'text_default_login_required_text',
		// Tabs
		'tab_settings', 'tab_tabs', 'tab_support', 'tab_about', 'tab_general', 'tab_faq', 'tab_services', 'tab_changelog', 'tab_extension',
		// Buttons
		'button_save', 'button_apply', 'button_cancel', 'button_delete', 'button_close', 'button_upgrade', 'button_refresh', 'button_fix_db',
		'button_purchase_license',
		// Help texts
		'help_show_always', 'help_global_status', 'help_use_admin_language_value', 'help_use_default_value_for_new', 'help_show_login_required_text',
		'help_tab_type', 'help_tab_key', 'help_tab_key_alt', 'help_overwrite', 'help_require_login', 'help_remove_sql_changes',
		'help_change_product_tab_status', 'help_condition', 'help_purchase_additional_licenses',
		// Entries
		'entry_installed_version', 'entry_extension_status', 'entry_show_always', 'entry_use_admin_language_value', 'entry_use_default_value_for_new',
		'entry_show_login_required_text', 'entry_login_required_text', 'entry_remove_sql_changes', 'entry_tab_status', 'entry_tab_name', 'entry_sort_order',
		'entry_require_login', 'entry_tab_type', 'entry_tab_key', 'entry_default_value', 'entry_action', 'entry_products', 'entry_extension_name',
		'entry_extension_compatibility', 'entry_extension_store_url', 'entry_copyright_notice', 'entry_condition', 'entry_active_on', 'entry_inactive_on',
		// Errors
		'error_tab_name', 'error_tab_key', 'error_required', 'error_ajax_request'
	);

	public function __construct($registry) {
		parent::__construct($registry);
		$this->load->helper('cpt');
		$this->load->language('extension/module/custom_product_tab');
		$this->load->model('extension/module/custom_product_tab');
	}

	public function index() {
		$this->document->addStyle('view/javascript/summernote/summernote.css');
		$this->document->addStyle('view/stylesheet/cpt/custom.min.css');

		$this->document->addScript('view/javascript/summernote/summernote.js');
		$this->document->addScript('view/javascript/cpt/custom.min.js');

		$this->document->setTitle($this->language->get('extension_name'));

		$this->load->model('setting/setting');

		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && !$ajax_request && $this->validateForm($this->request->post)) {
			$original_settings = $this->model_setting_setting->getSetting('cpt');

			foreach (self::$config_defaults as $setting => $default) {
				$value = $this->config->get($setting);
				if ($value === null) {
					$original_settings[$setting] = $default;
				}
			}

			$tabs = (isset($this->request->post['tabs']) && is_array($this->request->post['tabs'])) ? $this->request->post['tabs'] : array();

			unset($this->request->post['tabs']);

			$settings = array_merge($original_settings, $this->request->post);
			$settings['cpt_installed_version'] = $original_settings['cpt_installed_version'];

			$this->model_setting_setting->editSetting('cpt', $settings);

			foreach ($tabs as $tab) {
				$this->model_extension_module_custom_product_tab->editTab($tab['tab_id'], $tab);
			}

			$this->session->data['success'] = $this->language->get('text_success_update');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		} else if ($this->request->server['REQUEST_METHOD'] == 'POST' && $ajax_request) {
			$response = array();

			if ($this->validateForm($this->request->post)) {
				$original_settings = $this->model_setting_setting->getSetting('cpt');

				foreach (self::$config_defaults as $setting => $default) {
					$value = $this->config->get($setting);
					if ($value === null) {
						$original_settings[$setting] = $default;
					}
				}

				if ((int)$original_settings['cpt_status'] != (int)$this->request->post['cpt_status']) {
					$response['reload'] = true;
					$this->session->data['success'] = $this->language->get('text_success_update');
				}

				$tabs = (isset($this->request->post['tabs']) && is_array($this->request->post['tabs'])) ? $this->request->post['tabs'] : array();

				unset($this->request->post['tabs']);

				$settings = array_merge($original_settings, $this->request->post);
				$settings['cpt_installed_version'] = $original_settings['cpt_installed_version'];

				$this->model_setting_setting->editSetting('cpt', $settings);

				foreach ($tabs as $tab) {
					$this->model_extension_module_custom_product_tab->editTab($tab['tab_id'], $tab);
				}

				$this->alert['success']['updated'] = $this->language->get('text_success_update');
			} else {
				if (!$this->checkVersion()) {
					$response['reload'] = true;
				}
			}

			$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
			return;
		}

		$db_structure_ok = $this->checkVersion() && $this->model_extension_module_custom_product_tab->checkDatabaseStructure($this->alert);
		$db_errors = !($db_structure_ok && $this->model_extension_module_custom_product_tab->checkDatabaseConsistency($this->alert));

		$this->alert = array_merge($this->alert, $this->model_extension_module_custom_product_tab->getAlerts());

		$this->checkPrerequisites();

		$this->checkVersion();

		$data['heading_title'] = $this->language->get('extension_name');
		$data['text_other_extensions'] = sprintf($this->language->get('text_other_extensions'), OTHER_EXTENSIONS);

		foreach (self::$language_texts as $text) {
			$data[$text] = $this->language->get($text);
		}

		$data['db_errors'] = $db_errors;

		$data['ext_name'] = EXTENSION_NAME;
		$data['ext_version'] = EXTENSION_VERSION;
		$data['ext_id'] = EXTENSION_ID;
		$data['ext_compatibility'] = EXTENSION_COMPATIBILITY;
		$data['ext_store_url'] = EXTENSION_STORE_URL;
		$data['ext_purchase_url'] = EXTENSION_PURCHASE_URL;
		$data['ext_support_email'] = EXTENSION_SUPPORT_EMAIL;
		$data['ext_support_forum'] = EXTENSION_SUPPORT_FORUM;
		$data['other_extensions_url'] = OTHER_EXTENSIONS;
		$data['oc_version'] = VERSION;

		$data['alert_icon'] = function($type) {
			$icon = "";
			switch ($type) {
				case 'error':
					$icon = "fa-times-circle";
					break;
				case 'warning':
					$icon = "fa-exclamation-triangle";
					break;
				case 'success':
					$icon = "fa-check-circle";
					break;
				case 'info':
					$icon = "fa-info-circle";
					break;
				default:
					break;
			}
			return $icon;
		};

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
			'active'    => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_extension'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true),
			'active'    => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('extension_name'),
			'href'      => $this->url->link('extension/module/custom_product_tab', 'token=' . $this->session->data['token'], true),
			'active'    => true
		);

		$data['save'] = $this->url->link('extension/module/custom_product_tab', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['upgrade'] = $this->url->link('extension/module/custom_product_tab/upgrade', 'token=' . $this->session->data['token'], true);
		$data['add'] = html_entity_decode($this->url->link('extension/module/custom_product_tab/add', 'token=' . $this->session->data['token'], true));
		$data['delete'] = html_entity_decode($this->url->link('extension/module/custom_product_tab/delete', 'token=' . $this->session->data['token'], true));
		$data['fix_db'] = html_entity_decode($this->url->link('extension/module/custom_product_tab/fix_db', 'token=' . $this->session->data['token'], true));
		$data['autocomplete'] = html_entity_decode($this->url->link('extension/module/custom_product_tab/autocomplete', 'type=%TYPE%&query=%QUERY&token=' . $this->session->data['token'], true));
		$data['extension_installer'] = $this->url->link('extension/installer', 'token=' . $this->session->data['token'], true);
		$data['services'] = ' ';

		$data['update_pending'] = !$this->checkVersion();

		if (!$data['update_pending']) {
			$this->updateEventHooks();
		}

		$data['ssl'] = (
				(int)$this->config->get('config_secure') ||
				isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' ||
				!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' ||
				!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on'
			) ? 's' : '';

		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach ($languages as $key => $value) {
			unset($languages[$key]['image']);
		}
		$data['languages'] = array_remap_key_to_id('language_id', $languages);
		$data['default_language'] = $this->config->get('config_language_id');

		$this->load->model('catalog/category');
		$categories = $this->model_catalog_category->getCategories(array('sort' => 'name'));
		$data['categories'] = array_remap_key_to_id('category_id', $categories);

		$this->load->model('catalog/manufacturer');
		$manufacturers = $this->model_catalog_manufacturer->getManufacturers(array('sort' => 'name'));
		$data['manufacturers'] = array_remap_key_to_id('manufacturer_id', $manufacturers);

		$data['installed_version'] = $this->installedVersion();

		if ($db_structure_ok) {
			if (isset($this->request->post['tabs'])) {
				$data['tabs'] = $this->request->post['tabs'];
			} else {
				$tabs = $this->model_extension_module_custom_product_tab->getTabs();
				$tab_data = array();

				foreach ($tabs as $idx => $tab) {
					$tabs[$idx]['names'] = $this->model_extension_module_custom_product_tab->getTabNames($tab['tab_id']);
					$tabs[$idx]['defaults'] = $this->model_extension_module_custom_product_tab->getTabDefaults($tab['tab_id']);
					$tabs[$idx]['linked_products'] = array();
				}

				$data['tabs'] = $tabs;
			}
		} else {
			$data['tabs'] = array();
		}

		# Loop through all settings for the post/config values
		foreach (array_keys(self::$config_defaults) as $setting) {
			if (isset($this->request->post[$setting])) {
				$data[$setting] = $this->request->post[$setting];
			} else {
				$data[$setting] = $this->config->get($setting);
				if ($data[$setting] === null) {
					if (!isset($this->alert['warning']['unsaved']) && $this->checkVersion())  {
						$this->alert['warning']['unsaved'] = $this->language->get('error_unsaved_settings');
					}
					if (isset(self::$config_defaults[$setting])) {
						$data[$setting] = self::$config_defaults[$setting];
					}
				}
			}
		}

		$this->load->model('setting/store');

		$stores = $this->model_setting_store->getStores();

		$data['stores'] = array();

		$data['stores'][0] = array(
			'name' => $this->config->get('config_name'),
			'url'  => HTTP_CATALOG
		);

		foreach ($stores as $store) {
			$data['stores'][$store['store_id']] = array(
				'name' => $store['name'],
				'url'  => $store['url']
			);
		}

		if (isset($this->session->data['error'])) {
			$this->error = $this->session->data['error'];

			unset($this->session->data['error']);
		}

		if (isset($this->error['warning'])) {
			$this->alert['warning']['warning'] = $this->error['warning'];
		}

		if (isset($this->error['error'])) {
			$this->alert['error']['error'] = $this->error['error'];
		}

		if (isset($this->session->data['success'])) {
			$this->alert['success']['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		}

		$data['errors'] = $this->error;

		$data['token'] = $this->session->data['token'];

		$data['alerts'] = $this->alert;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$template = 'extension/module/custom_product_tab';

		$this->response->setOutput($this->load->view($template, $data));
	}

	public function install() {
		$this->registerEventHooks();

		$this->model_extension_module_custom_product_tab->applyDatabaseChanges();

		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('cpt', self::$config_defaults);
	}

	public function uninstall() {
		$this->removeEventHooks();

		if ($this->config->get("cpt_remove_sql_changes")) {
			$this->model_extension_module_custom_product_tab->revertDatabaseChanges();
		}

		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('cpt');
	}

	public function upgrade() {
		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		$response = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateUpgrade()) {
			$this->load->model('setting/setting');

			if ($this->model_extension_module_custom_product_tab->upgradeDatabaseStructure($this->installedVersion(), $this->alert)) {
				$settings = array();

				// Go over all settings, add new values and remove old ones
				foreach (self::$config_defaults as $setting => $default) {
					$value = $this->config->get($setting);
					if ($value === null) {
						$settings[$setting] = $default;
					} else {
						$settings[$setting] = $value;
					}
				}

				$response['reload'] = true; //?needed?
				$settings['cpt_installed_version'] = EXTENSION_VERSION;

				$this->model_setting_setting->editSetting('cpt', $settings);

				$this->session->data['success'] = sprintf($this->language->get('text_success_upgrade'), EXTENSION_VERSION);

				$this->alert['success']['upgrade'] = sprintf($this->language->get('text_success_upgrade'), EXTENSION_VERSION);

				$response['success'] = true;
				$response['reload'] = true;
			} else {
				$this->alert = array_merge($this->alert, $this->model_extension_module_custom_product_tab->getAlerts());
				$this->alert['error']['database_upgrade'] = $this->language->get('error_upgrade_database');
			}
		}

		$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

		if (!$ajax_request) {
			$this->session->data['errors'] = $this->error;
			$this->session->data['alerts'] = $this->alert;
			$this->response->redirect($this->url->link('extension/module/custom_product_tab', 'token=' . $this->session->data['token'], true));
		} else {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
			return;
		}
	}

	private function registerEventHooks() {
		// $this->load->model('extension/event');
		// $this->model_extension_event->addEvent('cpt.product.delete', 'pre.admin.product.delete', 'module/custom_product_tab/hook');
	}

	private function removeEventHooks() {
		// $this->load->model('extension/event');
		// $this->model_extension_event->deleteEvent('cpt.product.delete');
	}

	private function updateEventHooks() {
		$this->load->model('extension/event');

		$event_hooks = array(
			// 'cpt.product.delete'         => array('trigger' => 'pre.admin.product.delete',           'action' => 'module/custom_product_tab/hook'),
		);

		foreach ($event_hooks as $code => $hook) {
			$event = $this->model_extension_event->getEvent($code, $hook['trigger'], $hook['action']);

			if (!$events) {
				$this->model_extension_event->addEvent($code, $hook['trigger'], $hook['action']);

				if (empty($this->alert['success']['hooks_updated'])) {
					$this->alert['success']['hooks_updated'] = $this->language->get('text_success_hooks_update');
				}
			}
		}

		// Delete old triggers
		$query = $this->db->query("SELECT `code` FROM " . DB_PREFIX . "event WHERE `code` LIKE 'cpt.%'");
		$events = array_keys($event_hooks);

		foreach ($query->rows as $row) {
			if (!in_array($row['code'], $events)) {
				$this->model_extension_event->deleteEvent($row['code']);

				if (empty($this->alert['success']['hooks_updated'])) {
					$this->alert['success']['hooks_updated'] = $this->language->get('text_success_hooks_update');
				}
			}
		}
	}

	public function add() {
		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		$response = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ($this->validateAdd($this->request->post)) {
				$this->load->model('localisation/language');

				$name = $this->request->post['name'];

				$languages = $this->model_localisation_language->getLanguages();
				$languages = array_remap_key_to_id('language_id', $languages);

				$data = array(
					'sort_order' => 0,
					'status' => 0,
					'name' => array(),
					'default' => array(),
				);

				foreach ($languages as $language_id => $language) {
					$data['name'][$language_id] = $name;
					$data['default'][$language_id] = '';
				}

				$tab_id = $this->model_extension_module_custom_product_tab->addTab($data);
				$response['tab_id'] = $tab_id;

				$this->alert['success']['tab_add'] = sprintf($this->language->get('text_success_tab_add'), $name);
			}
		}

		$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

		if (!$ajax_request) {
			$this->session->data['errors'] = $this->error;
			$this->session->data['alerts'] = $this->alert;
			$this->response->redirect($this->url->link('extension/module/custom_product_tab', 'token=' . $this->session->data['token'], true));
		} else {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
			return;
		}
	}

	public function delete() {
		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		$response = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ($this->validateDelete($this->request->post)) {
				$tab_id = $this->request->post['tab_id'];

				$tab = $this->model_extension_module_custom_product_tab->getTab($tab_id);

				$this->model_extension_module_custom_product_tab->deleteTab($tab_id);

				$response['deleted'] = true;

				$this->alert['success']['tab_delete'] = sprintf($this->language->get('text_success_tab_delete'), $tab['name']);
			}
		}

		$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

		if (!$ajax_request) {
			$this->session->data['errors'] = $this->error;
			$this->session->data['alerts'] = $this->alert;
			$this->response->redirect($this->url->link('extension/module/custom_product_tab', 'token=' . $this->session->data['token'], true));
		} else {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
			return;
		}
	}

	public function fix_db() {
		$ajax_request = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && !empty($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';

		$response = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			if ($this->model_extension_module_custom_product_tab->fixDatabaseConsistency($this->alert)) {
				$this->alert['success']['fix_db'] = $this->language->get('text_success_fix_db');
			} else {
				$this->alert = array_merge($this->alert, $this->model_extension_module_custom_product_tab->getAlerts());
			}
		}

		$response = array_merge($response, array("errors" => $this->error), array("alerts" => $this->alert));

		if (!$ajax_request) {
			$this->session->data['errors'] = $this->error;
			$this->session->data['alerts'] = $this->alert;
			$this->response->redirect($this->url->link('extension/module/custom_product_tab', 'token=' . $this->session->data['token'], true));
		} else {
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
		}
	}

	public function autocomplete() {
		if ($this->request->server['REQUEST_METHOD'] == 'GET' && isset($this->request->get['type'])) {
			$response = array();
			switch ($this->request->get['type']) {
				case 'product':
					$this->load->model('catalog/product');

					$results = array();

					if (isset($this->request->get['query'])) {
						$filter_data = array(
							'filter_name'   => $this->request->get['query'],
							'sort'          => 'pd.name',
							'start'         => 0,
							'limit'         => 20,
						);

						$results = $this->model_catalog_product->getProducts($filter_data);
					}

					foreach ($results as $result) {
						$result['name'] = html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8');
						$response[] = array(
							'value'     => $result['name'],
							'tokens'    => explode(' ', $result['name']),
							'id'        => $result['product_id'],
							'model'     => $result['model']
						);
					}
					break;
				case 'category':
					$this->load->model('catalog/category');

					$results = array();

					if (isset($this->request->get['query'])) {
						$filter_data = array(
							'filter_name'   => $this->request->get['query'],
						);

						$results = $this->model_catalog_category->getCategories($filter_data);

						if (stripos($this->language->get('text_none'), $this->request->get['query']) !== false) {
							$response[] = array(
									'value'     => $this->language->get('text_none'),
									'tokens'    => explode(' ', trim(str_replace('---', '', $this->language->get('text_none')))),
									'id'        => '*',
									'path'      => '',
									'full_name' => $this->language->get('text_none')
								);
						}
					}

					foreach ($results as $result) {
						$result['name'] = html_entity_decode(str_replace('&nbsp;', '', $result['name']), ENT_QUOTES, 'UTF-8');
						$parts = explode('>', $result['name']);
						$last_part = array_pop($parts);

						$response[] = array(
							'value'     => $last_part,
							'tokens'    => explode('>', $result['name']),
							'id'        => $result['category_id'],
							'path'      => $parts ? implode(' > ', $parts) . ' > ' : '',
							'full_name' => $result['name']
						);
					}
					break;
				default:
					break;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_enc($response, JSON_UNESCAPED_SLASHES));
	}

	private function checkPrerequisites() {
		$errors = false;

		if (version_compare(phpversion(), EXTENSION_MIN_PHP_VERSION) < 0) {
			$errors = true;
			$this->alert['error']['php'] = sprintf($this->language->get('error_php_version'), phpversion(), EXTENSION_MIN_PHP_VERSION);
		}

		return !$errors;
	}

	private function checkVersion() {
		$errors = false;

		$installed_version = $this->installedVersion();

		if ($installed_version != EXTENSION_VERSION) {
			$errors = true;
			$this->alert['info']['version'] = sprintf($this->language->get('error_version'), EXTENSION_VERSION);
		}

		return !$errors;
	}

	private function validate() {
		$errors = false;

		if (!$this->user->hasPermission('modify', 'extension/module/custom_product_tab')) {
			$errors = true;
			$this->alert['error']['permission'] = $this->language->get('error_permission');
		}

		if (!$errors) {
			$result = $this->checkVersion() && $this->model_extension_module_custom_product_tab->checkDatabaseStructure($this->alert) && $this->checkPrerequisites();
			$this->alert = array_merge($this->alert, $this->model_extension_module_custom_product_tab->getAlerts());
			return $result;
		} else {
			return false;
		}
	}

	private function validateUpgrade() {
		$errors = false;

		if (!$this->user->hasPermission('modify', 'extension/module/custom_product_tab')) {
			$errors = true;
			$this->alert['error']['permission'] = $this->language->get('error_permission');
		}

		return !$errors;
	}

	private function validateForm(&$data) {
		$errors = false;

		$tabs = (isset($data['tabs']) && is_array($data['tabs'])) ? $data['tabs'] : array();

		foreach ($tabs as $idx => $tab) {
			foreach ($tab["names"] as $language_id => $value) {
				if (!utf8_strlen($value)) {
					$errors = true;
					$this->error['tabs'][$idx]['names'][$language_id]['name'] = $this->language->get('error_tab_name');
				}
			}

			if ($tab['type'] == 'reserved' && !utf8_strlen($tab['key'])) {
				$errors = true;
				$this->error['tabs'][$idx]['key'] = $this->language->get('error_tab_key');
			}
		}

		if ((int)$data['cpt_show_login_required_text']) {
			foreach ($data["cpt_login_required_text"] as $language_id => $value) {
				if (!utf8_strlen($value)) {
					$errors = true;
					$this->error['login_required_texts'][$language_id]['text'] = $this->language->get('error_required');
				}
			}
		}

		if ($errors) {
			$this->alert['warning']['warning'] = $this->language->get('error_warning');
		}

		if (!$errors) {
			return $this->validate();
		} else {
			return false;
		}
	}

	private function validateAdd($data) {
		$errors = false;

		if (empty($data['name'])) {
			$errors = true;
			$this->alert['warning']['tab_name'] = $this->language->get('error_tab_name');
		}

		if (!$errors) {
			return $this->validate();
		} else {
			return false;
		}
	}

	private function validateDelete($data) {
		$errors = false;

		if (empty($data['tab_id'])) {
			$errors = true;
			$this->alert['warning']['warning'] = $this->language->get('error_warning');
		} else {
			$tab_id = $data['tab_id'];

			$tab = $this->model_extension_module_custom_product_tab->getTab($tab_id);

			if ($tab['type'] == 'default') {
				$errors = true;
				$this->alert['warning']['delete_default'] = $this->language->get('error_delete_default_tab');
			}
		}

		if (!$errors) {
			return $this->validate();
		} else {
			return false;
		}
	}

	private function installedVersion() {
		$installed_version = $this->config->get('cpt_installed_version');
		return $installed_version ? $installed_version : '1.1.3';
	}
}
