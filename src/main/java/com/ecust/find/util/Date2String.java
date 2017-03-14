package com.ecust.find.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Date2String {
	
    public static String date2String(Date date){
 		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
 		String dateString = dateFormat.format(date);
 		String needDateFormat = dateString.substring(0, dateString.length()-3);
 		return needDateFormat;
    }
}
