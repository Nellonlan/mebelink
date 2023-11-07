<?php
class ModelExtensionModuleCustomProductTab extends Model {
	private static $alerts;
	private $tables = array(
		"product_tab" => array("tab_id", "sort_order", "status", "type", "key", "login", "condition"),
		"product_to_tab" => array("product_id", "tab_id", "status"),
		"product_tab_name" => array("tab_id", "language_id", "name"),
		"product_tab_default" => array("tab_id", "language_id", "content"),
		"product_tab_content" => array("product_id", "language_id", "tab_id", "content"),
	);

	public function __construct($registry) {
		parent::__construct($registry);
	}

	public function addTab($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");

		$tab_id = $this->db->getLastId();

		$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_tab (product_id, tab_id) SELECT product_id, '" . (int)$tab_id . "' FROM " . DB_PREFIX . "product");

		foreach ($data['name'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_name SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value) . "'");

			$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_content (product_id, language_id, tab_id, content) SELECT product_id, '" . (int)$language_id . "', '" . (int)$tab_id . "', '' FROM " . DB_PREFIX . "product");
		}

		foreach ($data['default'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_default SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', content = '" . $this->db->escape($value) . "'");
		}

		return $tab_id;
	}

	public function editTab($tab_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "product_tab SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', type = '" . $this->db->escape($data['type']) . "', `key` = '" . $this->db->escape($data['key']) . "', login = '" . (int)$data['login'] . "', `condition` = '" . $this->db->escape($data['condition']) . "' WHERE tab_id = '" . (int)$tab_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_name WHERE tab_id = '" . (int)$tab_id . "'");

		foreach ($data['names'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_name SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value) . "'");
		}

