package sclab.db;

public class GuDongWeeks {
	
	private String guGun;
	private String umDong;
	private double day1;
	private double day2;
	private double day3;
	private double day4;
	private double day5;
	private double day6;
	private double day7;
	
	public GuDongWeeks( ) {
		this.guGun = null;
		this.umDong = null;
		this.day1 = 0;
		this.day2 = 0;
		this.day3 = 0;
		this.day4 = 0;
		this.day5 = 0;
		this.day6 = 0;
		this.day7 = 0;
	}
	
	public GuDongWeeks(String guGun, String umDong, double day1, double day2,
			double day3, double day4, double day5, double day6, double day7) {
		super();
		this.guGun = guGun;
		this.umDong = umDong;
		this.day1 = day1;
		this.day2 = day2;
		this.day3 = day3;
		this.day4 = day4;
		this.day5 = day5;
		this.day6 = day6;
		this.day7 = day7;
	}
	
	public String getGuGun() {
		return guGun;
	}
	public void setGuGun(String guGun) {
		this.guGun = guGun;
	}
	public String getUmDong() {
		return umDong;
	}
	public void setUmDong(String umDong) {
		this.umDong = umDong;
	}
	public double getDay1() {
		return day1;
	}
	public void setDay1(double day1) {
		this.day1 = day1;
	}
	public double getDay2() {
		return day2;
	}
	public void setDay2(double day2) {
		this.day2 = day2;
	}
	public double getDay3() {
		return day3;
	}
	public void setDay3(double day3) {
		this.day3 = day3;
	}
	public double getDay4() {
		return day4;
	}
	public void setDay4(double day4) {
		this.day4 = day4;
	}
	public double getDay5() {
		return day5;
	}
	public void setDay5(double day5) {
		this.day5 = day5;
	}
	public double getDay6() {
		return day6;
	}
	public void setDay6(double day6) {
		this.day6 = day6;
	}
	public double getDay7() {
		return day7;
	}
	public void setDay7(double day7) {
		this.day7 = day7;
	}
	
	
	

}
