package member.service;

import member.vo.Member;

/**
 * 
 * @author 서재진
 * 
 */

public interface MemberService {

    Member login(String email,String pw); // 로그인
    void logout();//로그아웃
    void join(Member vo); // 가입 
    void mypage(Member vo);//수정 , 예약확인 ,탈퇴
	void resign(String email);



}





