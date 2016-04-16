package _02_login.model.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Test {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.getTime());
		System.out.println(cal.get(Calendar.DAY_OF_WEEK));
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd");
		String yesterdayStr = sformat.format(cal.getTime());
		System.out.println(yesterdayStr);
	}

}
