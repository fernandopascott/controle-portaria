package br.com.controle.portaria.controller.web.impl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.controle.portaria.controller.web.WebControllerInterface;
import br.com.controle.portaria.model.Pessoa;
import br.com.controle.portaria.model.Veiculo;
import br.com.controle.portaria.services.ServiceInterface;
import br.com.controle.portaria.services.impl.PessoaServiceImpl;
import br.com.controle.portaria.services.impl.VeiculoServiceImpl;

@Controller
public class VeiculoControllerImpl implements WebControllerInterface<Veiculo> {

	private static ServiceInterface<Veiculo> service;
	private static ServiceInterface<Pessoa> servicePessoa;

	private static synchronized ServiceInterface<Veiculo> getInstance() {
		return service == null ? new VeiculoServiceImpl() : service;
	}

	private static synchronized ServiceInterface<Pessoa> getInstancePessoa() {
		return servicePessoa == null ? new PessoaServiceImpl() : servicePessoa;
	}

	@Override
	public void dataBinding(WebDataBinder binder) {
		// TODO Auto-generated method stub

	}

	@Override
	@RequestMapping(value = "/veiculo")
	public String listar(Model model) {
		System.out.println(this.getClass().getName() + "#############listar#########");

		model.addAttribute("listVeiculo", getInstance().listar());

		model.addAttribute("listPessoa", getInstancePessoa().listar());

		return "cadastroVeiculoForm";
	}

	@Override
	@RequestMapping(value = "/carregarVeiculo", method = RequestMethod.GET)
	public String carregar(@RequestParam("idVeiculo") Integer idVeiculo, Model model) {
		System.out.println(this.getClass().getName() + "#############carregar#########");

		model.addAttribute("veiculo", getInstance().carregar(idVeiculo));
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/salvarVeiculo", method = RequestMethod.POST)
	public String salvar(Veiculo veiculo, BindingResult result, Model model, HttpSession session) {

		System.out.println(this.getClass().getName() + "#############salvar#########");
		getInstance().salvar(veiculo);
		model.addAttribute("veiculo", veiculo);
		
		if (result.hasErrors()) {
			return "error";
		}
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/excluirVeiculo", method = RequestMethod.POST)
	public String excluir(@RequestParam("cds") Integer[] cds, Model model) {
		System.out.println(this.getClass().getName() + "#############excluir#########");
		getInstance().excluir(cds);
		return listar(model);
	}
}
