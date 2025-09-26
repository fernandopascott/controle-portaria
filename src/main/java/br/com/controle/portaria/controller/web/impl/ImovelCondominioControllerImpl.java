package br.com.controle.portaria.controller.web.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.controle.portaria.controller.web.WebControllerInterface;
import br.com.controle.portaria.model.ImovelCondominio;
import br.com.controle.portaria.model.Pessoa;
import br.com.controle.portaria.services.ServiceInterface;

@Controller
public class ImovelCondominioControllerImpl implements WebControllerInterface<ImovelCondominio> {

	@Autowired
	private ServiceInterface<ImovelCondominio> service;

	@Autowired
	private ServiceInterface<Pessoa> servicePessoa;

	@Override
	public void dataBinding(WebDataBinder binder) {
		// TODO Auto-generated method stub

	}

	@Override
	@RequestMapping(value = "/imovelCondominio")
	public String listar(Model model) {
		System.out.println(this.getClass().getName() + "#############listar#########");

		model.addAttribute("listImovelCondominio", service.listar());
		model.addAttribute("listPessoa", servicePessoa.listar());

		return "cadastroImovelCondominioForm";
	}

	@Override
	@RequestMapping(value = "/carregarImovelCondominio", method = RequestMethod.GET)
	public String carregar(@RequestParam("idImovelCondominio") Integer idImovelCondominio, Model model) {
		System.out.println(this.getClass().getName() + "#############carregar#########");

		ImovelCondominio imovelCondominio = new ImovelCondominio();
		if (idImovelCondominio != null) {
			imovelCondominio = service.carregar(idImovelCondominio);
			model.addAttribute("imovelCondominio", imovelCondominio);
		}
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/salvarImovelCondominio", method = RequestMethod.POST)
	public String salvar(ImovelCondominio imovelCondominio, BindingResult result, Model model, HttpSession session) {

		System.out.println(this.getClass().getName() + "#############salvar#########");

		service.salvar(imovelCondominio);
		model.addAttribute("imovelCondominio", imovelCondominio);
		if (result.hasErrors()) {
			return "error";
		}
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/excluirImovelCondominio", method = RequestMethod.POST)
	public String excluir(@RequestParam("cds") Integer[] cds, Model model) {
		System.out.println(this.getClass().getName() + "#############excluir#########");
		service.excluir(cds);

		return listar(model);
	}
}
