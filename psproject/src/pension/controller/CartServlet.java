package pension.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.vo.Member;
import pension.dao.PensionDao;
import pension.vo.CartVo;
import pension.vo.PensionVo;
import pension.vo.RoomVo;

@WebServlet("/cart.do")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PensionDao dao = new PensionDao();
		HttpSession session = req.getSession();
		 System.out.println(session.getAttribute("member"));
		if (session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			String email = member.getEmail();

			ArrayList<CartVo> cartvo = dao.getcakt(email);
			req.setAttribute("Selection", cartvo);

			req.getRequestDispatcher("member/ilikeit.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

	}

}
