package board.service;

import java.util.List;

import board.dao.BoardDao;
import board.vo.BoardVo;

public class BoardServiceImpl implements BoardService {
	private static BoardServiceImpl service = new BoardServiceImpl();
	private BoardServiceImpl() {}
	public static BoardServiceImpl getInstance() {
		return service;
	}
	@Override
	public void write() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void modify() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<BoardVo> list() {
		// TODO Auto-generated method stub
		return BoardDao.getInstance().list();
	}
}
