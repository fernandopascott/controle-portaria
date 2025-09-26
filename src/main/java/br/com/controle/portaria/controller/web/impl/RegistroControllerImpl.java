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
import br.com.controle.portaria.model.ControleRegistro;
import br.com.controle.portaria.model.ImovelCondominio;
import br.com.controle.portaria.model.Pessoa;
import br.com.controle.portaria.model.Usuario;
import br.com.controle.portaria.services.ServiceInterface;
import br.com.controle.portaria.services.ServiceInterfaceAbstract;
import br.com.controle.portaria.services.impl.UsuarioServiceImpl;

@Controller
public class RegistroControllerImpl implements WebControllerInterface<ControleRegistro> {

//	private static GenericDao<ControleRegistro> dao;
//
//    private static synchronized GenericDao<ControleRegistro> getInstance() {
//        if (dao == null || dao.isSessionClosed()) {
//        	dao = new GenericDao<ControleRegistro>();
//        }
//        return dao;
//    }

	@Autowired
	private ServiceInterfaceAbstract<ControleRegistro> service;

	@Autowired
	private ServiceInterfaceAbstract<Pessoa> servicePessoa;

	@Autowired
	private ServiceInterface<ImovelCondominio> serviceImovel;

	private static UsuarioServiceImpl serviceUsuario;

	private static synchronized UsuarioServiceImpl getInstance() {
		return serviceUsuario == null ? new UsuarioServiceImpl() : serviceUsuario;
	}

	@Override
	public void dataBinding(WebDataBinder binder) {
		// TODO Auto-generated method stub

	}

	@Override
	@RequestMapping(value = "/controleRegistro")
	public String listar(Model model) {
		System.out.println(this.getClass().getName() + "#############listar#########");

		model.addAttribute("listControleRegistro", service.listar());
		model.addAttribute("listUsuario", getInstance().listar());
		model.addAttribute("listPessoa", servicePessoa.listar());
		model.addAttribute("listImovelCond", serviceImovel.listar());

		return "cadastroControleRegistroForm";
	}

	@Override
	@RequestMapping(value = "/carregarControleRegistro", method = RequestMethod.GET)
	public String carregar(@RequestParam("idControleRegistro") Integer idControleRegistro, Model model) {
		System.out.println(this.getClass().getName() + "#############carregar#########");

		if (idControleRegistro != null) {
			model.addAttribute("controleRegistro", service.carregar(idControleRegistro));
		}
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/salvarControleRegistro", method = RequestMethod.POST)
	public String salvar(ControleRegistro controleRegistro, BindingResult result, Model model, HttpSession session) {

		System.out.println(this.getClass().getName() + "#############salvar#########");

		Usuario userTemp = (Usuario) session.getAttribute("usuarioLogado");
		service.salvar(controleRegistro, userTemp);

		model.addAttribute("controleRegistro", controleRegistro);
		if (result.hasErrors()) {
			return "error";
		}
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/excluirControleRegistro", method = RequestMethod.POST)
	public String excluir(@RequestParam("cds") Integer[] cds, Model model) {
		System.out.println(this.getClass().getName() + "#############excluir#########");
		service.excluir(cds);

		return listar(model);
	}
}
