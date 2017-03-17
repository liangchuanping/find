package com.ecust.find.loser.dao;

import java.util.List;

import com.ecust.find.loser.model.FindInfo;
import com.ecust.find.loser.model.LoseRecord;

public interface LoserDao {
     public List<LoseRecord> listAll(String studentId);
     
     public String getNameByLoseId(long loseId);	 
     
     public void updateLoseStatusToProccessing(long loseId);
     
     public int getFindIdByLoseId(long loseId);
     
     public String getStatusByLoseId(long loseId);
     
     public void updateCheckDate(long loseId);
     
     public FindInfo getFindInfoByFindId(int findId);
     
     public LoseRecord getSingleLoseRecord(long loseId);
     
     public void closeLoseRecordByLoseId(long loseId);
     
     public void updateCloseDate(long loseId);
}
