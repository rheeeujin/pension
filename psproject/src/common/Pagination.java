package common;

import lombok.Data;

@Data
public class Pagination {
	private int ppv; // page per view = 12
	private int pageRange; // 한페이지에 보여줄 페이징범위
	private int totalCnt; // 총 게시글 수
	private int currPage; // 현재 페이지 번호
	
	//계산 이후 결과값
	private int pageCnt; // 페이지 수
	private boolean firstRange; // 첫번째 페이지 범위 인가
	private boolean lastRange; // 마지막 페이지 범위 인가
	private int from; // 쿼리 사용시 시작 위치
	private int to; // 쿼리 사용시 종료 위치
	
	private int fromPage; // 화면 표시에 사용될 시작 페이지 번호
	private int toPage; // 화면 표시에 사용될 종료 페이지 번호
	
	public Pagination(int ppv, int pageRange, int totalCnt, int currPage) {
		this.ppv = ppv;
		this.pageRange = pageRange;
		this.totalCnt = totalCnt;
		this.currPage = currPage;
		
		pageCnt = (totalCnt-1) / ppv + 1;
		
		to = ppv * currPage;
		from = to - ppv + 1;
		
		toPage = ((currPage -1) / pageRange + 1) * pageRange;
		fromPage = toPage - pageRange + 1;
		toPage = toPage > pageCnt ? pageCnt : toPage;
		
		firstRange = fromPage != 1;
		lastRange = toPage != pageCnt;
	}
}
