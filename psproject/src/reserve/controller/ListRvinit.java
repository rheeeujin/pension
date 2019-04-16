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

/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */


@WebServlet("/rsv")
public class ListRvinit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String ls_ymd, ls_todate, ls_seldate, ls_prenext;
		 int li_psidx, li_selgb;
		
			HttpSession session = req.getSession();
			if(session.getAttribute("member") == null) {
				resp.sendRedirect("index");
			}
		 
		 
		//오늘일자 Get
		ls_todate = ReserveServiceImpl.GetInstance().getToDate();
		req.setAttribute("s_todate",ls_todate);  //오늘
		 
		 
		if(req.getParameter("pension_code")!=null) {
			li_psidx = Integer.valueOf(req.getParameter("pension_code"));
		} else {
			li_psidx = 1;
		}
		req.setAttribute("s_psidx",li_psidx); 
		
		
		
		if(req.getParameter("sel_date")!=null) {
			ls_seldate = (String)req.getParameter("sel_date");
			li_selgb = Integer.valueOf(req.getParameter("data_gb"));
			ls_prenext = (String)req.getParameter("rsrm_date");
			
			ls_ymd = ReserveServiceImpl.GetInstance().getStandardDate(ls_seldate, li_selgb);
			//System.out.println("-----1-----ls_seldate : "+ls_seldate+"   li_selgb : "+li_selgb+"   ls_ymd : "+ls_ymd);
			
			if(ls_prenext.equals("2") && ls_todate.substring(0, 7).equals(ls_seldate.substring(0, 7))) {
				ls_seldate=ls_todate;
			}
		} else {
			ls_ymd = ls_todate;
			ls_seldate=ls_todate;
		}

		
		System.out.println("li_psidx : "+li_psidx+" ls_ymd : "+ ls_ymd);	
			
		//전달0,현재달1,다음달2 Get
		String[] l_ym = ReserveServiceImpl.GetInstance().getCurNextYm(ls_ymd); //당월,익월값 가져옴
		
	//	System.out.println(l_ym[0]+"  "+l_ym[1]+"  "+l_ym[2]);
		req.setAttribute("s_p_month",l_ym[0]); //전달
		req.setAttribute("s_c_month",l_ym[1]); //현재달
		req.setAttribute("s_n_month",l_ym[2]); //다음달
		
		req.setAttribute("s_ls_c_month", ReserveServiceImpl.GetInstance().listCal(l_ym[1], li_psidx));	//당월
		req.setAttribute("s_ls_n_month", ReserveServiceImpl.GetInstance().listCal(l_ym[2], li_psidx));	//익월
		
//		System.out.println("room date : "+ls_seldate);
		req.setAttribute("s_ls_initroom", ReserveServiceImpl.GetInstance().listInitRoom(ls_seldate, li_psidx));
		
		
        req.setAttribute("s_sel_date",ls_seldate); 
//		System.out.println("s_sel_date "+req.getAttribute("s_sel_date"));
		
		req.getRequestDispatcher("reserve/rvps.jsp").forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		if(session.getAttribute("member") == null) {
			resp.sendRedirect("index");
		}
		
		List<RvdetailVo> ls_rdtvo = new ArrayList<>();
		
		int icnt = req.getParameterValues("room_chk").length;
		int[] rinx = new int[icnt];
		Arrays.fill(rinx, -1);
		
		for(int i=0;i<icnt;i++) {
			rinx[i] = Integer.valueOf(req.getParameterValues("room_chk")[i]);
		}
		
        int icnt1 = req.getParameterValues("room_idx").length;
        System.out.println("cnt : " + icnt+" cnt1 : " + icnt1);
        
        
		for(int i=0;i<rinx.length;i++) {
			int baseamt = Integer.valueOf(req.getParameterValues("rsrm_baseamt")[rinx[i]]);
			int night = Integer.valueOf(req.getParameterValues("rsrm_term")[rinx[i]]);
			int perscnt = Integer.valueOf(req.getParameterValues("rsrm_suse")[rinx[i]]);
			String sdate = req.getParameter("rsrm_date");
			int psidx = Integer.valueOf(req.getParameter("pension_code"));
			int rmidx = Integer.valueOf(req.getParameterValues("room_idx")[rinx[i]]);
			String rmnm = req.getParameterValues("room_nm")[rinx[i]];
 		    ls_rdtvo.add(new RvdetailVo(0, 0, baseamt, night, perscnt, 1, sdate, "", psidx, rmidx, rmnm));
		}
		
		req.setAttribute("s_pension_nm",req.getParameter("pension_nm"));
		req.setAttribute("s_ls_rdtvo",ls_rdtvo); //예약세부자료
		
		System.out.println(ls_rdtvo);
		req.getRequestDispatcher("reserve/rvps_pay.jsp").forward(req, resp);	
	}

}
