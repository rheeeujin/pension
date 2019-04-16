package pension.vo;

/**
 * 
 * @author 장우영
 * 
 * 
 * -염윤호
 * 펜션 방별 최저가 가격 추가됨(lowPrice)
 */

public class PensionVo {
	private int psidx;
	private String pstitle;
	private String pscont;
	private String psurl;
	private int comnum;
	private int acc;
	private String preaddr;
	private String curaddr;
	private String pickup;
	private String calltel;
	private String email;
	private String longitude;
	private String latitude;
	private String oridx;
	private String href;
	private int lowPrice;
	
	public PensionVo() {}
	
	public PensionVo(int psidx, String pstitle, String pscont, String psurl, int comnum, int acc, String preaddr,
			String curaddr, String pickup, String calltel, String email, String longitude, String latitude,
			String oridx, String href, int lowPrice) {
		super();
		this.psidx = psidx;
		this.pstitle = pstitle;
		this.pscont = pscont;
		this.psurl = psurl;
		this.comnum = comnum;
		this.acc = acc;
		this.preaddr = preaddr;
		this.curaddr = curaddr;
		this.pickup = pickup;
		this.calltel = calltel;
		this.email = email;
		this.longitude = longitude;
		this.latitude = latitude;
		this.oridx = oridx;
		this.href = href;
		this.lowPrice = lowPrice;
	}

	public int getPsidx() {
		return psidx;
	}
	public void setPsidx(int psidx) {
		this.psidx = psidx;
	}
	public String getPstitle() {
		return pstitle;
	}
	public void setPstitle(String pstitle) {
		this.pstitle = pstitle;
	}
	public String getPscont() {
		return pscont;
	}
	public void setPscont(String pscont) {
		this.pscont = pscont;
	}
	public String getPsurl() {
		return psurl;
	}
	public void setPsurl(String psurl) {
		this.psurl = psurl;
	}
	public int getComnum() {
		return comnum;
	}
	public void setComnum(int comnum) {
		this.comnum = comnum;
	}
	public int getAcc() {
		return acc;
	}
	public void setAcc(int acc) {
		this.acc = acc;
	}
	public String getPreaddr() {
		return preaddr;
	}
	public void setPreaddr(String preaddr) {
		this.preaddr = preaddr;
	}
	public String getCuraddr() {
		return curaddr;
	}
	public void setCuraddr(String curaddr) {
		this.curaddr = curaddr;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public String getCalltel() {
		return calltel;
	}
	public void setCalltel(String calltel) {
		this.calltel = calltel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getOridx() {
		return oridx;
	}
	public void setOridx(String oridx) {
		this.oridx = oridx;
	}
	public int getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}
	public String toString() {
		return "PensionVo [psidx=" + psidx + ", pstitle=" + pstitle + ", pscont=" + pscont + ", psurl=" + psurl
				+ ", comnum=" + comnum + ", acc=" + acc + ", preaddr=" + preaddr + ", curaddr=" + curaddr + ", pickup="
				+ pickup + ", calltel=" + calltel + ", email=" + email + ", longitude=" + longitude + ", latitude="
				+ latitude + ", oridx=" + oridx + ", href=" + href + ", lowPrice=" + lowPrice + "]";
	}
}