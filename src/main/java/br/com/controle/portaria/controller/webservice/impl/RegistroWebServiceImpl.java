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
import br.com.controle.portaria.model.ControleRegistro;
import br.com.controle.portaria.services.ServiceInterfaceAbstract;

@RestController
public class RegistroWebServiceImpl implements WebServiceInterface<ControleRegistro> {
	
	@Autowired
	private ServiceInterfaceAbstract<ControleRegistro> service;

	@Override
	public void dataBinding(WebDataBinder binder) {
		// TODO Auto-generated method stub

	}

	@Override
	@GetMapping("/listarControleRegistroRest")
	public List<ControleRegistro> listar() {
		List<ControleRegistro> listaControleRegistro = service.listar();
		return listaControleRegistro;
	}

	@Override
	@GetMapping("/carregarControleRegistroRest/{id}")
	public ControleRegistro carregar(@PathVariable Integer id) {
		ControleRegistro controleRegistro = service.carregar(id);
		return controleRegistro;
	}

	@Override
	@PutMapping("/salvarControleRegistroRest")
	public void salvar(@RequestBody ControleRegistro controleRegistro) {
		service.salvar(controleRegistro);
	}

	@Override
	@DeleteMapping("/excluirControleRegistroRest/{id}")
	public void excluir(@PathVariable Integer id) {
		service.excluir((Integer[]) Arrays.asList(id).toArray());
	}
}
