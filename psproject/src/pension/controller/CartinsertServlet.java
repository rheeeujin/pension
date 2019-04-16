package pension.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.vo.Member;
import pension.dao.PensionDao;
import pension.vo.CartVo;


@WebServlet("/insert.do")
public class CartinsertServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PensionDao dao = new PensionDao();
		int psidx = Integer.parseInt(req.getParameter("psidx"));

		HttpSession session = req.getSession();
//		System.out.println(session.getAttribute("member"));
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			String email = member.getEmail();
			
			int result = dao.caktinsert(email, psidx);

			session.setAttribute("insert", result);
			resp.sendRedirect("cart.do");
		}

		
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	
}
