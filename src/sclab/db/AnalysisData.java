package sclab.db;

public class AnalysisData {

	public String code; // 수용가 번호
	public String detail; // 수용가명
	public String number; // 지시부 번호
	public String meter_num; // 미터 번호
	public String meter_type; // 미터 타입
	public String term; // 기간
	public String total_consumed; // 총사용량
	public String count; // 일/월/년 수
	public String avg_consumed; // 일/월/년 평균 사용량
	
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
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getTotal_consumed() {
		return total_consumed;
	}
	public void setTotal_consumed(String total_consumed) {
		this.total_consumed = total_consumed;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getAvg_consumed() {
		return avg_consumed;
	}
	public void setAvg_consumed(String avg_consumed) {
		this.avg_consumed = avg_consumed;
	}
	
}
