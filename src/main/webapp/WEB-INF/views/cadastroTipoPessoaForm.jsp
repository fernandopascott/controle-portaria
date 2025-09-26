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
					$('#formId').prop('action',"/controle-portaria/salvarTipoPessoa");
			    	$('#formId').submit();
				}		    	
		    }); 
			
			$("#idExcluir").click(function(){
				$('#formId').prop('action',"/controle-portaria/excluirTipoPessoa");
				$('#formId').submit();
			});
			
			new DataTable('#idTableTipoPessoa', {
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
							<legend class="titulo">Lista de Tipo Pessoa</legend>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Cod</span>
								<input type="text" name="id" class="form-control inputInsert" maxlength="5" value="${tipoPessoa.id}" disabled="disabled">
								<input type="hidden" name="id" class="inputInsert" value="${tipoPessoa.id}">
							</div>						
						</div>							
					</div>	
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Descrição</span>
								<input type="text" name="descricao" class="form-control inputInsert cpObrigatorio" maxlength="150" value="${tipoPessoa.descricao}" >
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
						<div class="col-3"></div>
						<div class="col-5">
							<table id="idTableTipoPessoa"
								class="table table-bordered table-striped ">
								<thead class="table-dark">
									<tr>
										<th class="display-th"><input type="checkbox"
											id="idSelecionaTodos"></th>
										<th class="display-th">Tipo Pessoa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listTipoPessoa}" var="tipoPessoa">
										<tr>
											<td class="text-center"><input type="checkbox"
												name="cds" value="${tipoPessoa.id}" class="check"></td>
											<td><a
												href="/controle-portaria/carregarTipoPessoa?idTipoPessoa=${tipoPessoa.id}">${tipoPessoa.descricao}</a></td>
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
