package pension.vo;

/**
 * 
 * @author 장우영
 * 
 * 
 * 
 */



public class RoomimgVo {
	private int rmidx;
	private int rmimgidx;
	private String rmimginurl;
	
	public RoomimgVo() {	}

	public int getRmidx() {
		return rmidx;
	}

	public void setRmidx(int rmidx) {
		this.rmidx = rmidx;
	}

	public int getRmimgidx() {
		return rmimgidx;
	}

	public void setRmimgidx(int rmimgidx) {
		this.rmimgidx = rmimgidx;
	}

	public String getRmimginurl() {
		return rmimginurl;
	}

	public void setRmimginurl(String rmimginurl) {
		this.rmimginurl = rmimginurl;
	}

	@Override
	public String toString() {
		return "RoomimgVo [rmidx=" + rmidx + ", rmimgidx=" + rmimgidx + ", rmimginurl=" + rmimginurl + "]";
	}
	
	
	
	

}
