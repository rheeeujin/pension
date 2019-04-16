package reserve.service;

import java.util.List;

import reserve.dao.ReserveDao;
import reserve.vo.CalVo;
import reserve.vo.RvdetailVo;
import reserve.vo.RvinitviewVo;
import reserve.vo.RvmainVo;
import reserve.vo.RvresultVo;


/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */

public class ReserveServiceImpl implements ReserveService{

	static ReserveService service = new ReserveServiceImpl();
	private ReserveServiceImpl() {}
	public static ReserveService GetInstance() {
		return service;
	}
	
	ReserveDao dao = ReserveDao.getInstance();
	
	//달력형 일자별 예약현황
	public List<CalVo> listCal(String ym, int psidx) {
		// TODO Auto-generated method stub
		return dao.listCal(ym, psidx);
	}
	
	//전달0,현재달1,다음달2 Get
	public String[] getCurNextYm(String ymd) {
		// TODO Auto-generated method stub
		return dao.getCurNextYm(ymd);
	}

	//팬션에 대한 각 방에 대한 초기 List
	public List<RvinitviewVo> listInitRoom(String ymd, int psidx){
		return dao.listInitRoom(ymd, psidx);
	}
	
	//팬션 Room 예약 저장
	public long Ins_PsRoomReservation(RvmainVo mvo, List<RvdetailVo> dlist) {
		return dao.Ins_PsRoomReservation(mvo, dlist);
	}
	
	//예약번호 생성
	public long Creation_RvNo() {
		return dao.Creation_RvNo();
	}
	
	//현재,다음달력날짜 선택에 의한 기준날짜
	public String getStandardDate(String ymd, int stdval) {
		return dao.getStandardDate(ymd, stdval);	
	}	
	
	//오늘 날짜
	public String getToDate() {
		return dao.getToDate();	
	}	
	
	//팬션예약 결과에 대한 List
	public List<RvresultVo> listRvrmResult(long rvidx) {
		return dao.listRvrmResult(rvidx);
	}	
	
}
