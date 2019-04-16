package board.service;

import java.util.List;

import board.vo.BoardVo;

public interface BoardService {
	void write();
	void modify();
	void delete();
	List<BoardVo> list();
}
