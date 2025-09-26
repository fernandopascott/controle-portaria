<%@ include file="templateForm.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
		function validaCamposSalvar(){
			 var cont = 0;
		     $(".cpObrigatorio").each(function(){
		    	 
		         if($(this).val().trim() == ""){
		                 $(this).css({"border" : "1px solid #F00", "padding": "2px"});
		                 cont++;
		             }
		     });
		     if(cont == 0){
		    	 return true;
		     }
		     return false;
		}
		
		$(document).ready(function(){
		
			$("#idNovo").click(function(){
				$('.inputInsert').val('');			
			});
			
			$("#idSalvar").click(function(){
				if(validaCamposSalvar()){
					$('#formId').prop('action',"/controle-portaria/salvarControleRegistro");
			    	$('#formId').submit();
				}		    	
		    }); 
			
			$("#idExcluir").click(function(){
				$('#formId').prop('action',"/controle-portaria/excluirControleRegistro");
				$('#formId').submit();
			});
			
			new DataTable('#idTableUsuario', {
			    pagingType: 'full_numbers'
			});
		    
		});		
	</script>	

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col">
				<form id="formId" name="formName" method="post" action="">
					<div class="row top-buffer5">
						<div class="col-3"></div>
						<div class="col-5">
							<legend class="titulo">Lista de Controle Registro</legend>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Cod</span>
								<input type="text" name="id" class="form-control inputInsert" maxlength="5" value="${controleRegistro.id}" disabled="disabled">
								<input type="hidden" name="id" class="inputInsert" value="${controleRegistro.id}">
							</div>						
						</div>							
					</div>	
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Visitante</span>
								<select class="form-select inputInsert cpObrigatorio" aria-label="Default select example" name="pessoa.id">
								  	<option selected>Selecione uma Pessoa</option>
								  	<c:forEach items="${listPessoa}" var="pessoa">
										<option value="${pessoa.id}" 
											<c:if test="${controleRegistro.pessoa.id eq pessoa.id}">
								   				selected="selected"
								   			</c:if>
								   		>${pessoa.nome}</option>								   		
							  		</c:forEach>
								</select>
							</div>
						</div>
					</div>
					
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Imóvel</span>
								<select class="form-select inputInsert cpObrigatorio" aria-label="Default select example" name="imovelCondominio.id">
								  	<option selected>Selecione um Imóvel</option>
								  	<c:forEach items="${listImovelCond}" var="imovel">
										<option value="${imovel.id}" 
											<c:if test="${controleRegistro.imovelCondominio.id eq imovel.id}">
								   				selected="selected"
								   			</c:if>
								   		>${imovel.logradouro}</option>								   		
							  		</c:forEach>
								</select>
							</div>
						</div>
					</div>
					
					<div class="row top-buffer15">
						<div class="col-7"></div>
						<div class="col-5 text-right">
							<input type="button" name="novo" id="idNovo" value="Novo" class="btn btn-sm btn-oldstyle btn-secondary " />
							<input type="button" name="salvar" id="idSalvar" value="Salvar" class="btn btn-sm btn-oldstyle btn-primary"/>
						</div>							
					</div>		

					<div class="row top-buffer25">
						<div class="col-2"></div>
						<div class="col-7">
							<table id="idTableUsuario"
								class="table table-bordered table-striped ">
								<thead class="table-dark">
									<tr>
										<th class="display-th">Id</th>
										<th class="display-th">Visitante</th>
										<th class="display-th">Endereço</th>
										<th class="display-th">Usuario</th>
										<th class="display-th">Data/Hora</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listControleRegistro}" var="registro">
										<tr>
											<td class="text-center">${registro.id}</td>										
											<td class="text-center">${registro.pessoa.nome}</td>
											<td class="text-center">${registro.imovelCondominio.logradouro}</td>
											<td class="text-center">${registro.usuario.user}</td>
											<fmt:formatDate value="${registro.dataHoraReg}" var="dataHoraFmt" type="date" pattern="dd/MM/yyyy HH:mm:ss" />
											<td class="text-center">${dataHoraFmt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
