package sclab.db;

public class Consumption{
	private int code;
	private String date;
	private float consumed;
	private float predicted;
	private boolean leak;
	private boolean absence;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public float getConsumed() {
		return consumed;
	}
	public void setConsumed(float consumed) {
		this.consumed = consumed;
	}
	public float getPredicted() {
		return predicted;
	}
	public void setPredicted(float predicted) {
		this.predicted = predicted;
	}
	public boolean isLeak() {
		return leak;
	}
	public void setLeak(boolean leak) {
		this.leak = leak;
	}
	public boolean isAbsence() {
		return absence;
	}
	public void setAbsence(boolean absence) {
		this.absence = absence;
	}
}