package com.ecust.find.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Date2String {
	
    public static String date2String(Date date){
 		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm");
 		String dateString = dateFormat.format(date);
 		return dateString;
    }
}
