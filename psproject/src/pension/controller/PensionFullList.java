package pension.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pension.dao.PensionDao;
import pension.vo.PensionVo;

/**
 * 
 * @author 염윤호
 * 
 * 수정중
 * jsp도 수정중
 * 
 */

@WebServlet("/full.do")
public class PensionFullList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String title = "풀빌라";
		String mainSearch = req.getParameter("mainsearch");
		String subSearch = req.getParameter("subsearch");
		PensionDao dao = new PensionDao();
		List<PensionVo> list = dao.readTitleList(title);
		req.setAttribute("list", list);
		// 첫 페이지 로드시 기본적으로 보여줄 리스트
		if (mainSearch==null && subSearch==null) {
			mainSearch = "경기";
			subSearch = "가평";
		}
		
		// 페이징
		String pageStr = req.getParameter("page");
		int page = pageStr == null || pageStr.equals("") || pageStr.equals("0") ? 1 : Integer.parseInt(req.getParameter("page"));
		int rowSize = 12; // 한페이지에 보여줄 개수 
		int block = 10; // 한페이지에 보여줄 페이징범위
		
		int toPage = (int)Math.ceil((float)page/block)*block;
		int fromPage = toPage-9;
		
		int from = 1;
		int to = 12;
		if (page==1) {
			from = 1;
		}else if (page>1) {
			from = (page*rowSize-12)+1;
			to = page*rowSize;
		}
		if (subSearch.equals("전체")) {
			subSearch=mainSearch;
		}
		List<PensionVo> items = dao.searchTitleList(title,subSearch,from,to);
		int num = dao.titleGetTotal(title,subSearch); // 총게시물 수
		int allPage = (int)Math.ceil(num/(double)rowSize); //페이지수
		if (toPage>allPage) {
			toPage=allPage;
		}
		req.setAttribute("mainsearch", mainSearch);
		req.setAttribute("subsearch", subSearch);
		req.setAttribute("page", page);
		req.setAttribute("search", items);
		req.setAttribute("num", num);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
		req.setAttribute("allPage", allPage);
		req.setAttribute("block", block);
		req.setAttribute("rowSize", rowSize);
		req.getRequestDispatcher("pension/pensionFullList.jsp").forward(req, resp);
	}
}
