package sclab.db;

import java.util.ArrayList;

// BigData Report 페이지에서 사용될 클래스

public class ProcessedData {
	
	public ArrayList<ArrayList<String>> rank_difference;
	public ArrayList<ArrayList<String>> rank_leak;
	public ArrayList<ArrayList<String>> rank_absence;
	public ArrayList<ArrayList<String>> rank_overused;
	public ArrayList<ArrayList<String>> rank_freezed;
	
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
	
}
