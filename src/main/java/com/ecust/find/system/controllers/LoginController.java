package com.ecust.find.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecust.find.controllers.BaseController;

@Controller
public class LoginController extends BaseController{
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam("studentId") String studentId, HttpSession session){
		accountService.recordVisit(studentId);   
		session.setAttribute("studentId", studentId);
		return "choice";
	} 	

}
