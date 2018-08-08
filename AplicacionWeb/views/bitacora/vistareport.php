<?php
	use yii\helpers\Url;
	use yii\widgets\ActiveForm;
	use yii\widgets\CActiveRecord;
	use yii\helpers\Html;
	use yii\data\Pagination;
	use yii\widgets\LinkPager;
	use app\models\productos;
	use app\models\comentariosConecs;
	use yii\helpers\Arrayhelper;

	$this->title = 'Formulario de Reporte';
	?>
	   <style>
        .container-fluid {
        	height: 400px;
          overflow: scroll;	
        }
      </style>
	<div class="input-sm">
		<div style="float:left;"  class="panel panel-default col-md-6">
			<div class="panel-body">
				<h2>Reporte</h2>
				<?php $form = ActiveForm::begin([
					"method" => "post",
					// accion del formulario ("controlador/funcion")//
					"action" => Url::toRoute("comentario/enviar"),
					'enableClientValidation' => true,
				]);
				?>
				<?= $form->field($model, "IdQuery")->input("hidden")->label(false) ?>

				<div class="col-md-4" class ="form-group">

				<?= $form->field($model, "C_P_U")->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled']) ?>
				</div>	
				<div class="col-md-4"  class ="form-group">
					<?= $form->field($model, "hostname")->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled']) ?>
				</div>		
				<div  class="col-md-4" class ="form-group">
					<?= $form->field($model, "status")->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled'])?>
				</div>
				<div class="col-md-6"  class ="form-group">
					<?= $form->field($model, 'memoria_utilizada')->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled']) ?>
				</div>
				<div class="col-md-6" class ="form-group">
					<?= $form->field($model, 'transcurso_de_tiempo')->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled']) ?>
				</div>
				<div  class ="form-group">
					<?= $form->field($model, "dataBase")->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled'])?>
				</div>	
	
				<div class ="form-group">
					<?= $form->field($model, 'query')->textArea(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled']) ?>
				</div>


				<div class ="form-group">
					
					<?= $form->field($model, 'Fecha_Ocurrencia')->textInput(['class' => 'form-control class-content-proceso', 'disabled' => 'disabled']) ?>
				</div>
			</div>
		</div>
		<div  class="panel panel-default col-md-6">
			<div class="content container-fluid" class="panel-body">
				<h2>Comentarios</h2><br>
				<div data-spy="scroll" data-target =".navbar" data-offset="2">
				<?php 
				// consulta con todos los comentarios relacionados con el id del query del registro seleccionado 
				$table2=Arrayhelper::index(comentariosConecs::find()->where(["IdQuery" => $model->IdQuery])->asArray()->all(),'IdComentario');
				foreach ($table2 as $comentario) {
				// imprimimnos todos los comentarios
					echo'
					  <div>
					  <p >Usuario: '.$comentario["IdUser"].'</p>
					  <p >Fecha: '.$comentario["FechaC"].'</p>
					  <p >Comentario: '.$comentario["Comentarios"].'</p>
					  </div><br/>';
				}
				 ?>          
				</div>

				</div>

					<?php $mens = ActiveForm::begin([
					"method" => "post",
					"action" => Url::toRoute("comentario/enviar"),
					'enableClientValidation' => true,
				]);
				?>
				<div class="form-group">
			 		
			 		<?= $mens->field($model, "Comentarios")->textArea(['value' => null]) ?>   
			 		
				</div>
					
				<?= Html::submitButton("Agregar",["class" => "btn btn-success"])?>
				<?php $mens->end() ?>

				<?php $form->end() ?>
			</div>
		</div>
	</div>