package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberServiceImpl;
import member.vo.Member;

/**
 * 
 * @author 서재진
 * 
 * 
 */


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("member/login.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		Member vo =  MemberServiceImpl.getInstance().login(email,pw);
		
		if (vo ==null) { // 로그인 실패
			resp.sendRedirect("login?massage=fail");

			
		}else if(vo!=null){ // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("member", vo);
			resp.sendRedirect("index");
			
		}
	
		
		
	}
}