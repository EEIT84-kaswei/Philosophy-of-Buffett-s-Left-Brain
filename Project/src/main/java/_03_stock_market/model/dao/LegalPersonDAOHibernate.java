package _03_stock_market.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import _03_stock_market.model.LegalPersonBean;
import _03_stock_market.model.LegalPersonDAO;
import misc.HibernateUtil;

public class LegalPersonDAOHibernate implements LegalPersonDAO {
	private Session session;

	public LegalPersonDAOHibernate(Session session) {
		this.session = session;
	}
	
	public Session getSession(){
		return session;
	}
	
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			LegalPersonDAOHibernate dao = new LegalPersonDAOHibernate(session);
//			List<LegalPersonBean> bean = dao.select();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf.parse("2016-03-01");
//			LegalPersonBean bean = dao.selectByDate(date);
//			LegalPersonBean result = new LegalPersonBean();
//			result.setLdate(date);
//			result.setFCBuy_Count(31);
//			result.setFCSale_Count(31);
//			result.setITBuy_Count(31);
//			result.setITSale_Count(31);
//			result.setSFBuy_Count(31);
//			result.setSFSale_Count(31);
//			LegalPersonBean bean = dao.insert(result);
//			LegalPersonBean bean = dao.update(result);
			boolean bean = dao.delete(date);
			
			System.out.println(bean);
			
			session.getTransaction().commit();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}

	@Override
	public List<LegalPersonBean> select(){
		Query query = getSession().createQuery("from LegalPersonBean");
		return (List<LegalPersonBean>) query.list();
	}

	@Override
	public LegalPersonBean selectByDate(java.util.Date ldate){
		return (LegalPersonBean) getSession().get(LegalPersonBean.class, ldate);
	}

	@Override
	public LegalPersonBean insert(LegalPersonBean bean){
		if(selectByDate(bean.getLdate())==null){
			getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public LegalPersonBean update(LegalPersonBean bean){
		if(selectByDate(bean.getLdate())!=null){
			LegalPersonBean result = selectByDate(bean.getLdate());
			result.setFCBuy_Count(bean.getFCBuy_Count());
			result.setFCSale_Count(bean.getFCSale_Count());
			result.setITBuy_Count(bean.getITBuy_Count());
			result.setITSale_Count(bean.getITSale_Count());
			result.setSFBuy_Count(bean.getSFBuy_Count());
			result.setSFSale_Count(bean.getSFSale_Count());
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(java.util.Date ldate){
		if(selectByDate(ldate)!=null){
			getSession().delete(selectByDate(ldate));
			return true;
		}
		return false;
	}
}
