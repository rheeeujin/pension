package reserve.vo;
/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */
public class RvdetailVo {

	private int rvidx;
	private int rvsub;
	private int baseamt;     //+
	private int night;
	private int perscnt;
	private int status;      //+
	private String sdate;
	private String edate;
	private int psidx;       //+
	private int rmidx;       //+
	private String rmnm;
	
	public RvdetailVo(int rvidx, int rvsub, int baseamt, int night, int perscnt, int status, String sdate, String edate,
			int psidx, int rmidx, String rmnm) {
		this.rvidx = rvidx;
		this.rvsub = rvsub;
		this.baseamt = baseamt;
		this.night = night;
		this.perscnt = perscnt;
		this.status = status;
		this.sdate = sdate;
		this.edate = edate;
		this.psidx = psidx;
		this.rmidx = rmidx;
		this.rmnm = rmnm;
	}

	public int getRvidx() {
		return rvidx;
	}

	public void setRvidx(int rvidx) {
		this.rvidx = rvidx;
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

	public int getRmidx() {
		return rmidx;
	}

	public void setRmidx(int rmidx) {
		this.rmidx = rmidx;
	}

	public String getRmnm() {
		return rmnm;
	}

	public void setRmnm(String rmnm) {
		this.rmnm = rmnm;
	}

	@Override
	public String toString() {
		return "RvdetailVo [rvidx=" + rvidx + ", rvsub=" + rvsub + ", baseamt=" + baseamt + ", night=" + night
				+ ", perscnt=" + perscnt + ", status=" + status + ", sdate=" + sdate + ", edate=" + edate + ", psidx="
				+ psidx + ", rmidx=" + rmidx + ", rmnm=" + rmnm + "]";
	}
	
}
