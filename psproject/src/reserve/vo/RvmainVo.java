package reserve.vo;
/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */
public class RvmainVo {
	
	private int rvidx;
	private String email;  //로그인 ID email
	private String name;   //예약자성명
	private String tel;    //예약자 폰 번호
	private String email2; //예약자 이메일
	private int totmoney;  //예약총금액
	private String reqtext; //요청사항
	
	
	public RvmainVo(int rvidx, String email, String name, String tel, String email2, int totmoney, String reqtext) {
		this.rvidx = rvidx;
		this.email = email;
		this.name = name;
		this.tel = tel;
		this.email2 = email2;
		this.totmoney = totmoney;
		this.reqtext = reqtext;
	}
	
	public int getRvidx() {
		return rvidx;
	}
	public void setRvidx(int rvidx) {
		this.rvidx = rvidx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public int getTotmoney() {
		return totmoney;
	}
	public void setTotmoney(int totmoney) {
		this.totmoney = totmoney;
	}
	public String getReqtext() {
		return reqtext;
	}
	public void setReqtext(String reqtext) {
		this.reqtext = reqtext;
	}
	
	@Override
	public String toString() {
		return "RvmainVo [rvidx=" + rvidx + ", email=" + email + ", name=" + name + ", tel=" + tel + ", email2="
				+ email2 + ", totmoney=" + totmoney + ", reqtext=" + reqtext + "]";
	}
	

}
