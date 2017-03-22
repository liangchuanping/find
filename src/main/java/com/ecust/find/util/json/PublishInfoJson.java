package com.ecust.find.util.json;

import com.ecust.find.publisher.model.LoseCardInfo;
import com.ecust.find.publisher.model.PublisherInfo;

public class PublishInfoJson {
       
	   private String cardId;
	   private String cardName;
	
	   private String name;
	   private String phoneNumber;
	   private String weChat;
	   private String qq;
	   private String email;
	   private String comment;	 
	   	   
	   
	   public void setCardId(String cardId){
		   this.cardId = cardId;	
	   }
	   
	   public String getCardId(){
		   return cardId;
	   }
	   
	   public void setCardName(String cardName){
		   this.cardName = cardName;
	   }
	   
	   public String getCardName(){
		  return cardName;   
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
	   
	   
	   public LoseCardInfo getLoseCardInfo(){
		   LoseCardInfo loseCardInfo = new LoseCardInfo();
		   loseCardInfo.setName(cardName);
		   loseCardInfo.setStudentId(cardId);
		   return loseCardInfo;
	   }
	   
	   public PublisherInfo getPublisherInfo(){
		   PublisherInfo publisherInfo = new PublisherInfo();
		   publisherInfo.setName(name);
		   publisherInfo.setPhoneNumber(phoneNumber);
		   publisherInfo.setWeChat(weChat);
		   publisherInfo.setQq(qq);
		   publisherInfo.setEmail(email);
		   publisherInfo.setComment(comment);
		   return publisherInfo;
	   }
}
