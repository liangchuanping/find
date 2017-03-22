package com.ecust.find.publisher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecust.find.publisher.dao.PublisherDao;
import com.ecust.find.publisher.model.LoseCardInfo;
import com.ecust.find.publisher.model.PublisherInfo;

@Transactional
@Service
public class PublisherServiceImpl implements PublisherService {
 
	@Autowired
    PublisherDao publisherDao;
	
	public void persistPublisherInfoAndReturnId(PublisherInfo publisherInfo){
		 publisherDao.insertPublisherInfoAndReturnId(publisherInfo);		
	}
	
	public void persistLoseCardInfo(LoseCardInfo loseCardInfo){
		publisherDao.persistLoseCardInfo(loseCardInfo);
	}
	
}
