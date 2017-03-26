package com.ecust.find.loser.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecust.find.loser.dao.LoserDao;
import com.ecust.find.loser.model.FindInfo;
import com.ecust.find.loser.model.LoseRecord;

@Transactional
@Service
public class LoserServiceImpl implements LoserService{
    
	@Autowired
	LoserDao loserDao;	

	public List<LoseRecord> listAll(String studentId){
		return loserDao.listAll(studentId);
	}

	public String findNameByLoseId(long loseId){
		return loserDao.getNameByLoseId(loseId);
	}

	public void updateLoseStatusToProccessing(long loseId) {
		loserDao.updateLoseStatusToProccessing(loseId);
		
	}

	public int getFindIdByLoseId(long loseId) {
		return loserDao.getFindIdByLoseId(loseId);
	}

	public FindInfo getFindInfoByFindId(int findId) {
		return loserDao.getFindInfoByFindId(findId);
	}

	public LoseRecord getSingleLoseRecord(long loseId) {
        return loserDao.getSingleLoseRecord(loseId);
	}

	public void updateCheckDate(long loseId) {
		loserDao.updateCheckDate(loseId);
		
	}

	public void closeLoseRecordByLoseId(long loseId) {
	    loserDao.closeLoseRecordByLoseId(loseId);
	}
	
	public void updataCloseDate(long loseId){
		loserDao.updateCloseDate(loseId);
	}

	public String getStatusByLoseId(long loseId) {
		return loserDao.getStatusByLoseId(loseId);
	}		
}

