package com.ecust.find.loser.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.find.controllers.BaseController;
import com.ecust.find.loser.model.FindInfo;
import com.ecust.find.loser.model.LoseRecord;
import com.ecust.find.util.NameCheckHelper;
import com.ecust.find.util.enums.CardStatus;

@Controller
@RequestMapping(value ="loser")
public class LoserController extends BaseController{
   
	@RequestMapping(value = "/loser_pre/{device}")
	public String listRecord(Model model, @PathVariable("device") String deviceUrl,HttpSession session){
		String studentId = (String)session.getAttribute("studentId");
		List<LoseRecord> loseRecords = loserService.listAll(studentId);
		model.addAttribute("loseRecords", loseRecords);
		return "loser/"+deviceUrl;
	}
	
	@RequestMapping(value = "/check")	
	@ResponseBody
	public String validName(@RequestParam(value="loseId") long loseId, HttpServletRequest req){		
        String status = loserService.getStatusByLoseId(loseId);
		String studentName;
		try {
			studentName = new String(req.getParameter("studentName").getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			studentName ="";
			e.printStackTrace();
		} 
		String expectName = loserService.findNameByLoseId(loseId);
		if(NameCheckHelper.checkEquals(studentName, expectName)){ 
			if(status.equals( CardStatus.PUBLICED.toString())){
				updateLoseStatusToProccessing(loseId);
				loserService.updateCheckDate(loseId);
			}				
			return  success("/loser/loser_success");
		}else{
			return fail();
		}		
	}
	
	@RequestMapping(value = "/loser_success")	
	public String validSuccess(Model model, 
			         @RequestParam(value="loseId") long loseId){	
		LoseRecord  loseRecord = loserService.getSingleLoseRecord(loseId);
		int findId = loserService.getFindIdByLoseId(loseId);
		FindInfo findInfo = loserService.getFindInfoByFindId(findId);
		model.addAttribute("findInfo", findInfo);
		model.addAttribute("loseRecord", loseRecord);
		return "loser/loser_success";
	}
	
	@RequestMapping(value = "/closeRecord")
	@ResponseBody
	public String closeRecord(@RequestParam(value = "loseId") long loseId,@RequestParam(value = "loseStatus") String loseStatus){
		if(!loseStatus.equals(CardStatus.CLOSED.toString())){
		loserService.closeLoseRecordByLoseId(loseId);
		loserService.updataCloseDate(loseId);
		}
    	return  success("");
	}	
}
