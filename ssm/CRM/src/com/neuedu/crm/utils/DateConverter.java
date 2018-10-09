package com.neuedu.crm.utils;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import org.springframework.core.convert.converter.Converter;

public class DateConverter implements Converter<String,Date>{

	public Date convert(String source) {
		 SimpleDateFormat sdf = new SimpleDateFormat();
	        if (Pattern.matches("^\\d{4}-\\d{2}-\\d{2}$", source)) { // yyyy-MM-dd
	            sdf = new SimpleDateFormat("yyyy-MM-dd");
	        } else if (Pattern.matches("^\\d{4}-\\d{2}-\\d{2} \\d{2}-\\d{2}-\\d{2}$", source)) { // yyyy-MM-dd HH-mm-ss
	            sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
	        } else if (Pattern.matches("^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", source)) { // yyyy-MM-dd HH:mm:ss
	            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        } else if (Pattern.matches("^\\d{4}/\\d{2}/\\d{2}$", source)) { // yyyy/MM/dd
	            sdf = new SimpleDateFormat("yyyy/MM/dd");
	        } else if (Pattern.matches("^\\d{4}/\\d{2}/\\d{2} \\d{2}/\\d{2}/\\d{2}$", source)) { // yyyy/MM/dd HH/mm/ss
	            sdf = new SimpleDateFormat("yyyy/MM/dd HH/mm/ss");
	        }  else if (Pattern.matches("^\\d{4}\\d{2}\\d{2}$", source)) { // yyyyMMdd
	            sdf = new SimpleDateFormat("yyyyMMdd");
	        }  else if (Pattern.matches("^\\d{4}\\d{2}\\d{2} \\d{2}\\d{2}\\d{2}$", source)) { // yyyyMMdd HHmmss
	            sdf = new SimpleDateFormat("yyyyMMdd HHmmss");
	        } else if (Pattern.matches("^\\d{4}\\.\\d{2}\\.\\d{2}$", source)) { // yyyy.MM.dd
	            sdf = new SimpleDateFormat("yyyy.MM.dd");
	        }  else if (Pattern.matches("^\\d{4}\\.\\d{2}\\.\\d{2} \\d{2}\\.\\d{2}\\.\\d{2}$", source)) { // yyyy.MM.dd HH.mm.ss
	            sdf = new SimpleDateFormat("yyyy.MM.dd HH.mm.ss");
	        }else{
	        	return null;
	        }
        try {
            Date date = sdf.parse(source);
            return date;
        } catch (Exception e) {
           System.out.println("error");
        }
       return null;
    }

}
