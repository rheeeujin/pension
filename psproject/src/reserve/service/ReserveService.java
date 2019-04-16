package reserve.service;

import java.util.List;

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


public interface ReserveService {

	//달력 예약현황 정보
	public List<CalVo> listCal(String ym, int psidx);
	
	//전달0,현재달1,다음달2 Get
	public String[] getCurNextYm(String ymd);
	
	//팬션에 대한 각 방에 대한 초기 List
	public List<RvinitviewVo> listInitRoom(String ymd, int psidx);
	
	//팬션 Room 예약 저장
	public long Ins_PsRoomReservation(RvmainVo mvo, List<RvdetailVo> dlist);
	
	//예약번호 생성(현재일+seq)
	public long Creation_RvNo();
	
	//현재,다음달력날짜 선택에 의한 기준날짜
	public String getStandardDate(String ymd, int stdval);
	
	//오늘 날짜
	public String getToDate();	
	
	//팬션예약 결과에 대한 List
	public List<RvresultVo> listRvrmResult(long rvidx);	
	
}
