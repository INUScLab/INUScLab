package sclab.db;

import java.util.ArrayList;

// BigData Report 페이지에서 사용될 클래스

public class ProcessedData {
	
	public ArrayList<ArrayList<String>> rank_difference;
	public ArrayList<ArrayList<String>> rank_leak;
	public ArrayList<ArrayList<String>> rank_absence;
	public ArrayList<ArrayList<String>> rank_overused;
	public ArrayList<ArrayList<String>> rank_freezed;
	public String avg_difference;
	public String avg_leak;
	public String avg_absence;
	public String avg_overused;
	public String avg_freezed;

	public ArrayList<ArrayList<String>> getRank_difference() {
		return rank_difference;
	}
	public void setRank_difference(ArrayList<ArrayList<String>> rank_difference) {
		this.rank_difference = rank_difference;
	}
	public ArrayList<ArrayList<String>> getRank_leak() {
		return rank_leak;
	}
	public void setRank_leak(ArrayList<ArrayList<String>> rank_leak) {
		this.rank_leak = rank_leak;
	}
	public ArrayList<ArrayList<String>> getRank_absence() {
		return rank_absence;
	}
	public void setRank_absence(ArrayList<ArrayList<String>> rank_absence) {
		this.rank_absence = rank_absence;
	}
	public ArrayList<ArrayList<String>> getRank_overused() {
		return rank_overused;
	}
	public void setRank_overused(ArrayList<ArrayList<String>> rank_overused) {
		this.rank_overused = rank_overused;
	}
	public ArrayList<ArrayList<String>> getRank_freezed() {
		return rank_freezed;
	}
	public void setRank_freezed(ArrayList<ArrayList<String>> rank_freezed) {
		this.rank_freezed = rank_freezed;
	}
	public String getAvg_difference() {
		return avg_difference;
	}
	public void setAvg_difference(String avg_difference) {
		this.avg_difference = avg_difference;
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
	public String getAvg_overused() {
		return avg_overused;
	}
	public void setAvg_overused(String avg_overused) {
		this.avg_overused = avg_overused;
	}
	public String getAvg_freezed() {
		return avg_freezed;
	}
	public void setAvg_freezed(String avg_freezed) {
		this.avg_freezed = avg_freezed;
	}
	
}
