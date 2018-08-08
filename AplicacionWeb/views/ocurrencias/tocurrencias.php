<?php
	use yii\helpers\Url;
	use yii\widgets\ActiveForm;
	use yii\widgets\CActiveRecord;
	use yii\helpers\Html;
	use yii\data\Pagination;
	use yii\widgets\LinkPager;
	use app\models\productos;
	
	$this->title = "Tabla de Query's";
?>
<h1>Ocurrencias</h1>
<h4>En la presente tabla se visualizan la cantidad de veces que se a encontrado el mismo Query</h4>
<br/>
<table class="table table-bodered">
	<tr bgcolor="#FFFFFF">
		<th style="color:#337ab7">CPU</th>
		<th style="color:#337ab7">Query</th>
		<th style="color:#337ab7">Tiempo Transcurrido(S)</th>
		<th style="color:#337ab7">Memoria utilizada</th>
		<th style="color:#337ab7">Fecha Ocurrencia</th>
	</tr>
	<?php foreach($model as $row): ?>
		<tr id="colum" >
		<td ><?=$row->cpu?></td>
		<td ><?=$row->sqlcommand?></td>
		<td ><?=$row->wait?></td>
		<td ><?=$row->usedmemory?></td>
		<td ><?=$row->FechaO?></td>

	</tr>

       
	<?php endforeach ?>
	
</table>
  <?=LinkPager::widget([
	"pagination" => $pages,
	]);
?>
	
	<?php $form = ActiveForm::begin([
		"method" => "post",
		"action" => Url::toRoute("ocurrencias/tocurrencias"),
		'enableClientValidation' => true,
	]);
		echo '
		<div class ="form-group">
		<h3><strong>Memoria Total:</strong> '.$memoria.'<h3>';
		foreach($segundos as $fila){
			echo'
			<div class ="form-group">
			<h3><strong>Tiempo Total:</strong> '.$fila.'<h3>
			<br>';	

		}
	?>

	<?php $form->end() ?>
<!--  Html::submitButton("Generar PDF",array("class" => "pdf", "onclick" => "js:document.location.href=print/".$row->id.'"','id' => $row->id));  ES PHP-->
<!--  Html::submitButton("Generar PDF",array("class" => "pdf", "onclick" => "js:document.location.href=print/".$row->id.'"','id' => $row->id));  ES PHP-->


