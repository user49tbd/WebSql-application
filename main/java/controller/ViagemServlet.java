package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Onibus;
import model.Viagem;
import persistence.IViagemDaoc;
import persistence.ViagemDao;

/**
 * Servlet implementation class ViagemServlet
 */
@WebServlet("/viagem")
public class ViagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ViagemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String botao = request.getParameter("botao_v");
		
		Viagem v = new Viagem();
		IViagemDaoc vd = new ViagemDao();
		String erro ="";
		List<Viagem> lv = new ArrayList();
		List<Onibus> lo = new ArrayList();
		
		try {
			System.out.println(botao);
			if(botao.equalsIgnoreCase("Viagem")) {
				System.out.println("ListarV");
				lv = vd.ConsultaViagems();
				System.out.println("FinishV");
			}
			else {
				if(botao.equalsIgnoreCase("Onibus")) {
					System.out.println("ListarO");
					lo = vd.ConsultaOnibus();
					System.out.println("FinishO");
				}
			}
		} catch(SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
			System.out.println(erro);
		}finally{
			RequestDispatcher rd = request.getRequestDispatcher("viagem.jsp");
			request.setAttribute("viagems", lv);
			request.setAttribute("onibus", lo);
			request.setAttribute("erro", erro);
			rd.forward(request,response);
		}
		
		
	}
	/*
	private Viagem valida(String id,String botao) throws IOException{
		Viagem v = new Viagem();
		if(botao.equalsIgnoreCase("Buscar")) {
			if(id.equals("")) {
				throw new IOException("id nao pode ser nulo");
			}
			else {
				Integer.parseInt(id);
			}
			v.setCodigo(0);
		}
		return v;
	}*/
}
