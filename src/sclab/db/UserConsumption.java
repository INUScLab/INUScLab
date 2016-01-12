package sclab.db;

public class UserConsumption {

	private String umDong;
	private String detail;
	private double lat;
	private double lng;
	private double consumed;
	private double predicted;
	private int leak;
	private int absence;
	private int overused;
	
	public UserConsumption ( String umDong, String detail , double lat, double lng, double consumed , double predicted , int leak , int absence, int overused ) {
		this.umDong = umDong;
		this.detail = detail;
		this.lat = lat;
		this.lng = lng;
		this.consumed = consumed;
		this.predicted = predicted;
		this.leak = leak;
		this.absence = absence;
		this.overused  = overused;
	}

	public String getumDong() {
		return umDong;
	}

	public void setumDong(String umDong) {
		this.umDong = umDong;
	}

	public String getBlock() {
		return detail;
	}

	public void setBlock(String detail) {
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

	public int getOverused() {
		return overused;
	}

	public void setOverused(int overused) {
		this.overused = overused;
	}
	
}
