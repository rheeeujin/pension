package reserve.vo;

import lombok.Data;

/**
 *  @author 박승호, 이충현
 *  version 1.7
 *  Date : 19/03/27
 */

public class CalVo {
	private int d1;    //일
	private int d1_rv; //예약가능여부(0:예약가능-일부예약, 1:예약완료-방전체)
	private int d2;    //월
	private int d2_rv;
	private int d3;    //화
	private int d3_rv;
	private int d4;    //수
	private int d4_rv;
	private int d5;    //목
	private int d5_rv;
	private int d6;    //금
	private int d6_rv;
	private int d7;    //토
	private int d7_rv;
	
	
	public int getD1() {
		return d1;
	}
	public void setD1(int d1) {
		this.d1 = d1;
	}
	public int getD1_rv() {
		return d1_rv;
	}
	public void setD1_rv(int d1_rv) {
		this.d1_rv = d1_rv;
	}
	public int getD2() {
		return d2;
	}
	public void setD2(int d2) {
		this.d2 = d2;
	}
	public int getD2_rv() {
		return d2_rv;
	}
	public void setD2_rv(int d2_rv) {
		this.d2_rv = d2_rv;
	}
	public int getD3() {
		return d3;
	}
	public void setD3(int d3) {
		this.d3 = d3;
	}
	public int getD3_rv() {
		return d3_rv;
	}
	public void setD3_rv(int d3_rv) {
		this.d3_rv = d3_rv;
	}
	public int getD4() {
		return d4;
	}
	public void setD4(int d4) {
		this.d4 = d4;
	}
	public int getD4_rv() {
		return d4_rv;
	}
	public void setD4_rv(int d4_rv) {
		this.d4_rv = d4_rv;
	}
	public int getD5() {
		return d5;
	}
	public void setD5(int d5) {
		this.d5 = d5;
	}
	public int getD5_rv() {
		return d5_rv;
	}
	public void setD5_rv(int d5_rv) {
		this.d5_rv = d5_rv;
	}
	public int getD6() {
		return d6;
	}
	public void setD6(int d6) {
		this.d6 = d6;
	}
	public int getD6_rv() {
		return d6_rv;
	}
	public void setD6_rv(int d6_rv) {
		this.d6_rv = d6_rv;
	}
	public int getD7() {
		return d7;
	}
	public void setD7(int d7) {
		this.d7 = d7;
	}
	public int getD7_rv() {
		return d7_rv;
	}
	public void setD7_rv(int d7_rv) {
		this.d7_rv = d7_rv;
	}
	
	@Override
	public String toString() {
		return "CalVo [d1=" + d1 + ", d1_rv=" + d1_rv + ", d2=" + d2 + ", d2_rv=" + d2_rv + ", d3=" + d3 + ", d3_rv="
				+ d3_rv + ", d4=" + d4 + ", d4_rv=" + d4_rv + ", d5=" + d5 + ", d5_rv=" + d5_rv + ", d6=" + d6
				+ ", d6_rv=" + d6_rv + ", d7=" + d7 + ", d7_rv=" + d7_rv + "]";
	}
	
	
}
