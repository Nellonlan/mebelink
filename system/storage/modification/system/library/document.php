<?php
class Document {
	private $title;
	private $description;
	private $keywords;
	private $links = array();
	private $styles = array();
	private $scripts = array();
	private $og_image;


					//microdatapro 7.5 start
					private $tc_og;
					private $tc_og_prefix;
					public function setTc_og($data){$this->tc_og = $data;}
					public function getTc_og(){return $this->tc_og;}
					public function setTc_og_prefix($data){$this->tc_og_prefix = $data;}
					public function getTc_og_prefix(){return $this->tc_og_prefix;}
					//microdatapro 7.5 end
				
	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}

	public function setOgImage($image) {
		$this->og_image = $image;
	}

	public function getOgImage() {
		return $this->og_image;
	}
}