		if ($this->config->get('cpt_use_admin_language_value') && isset($data['defaults'])) {
			$admin_lang_default = $data['defaults'][$this->config->get('config_language_id')];
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_default WHERE tab_id = '" . (int)$tab_id . "'");

		if (isset($data['defaults']) && $data['type'] == 'regular') {
			foreach ($data['defaults'] as $language_id => $value) {
				$default_value = ($this->config->get('cpt_use_admin_language_value') && $value == '') ? $admin_lang_default : $value;

				$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_default SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', content = '" . $this->db->escape($default_value) . "'");

				if (isset($data['overwrite']) && $data['overwrite'] != '' && (int)$data['overwrite'] == 0) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_tab_content ptc JOIN " . DB_PREFIX . "product_to_category p2c ON (ptc.product_id = p2c.product_id) SET ptc.content = '" . $this->db->escape($default_value) . "' WHERE ptc.tab_id = '" . (int)$tab_id . "' AND ptc.language_id = '" . (int)$language_id . "'");
				} elseif (isset($data['overwrite']) && $data['overwrite'] && (int)$data['overwrite'] == 1) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_tab_content SET content = '" . $this->db->escape($default_value) . "' WHERE tab_id = '" . (int)$tab_id . "' AND language_id = '" . (int)$language_id . "' AND content = ''");
				} elseif (isset($data['overwrite']) && $data['overwrite'] && (int)$data['overwrite'] == 2 && isset($data['ow_category'])) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_tab_content ptc JOIN " . DB_PREFIX . "product_to_category p2c ON (ptc.product_id = p2c.product_id AND p2c.category_id = '" . (int)$data['ow_category'] . "') SET ptc.content = '" . $this->db->escape($default_value) . "' WHERE ptc.tab_id = '" . (int)$tab_id . "' AND language_id = '" . (int)$language_id . "'");
				} elseif (isset($data['overwrite']) && $data['overwrite'] && (int)$data['overwrite'] == 3 && isset($data['ow_manufacturer'])) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_tab_content ptc JOIN " . DB_PREFIX . "product p ON (ptc.product_id = p.product_id AND p.manufacturer_id = '" . (int)$data['ow_manufacturer'] . "') SET ptc.content = '" . $this->db->escape($default_value) . "' WHERE ptc.tab_id = '" . (int)$tab_id . "' AND language_id = '" . (int)$language_id . "'");
				} else if (isset($data['ow_products'])) {
					foreach ((array)$data['ow_products'] as $product) {
						$this->db->query("UPDATE " . DB_PREFIX . "product_tab_content SET content = '" . $this->db->escape($default_value) . "' WHERE product_id = '" . (int)$product['product_id'] . "' AND tab_id = '" . (int)$tab_id . "' AND language_id = '" . (int)$language_id . "'");
					}
				}
			}
		}

		if (isset($data['change_action']) && $data['change_action'] != '' && isset($data['change'])) {
			if ((int)$data['change'] == 0) {
				$this->db->query("UPDATE " . DB_PREFIX . "product_to_tab SET status = '" . (int)$data['change_action'] . "' WHERE tab_id = '" . (int)$tab_id . "'");
			} else if ((int)$data['change'] == 1 && isset($data['ch_category'])) {
				$this->db->query("UPDATE " . DB_PREFIX . "product_to_tab p2t JOIN " . DB_PREFIX . "product_to_category p2c ON (p2t.product_id = p2c.product_id AND p2c.category_id = '" . (int)$data['ch_category'] . "') SET p2t.status = '" . (int)$data['change_action'] . "' WHERE p2t.tab_id = '" . (int)$tab_id . "'");
			} else if ((int)$data['change'] == 2 && isset($data['ch_manufacturer'])) {
				$this->db->query("UPDATE " . DB_PREFIX . "product_to_tab p2t JOIN " . DB_PREFIX . "product p ON (p2t.product_id = p.product_id AND p.manufacturer_id = '" . (int)$data['ch_manufacturer'] . "') SET p2t.status = '" . (int)$data['change_action'] . "' WHERE p2t.tab_id = '" . (int)$tab_id . "'");
			} else if ((int)$data['change'] == 3 && isset($data['ch_products'])) {
				foreach ((array)$data['ch_products'] as $product) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_to_tab SET status = '" . (int)$data['change_action'] . "' WHERE product_id = '" . (int)$product['product_id'] . "' AND tab_id = '" . (int)$tab_id . "'");
				}
			}
		}
	}

	public function deleteTab($tab_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab WHERE tab_id = '" . (int)$tab_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_tab WHERE tab_id = '" . (int)$tab_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_name WHERE tab_id = '" . (int)$tab_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_default WHERE tab_id = '" . (int)$tab_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_content WHERE tab_id = '" . (int)$tab_id . "'");
	}

	public function getTab($tab_id) {
		$sql = "SELECT t.*, tn.name AS name FROM " . DB_PREFIX . "product_tab t LEFT JOIN " . DB_PREFIX . "product_tab_name tn ON (t.tab_id = tn.tab_id) WHERE t.tab_id = '" . (int)$tab_id . "' AND tn.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$query = $this->db->query($sql);

		if (isset($query->row['name'])) {
			$query->row['name'] = html_entity_decode($query->row['name'], ENT_QUOTES, 'UTF-8');
		}

		return $query->row;
	}

	public function getTabs($data = array()) {
		$tabs = array();

		$sql = "SELECT t.*, tn.name AS name FROM " . DB_PREFIX . "product_tab t LEFT JOIN " . DB_PREFIX . "product_tab_name tn ON (t.tab_id = tn.tab_id) WHERE tn.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (isset($data['type'])) {
			$sql .= " AND t.type = '" . $this->db->escape($data['type']) . "'";
		}

		$sql .=  " ORDER BY t.sort_order ASC";

		$query = $this->db->query($sql);

		foreach ($query->rows as $tab) {
			$tab['name'] = html_entity_decode($tab['name'], ENT_QUOTES, 'UTF-8');
			$tabs[$tab['tab_id']] = $tab;
		}

		return $tabs;
	}

	public function getProductTabStatuses($product_id) {
		$tabs = array();

		$sql = "SELECT * FROM " . DB_PREFIX . "product_to_tab WHERE product_id = '" . (int)$product_id . "'";

		$query = $this->db->query($sql);

		foreach ($query->rows as $tab) {
			$tabs[$tab['tab_id']] = $tab['status'];
		}

		return $tabs;
	}

	public function getProductTabContents($product_id, $tab_id) {
		$tab_contents = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_tab_content WHERE tab_id = '" . (int)$tab_id . "' AND product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$tab_contents[$result['language_id']] = $result['content'];
		}

		return $tab_contents;
	}

	public function getTabNames($tab_id) {
		$tab_name_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_tab_name WHERE tab_id = '" . (int)$tab_id . "'");

		foreach ($query->rows as $result) {
			$tab_name_data[$result['language_id']] = html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8');
		}

		return $tab_name_data;
	}

	public function getTabDefaults($tab_id) {
		$tab_default_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_tab_default WHERE tab_id = '" . (int)$tab_id . "'");

		foreach ($query->rows as $result) {
			$tab_default_data[$result['language_id']] = html_entity_decode($result['content'], ENT_QUOTES, 'UTF-8');
		}

		return $tab_default_data;
	}

	public function upgradeDatabaseStructure($from_version, $alert = array()) {
		$errors = false;
		self::$alerts = array();

		switch ($from_version) {
			case '1.1.3':
				$table_exists = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "product_tab'");

				if ($table_exists->num_rows) {
					// Drop column 'editable'
					$column_exists = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_tab` LIKE 'editable'");

					if ($column_exists->num_rows) {
						$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab` DROP COLUMN `editable`");
					}

					// Convert collation to utf8_unicode_ci
					$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci");

					// Add columns 'type' & 'key' & 'login'
					$columns_exist = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_tab` WHERE `Field` LIKE 'type' OR `Field` LIKE 'key' OR `Field` LIKE 'login'");

					if ($columns_exist->num_rows != 3) {
						$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab`
							ADD COLUMN `type` ENUM('default', 'regular', 'reserved') NOT NULL DEFAULT 'regular' AFTER `status`,
							ADD COLUMN `key` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `type`,
							ADD COLUMN `login` TINYINT(1) NOT NULL DEFAULT '0' AFTER `key`"
						);
					}

					$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `type` = 'default', `key` = 'description' WHERE tab_id = '1'");
					$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `type` = 'default', `key` = 'attributes' WHERE tab_id = '2'");
					$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `type` = 'default', `key` = 'reviews' WHERE tab_id = '3'");
					$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `type` = 'default', `key` = 'related_products' WHERE tab_id = '4'");
				} else {
					$errors = true;
					self::$alerts['error']['upgrade_database'] = $this->language->get('error_upgrade_database');
				}
			case '2.0.0':
				// Add a separate table that maps tabs to products
				$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_to_tab (
					product_id INT(11) NOT NULL,
					tab_id INT(11) NOT NULL,
					status TINYINT(1) NOT NULL DEFAULT '1',
					PRIMARY KEY (product_id, tab_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
				);

				// Associate all tabs with all products
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_tab (product_id, tab_id) SELECT p.product_id, pt.tab_id FROM " . DB_PREFIX . "product_tab pt JOIN " . DB_PREFIX . "product p");
			case '2.0.1':
				// Convert collation to utf8_unicode_ci
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab_name` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab_content` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci");
			case '2.1.0':
				// Delete related products tab
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_name WHERE tab_id ='4'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_content WHERE tab_id ='4'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_default WHERE tab_id ='4'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_tab WHERE tab_id ='4'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_tab WHERE tab_id ='4'");
			case '2.1.1':
			case '2.1.2':
			case '2.1.3':
			case '2.1.4':
				$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `key` = 'tab-description' WHERE tab_id = '1'");
				$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `key` = 'tab-attributes' WHERE tab_id = '2'");
				$this->db->query("UPDATE `" . DB_PREFIX . "product_tab` SET `key` = 'tab-reviews' WHERE tab_id = '3'");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab` ENGINE = InnoDB");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_to_tab` ENGINE = InnoDB");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab_name` ENGINE = InnoDB");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab_default` ENGINE = InnoDB");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab_content` ENGINE = InnoDB");
			case '2.2.0':
			case '2.2.1':
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab` ADD COLUMN `condition` VARCHAR(255) NOT NULL DEFAULT '' AFTER `login`");
			case '2.3.0':
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_tab_name` MODIFY COLUMN `name` VARCHAR(512) COLLATE utf8_unicode_ci NOT NULL");
			default:
				break;
		}

		return !$errors;
	}

	public function applyDatabaseChanges() {
		// If an incompatible product_tab table exists, remove it first
		$table_exists = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "product_tab'");

		if ($table_exists->num_rows) {
			$columns = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_tab");

			$drop_table = false;

			if ($columns->num_rows != count($this->tables['product_tab'])) {
				$drop_table = true;
			} else {
				foreach ($columns->rows as $column) {
					if (!in_array($column['Field'], $this->tables['product_tab'])) {
						$drop_table = true;
						break;
					}
				}
			}

			if ($drop_table) {
				$this->db->query("DROP TABLE " . DB_PREFIX . "product_tab");
			}
		}

		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab (
			tab_id INT(11) NOT NULL AUTO_INCREMENT,
			sort_order INT(3) NOT NULL,
			status TINYINT(1) NOT NULL DEFAULT '0',
			type ENUM('default', 'regular', 'reserved') NOT NULL DEFAULT 'regular',
			`key` VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
			login TINYINT(1) NOT NULL DEFAULT '0',
			`condition` VARCHAR(255) NOT NULL DEFAULT '',
			PRIMARY KEY (tab_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_to_tab (
			product_id INT(11) NOT NULL,
			tab_id INT(11) NOT NULL,
			status TINYINT(1) NOT NULL DEFAULT '1',
			PRIMARY KEY (product_id, tab_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab_name (
			tab_id INT(11) NOT NULL,
			language_id INT(11) NOT NULL,
			name VARCHAR(512) COLLATE utf8_unicode_ci NOT NULL,
			PRIMARY KEY (tab_id, language_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab_default (
			tab_id INT(11) NOT NULL,
			language_id INT(11) NOT NULL,
			content TEXT COLLATE utf8_unicode_ci NOT NULL,
			PRIMARY KEY (tab_id, language_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
		);

		$this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab_content (
			product_id INT(11) NOT NULL,
			language_id INT(11) NOT NULL,
			tab_id INT(11) NOT NULL,
			content TEXT COLLATE utf8_unicode_ci NOT NULL,
			PRIMARY KEY (product_id, language_id, tab_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
		);

		// If upgrading, do not add the initial values
		$query = $this->db->query("SELECT COUNT(*) as count FROM " . DB_PREFIX . "product_tab WHERE tab_id <= '3'");

		if ((int)$query->row['count'] == 0) {
			$tabs = array();
			$tabs[] = array("id" => 1, "name" => $this->language->get("tab_description"));
			$tabs[] = array("id" => 2, "name" => $this->language->get("tab_attribute"));
			$tabs[] = array("id" => 3, "name" => $this->language->get("tab_review"));

			$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab (tab_id, sort_order, status, type, `key`) VALUES
				(1, 10, 1, 'default', 'tab-description'),
				(2, 20, 1, 'default', 'tab-attributes'),
				(3, 30, 1, 'default', 'tab-reviews')"
			);

			$this->load->model('localisation/language');
			$languages = $this->model_localisation_language->getLanguages();
			$languages = array_remap_key_to_id('language_id', $languages);

			foreach ($tabs as $tab) {
				foreach ($languages as $language_id => $language) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_name (tab_id, language_id, name) VALUES (" . $tab['id'] . ", " . (int)$language_id . ", '" . $tab['name'] . "')");
				}
			}
		}

		// Associate all tabs with all products
		$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_tab (product_id, tab_id) SELECT p.product_id, pt.tab_id FROM " . DB_PREFIX . "product_tab pt JOIN " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_tab p2t ON (p2t.tab_id = pt.tab_id AND p2t.product_id = p.product_id) WHERE p2t.product_id IS NULL");
	}

	public function revertDatabaseChanges() {
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_tab");
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_to_tab");
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_tab_name");
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_tab_default");
		$this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_tab_content");
	}

	public function checkDatabaseStructure($alert = array()) {
		$errors = false;
		self::$alerts = array();

		foreach ($this->tables as $tbl => $fields) {
			$table_exists = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "{$tbl}'");
			if (!$table_exists->num_rows) {
				$errors = true;
				self::$alerts['error']["missing_table_{$tbl}"] = sprintf($this->language->get('error_missing_table'), DB_PREFIX . $tbl);
			} else { // Check for table fields
				foreach($fields as $field) {
					$column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "{$tbl} LIKE '{$field}'");
					if (!$column_exists->num_rows) {
						$errors = true;
						self::$alerts['error']["missing_column_{$field}"] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . $tbl, $field);
					}
				}
			}
		}

		return !$errors;
	}

	public function checkDatabaseConsistency($alert = array()) {
		$errors = false;
		self::$alerts = array();

		$query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . "product_tab pt JOIN " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_tab p2t ON (p2t.tab_id = pt.tab_id AND p2t.product_id = p.product_id) WHERE p2t.product_id IS NULL");

		if ($query->num_rows != 0) {
			$errors = true;
			self::$alerts['warning']['db_error'] = $this->language->get('error_db_inconsistency');
		}

		return !$errors;
	}

	public function fixDatabaseConsistency($alert = array()) {
		$errors = false;
		self::$alerts = array();

		$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_tab (product_id, tab_id) SELECT p.product_id, pt.tab_id FROM " . DB_PREFIX . "product_tab pt JOIN " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_tab p2t ON (p2t.tab_id = pt.tab_id AND p2t.product_id = p.product_id) WHERE p2t.product_id IS NULL");
		$this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_content (product_id, language_id, tab_id, content) SELECT p2t.product_id, l.language_id, pt.tab_id , '' FROM " . DB_PREFIX . "product_to_tab p2t JOIN " . DB_PREFIX . "language l LEFT JOIN " . DB_PREFIX . "product_tab pt ON (p2t.tab_id = pt.tab_id) LEFT JOIN " . DB_PREFIX . "product_tab_content ptc ON (ptc.product_id = p2t.product_id AND ptc.tab_id = p2t.tab_id AND ptc.language_id = l.language_id) WHERE pt.type = 'regular' AND ptc.content IS NULL");

		if (!$this->checkDatabaseConsistency()) {
			$errors = true;
			self::$alerts['error']['fix_db'] = $this->language->get('error_fix_db_inconsistency');
		}

		return !$errors;
	}

	public function getAlerts() {
		return self::$alerts;
	}
}
