<?php
/*
	Project: CSV Product Import
	Author : karapuz <support@ka-station.com>

	Version: 4 ($Revision: 53 $)

*/

class KaLoader {
	protected $loader, $registry;

	function __construct($loader, $registry) {
		$this->loader = $loader;
		$this->registry = $registry;
	}

	function __call($name, $params) {
		return call_user_func_array(array($this->loader, $name), $params);
	}
	
	function getLoader() {
		return $this->loader;
	}	
	
	function model($name) {
		$model_name = 'model_' . str_replace('/', '_', $name);
		if ($this->registry->has($model_name)) {
			return true;
		}
		
		return call_user_func_array(array($this->loader, 'model'), array($name));
	}
}

class KaResponse extends Response {
	protected $response;

	public function __construct($response) {
		$this->response = $response;
	}

	public function redirect($url, $status = 302) {
		if (!empty($GLOBALS['ka_silent_return'])) {
			return true;
		}
		return $this->response->redirect($url, $status);
	}
	
	public function addHeader($header) {	
		return $this->response->addHeader($header);		
	}
	
	public function setOutput($output) {
		return $this->response->setOutput($output);
	}
	
	public function getOutput() {
		return $this->response->getOutput();
	}
	
	public function output() {	
		return $this->response->output();
	}
}

$loader = new KaLoader($this->load, $this->registry);
$this->load = $loader;

$response = new KaResponse($this->response);
$this->registry->set('response', $response);


$this->load->model('extension/modification');
class KaModificationModel extends ModelExtensionModification {
	
	public function getModificationByCode($code) {
		return false;
	}
	
	public function addModification($data) {
	
		$mod = parent::getModificationByCode($data['code']);
		if (!empty($mod)) {
			$this->deleteModification($mod['modification_id']);
		}
		
		return parent::addModification($data);
	}
	
	public function isKaRequired() {
		return false;
	}
}

$modification_model = new KaModificationModel($this->registry);
$this->registry->set('model_extension_modification', $modification_model);
$this->model_extension_modification = $modification_model;

require_once(modification(DIR_APPLICATION . 'controller/extension/modification.php'));
class KaModificationController extends ControllerExtensionModification {
	protected function getList() {
		return true;
	}
	
	public function refresh() {
		$GLOBALS['ka_silent_return'] = true;
		parent::refresh();
		$GLOBALS['ka_silent_return'] = false;
	}
}
$modification_controller = new KaModificationController($this->registry);

// install ka_extensions patch
//
$dir = dirname(__FILE__);

$src  = $dir . "/xml/ka_extensions.ocmod.xml";
$dest = $dir . "/install.xml";
copy($src, $dest);

if (defined('_JEXEC')) {
	$this->miwi_xml();	
} else {
	$this->xml();
}
@unlink($dest);

// install 'Maintenance Informer'
//
$src  = $dir . "/xml/maintenance_informer.ocmod.xml";
$dest = $dir . "/install.xml";
copy($src, $dest);

if (defined('_JEXEC')) {
	$this->miwi_xml();	
} else {
	$this->xml();
}
@unlink($dest);

$this->load->model('user/user_group');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/ka_extensions');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/ka_extensions');

// install the extension patch
//
$src  = $dir . "/xml/ka_csv_product_import.ocmod.xml";

$dest = $dir . "/install.xml";
copy($src, $dest);
if (defined('_JEXEC')) {
	$this->miwi_xml();	
} else {
	$this->xml();
}
$result = $modification_controller->refresh();
header_remove();
@unlink($dest);

?>