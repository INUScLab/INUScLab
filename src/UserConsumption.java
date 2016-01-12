
public class UserConsumption {

	private String dong;
	private String detailAddress;
	private double lat;
	private double lng;
	private double consumed;
	private double predicted;
	private int leak;
	private int absence;
	private int overused;
	
	public UserConsumption ( String dong, String detailAddress , double lat, double lng, double consumed , double predicted , int leak , int absence, int overused ) {
		this.dong = dong;
		this.detailAddress = detailAddress;
		this.lat = lat;
		this.lng = lng;
		this.consumed = consumed;
		this.predicted = predicted;
		this.leak = leak;
		this.absence = absence;
		this.overused  = overused;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
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
