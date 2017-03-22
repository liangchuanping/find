package com.ecust.find.publisher.service;

import com.ecust.find.publisher.model.LoseCardInfo;
import com.ecust.find.publisher.model.PublisherInfo;

public interface PublisherService {
  
	public void persistPublisherInfoAndReturnId(PublisherInfo publisherInfo);
	
	public void persistLoseCardInfo(LoseCardInfo loseCardInfo);
}
