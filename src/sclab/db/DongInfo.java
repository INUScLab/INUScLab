package sclab.db;

public class DongInfo {
	
	String gu;
	String dong;
	double lat;
	double lng;
	int count_leak;
	int count_absence;
	int count_freezed;
	int count_reverse;
	int count_fat;
	int count_breakage;
	
	public DongInfo() {
	}
	
	

	public double getLat() {
		return lat;
	}

	

	public DongInfo(String gu, String dong, double lat, double lng,
			int count_leak, int count_absence, int count_freezed,
			int count_reverse, int count_fat, int count_breakage) {
		this.gu = gu;
		this.dong = dong;
		this.lat = lat;
		this.lng = lng;
		this.count_leak = count_leak;
		this.count_absence = count_absence;
		this.count_freezed = count_freezed;
		this.count_reverse = count_reverse;
		this.count_fat = count_fat;
		this.count_breakage = count_breakage;
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


	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getCount_leak() {
		return count_leak;
	}
	public void setCount_leak(int count_leak) {
		this.count_leak = count_leak;
	}
	public int getCount_absence() {
		return count_absence;
	}
	public void setCount_absence(int count_absence) {
		this.count_absence = count_absence;
	}
	public int getCount_freezed() {
		return count_freezed;
	}
	public void setCount_freezed(int count_freezed) {
		this.count_freezed = count_freezed;
	}
	public int getCount_reverse() {
		return count_reverse;
	}
	public void setCount_reverse(int count_reverse) {
		this.count_reverse = count_reverse;
	}
	public int getCount_fat() {
		return count_fat;
	}
	public void setCount_fat(int count_fat) {
		this.count_fat = count_fat;
	}
	public int getCount_breakage() {
		return count_breakage;
	}
	public void setCount_breakage(int count_breakage) {
		this.count_breakage = count_breakage;
	}
	
	
	

}
