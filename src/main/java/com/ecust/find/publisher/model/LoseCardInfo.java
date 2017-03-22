package com.ecust.find.publisher.model;


public class LoseCardInfo {
	
	private String studentId;
	
	private String name;
	
	private int findId;
	
	public void setStudentId(String studentId){
		this.studentId = studentId;
	}
	
	public String getStudentId(){
		return studentId;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return name;
	}
	
	public void setFindId(int findId){
		this.findId = findId;
	}
	
	public int getFindId(){
	     return findId;
	}
	
}
