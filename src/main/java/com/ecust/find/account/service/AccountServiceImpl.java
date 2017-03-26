package com.ecust.find.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecust.find.account.dao.AccountDao;

@Transactional
@Service
public class AccountServiceImpl implements AccountService {
	
   @Autowired
   AccountDao accountDao;
     
   public void recordVisit(String studentId){
	   accountDao.recordVisit(studentId);
   }
}
