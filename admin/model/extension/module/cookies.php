<?php
class ModelExtensionModuleCookies extends Model {
    public function getAllInfoPages() {
        $db_list_lm = $this->db->query("SELECT language_id as lang_id FROM " . DB_PREFIX . "language WHERE code = '" . $this->config->get('config_admin_language') . "';");
        foreach ($db_list_lm->rows as $an_lang_id) {
            $admin_language = $an_lang_id['lang_id'];
        }

        $query = $this->db->query("SELECT " . DB_PREFIX . "information_description.information_id, " . DB_PREFIX . "information_description.language_id, " . DB_PREFIX . "information_description.title FROM " . DB_PREFIX . "information_description WHERE language_id = " . $admin_language . ";");
        return $query->rows;
    }
}