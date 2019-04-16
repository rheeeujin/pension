package pension.vo;

/**
 * 
 * @author 장우영
 * 
 * 
 * 
 */

public class ChargeVo {
private int rmidx;
private int period;
private int week;
private int fri;
private int weekend;

public ChargeVo() {}

public int getRmidx() {
	return rmidx;
}

public void setRmidx(int rmidx) {
	this.rmidx = rmidx;
}

public int getPeriod() {
	return period;
}

public void setPeriod(int period) {
	this.period = period;
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
	return "ChargeVo [rmidx=" + rmidx + ", period=" + period + ", week=" + week + ", fri=" + fri + ", weekend="
			+ weekend + "]";
}




}
