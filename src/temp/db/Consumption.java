package temp.db;

public class Consumption{
	private int code;
	private String date;
	private String predict_value;
	private String raw_value;
	
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
	public String getPredict_value() {
		return predict_value;
	}
	public void setPredict_value(String predict_value) {
		this.predict_value = predict_value;
	}
	public String getRaw_value() {
		return raw_value;
	}
	public void setRaw_value(String raw_value) {
		this.raw_value = raw_value;
	}
}