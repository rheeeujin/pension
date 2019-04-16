package board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVo {
	private int boardIdx;
	private String title;
	private String cont;
	private int cate;
	private int score;
	private Date redate;
	private String email;
	private int psIdx;
//	private int depth;
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public int getCate() {
		return cate;
	}
	public void setCate(int cate) {
		this.cate = cate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPsIdx() {
		return psIdx;
	}
	public void setPsIdx(int psIdx) {
		this.psIdx = psIdx;
	}

	
	
}
