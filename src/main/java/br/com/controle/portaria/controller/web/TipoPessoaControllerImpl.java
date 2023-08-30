package br.com.controle.portaria.controller.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.controle.portaria.model.TipoPessoa;
import br.com.controle.portaria.services.ServiceInterface;
import br.com.controle.portaria.services.TipoPessoaServiceImpl;

@Controller
public class TipoPessoaControllerImpl implements WebControllerInterface<TipoPessoa>{
	
	private static ServiceInterface<TipoPessoa> tipoPessoaService;

    private static synchronized ServiceInterface<TipoPessoa> getInstance() {
        if (tipoPessoaService == null) {
        	tipoPessoaService = new TipoPessoaServiceImpl();
        }
        return tipoPessoaService;
    }

	@Override
	public void dataBinding(WebDataBinder binder) {
		// TODO Auto-generated method stub
	}

	@Override
	@RequestMapping(value="/tipoPessoa")
	public String listar(Model model) {
		tipoPessoaService = getInstance();
		List<TipoPessoa> listaTipoPessoa = tipoPessoaService.listar();
		model.addAttribute("listTipoPessoa", listaTipoPessoa);		
		return "cadastroTipoPessoaForm";
	}
	
	@Override
	@RequestMapping(value = "/carregarTipoPessoa", method = RequestMethod.GET)
	public String carregar(@RequestParam("idTipoPessoa")Integer idTipoPessoa, Model model) {
		TipoPessoa tipoPessoa = new TipoPessoa();
		if(idTipoPessoa != null){
			tipoPessoaService = getInstance();
			tipoPessoa = tipoPessoaService.carregar(idTipoPessoa);
			model.addAttribute("tipoPessoa", tipoPessoa);
		}		
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/salvarTipoPessoa", method = RequestMethod.POST)
	public String salvar(TipoPessoa tipoPessoa, BindingResult result, Model model, HttpSession session) {
		tipoPessoaService = getInstance();
		tipoPessoaService.salvar(tipoPessoa);
		model.addAttribute("tipoPessoa", tipoPessoa);
		if (result.hasErrors()) {			
			return "error";
		}
		return listar(model);
	}

	@Override
	@RequestMapping(value = "/excluirTipoPessoa", method = RequestMethod.POST)
	public String excluir(@RequestParam("cds") Integer[] cds, Model model) {
		tipoPessoaService = getInstance();
		tipoPessoaService.excluir(cds);
		return listar(model);
	}
}
