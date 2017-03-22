package com.ecust.find.loser.model;

public class FindInfo {
   private int    infoId;
   private String name;
   private String phoneNumber;
   private String weChat;
   private String qq;
   private String email;
   private String comment;
   
   public void setInfoId(int id){
	   this.infoId = id;
   }
   
   public int getInfoId(){
	  return infoId;    
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
