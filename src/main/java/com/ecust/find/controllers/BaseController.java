package com.ecust.find.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

import com.ecust.find.account.service.AccountService;
import com.ecust.find.loser.service.LoserService;
import com.ecust.find.publisher.model.PublisherInfo;
import com.ecust.find.publisher.service.PublisherService;
import com.ecust.find.util.json.Jackson;

public class BaseController {
    
	@Autowired
    protected AccountService accountService;	
	
	@Autowired
	protected LoserService loserService;
	
	@Autowired
	protected PublisherService publisherService;
		
	@Async
	public void updateLoseStatusToProccessing(long loseId){
		loserService.updateLoseStatusToProccessing(loseId);
	}
	
	
	public String success(String url){
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("ifSuccess", "true");
		resultMap.put("message", url);		
		return Jackson.toJson(resultMap);		
	}
	
	public String fail(){
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("ifSuccess","false");
		resultMap.put("message", "");
		return Jackson.toJson(resultMap);
	}
	
	public String publishSuccess(PublisherInfo publisherInfo){
		Map<String ,String> resultMap = new HashMap<String, String>();
		resultMap.put("publisherName", publisherInfo.getName());
		return Jackson.toJson(resultMap);
	}
}
