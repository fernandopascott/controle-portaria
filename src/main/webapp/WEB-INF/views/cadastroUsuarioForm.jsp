<%@ include file="templateForm.jsp" %> 

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
					$('#formId').prop('action',"/controle-portaria/salvarUsuario");
			    	$('#formId').submit();
				}		    	
		    }); 
			
			$("#idExcluir").click(function(){
				$('#formId').prop('action',"/controle-portaria/excluirUsuario");
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
							<legend class="titulo">Lista de Usuários</legend>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Cod</span>
								<input type="text" name="id" class="form-control inputInsert" maxlength="5" value="${usuario.id}" disabled="disabled">
								<input type="hidden" name="id" class="inputInsert" value="${usuario.id}">
							</div>						
						</div>							
					</div>	
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-3">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75 ">Login</span>
								<input type="text" name="user" class="form-control inputInsert cpObrigatorio" maxlength="100" value="${usuario.user}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-3">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75 ">Senha</span>
								<input type="password" name="senha" class="form-control inputInsert cpObrigatorio " maxlength="150" value="${usuario.senha}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Pessoa</span>
								<select class="form-select inputInsert cpObrigatorio" aria-label="Default select example" name="pessoa.id">
								  	<option selected>Selecione uma Pessoa</option>
								  	<c:forEach items="${listPessoa}" var="pessoa">
										<option value="${pessoa.id}" 
											<c:if test="${usuario.pessoa.id eq pessoa.id}">
								   				selected="selected"
								   			</c:if>
								   		>${pessoa.nome}</option>								   		
							  		</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-6"></div>
						<div class="col-5 text-right">
							<input type="button" name="novo" id="idNovo" value="Novo" class="btn btn-sm btn-oldstyle btn-secondary " />
							<input type="button" name="salvar" id="idSalvar" value="Salvar" class="btn btn-sm btn-oldstyle btn-primary"/>
							<input type="button" name="excluir" id="idExcluir" value="Excluir" class="btn btn-sm btn-oldstyle btn-danger"/>
						</div>							
					</div>		

					<div class="row top-buffer25">
						<div class="col-2"></div>
						<div class="col-7">
							<table id="idTableUsuario"
								class="table table-bordered table-striped ">
								<thead class="table-dark">
									<tr>
										<th class="display-th">
											<input type="checkbox" id="idSelecionaTodos">
										</th>
										<th class="display-th">Id</th>
										<th class="display-th">Login</th>
										<th class="display-th">Pessoa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listUsuario}" var="usuario">
										<tr>
											<td class="text-center">
												<input type="checkbox" name="cds" value="${usuario.id}" class="check">
											</td>	
											<td>
												<a href="/controle-portaria/carregarUsuario?idUsuario=${usuario.id}">${usuario.id}</a>
											</td>										
											<td class="text-center">${usuario.user}</td>
											<td class="text-center">${usuario.pessoa.nome}</td>
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
