package pension.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.dao.PensionDao;
import pension.vo.ChargeVo;
import pension.vo.PensionVo;
import pension.vo.RoomVo;
import pension.vo.RoomimgVo;

@WebServlet("/detail.do")
public class DetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		PensionDao dao = new PensionDao();
		if (url.indexOf("detail.do") != -1) {
			String psidx = req.getParameter("psidx");
			ArrayList<RoomVo> roomVo = dao.detailRoom(psidx);
			
			String rmidx = req.getParameter("rmidx"); // null x
			int roomidx = 0;
			if(rmidx == null) {
				roomidx = roomVo.get(0).getRmidx();
			}
			else {
				roomidx = Integer.parseInt(rmidx);
			}
			
			
			PensionVo vo = dao.detailPension(psidx);

			req.setAttribute("dao", vo);
			req.setAttribute("rmIdx", roomidx);
			req.setAttribute("room", roomVo);
			
			RequestDispatcher rd = req.getRequestDispatcher("pension/PensionDetail.jsp");
			rd.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}