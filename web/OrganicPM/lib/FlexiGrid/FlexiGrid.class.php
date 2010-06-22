<?php
/**
 * FlexiGrid.class.php
 * 
 * Class to generate the data to load the FLexiGrid
 * jQuery plugin.
 *
 * @author BlackNRoll
 * @version 1.0
 */
class FlexiGrid
	{
	
		//==================================================================
   		// Attributes ======================================================
   		//==================================================================
		
		private $classObj;
		private $fields;
		private $target;
		private $url;
		private $dataType;
		private $sortName;
		private $sortOrder;
		private $title;
		private $height;
		private $width;
		private $resPerPage;
		private $addBtn;
		private $delBtn;
		private $edtBtn;
		private $colModel;
		private $searchItems;
		
		private $edit;
		private $delete;
		private $add;
		
		private $config;
		
		
		
		//==================================================================
   		// Magic Methods ===================================================
   		//==================================================================
		function __construct($class)
			{
				$this->classObj = $class;
				
				//Set the user fields
				$this->setFields();
				
				//Create the colModel
				$this->createColumns();
				
				//Default
				$this->dataType		= 'json';
				$this->addBtn		= 'true';
				$this->edtBtn		= 'true';
				$this->delBtn		= 'true';
				$this->sortOrder	= 'asc';
				$this->resPerPage	= '15';
				$this->height		= '230';
				$this->target		= '#flex1';
			}
			
		//==================================================================
   		// Accessors =======================================================
   		//==================================================================
		
		private function setFields()
			{
				$this->fields = $this->classObj->getFieldNames();
			}
			
		/**
		 * @return the $edit
		 */
		public function getEdit() {
			return $this->edit;
		}
	
			/**
		 * @return the $delete
		 */
		public function getDelete() {
			return $this->delete;
		}
	
			/**
		 * @return the $add
		 */
		public function getAdd() {
			return $this->add;
		}
	
			/**
		 * @param $edit the $edit to set
		 */
		public function setEdit($edit) {
			$this->edit = $edit;
		}
	
			/**
		 * @param $delete the $delete to set
		 */
		public function setDelete($delete) {
			$this->delete = $delete;
		}
	
			/**
		 * @param $add the $add to set
		 */
		public function setAdd($add) {
			$this->add = $add;
		}
		/**
		 * @return the $url
		 */
		public function getUrl() {
			return $this->url;
		}
	
		/**
		 * @return the $dataType
		 */
		public function getDataType() {
			return $this->dataType;
		}
	
		/**
		 * @return the $sortName
		 */
		public function getSortName() {
			return $this->sortName;
		}
	
		/**
		 * @return the $sortOrder
		 */
		public function getSortOrder() {
			return $this->sortOrder;
		}
	
		/**
		 * @return the $title
		 */
		public function getTitle() {
			return $this->title;
		}
	
		/**
		 * @return the $height
		 */
		public function getHeight() {
			return $this->height;
		}
	
		/**
		 * @return the $width
		 */
		public function getWidth() {
			return $this->width;
		}
	
		/**
		 * @return the $resPerPage
		 */
		public function getResPerPage() {
			return $this->resPerPage;
		}
	
		/**
		 * @return the $config
		 */
		public function getConfig() {
			return $this->config;
		}
	
			/**
		 * @param $url the $url to set
		 */
		public function setUrl($url) {
			$this->url = $url;
			return $this;
		}
	
		/**
		 * @param $dataType the $dataType to set
		 */
		public function setDataType($dataType) {
			$this->dataType = $dataType;
			return $this;
		}
	
		/**
		 * @param $sortName the $sortName to set
		 */
		public function setSortName($sortName) {
			$this->sortName = $sortName;
			return $this;
		}
	
			/**
		 * @param $sortOrder the $sortOrder to set
		 */
		public function setSortOrder($sortOrder) {
			$this->sortOrder = $sortOrder;
			return $this;
		}
	
		/**
		 * @param $title the $title to set
		 */
		public function setTitle($title) {
			$this->title = $title;
			return $this;
		}
	
		/**
		 * @param $height the $height to set
		 */
		public function setHeight($height) {
			$this->height = $height;
			return $this;
		}
	
		/**
		 * @param $width the $width to set
		 */
		public function setWidth($width) {
			$this->width = $width;
			return $this;
		}
	
		/**
		 * @param $resPerPage the $resPerPage to set
		 */
		public function setResPerPage($resPerPage) {
			$this->resPerPage = $resPerPage;
			return $this;
		}
	
		/**
		 * @param $config the $config to set
		 */
		public function setConfig($config) {
			$this->config = $config;
			return $this;
		}
		/**
		 * @return the $addBtn
		 */
		public function getAddBtn() {
			return $this->addBtn;
		}
	
		/**
		 * @return the $delBtn
		 */
		public function getDelBtn() {
			return $this->delBtn;
		}
	
		/**
		 * @return the $edtBtn
		 */
		public function getEdtBtn() {
			return $this->edtBtn;
		}
	
		/**
		 * @param $addBtn the $addBtn to set
		 */
		public function setAddBtn($addBtn) {
			$this->addBtn = $addBtn;
			return $this;
		}
	
		/**
		 * @param $delBtn the $delBtn to set
		 */
		public function setDelBtn($delBtn) {
			$this->delBtn = $delBtn;
			return $this;
		}
	
		/**
		 * @param $edtBtn the $edtBtn to set
		 */
		public function setEdtBtn($edtBtn) {
			$this->edtBtn = $edtBtn;
			return $this;
		}
		
		/**
		 * @return the $target
		 */
		public function getTarget() {
			return $this->target;
		}
	
		/**
		 * @param $target the $target to set
		 */
		public function setTarget($target) {
			$this->target = $target;
			return $this;
		}
		

		//==================================================================
   		// Methods =========================================================
   		//==================================================================
   		
		private function createColumns()
			{
				$count = count($this->fields);
				
				$this->colModel = '';
				
				for($i = 0; $i < $count; $i++)
					{
						$this->colModel		.= '
							{display: "'.$this->fields[$i]['display'].'", name : "'.$this->fields[$i]['name'].'", width : '.$this->fields[$i]['width'].', sortable : '.$this->fields[$i]['sortable'].', align: "'.$this->fields[$i]['align'].'"}';
						
						if($i == 0)
							$this->searchItems	.= '
							{display: "'.$this->fields[$i]['display'].'", name : "'.$this->fields[$i]['name'].'", isdefault: true}';
						else
							$this->searchItems	.= '
							{display: "'.$this->fields[$i]['display'].'", name : "'.$this->fields[$i]['name'].'"}';
						
						
						if($i != $count)
							$this->colModel		.= ',';
							$this->searchItems	.= ',';
					}
			}
		
		
		public function generateConfig()
			{
				if(!$this->sortName)
					$this->sortName = $this->fields[0]['name'];
				
				$this->config = '
				$("#flex1").flexigrid(
					{
						url: "'.$this->url.'",
						dataType: "'.$this->dataType.'",
						colModel : [
							'.$this->colModel.'
						],
						addBtnShow: '.$this->addBtn.',
						edtBtnShow: '.$this->edtBtn.',
						delBtnShow: '.$this->delBtn.',';
				
				if ($this->edit)
					$this->config .= '
						edtBtn: {caption: "'.$this->edit['caption'].'", title: "'.$this->edit['title'].'", sucessMsg: "'.$this->edit['sucessMsg'].'", 
			 errorMsg: "'.$this->edit['errorMsg'].'", html: "'.$this->edit['html'].'", url: "'.$this->edit['url'].'"},
					';
					
				if ($this->delete)
					$this->config .= '
						delBtn: {caption: "'.$this->delete['caption'].'", title: "'.$this->delete['title'].'", sucessMsg: "'.$this->delete['sucessMsg'].'", 
			 errorMsg: "'.$this->delete['errorMsg'].'", html: "'.$this->delete['html'].'"},
					';
					
				if ($this->add)
					$this->config .= '
						addBtn: {caption: "'.$this->add['caption'].'", title: "'.$this->add['title'].'", sucessMsg: "'.$this->add['sucessMsg'].'", 
			 errorMsg: "'.$this->add['errorMsg'].'", html: "'.$this->add['html'].'", url: "'.$this->add['url'].'"},
					';
				
				
				$this->config .= '
						searchitems : [
							'.$this->searchItems.'
						],
						sortname: "'.$this->sortName.'",
						sortorder: "'.$this->sortOrder.'",
						usepager: true,
						title: "'.$this->title.'",
						useRp: true,
						rp: '.$this->resPerPage.',
						showTableToggleBtn: true,
						showToggleBtn: true,
						height: '.$this->height.'
					});
				';
				
				return $this->config;
			}
	}