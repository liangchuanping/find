package com.ecust.find.loser.service;

import java.util.List;

import com.ecust.find.loser.model.FindInfo;
import com.ecust.find.loser.model.LoseRecord;

public interface LoserService {
 
   public List<LoseRecord>listAll(String studentId);	  
   
   public String findNameByLoseId(long loseId);
   
   public void updateLoseStatusToProccessing(long loseId);
   
   public int getFindIdByLoseId(long loseId);
   
   public String getStatusByLoseId(long loseId);

   
   public void updateCheckDate(long loseId);
   
   public LoseRecord getSingleLoseRecord(long loseId);
   
   public FindInfo getFindInfoByFindId(int findId);
   
   public void closeLoseRecordByLoseId(long loseId);
   
   public void updataCloseDate(long loseId);
   
}
