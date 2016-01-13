package sclab.db;

public class GuDongLatLng {
	private String guGun;
	private String umDong;
	private double lat;
	private double lng;
	
	public GuDongLatLng ( ) {
		this.guGun="";
		this.umDong="";
		this.lat=0;
		this.lng=0;
	}
	
	public GuDongLatLng(String guGun, String umDong, double lat, double lng) {
		this.guGun = guGun;
		this.umDong = umDong;
		this.lat = lat;
		this.lng = lng;
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
	
	
}

