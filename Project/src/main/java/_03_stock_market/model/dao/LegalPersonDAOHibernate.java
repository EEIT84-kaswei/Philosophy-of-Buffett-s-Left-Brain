package _03_stock_market.model.dao;
/* 廖千慧, 07-04-2016 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _03_stock_market.model.LegalPersonBean;
import _03_stock_market.model.LegalPersonDAO;
import misc.HibernateUtil;

public class LegalPersonDAOHibernate implements LegalPersonDAO {
	private SessionFactory sessionFactory;

	public void setLegalPersonDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {
		LegalPersonDAOHibernate dao = new LegalPersonDAOHibernate();
		dao.setLegalPersonDAOHibernate(HibernateUtil.getSessionFactory());
		Transaction tx = null;
		
		try {
			Session session = dao.getSession();
			tx = session.beginTransaction();
			
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
//			boolean bean = dao.delete(date);
			
//			System.out.println(bean);
			
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
	public LegalPersonBean selectByDateCode(Integer stock_Code ,Date ldate){
		LegalPersonBean personBean = new LegalPersonBean();
		personBean.setStock_Code(stock_Code);
		personBean.setLdate(ldate);		
		return this.getSession().get(LegalPersonBean.class, personBean);
	}

	@Override
	public LegalPersonBean insert(LegalPersonBean bean){
		
		System.out.println(bean);
		
		LegalPersonBean personBean = new LegalPersonBean();
		personBean.setStock_Code(bean.getStock_Code());
		personBean.setLdate(bean.getLdate());	
		LegalPersonBean isBeanExist = this.getSession().get(LegalPersonBean.class, personBean);		
		
		System.out.println("isBeanExist = " + isBeanExist);
		
		if(isBeanExist==null){
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public LegalPersonBean update(LegalPersonBean bean){
		LegalPersonBean personBean = new LegalPersonBean();
		personBean.setStock_Code(bean.getStock_Code());
		personBean.setLdate(bean.getLdate());
		LegalPersonBean isBeanExist = this.getSession().get(LegalPersonBean.class, personBean);		
		if(isBeanExist!=null){
			isBeanExist.setLdate(bean.getLdate());
			isBeanExist.setStock_Code(bean.getStock_Code());
			isBeanExist.setFC_Trade_Count(bean.getFC_Trade_Count());
			isBeanExist.setIT_Trade_Count(bean.getFC_Trade_Count());
			isBeanExist.setSD_Trade_Count(bean.getSD_Trade_Count());
		}
		return isBeanExist; //有進if就會有值，沒進就會是NULL
	}

	@Override
	public boolean delete(Integer stock_Code ,Date ldate){
		LegalPersonBean personBean = new LegalPersonBean();
		personBean.setStock_Code(stock_Code);
		personBean.setLdate(ldate);
		LegalPersonBean isBeanExist = this.getSession().get(LegalPersonBean.class, personBean);	
		if(isBeanExist!=null){
			this.getSession().delete(isBeanExist);
			return true;
		}
		return false;
	}
}
