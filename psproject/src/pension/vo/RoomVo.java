package pension.vo;

import java.util.List;

/**
 * 
 * @author 장우영
 * 
 * 
 * 
 */

public class RoomVo {
	private int psidx;
	private int rmidx;
	private String rmtitle;
	private String rmsize;
	private int rmpermin;
	private int rmpermax;
	private int rorder;
	private List<ChargeVo> chargeVos; 
	private List<RoomimgVo> roomimgVos;
	

	public RoomVo() {}

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

	public String getRmtitle() {
		return rmtitle;
	}

	public void setRmtitle(String rmtitle) {
		this.rmtitle = rmtitle;
	}

	public String getRmsize() {
		return rmsize;
	}

	public void setRmsize(String rmsize) {
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

	public int getRorder() {
		return rorder;
	}

	public void setRorder(int rorder) {
		this.rorder = rorder;
	}

	public List<ChargeVo> getChargeVos() {
		return chargeVos;
	}

	public void setChargeVos(List<ChargeVo> chargeVos) {
		this.chargeVos = chargeVos;
	}

	public List<RoomimgVo> getRoomimgVos() {
		return roomimgVos;
	}

	public void setRoomimgVos(List<RoomimgVo> roomimgVos) {
		this.roomimgVos = roomimgVos;
	}
	
	
	@Override
	public String toString() {
		return "RoomVo [psidx=" + psidx + ", rmidx=" + rmidx + ", rmtitle=" + rmtitle + ", rmsize=" + rmsize
				+ ", rmpermin=" + rmpermin + ", rmpermax=" + rmpermax + ", rorder=" + rorder + ", chargeVos="
				+ chargeVos + ", roomimgVos=" + roomimgVos + "]";
	}

	
}
