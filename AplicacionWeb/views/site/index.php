<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\helpers\Url;
	use yii\widgets\ActiveForm;


?>
<div class="site-index">

    <div class="jumbotron">
        <h2>Bienvenido al Sistema de Administracion y Monitoreo de Querys</h2>
   		<p class="lead">Por favor, Inicie Sesion para continuar</p>
   		<br />
   		<img src="/images/Monitoreo.png" title="Sistema de Administracion y Monitoreo de Querys">
   		<br/>
   		<br/>
   		<?php $mens = ActiveForm::begin([
		"method" => "post",
		"action" => Url::toRoute('site/login'),
		'enableClientValidation' => true,
		]);
		?>
				
			<?= Html::submitButton("Ingresar al Sistema",["class" => "btn btn-success"])?>

		<?php $mens->end() ?>
				    </div>

</div>