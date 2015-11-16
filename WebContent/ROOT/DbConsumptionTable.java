package jsptable.dbtable;

public class DbConsumptionTable{
	private int consumption_code;
	private String consumption_date;
	private String consumption_predict;
	private String consumption_raw;
	
	public int getConsumption_code() {
		return consumption_code;
	}
	public void setConsumption_code(int consumption_code) {
		this.consumption_code = consumption_code;
	}
	public String getConsumption_date() {
		return consumption_date;
	}
	public void setConsumption_date(String consumption_date) {
		this.consumption_date = consumption_date;
	}
	public String getConsumption_predict() {
		return consumption_predict;
	}
	public void setConsumption_predict(String consumption_predict) {
		this.consumption_predict = consumption_predict;
	}
	public String getConsumption_raw() {
		return consumption_raw;
	}
	public void setConsumption_raw(String consumption_raw) {
		this.consumption_raw = consumption_raw;
	}
}