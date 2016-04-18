package _06_message.model.dao;

import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _06_message.model.MessageBean;
import _06_message.model.MessageDAO;


public class MessageDAOHibernate implements MessageDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			
			MessageDAOHibernate dao = new MessageDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
//			List<MessageBean> bean = dao.select();
//			MessageBean bean = dao.selectByMno(5);
//			List<MessageBean> bean = dao.selectByAno(10);
			List<MessageBean> bean = dao.selectByAccount("sa");
//			MessageBean result = new MessageBean();
//			result.setMno(1);
//			result.setId(7);
//			result.setAno(4);
//			result.setMtime(new Date());
//			result.setMcontext("HAHAHAHA");
//			MessageBean bean = dao.insert(result);
//			MessageBean bean = dao.update(result);
//			boolean bean = dao.delete(13);
			System.out.println(bean);
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}

	@Override
	public List<MessageBean> select(){
		Query query = getSession().createQuery("from MessageBean");
		return (List<MessageBean>) query.list();
	}

	@Override
	public MessageBean selectByMno(int mno){
		return (MessageBean) getSession().get(MessageBean.class, mno);
	}

	@Override
	public List<MessageBean> selectByAccount(String account){
		Query query = getSession().createQuery("from MessageBean where account = ?");
		query.setParameter(0, account);
		return (List<MessageBean>) query.list();
	}

	@Override
	public List<MessageBean> selectByAno(int ano){
		Query query = getSession().createQuery("from MessageBean where ano = ?");
		query.setParameter(0, ano);
		return (List<MessageBean>) query.list();
	}

	@Override
	public MessageBean insert(MessageBean bean){
		if(bean != null){     // ???
			getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public MessageBean update(MessageBean bean){
		if(selectByMno(bean.getMno())!= null){
			MessageBean result = (MessageBean) selectByMno(bean.getMno());
			result.setAccount(bean.getAccount());

			result.setAno(bean.getAno());
			result.setMtime(bean.getMtime());
			result.setMcontext(bean.getMcontext());
			return result;
		}
		return null;
	}

	@Override
	public boolean delete(int mno){
		if(selectByMno(mno)!= null){
			getSession().delete(selectByMno(mno));
			return true;
		}
		return false;
	}
}
