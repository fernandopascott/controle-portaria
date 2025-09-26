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
					$('#formId').prop('action',"/controle-portaria/salvarPessoa");
			    	$('#formId').submit();
				}		    	
		    }); 
			
			$("#idExcluir").click(function(){
				$('#formId').prop('action',"/controle-portaria/excluirPessoa");
				$('#formId').submit();
			});
			
			new DataTable('#idTablePessoa', {
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
							<legend class="titulo">Lista de Pessoa</legend>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100">Cod</span>
								<input type="text" name="id" class="form-control inputInsert" maxlength="5" value="${pessoa.id}" disabled="disabled">
								<input type="hidden" name="id" class="inputInsert" value="${pessoa.id}">
							</div>						
						</div>							
					</div>	
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100 ">Nome</span>
								<input type="text" name="nome" class="form-control inputInsert cpObrigatorio" maxlength="150" value="${pessoa.nome}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-4">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100 ">RG</span>
								<input type="text" name="rg" class="form-control inputInsert " maxlength="20" value="${pessoa.rg}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-3">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100">CPF</span>
								<input type="text" name="cpf" class="form-control inputInsert " maxlength="11" value="${pessoa.cpf}" >
							</div>
						</div>
					</div>					
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width100">Tipo Pessoa</span>
								<select class="form-select inputInsert cpObrigatorio" aria-label="Default select example" name="tipoPessoa.id">
								  	<option selected>Selecione uma Pessoa</option>
								  	<c:forEach items="${listTipoPessoa}" var="tipoPessoa">
										<option value="${tipoPessoa.id}" 
											<c:if test="${pessoa.tipoPessoa.id eq tipoPessoa.id}">
								   				selected="selected"
								   			</c:if>
								   		>${tipoPessoa.descricao}</option>								   		
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
						<div class="col-8">
							<table id="idTablePessoa"
								class="table table-bordered table-striped ">
								<thead class="table-dark">
									<tr>
										<th class="display-th">
											<input type="checkbox" id="idSelecionaTodos">
										</th>
										<th class="display-th">Id</th>
										<th class="display-th">Nome</th>
										<th class="display-th">RG</th>
										<th class="display-th">CPF</th>
										<th class="display-th">Tipo Pessoa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listPessoa}" var="pessoa">
										<tr>
											<td class="text-center">
												<input type="checkbox" name="cds" value="${pessoa.id}" class="check">
											</td>	
											<td>
												<a href="/controle-portaria/carregarPessoa?idPessoa=${pessoa.id}">${pessoa.id}</a>
											</td>										
											<td class="text-center">${pessoa.nome}</td>	
											<td class="text-center">${pessoa.rg}</td>	
											<td class="text-center">${pessoa.cpf}</td>
											<td class="text-center">${pessoa.tipoPessoa.descricao}</td>
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
