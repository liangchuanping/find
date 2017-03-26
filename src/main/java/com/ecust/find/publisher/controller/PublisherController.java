package com.ecust.find.publisher.controller;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.find.controllers.BaseController;
import com.ecust.find.publisher.model.LoseCardInfo;
import com.ecust.find.publisher.model.PublisherInfo;
import com.ecust.find.util.json.PublishInfoJson;


@Controller
@RequestMapping(value = "publisher")
public class PublisherController extends BaseController{
	
	@RequestMapping(value = "/publisher_pre")
    public  String  navToPublic(Model model,HttpSession session){
		String publisherId  = (String)session.getAttribute("studentId");
		model.addAttribute("publisherId",publisherId);
		return "publisher/publisher_pub";
    }
	
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	@ResponseBody
	public String publicFindInfo(Model model, @RequestBody PublishInfoJson publishInfoJson){
		 PublisherInfo  publisherInfo = publishInfoJson.getPublisherInfo();
		 publisherService.persistPublisherInfoAndReturnId(publisherInfo);
		 int findId = publisherInfo.getId();		
		 LoseCardInfo loseCardInfo = publishInfoJson.getLoseCardInfo();
		 loseCardInfo.setFindId(findId);
		 publisherService.persistLoseCardInfo(loseCardInfo);
		 return publishSuccess(publisherInfo);
		  
     }
}