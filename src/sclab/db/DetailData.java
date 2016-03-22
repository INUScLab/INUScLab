package sclab.db;

public class DetailData {

	public String code; // 수용가 번호
	public String detail; // 수용가명
	public String number; // 지시부 번호
	public String meter_num; // 미터 번호
	public String meter_type; // 미터 타입
	
	public String total_consumed; // 총 사용량
	public String[] consumed_days; // 기간 동안 사용량
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getMeter_num() {
		return meter_num;
	}
	public void setMeter_num(String meter_num) {
		this.meter_num = meter_num;
	}
	public String getMeter_type() {
		return meter_type;
	}
	public void setMeter_type(String meter_type) {
		this.meter_type = meter_type;
	}
	public String getTotal_consumed() {
		return total_consumed;
	}
	public void setTotal_consumed(String total_consumed) {
		this.total_consumed = total_consumed;
	}
	public String[] getConsumed_days() {
		return consumed_days;
	}
	public void setConsumed_days(String[] consumed_days) {
		this.consumed_days = consumed_days;
	}
	

}
