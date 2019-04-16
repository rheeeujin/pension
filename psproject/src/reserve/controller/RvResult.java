package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import member.vo.Member;
import reserve.service.ReserveServiceImpl;

@WebServlet("/rvResult")
public class RvResult extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = req.getSession();
		if(session.getAttribute("member") == null) {
			resp.sendRedirect("index");
		}
		
	    long l_rvidx = Long.parseLong(req.getParameter("rvidx"));
		
    	req.setAttribute("ls_rv_rsult",ReserveServiceImpl.GetInstance().listRvrmResult(l_rvidx));  
    	req.getRequestDispatcher("reserve/rvps_result.jsp").forward(req, resp);
	 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		if(session.getAttribute("member") == null) {
			resp.sendRedirect("index");
		}
			
	}
	

}
