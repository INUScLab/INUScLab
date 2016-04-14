package sclab.db;

public class SummaryReport {
	
	String guGun;
	String umDong;
	String detail;
	double lat;
	double lng;
	
	double consumed;
	double predicted;
	
	int leak;
	int absence;
	int freezed;
	int reverse;
	int fat;
	int breakage;
	
	String latelyLeak;
	String latelyAbsence;
	String latelyFreezed;
	String latelyReverse;
	String latelyFat;
	String latelyBreakage;
	
	double day1;
	double day2;
	double day3;
	double day4;
	double day5;
	double day6;
	double day7;
	
	int countLeak;
	int countAbsence;
	int countFreezed;
	int countReverse;
	int countFat;
	int countBreakage;
	
	public SummaryReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SummaryReport(String guGun, String umDong, String detail,
			double lat, double lng, double consumed, double predicted,
			int leak, int absence, int freezed, int reverse, int fat,
			int breakage, String latelyLeak, String latelyAbsence,
			String latelyFreezed, String latelyReverse, String latelyFat,
			String latelyBreakage, double day1, double day2, double day3,
			double day4, double day5, double day6, double day7, int countLeak,
			int countAbsence, int countFreezed, int countReverse, int countFat,
			int countBreakage) {
		super();
		this.guGun = guGun;
		this.umDong = umDong;
		this.detail = detail;
		this.lat = lat;
		this.lng = lng;
		this.consumed = consumed;
		this.predicted = predicted;
		this.leak = leak;
		this.absence = absence;
		this.freezed = freezed;
		this.reverse = reverse;
		this.fat = fat;
		this.breakage = breakage;
		this.latelyLeak = latelyLeak;
		this.latelyAbsence = latelyAbsence;
		this.latelyFreezed = latelyFreezed;
		this.latelyReverse = latelyReverse;
		this.latelyFat = latelyFat;
		this.latelyBreakage = latelyBreakage;
		this.day1 = day1;
		this.day2 = day2;
		this.day3 = day3;
		this.day4 = day4;
		this.day5 = day5;
		this.day6 = day6;
		this.day7 = day7;
		this.countLeak = countLeak;
		this.countAbsence = countAbsence;
		this.countFreezed = countFreezed;
		this.countReverse = countReverse;
		this.countFat = countFat;
		this.countBreakage = countBreakage;
	}
	public int getCountLeak() {
		return countLeak;
	}
	public void setCountLeak(int countLeak) {
		this.countLeak = countLeak;
	}
	public int getCountAbsence() {
		return countAbsence;
	}
	public void setCountAbsence(int countAbsence) {
		this.countAbsence = countAbsence;
	}
	public int getCountFreezed() {
		return countFreezed;
	}
	public void setCountFreezed(int countFreezed) {
		this.countFreezed = countFreezed;
	}
	public int getCountReverse() {
		return countReverse;
	}
	public void setCountReverse(int countReverse) {
		this.countReverse = countReverse;
	}
	public int getCountFat() {
		return countFat;
	}
	public void setCountFat(int countFat) {
		this.countFat = countFat;
	}
	public int getCountBreakage() {
		return countBreakage;
	}
	public void setCountBreakage(int countBreakage) {
		this.countBreakage = countBreakage;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getConsumed() {
		return consumed;
	}
	public void setConsumed(double consumed) {
		this.consumed = consumed;
	}
	public double getPredicted() {
		return predicted;
	}
	public void setPredicted(double predicted) {
		this.predicted = predicted;
	}
	public int getLeak() {
		return leak;
	}
	public void setLeak(int leak) {
		this.leak = leak;
	}
	public int getAbsence() {
		return absence;
	}
	public void setAbsence(int absence) {
		this.absence = absence;
	}
	public int getFreezed() {
		return freezed;
	}
	public void setFreezed(int freezed) {
		this.freezed = freezed;
	}
	public int getReverse() {
		return reverse;
	}
	public void setReverse(int reverse) {
		this.reverse = reverse;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getBreakage() {
		return breakage;
	}
	public void setBreakage(int breakage) {
		this.breakage = breakage;
	}
	public String getLatelyLeak() {
		return latelyLeak;
	}
	public void setLatelyLeak(String latelyLeak) {
		this.latelyLeak = latelyLeak;
	}
	public String getLatelyAbsence() {
		return latelyAbsence;
	}
	public void setLatelyAbsence(String latelyAbsence) {
		this.latelyAbsence = latelyAbsence;
	}
	public String getLatelyFreezed() {
		return latelyFreezed;
	}
	public void setLatelyFreezed(String latelyFreezed) {
		this.latelyFreezed = latelyFreezed;
	}
	public String getLatelyReverse() {
		return latelyReverse;
	}
	public void setLatelyReverse(String latelyReverse) {
		this.latelyReverse = latelyReverse;
	}
	public String getLatelyFat() {
		return latelyFat;
	}
	public void setLatelyFat(String latelyFat) {
		this.latelyFat = latelyFat;
	}
	public String getLatelyBreakage() {
		return latelyBreakage;
	}
	public void setLatelyBreakage(String latelyBreakage) {
		this.latelyBreakage = latelyBreakage;
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
