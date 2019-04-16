package pension.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ConstPool;
import common.Pagination;
import pension.dao.PensionDao;
import pension.vo.PensionVo;

/**
 *
 * @author 염윤호
 * 2019-04-01
 * 검색 구현중
 * -공백포함시 나오지않는거 수정아직못함
 * 
 * 2019-04-02
 * 페이징 구현중
 * 
 * 2019-04-03
 * 페이징 구현완료
 * 공백있는검색시 나오지않는부분 수정해야함
 * 
 * 2019-04-09
 * 마지막페이지 +1 이 되는것 수정못함
 * 
 */

@SuppressWarnings("serial")
@WebServlet("/search")
public class PensionSearch extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.getServletContext().setAttribute("path", ConstPool.WEP_PATH);
		String search = req.getParameter("search");
		
		if (search.contains("경기도")) {
			search = search.replaceFirst("경기도", "경기");
		}
		
		int page = Util.getParameterNumber(req.getParameter("page"));
		
		PensionDao dao = new PensionDao();
		int num = dao.searchGetTotal(search); // 총게시물 수
		
		Pagination pagination = new Pagination(12, 10, num, page);
		
		List<PensionVo> items = dao.searchGetList(search, pagination.getFrom(), pagination.getTo());
		
		req.setAttribute("search", items);
		req.setAttribute("title", search);
		req.setAttribute("num", num);
		req.setAttribute("page", pagination);
		req.getRequestDispatcher(ConstPool.PENSION_PATH + "/pensionSearch.jsp").forward(req, resp);
	}
}

