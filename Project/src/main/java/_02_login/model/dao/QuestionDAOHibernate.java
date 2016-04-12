package _02_login.model.dao;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;
import _02_login.model.QuestionBean;
import _02_login.model.QuestionDAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class QuestionDAOHibernate implements QuestionDAO{
	private SessionFactory sessionFactory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public static void main (String[]args){
		QuestionDAOHibernate dao = new QuestionDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Date date = null;
		QuestionBean bean = null;
//		try {
//			session.beginTransaction();
//			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
//			try {
//				date = sFormat.parse("1905-06-29 00-00-00");
//			} catch (ParseException e) {
//				
//				e.printStackTrace();
//			}
//			Timestamp stamp = new Timestamp(date.getTime());
//			
//			bean = dao.select(1, stamp);
//			session.getTransaction().commit();
//		} catch (Exception e) {
//			session.getTransaction().rollback();
//			e.printStackTrace();
//		}
//		
//		System.out.println(bean);//查詢==================================
//		List<QuestionBean> beans = null;
//		try {
//			session.beginTransaction();
//			beans = dao.selectAll();
//			session.getTransaction().commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(beans);//查詢全部==============================
		
//		QuestionBean bean = null;
		QuestionBean bean1 = null;
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		try {
			date = sFormat.parse("2016-04-11 12-12-12");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp stamp = new Timestamp(date.getTime());
		try {
			session.beginTransaction();
			bean = new QuestionBean();
			bean.setId(4);
			bean.setQDate(stamp);
			bean.setRisk_Tolerance(3);
			bean.setScores(15);
			bean1 = dao.insert(bean);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		System.out.println(bean1);
	}
	
	
	
	
	@Override
	public QuestionBean select(Integer id, Timestamp QDate) {
		QuestionBean bean = new QuestionBean();
		bean.setId(id);
		bean.setQDate(QDate);
		return this.getSession().get(QuestionBean.class, bean);
	}
	private static final String SELECT_ALL = "from QuestionBean order by id";
	@Override
	public List<QuestionBean> selectAll() {		
		Query query = getSession().createQuery(SELECT_ALL);
		return (List<QuestionBean>)query.list();
	}
	@Override
	public QuestionBean insert(QuestionBean bean) {
		QuestionBean bean1 = new QuestionBean();
		bean1.setId(bean.getId());
		bean1.setQDate(bean.getQDate());
		bean1.setRisk_Tolerance(bean.getRisk_Tolerance());
		bean1.setScores(bean.getScores());
		QuestionBean result = this.getSession().get(QuestionBean.class, bean1);
		this.getSession().save(bean1);
		return bean;
		
	}
	
	
}
