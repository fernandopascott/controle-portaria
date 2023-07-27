<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastro Tipo Pessoa</title>

<link href='<c:url value="/include/bootstrap-5.3.0-dist/css/bootstrap.min.css" />'
	rel="stylesheet">
<link href='<c:url value="/include/bootstrap-5.3.0-dist/css/bootstrap-custom.css" />'
	rel="stylesheet">	

<script src='<c:url value="/include/bootstrap-5.3.0-dist/js/bootstrap.min.js" />'></script>
<script src='<c:url value="/include/bootstrap-5.3.0-dist/js/bootstrap.bundle.min.js" />'></script>
<script src='<c:url value="/include/jquery/code.jquery.com_jquery-3.7.0.min.js" />'></script>
<meta name="theme-color" content="#712cf9">
</head>
<body>
	<div class="container">
		<div class="row top-buffer15 text-center" >
			<div class="col-md-12">
				<img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="50" height="50">
			</div>
		</div>
		<div class="row top-buffer5 ">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
					<div class="container-fluid">						
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav mb-2 mb-lg-0 ">								
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="true">
										Cadastro </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="/controle_portaria/tipoPessoa">Tipo Pessoa</a></li>
										<li><a class="dropdown-item" href="#">Veículo</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Imóvel Condomínio</a></li>
									</ul></li>								
							</ul>
							<ul class="navbar-nav mb-2 mb-lg-0">								
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-bs-toggle="dropdown" aria-expanded="true">
										Movimentos </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="#">Tipo Pessoa</a></li>
										<li><a class="dropdown-item" href="#">Veículo</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Imóvel Condomínio</a></li>
									</ul></li>								
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		
	</div>
</body>
</html>