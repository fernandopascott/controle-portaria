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
			var modal = new bootstrap.Modal(document.getElementById("loading"), {});
			$("#idNovo").click(function(){
				$('.inputInsert').val('');			
			});
			
			$("#idSalvar").click(function(){
				if(validaCamposSalvar()){
					modal.show();
					$('#formId').prop('action',"/controle-portaria/salvarVeiculo");
			    	$('#formId').submit();
			    	modal.hide();
				}		    	
		    }); 
			
			$("#idExcluir").click(function(){
				$('#formId').prop('action',"/controle-portaria/excluirVeiculo");
				$('#formId').submit();
			});
			
			new DataTable('#idTableVeiculo', {
			    pagingType: 'full_numbers'
			});
			
			var MIN_LENGTH = 2;
			$('#idPessoaNome').keyup(function() {
				var nome = $('#idPessoaNome').val();
			    if (nome.length >= MIN_LENGTH) {    
			    	$.ajax({
				        type:'POST',
				        url:'./buscarPessoaPorNome',
				        dataType: "json",
				        data: {"nome": nome},
				        success: function(msg){
					        var availableTags = msg.map(function(value, key){
					            return {
					            		id: value.id,
					            		label: value.nome,
			                    		value: value.nome
			                    	   };
					        });
					        $("#idPessoaNome").autocomplete({
					            source: availableTags, // source é a origem dos dados ok
					            select: function(event, ui) {   // PARAMETRO SELECT                                
						            $("#idPessoaId").val(ui.item.id );   // PREENCHE RETORNO DA CONSULTA
						            $("#idPessoaNome").val(ui.item.value);   // PREENCHE RETORNO DA CONSULTA            
					        	} 
				           	});
			        	}
			        });
			    }
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
							<legend class="titulo">Lista de Veículos</legend>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Cod</span>
								<input type="text" name="id" class="form-control inputInsert" maxlength="5" value="${veiculo.id}" disabled="disabled">
								<input type="hidden" name="id" class="inputInsert" value="${veiculo.id}">
							</div>						
						</div>							
					</div>	
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-3">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75 ">Marca</span>
								<input type="text" name="marca" class="form-control inputInsert cpObrigatorio" maxlength="100" value="${veiculo.marca}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-3">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75 ">Modelo</span>
								<input type="text" name="modelo" class="form-control inputInsert cpObrigatorio " maxlength="150" value="${veiculo.modelo}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75">Cor</span>
								<input type="text" name="cor" class="form-control inputInsert " maxlength="8" value="${veiculo.cor}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-2">
							<div class="input-group">
								<span class="input-group-addon input-fixed-width75 ">Placa</span>
								<input type="text" name="placa" class="form-control inputInsert cpObrigatorio" maxlength="8" value="${veiculo.placa}" >
							</div>
						</div>
					</div>
					<div class="row top-buffer15">
						<div class="col-3"></div>
						<div class="col-5">
							<div class="input-group ui-widget">
								<span class="input-group-addon input-fixed-width75 ">Pessoa</span>
								<input type="text" name="pessoa.nome" id="idPessoaNome" class="form-control inputInsert cpObrigatorio" maxlength="150" value="${veiculo.pessoa.nome}" >
								<input type="hidden" name="pessoa.id" id="idPessoaId" class="inputInsert" value="${veiculo.pessoa.id}">
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
							<table id="idTableVeiculo"
								class="table table-bordered table-striped ">
								<thead class="table-dark">
									<tr>
										<th class="display-th">
											<input type="checkbox" id="idSelecionaTodos">
										</th>
										<th class="display-th">Id</th>
										<th class="display-th">Marca</th>
										<th class="display-th">Modelo</th>
										<th class="display-th">Cor</th>
										<th class="display-th">Placa</th>
										<th class="display-th">Proprietário</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listVeiculo}" var="veiculo">
										<tr>
											<td class="text-center">
												<input type="checkbox" name="cds" value="${veiculo.id}" class="check">
											</td>	
											<td>
												<a href="/controle-portaria/carregarVeiculo?idVeiculo=${veiculo.id}">${veiculo.id}</a>
											</td>										
											<td class="text-center">${veiculo.marca}</td>	
											<td class="text-center">${veiculo.modelo}</td>	
											<td class="text-center">${veiculo.cor}</td>
											<td class="text-center">${veiculo.placa}</td>
											<td class="text-center">${veiculo.pessoa.nome}</td>
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
