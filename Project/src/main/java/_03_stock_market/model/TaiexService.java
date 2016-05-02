package _03_stock_market.model;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArrayBuilder;

import org.hibernate.HibernateException;
import org.hibernate.Transaction;

import misc.HibernateUtil;
import _03_stock_market.model.dao.TaiexDAOHibernate;

public class TaiexService {	
	private TaiexDAO taiexDAO;	
	
	public void setTaiexDAO(TaiexDAO taiexDAO) {
		this.taiexDAO = taiexDAO;
	}

	public static void main(String[] args) {
		TaiexService taiexService=new TaiexService();
		TaiexDAOHibernate taiexDAOHibernate=new TaiexDAOHibernate();
		taiexDAOHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
		String taiexData;
		Transaction tx=null;
		try {
			tx=HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			taiexService.setTaiexDAO(taiexDAOHibernate);
			taiexData = taiexService.getTaiexData();
			System.out.println(taiexData);
			tx.commit();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
		}		
	}
	
	public String getTaiexData(){
		JsonArrayBuilder allDataArrayBuilder=Json.createArrayBuilder();
		List<TaiexBean> list=taiexDAO.select();
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
