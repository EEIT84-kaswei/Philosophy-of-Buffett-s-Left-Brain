package _03_stock_market.model;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;

public class TaiexService {	
	private TaiexDAO taiexDAO;	
	
	public void setTaiexDAO(TaiexDAO taiexDAO) {
		this.taiexDAO = taiexDAO;
	}

	public static void main(String[] args) {		

	}
	
	public String getTaiexData(){
		Calendar cal=Calendar.getInstance();
		int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
		if(dayOfWeek==1){
			cal.add(Calendar.DAY_OF_WEEK, -2);
		}else if(dayOfWeek==7){
			cal.add(Calendar.DAY_OF_WEEK, -1);
		}
		Date targetTime=cal.getTime();
		JsonArrayBuilder allDataArrayBuilder=Json.createArrayBuilder();
		List<TaiexBean> list=taiexDAO.selectByDate(targetTime);
		Iterator<TaiexBean> it=list.iterator();
		while(it.hasNext()){
			TaiexBean bean=it.next();
			JsonArrayBuilder oneDataArrayBuilder=Json.createArrayBuilder();
			long timeMillis=bean.gettDateTime().getTime();
			oneDataArrayBuilder.add(timeMillis);
			oneDataArrayBuilder.add(bean.getTaiex());
			oneDataArrayBuilder.add(bean.getTaiex_Volume());
			allDataArrayBuilder.add(oneDataArrayBuilder);
		}
		String allDataStr=allDataArrayBuilder.build().toString();
		return allDataStr;
	}

}
