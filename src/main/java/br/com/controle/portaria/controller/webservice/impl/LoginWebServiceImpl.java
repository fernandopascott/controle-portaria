package br.com.controle.portaria.controller.webservice.impl;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.controle.portaria.model.Usuario;
import br.com.controle.portaria.services.impl.LoginServiceImpl;

@RestController
public class LoginWebServiceImpl {

	private static LoginServiceImpl service;

	private static synchronized LoginServiceImpl getInstance() {
		if (service == null) {
			service = new LoginServiceImpl();
		}
		return service;
	}

	// @ApiOperation("Efetuar Login")
	@PostMapping("/efetuaLoginRest")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public ResponseEntity<Object> efetuaLogin(@RequestBody @Valid Usuario usuario, HttpSession session) {
		try {
			LoginServiceImpl usuarioService = getInstance();

			if (usuarioService.naoExisteUsuario(usuario)) {
				return new ResponseEntity<Object>(HttpStatus.UNAUTHORIZED);
			}
		} catch (Exception e) {
			session.setAttribute("msgErrorPasword", "Erro Interno, tente novamente");
			return new ResponseEntity<Object>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		session.setAttribute("usuarioLogado", usuario);
		return ResponseEntity.ok().build();
	}

	@GetMapping("/logoutRest")
	public ResponseEntity<Object> logout(HttpSession session) {
		System.out.println("#############log logout#############");
		session.invalidate();
		return new ResponseEntity<Object>(HttpStatus.OK);
	}

}
