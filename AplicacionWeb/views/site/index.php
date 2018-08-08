<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\helpers\Url;

?>
<div class="site-index">

    <div class="jumbotron">
        <h2>Bienvenido al Sistema de Administracion y Monitoreo de Querys</h2>
   		<p class="lead">Por favor, Inicie Sesion para continuar</p>
   		<br />
   		<img src="/images/Monitoreo.png" title="Sistema de Administracion y Monitoreo de Querys">
   		<br/>
   		<br/>
        <p><a class="btn btn-lg btn-success" href="<?= Url::toRoute('site/login') ?>">Inicio de Sesion</a></p>
    </div>

</div>