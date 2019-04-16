package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberServiceImpl;
import member.vo.Member;
@WebServlet("/mypage")
public class Mypage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("member/mypage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String email=req.getParameter("email");	
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String address= req.getParameter("address");
		String tel= req.getParameter("tel");

	    Member vo = new Member();
	
        vo.setEmail(email); 
		vo.setPw(pw);
		vo.setName(name);
		vo.setAddress(address);
		vo.setTel(tel);
		MemberServiceImpl.getInstance().mypage(vo);
		req.getSession().setAttribute("member", vo);
		
		resp.sendRedirect("index");
	}

	
}
