package reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reserve.service.ReserveServiceImpl;
import reserve.vo.RvdetailVo;
import reserve.vo.RvmainVo;


@WebServlet("/rvPay")
public class RvPay extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		if(session.getAttribute("member") == null) {
			resp.sendRedirect("index");
		}
		else {req.getRequestDispatcher("reserve/rvps_pay.jsp").forward(req, resp);}
		
//		System.out.println("rvpay " + req.getAttribute("s_ls_rdtvo"));
//		req.setAttribute("s_ls_rdtvo",req.getAttribute("s_ls_rdtvo")); 
//		req.getRequestDispatcher("reserve/rvps_pay.jsp").forward(req, resp);
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		
//		HttpSession session = req.getSession();
//		if(session.getAttribute("member") == null) {
//			resp.sendRedirect("index");
//		}
		
		List<RvdetailVo> dlist = new ArrayList<>();
		
		int icnt = req.getParameterValues("rs_rmidx").length;
        System.out.println("cnt : " + icnt);
        
		for(int i=0;i<icnt;i++) {
			int baseamt = Integer.valueOf(req.getParameterValues("rs_baseamt")[i]);
			int night = Integer.valueOf(req.getParameterValues("rs_night")[i]);
			int perscnt = Integer.valueOf(req.getParameterValues("rs_perscnt")[i]);
			int status =  Integer.valueOf(req.getParameterValues("rs_status")[i]);
			String sdate = req.getParameterValues("rs_sdate")[i]; 
			int psidx = Integer.valueOf(req.getParameterValues("rs_psidx")[i]);
			int rmidx = Integer.valueOf(req.getParameterValues("rs_rmidx")[i]);
			dlist.add(new RvdetailVo(0, 0, baseamt, night, perscnt, status, sdate, "", psidx, rmidx, ""));
		}
		
		String email = req.getParameter("rs_mem_email");
		String name = req.getParameter("nameId");
		String tel = req.getParameter("tel");
		String email2 = req.getParameter("pers_mail");
		int totmoney = Integer.valueOf(req.getParameter("rs_sumfee"));
		String reqtext = req.getParameter("rese_requ");
		RvmainVo mvo = new RvmainVo(0, email, name, tel, email2, totmoney, reqtext);
		
		System.out.println(mvo);
		System.out.println(dlist);
		
		long newRvNo = ReserveServiceImpl.GetInstance().Ins_PsRoomReservation(mvo, dlist);
		System.out.println("rvPay :: "+newRvNo);
		resp.sendRedirect("rvResult?rvidx="+String.valueOf(newRvNo));
		
	}
}
