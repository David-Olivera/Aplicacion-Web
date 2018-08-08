<?php
	namespace app\models;
	use Yii;
	use yii\base\model;
	
	class FormSearchfecha extends model
	{
		public $date;
		
		public function rules()
		{
			return[
								
				[['date'], 'date', 'format' => 'yyyy-mm-dd']
			];
		}
		public function attributeLabels()
		{
			return[
			'date' => "Buscar :  ",
			];
		}
	}
?>