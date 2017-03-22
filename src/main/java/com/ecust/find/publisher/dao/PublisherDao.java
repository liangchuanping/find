package com.ecust.find.publisher.dao;

import com.ecust.find.publisher.model.LoseCardInfo;
import com.ecust.find.publisher.model.PublisherInfo;

public interface PublisherDao { 
	
	public void insertPublisherInfoAndReturnId(PublisherInfo pulisherInfo);
	
	public void persistLoseCardInfo(LoseCardInfo loseCardInfo);
}
