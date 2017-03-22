package com.ecust.find.publisher.model;

public class PublisherInfo {
	   private int    id;
	   private String name;
	   private String phoneNumber;
	   private String weChat;
	   private String qq;
	   private String email;
	   private String comment;	 
	   	   
	   public void setId(int id){
		   this.id = id;
	   }
	   
	   public int getId(){
		  return id;
	   }
	   
	   public void setName(String name){
		   this.name =name;
	   }
	   
	   public String getName(){
		   return name;
	   }
	   
	   public void setPhoneNumber(String phoneNumber){
		  this.phoneNumber = phoneNumber; 
	   }
	   
	   public String getPhoneNumber(){
		   return phoneNumber;
	   }
	   
	   public void setWeChat(String weChat){
		   this.weChat = weChat;
	   }
	   
	   public String getWeChat(){
		   return weChat;
	   }
	   
	   public void setQq(String qq){
		   this.qq = qq;
	   }
	   
	   public String getQq(){
		   return qq;
	   }
	   
	   public void setEmail(String email){
		   this.email  = email;
	   }
	   
	   public String getEmail(){
		   return email;
	   }
	   
	   public void setComment(String comment){
		   this.comment = comment;
	   }
	   
	   public String getComment(){
		   return comment;
	   }
}
