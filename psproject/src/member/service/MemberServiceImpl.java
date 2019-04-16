package member.service;

import member.dao.MemberDao;
import member.vo.Member;

/**
 * 
 * @author 서재진
 * 
 * 
 */

public class MemberServiceImpl implements MemberService{
	static MemberService service = new MemberServiceImpl();
	private MemberServiceImpl() {}
	public static MemberService getInstance() {
		return service;}

	
	public Member login(String email, String pw) {
		return MemberDao.getInstance().login(email, pw);
		
	}

	

	public void logout() {

		
	}


	public void join(Member vo) {
		MemberDao.getInstance().join(vo);
		
	}


	public void mypage(Member vo) {
		
       MemberDao.getInstance().mypage(vo);
	}
	public void resign(String email) {
	    MemberDao.getInstance().resign(email);
		
	}
     
     

}
