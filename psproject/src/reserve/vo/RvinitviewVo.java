package reserve.vo;
/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */
public class RvinitviewVo {


	private int psidx;       //+
	private String pstitle;  //
	private int rmcnt;
	private int rmidx;       //+
	private String rmtitle;  //
	private int rmsize;      //
	private int rmpermin;    //
	private int rmpermax;    //  
	private int ava_night;   //
	private int baseamt;     //+	
	private int min_amt;     //  
    private int status;      //+ 
    
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
	public int getRmcnt() {
		return rmcnt;
	}
	public void setRmcnt(int rmcnt) {
		this.rmcnt = rmcnt;
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
	public int getRmsize() {
		return rmsize;
	}
	public void setRmsize(int rmsize) {
		this.rmsize = rmsize;
	}
	public int getRmpermin() {
		return rmpermin;
	}
	public void setRmpermin(int rmpermin) {
		this.rmpermin = rmpermin;
	}
	public int getRmpermax() {
		return rmpermax;
	}
	public void setRmpermax(int rmpermax) {
		this.rmpermax = rmpermax;
	}
	public int getAva_night() {
		return ava_night;
	}
	public void setAva_night(int ava_night) {
		this.ava_night = ava_night;
	}
	public int getBaseamt() {
		return baseamt;
	}
	public void setBaseamt(int baseamt) {
		this.baseamt = baseamt;
	}
	public int getMin_amt() {
		return min_amt;
	}
	public void setMin_amt(int min_amt) {
		this.min_amt = min_amt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "RvinitviewVo [psidx=" + psidx + ", pstitle=" + pstitle + ", rmcnt=" + rmcnt + ", rmidx=" + rmidx
				+ ", rmtitle=" + rmtitle + ", rmsize=" + rmsize + ", rmpermin=" + rmpermin + ", rmpermax=" + rmpermax
				+ ", ava_night=" + ava_night + ", baseamt=" + baseamt + ", min_amt=" + min_amt + ", status=" + status
				+ "]";
	}
    
    


	
}
