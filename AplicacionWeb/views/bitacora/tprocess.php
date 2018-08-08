<?php
	use yii\helpers\Url;
	use yii\widgets\ActiveForm;
	use yii\widgets\CActiveRecord;
	use yii\helpers\Html;
	use yii\data\Pagination;
	use yii\widgets\LinkPager;
	use app\models\productos;
	use kartik\date\DatePicker;

	$this->title = "Tabla de Query's";
?>
<section class="form-inline">

	
	<div >

	<?php 
		// buscador //
		$p = ActiveForm::begin([
		"method" => "get",
		"action" => Url::toRoute("bitacora/tprocess"),
		"enableClientValidation" => true,
	]);
	?>
	<?= $p->field($formf, 'date')->widget(DatePicker::classname(), [
	       'name' => 'date', 
		'value' => date('yyyy-mm-dd'),
		'options' => ['placeholder' => 'Seleccione la fecha...'],
		'pluginOptions' => [
			'format' => 'yyyy-mm-dd',
			'todayHighlight' => true
	        ]
	    ]);?>
	<?= Html::submitButton("Buscar",["class" => "btn btn-primary" ])?>

	<a id="todos" class="btn  btn-success" href="<?= Url::toRoute(["tprocess"])?>">Mostrar Todos </a>
	<?php $p->end() ?>

	</div>
</section>
    <style type="text/css">
      .centrado{
        text-align:center;
      }
    </style>


<h1>Bitacora de Querys</h1>
<h3><?= $msg ?></h3>
<table class="table table-bodered">
	<tr bgcolor="#FFFFFF">
		<th style="color:#337ab7">CPU</th>
		<th style="color:#337ab7">Hostname</th>
		<th style="color:#337ab7">DataBase</th>
		<th style="color:#337ab7">Status</th>
		<th style="color:#337ab7">Memoria</th>
		<th style="color:#337ab7">Query</th>
		<th style="color:#337ab7">Tiempo de Ejecucuion (S)</th>
		<th style="color:#337ab7">Fecha de Ultima Ocurrencia</th>
		<th style="color:#337ab7">Opciones</th>
		<th style="color:#337ab7"></th>
	</tr>
	<?php foreach($model as $row):
		// tomamos y asignamos los datos por cada columna // 
	 	?>
		<tr id="colum" >
		<td ><?=$row->cpu?></td>
		<td ><?=$row->hostname?></td>
		<td ><?=$row->databasename?></td>
		<td ><?=$row->status?></td>
		<td ><?=$row->usedmemory?></td>
		<td ><?=$row->sqlcommand?></td>
		<td ><?=$row->wait?></td>
		<td ><?=$row->FechaQ?></td>
		<th><a class="btn  btn-success" href="<?= Url::toRoute(["vistareport","IdQuery" => $row['IdQuery']])?>">Detalles</a></th>
		<th><a class="btn  btn-warning" href="<?= Url::toRoute(["ocurrencias/tocurrencias","IdQuery" => $row['IdQuery']])?>">Ocurrencias</a></th>

	</tr>

       
	<?php 
	endforeach ?>
</table>
		
  <?=LinkPager::widget([
	"pagination" => $pages,
	]);
?>

