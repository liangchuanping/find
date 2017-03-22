package com.ecust.find.loser.model;


import java.util.Date;

import com.ecust.find.util.Date2String;
import com.ecust.find.util.enums.CardStatus;

public class LoseRecord {
	private long recordId;
	
	private String studentId;
	
	private String name;
	
	private int findId;
	
	private Date findDate;
	
	private Date checkDate;
	
	private Date closeDate;
	
	private CardStatus cardStatus;
	
	public void setRecordId(long recordId){
		this.recordId = recordId;
	}
	
	public long getRecordId(){
		return recordId;
	}
	
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
	
 	public int getFind(){
 		return findId;
 	}
 	
 	public void setFind(int findId){
 		this.findId = findId;
 	}
 	
 	public String getCheckDate(){
 		return Date2String.date2String(checkDate); 		 
 	}
 	
 	public void setCheckDate(Date checkDate){
 		this.checkDate = checkDate;
 	}
		 	
 	public String getFindDate(){
 		return Date2String.date2String(findDate); 		 
 	}
 	
 	public void setFindDate(Date findDate){
 		this.findDate = findDate;
 	}
 	public String getCloseDate(){
 		return Date2String.date2String(closeDate); 		 
 	}
 	
 	public void setCloseDate(Date closeDate){
 		this.closeDate = closeDate;
 	}
 	public void setCardStatus(CardStatus cardStatus){
 		this.cardStatus = cardStatus;
 	}
 	
 	public String getCardStatus(){
 		return cardStatus.toString();
 	}
  }


