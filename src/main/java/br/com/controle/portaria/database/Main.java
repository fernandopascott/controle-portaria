package br.com.controle.portaria.database;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Main {

	public static void main(String[] args) {
//		GenericDao<TipoPessoa> dao = new GenericDao<TipoPessoa>();
//
//		TipoPessoa tipoPessoaInsert = new TipoPessoa();
//		tipoPessoaInsert.setDescricao("Porteiro");
//		dao.adicionarOrAlterar(tipoPessoaInsert);
//
//		GenericDao<TipoPessoa> daoList = new GenericDao<TipoPessoa>();
//		Collection<TipoPessoa> listaTipoPessoa = new ArrayList<TipoPessoa>();
//		listaTipoPessoa = daoList.listaTudo("from TipoPessoa");
//
//		for (TipoPessoa tipoPessoa : listaTipoPessoa) {
//			System.out.println(tipoPessoa);
//		}
		
		testeSenha("teste", "123456");
		//testeSenha("teste", "123456fjjkj");

	}

	private static void testeSenha(String login, String senha) {
		MessageDigest m;
		try {
			m = MessageDigest.getInstance("MD5");
			m.update(login.getBytes(), 0, login.length());
			BigInteger login1 = new BigInteger(1, m.digest());
			login = String.format("%1$032X", login1);

			m.reset(); // <---- Reseta antes de fazer o password
			m.update(senha.getBytes(), 0, senha.length());
			BigInteger password1 = new BigInteger(1, m.digest());
			senha = String.format("%1$032X", password1);

			System.out.println(login);
			System.out.println(senha);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
