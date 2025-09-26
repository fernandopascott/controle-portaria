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
					$('#formId').prop('action',"/controle-portaria/salvarImovelCondominio");
			    	$('#formId').submit();
				}		    	
		    }); 
			
			$("#idExcluir").click(function(){
				$('#formId').prop('action',"/controle-portaria/excluirImovelCondominio");
				$('#formId').submit();
			});
			
			new DataTable('#idTableImovelCondominio', {
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
							<legend class="titulo">Lista de Imóveis Condomínio</legend>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100">Cod</span>
								<input type="text" name="id" class="form-control inputInsert" maxlength="5" value="${imovelCondominio.id}" disabled="disabled">
								<input type="hidden" name="id" class="inputInsert" value="${imovelCondominio.id}">
							</div>						
						</div>							
					</div>	
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-4">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100 ">Descrição</span>
								<input type="text" name="descricao" class="form-control inputInsert cpObrigatorio" maxlength="150" value="${imovelCondominio.descricao}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100 ">Logradouro</span>
								<input type="text" name="logradouro" class="form-control inputInsert cpObrigatorio " maxlength="200" value="${imovelCondominio.logradouro}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-4">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100">Cidade</span>
								<input type="text" name="cidade" class="form-control inputInsert " maxlength="100" value="${imovelCondominio.cidade}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100 ">UF</span>
								<input type="text" name="uf" class="form-control inputInsert cpObrigatorio" maxlength="2" value="${imovelCondominio.uf}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100">Pessoa</span>
								<select class="form-select inputInsert cpObrigatorio" aria-label="Default select example" name="pessoa.id">
								  	<option selected>Selecione uma Pessoa</option>
								  	<c:forEach items="${listPessoa}" var="pessoa">
										<option value="${pessoa.id}" 
											<c:if test="${imovelCondominio.pessoa.id eq pessoa.id}">
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
							<table id="idTableImovelCondominio"
								class="table table-bordered table-striped ">
								<thead class="table-dark">
									<tr>
										<th class="display-th">
											<input type="checkbox" id="idSelecionaTodos">
										</th>
										<th class="display-th">Id</th>
										<th class="display-th">Descrição</th>
										<th class="display-th">Logradouro</th>
										<th class="display-th">Cidade</th>
										<th class="display-th">UF</th>
										<th class="display-th">Proprietário</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listImovelCondominio}" var="imovelCondominio">
										<tr>
											<td class="text-center">
												<input type="checkbox" name="cds" value="${imovelCondominio.id}" class="check">
											</td>	
											<td>
												<a href="/controle-portaria/carregarImovelCondominio?idImovelCondominio=${imovelCondominio.id}">${imovelCondominio.id}</a>
											</td>										
											<td class="text-center">${imovelCondominio.descricao}</td>	
											<td class="text-center">${imovelCondominio.logradouro}</td>	
											<td class="text-center">${imovelCondominio.cidade}</td>
											<td class="text-center">${imovelCondominio.uf}</td>
											<td class="text-center">${imovelCondominio.pessoa.nome}</td>
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
