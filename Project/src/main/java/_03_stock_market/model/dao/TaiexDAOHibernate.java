package _03_stock_market.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import _03_stock_market.model.TaiexBean;
import _03_stock_market.model.TaiexDAO;
import misc.HibernateUtil;

public class TaiexDAOHibernate implements TaiexDAO {
	private Session session;	

	public TaiexDAOHibernate(Session session) {
		this.session = session;
	}
	
	public Session getSession(){
		return session;
	}
	
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			TaiexDAOHibernate dao = new TaiexDAOHibernate(session);
//			List<TaiexBean> bean = dao.select();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			java.util.Date dateTime = sdf1.parse("2016-03-01 00:00:05");
//			TaiexBean bean = dao.select(dateTime);
//			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
//			java.util.Date date = sdf2.parse("2016-03-01");
//			List<TaiexBean> bean = dao.selectByDate(date);
//			TaiexBean result = new TaiexBean();
//			result.settDateTime(dateTime);
//			result.settDate(date);
//			result.setTaiex(5678.0);
//			TaiexBean bean = dao.insert(result);
//			TaiexBean bean = dao.update(result);
			boolean bean = dao.delete(dateTime);
			
			System.out.println(bean);
			
			session.getTransaction().commit();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}
	
	@Override
	public List<TaiexBean> select(){
		Query query = getSession().createQuery("from TaiexBean");
		return (List<TaiexBean>) query.list();
	}

	@Override
	public TaiexBean select(java.util.Date tDateTime){
		if(tDateTime != null){
			return (TaiexBean) getSession().get(TaiexBean.class, tDateTime);			
		}
		return null;
	}

	@Override
	public List<TaiexBean> selectByDate(java.util.Date tDate){
		Query query = getSession().createQuery("from TaiexBean where tDate = ?");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(tDate);
		query.setParameter(0, java.sql.Date.valueOf(date));
		return (List<TaiexBean>) query.list();
	}

	@Override
	public TaiexBean insert(TaiexBean bean){
		if(select(bean.gettDateTime())==null){			
			getSession().save(bean);
			TaiexBean result = select(bean.gettDateTime());
			result.setTaiex_Code("POW00");
			return result;
		}
		return null;
	}

	@Override
	public TaiexBean update(TaiexBean bean){
		if(select(bean.gettDateTime())!=null){
			TaiexBean result = select(bean.gettDateTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				java.util.Date date = sdf.parse(bean.gettDateTime().toString());
				result.settDate(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			result.setTaiex_Code("POW00");
			result.setTaiex(bean.getTaiex());
			result.setTaiex_Volume(bean.getTaiex_Volume());
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(java.util.Date tDateTime){
		if(select(tDateTime)!=null){
			getSession().delete(select(tDateTime));
			return true;
		}
		return false;
	}
}
