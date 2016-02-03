package sclab.db;

import java.util.ArrayList;

public class DetailData {
	// 기간 동안 사용량
	public ArrayList<String> consumed_days;

	// 사용량
	public String consumed;
	
	// 지역평균, 일주일평균
	public String avg_consumed;
	public String avg_week_consumed;
	
	// 누수 횟수, 부재중 횟수, 동파 횟수
	public String leak;
	public String absence;
	public String freezed;
	
	// 누수 횟수 평균, 부재중 횟수 평균, 동파 횟수 평균
	public String avg_leak;
	public String avg_absence;
	public String avg_freezed;
	
	public ArrayList<String> getConsumed_days() {
		return consumed_days;
	}
	public void setConsumed_days(ArrayList<String> consumed_days) {
		this.consumed_days = consumed_days;
	}
	public String getConsumed() {
		return consumed;
	}
	public void setConsumed(String consumed) {
		this.consumed = consumed;
	}
	public String getAvg_consumed() {
		return avg_consumed;
	}
	public void setAvg_consumed(String avg_consumed) {
		this.avg_consumed = avg_consumed;
	}
	public String getAvg_week_consumed() {
		return avg_week_consumed;
	}
	public void setAvg_week_consumed(String avg_week_consumed) {
		this.avg_week_consumed = avg_week_consumed;
	}
	public String getLeak() {
		return leak;
	}
	public void setLeak(String leak) {
		this.leak = leak;
	}
	public String getAbsence() {
		return absence;
	}
	public void setAbsence(String absence) {
		this.absence = absence;
	}
	public String getFreezed() {
		return freezed;
	}
	public void setFreezed(String freezed) {
		this.freezed = freezed;
	}
	public String getAvg_leak() {
		return avg_leak;
	}
	public void setAvg_leak(String avg_leak) {
		this.avg_leak = avg_leak;
	}
	public String getAvg_absence() {
		return avg_absence;
	}
	public void setAvg_absence(String avg_absence) {
		this.avg_absence = avg_absence;
	}
	public String getAvg_freezed() {
		return avg_freezed;
	}
	public void setAvg_freezed(String avg_freezed) {
		this.avg_freezed = avg_freezed;
	}
}
