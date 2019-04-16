package pension.vo;

public class CartVo {
private int cartid;
private String email;
private int psidx;
private int rmidx;
private String pstitle;
private String preaddr;
private int week;
private int fri;
private int weekend;
private String oridx;


public CartVo() {}



public String getOridx() {
	return oridx;
}



public void setOridx(String oridx) {
	this.oridx = oridx;
}



public int getCartid() {
	return cartid;
}


public void setCartid(int cartid) {
	this.cartid = cartid;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
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




public String getPstitle() {
	return pstitle;
}


public void setPstitle(String pstitle) {
	this.pstitle = pstitle;
}


public String getPreaddr() {
	return preaddr;
}


public void setPreaddr(String preaddr) {
	this.preaddr = preaddr;
}


public int getWeek() {
	return week;
}


public void setWeek(int week) {
	this.week = week;
}


public int getFri() {
	return fri;
}


public void setFri(int fri) {
	this.fri = fri;
}


public int getWeekend() {
	return weekend;
}


public void setWeekend(int weekend) {
	this.weekend = weekend;
}



@Override
public String toString() {
	return "CartVo [cartid=" + cartid + ", email=" + email + ", psidx=" + psidx + ", rmidx=" + rmidx + ", pstitle="
			+ pstitle + ", preaddr=" + preaddr + ", week=" + week + ", fri=" + fri + ", weekend=" + weekend + ", oridx="
			+ oridx + "]";
}









}
