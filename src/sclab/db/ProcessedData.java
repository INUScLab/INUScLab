package sclab.db;

import java.util.ArrayList;

// BigData Report 페이지에서 사용될 클래스

public class ProcessedData {
	
	public ArrayList<ArrayList<String>> lank_difference;
	public ArrayList<ArrayList<String>> lank_leak;
	public ArrayList<ArrayList<String>> lank_absence;
	public ArrayList<ArrayList<String>> lank_overused;
	public ArrayList<ArrayList<String>> lank_freezed;
	
	public ArrayList<ArrayList<String>> getLank_difference() {
		return lank_difference;
	}
	public void setLank_difference(ArrayList<ArrayList<String>> lank_difference) {
		this.lank_difference = lank_difference;
	}
	public ArrayList<ArrayList<String>> getLank_leak() {
		return lank_leak;
	}
	public void setLank_leak(ArrayList<ArrayList<String>> lank_leak) {
		this.lank_leak = lank_leak;
	}
	public ArrayList<ArrayList<String>> getLank_absence() {
		return lank_absence;
	}
	public void setLank_absence(ArrayList<ArrayList<String>> lank_absence) {
		this.lank_absence = lank_absence;
	}
	public ArrayList<ArrayList<String>> getLank_overused() {
		return lank_overused;
	}
	public void setLank_overused(ArrayList<ArrayList<String>> lank_overused) {
		this.lank_overused = lank_overused;
	}
	public ArrayList<ArrayList<String>> getLank_freezed() {
		return lank_freezed;
	}
	public void setLank_freezed(ArrayList<ArrayList<String>> lank_freezed) {
		this.lank_freezed = lank_freezed;
	}
}
