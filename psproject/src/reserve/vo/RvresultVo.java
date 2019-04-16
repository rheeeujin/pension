package reserve.vo;

public class RvresultVo {

	private long rvidx;
	private String email;
	private String name;
	private String tel;
	private String email2;
    private int totmoney;
    private String reqtext;
    private int rvsub;
    private int baseamt;
    private int night;
    private int perscnt;
    private int status;
    private String sdate;
    private String edate;
    private int psidx;
	private String pstitle;
    private int rmidx;
    private String rmtitle;
    
	public RvresultVo() {}

	public RvresultVo(long rvidx, String email, String name, String tel, String email2, int totmoney, String reqtext,
			int rvsub, int baseamt, int night, int perscnt, int status, String sdate, String edate, int psidx,
			String pstitle, int rmidx, String rmtitle) {
		this.rvidx = rvidx;
		this.email = email;
		this.name = name;
		this.tel = tel;
		this.email2 = email2;
		this.totmoney = totmoney;
		this.reqtext = reqtext;
		this.rvsub = rvsub;
		this.baseamt = baseamt;
		this.night = night;
		this.perscnt = perscnt;
		this.status = status;
		this.sdate = sdate;
		this.edate = edate;
		this.psidx = psidx;
		this.pstitle = pstitle;
		this.rmidx = rmidx;
		this.rmtitle = rmtitle;
	}

	public long getRvidx() {
		return rvidx;
	}

	public void setRvidx(long rvidx) {
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

	public int getRvsub() {
		return rvsub;
	}

	public void setRvsub(int rvsub) {
		this.rvsub = rvsub;
	}

	public int getBaseamt() {
		return baseamt;
	}

	public void setBaseamt(int baseamt) {
		this.baseamt = baseamt;
	}

	public int getNight() {
		return night;
	}

	public void setNight(int night) {
		this.night = night;
	}

	public int getPerscnt() {
		return perscnt;
	}

	public void setPerscnt(int perscnt) {
		this.perscnt = perscnt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
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

	public int getRmidx() {
		return rmidx;
	}

	public void setRmidx(int rmidx) {
		this.rmidx = rmidx;
	}

	public String getRmtitle() {
		return rmtitle;
	}

	public void setRmtitle(String rmtitle) {
		this.rmtitle = rmtitle;
	}

	@Override
	public String toString() {
		return "RvresultVo [rvidx=" + rvidx + ", email=" + email + ", name=" + name + ", tel=" + tel + ", email2="
				+ email2 + ", totmoney=" + totmoney + ", reqtext=" + reqtext + ", rvsub=" + rvsub + ", baseamt="
				+ baseamt + ", night=" + night + ", perscnt=" + perscnt + ", status=" + status + ", sdate=" + sdate
				+ ", edate=" + edate + ", psidx=" + psidx + ", pstitle=" + pstitle + ", rmidx=" + rmidx + ", rmtitle="
				+ rmtitle + "]";
	}    

	
}
