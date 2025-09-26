package br.com.controle.portaria.controller.webservice.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.controle.portaria.controller.webservice.WebServiceInterface;
import br.com.controle.portaria.model.TipoPessoa;
import br.com.controle.portaria.services.ServiceInterface;

@RestController
public class TipoPessoaWebServiceImpl implements WebServiceInterface<TipoPessoa> {

	@Autowired
	private ServiceInterface<TipoPessoa> service;

	@Override
	public void dataBinding(WebDataBinder binder) {
		// TODO Auto-generated method stub

	}

	@Override
	@GetMapping("/listarTipoPessoaRest")
	public List<TipoPessoa> listar() {
		List<TipoPessoa> listaTipoPessoa = service.listar();
		return listaTipoPessoa;
	}

	@Override
	@GetMapping("/carregarTipoPessoaRest/{id}")
	public TipoPessoa carregar(@PathVariable Integer id) {
		TipoPessoa tipoPessoa = service.carregar(id);
		return tipoPessoa;
	}

	@Override
	@PutMapping("/salvarTipoPessoaRest")
	public void salvar(@RequestBody TipoPessoa tipoPessoa) {
		service.salvar(tipoPessoa);
	}

	@Override
	@DeleteMapping("/excluirTipoPessoaRest/{id}")
	public void excluir(@PathVariable Integer id) {
		service.excluir((Integer[]) Arrays.asList(id).toArray());
	}

}
