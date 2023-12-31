<?php
/*
	Project: Ka Extensions
	Author : karapuz <support@ka-station.com>

	Version: 3 ($Revision: 42 $)

*/

class KaPagination extends Pagination {

	public $text;

	public function getResults($text = '') {
	
		if (empty($text)) {
			$text = $this->text;
		}
	
		$from  = ($this->total) ? (($this->page - 1) * $this->limit) + 1 : 0;
		$to    = ((($this->page - 1) * $this->limit) > ($this->total - $this->limit)) ? $this->total : ((($this->page - 1) * $this->limit) + $this->limit);
		$pages = ceil($this->total / $this->limit);
	
		// 'Showing %d to %d of %d (%d Pages)'
		//
		$str = sprintf($text, $from, $to, $this->total, $pages);
		
		return $str;
	}
}