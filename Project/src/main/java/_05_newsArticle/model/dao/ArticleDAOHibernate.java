package _05_newsArticle.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.Date;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import _05_newsArticle.model.ArticleBean;
import _05_newsArticle.model.ArticleDAO;

public class ArticleDAOHibernate implements ArticleDAO{
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public static void main(String[] args) {
		try {
			ArticleDAOHibernate dao = new ArticleDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}
	@Override
	public List<ArticleBean> select(){
		Query query = getSession().createQuery("from ArticleBean ORDER BY ano DESC");			
		return (List<ArticleBean>) query.list();
	}

	@Override
	public List<ArticleBean> selectByAccount(String account) {
		Query query = getSession().createQuery("from ArticleBean where account = ?");
		query.setParameter(0, account);
		return (List<ArticleBean>) query.list();
	}

	@Override
	public ArticleBean selectByAno(int ano){
		return (ArticleBean) getSession().get(ArticleBean.class, ano);
	}
	
	@Override
	public List<ArticleBean> selectByAname(String aname) {
		Query query = getSession().createQuery("from ArticleBean where aname like:name ORDER BY atime DESC");
		query.setParameter("name","%"+aname+"%");
		return (List<ArticleBean>) query.list();
	}
	
	@Override
	public ArticleBean insert(ArticleBean bean){
			getSession().save(bean);
			return bean;
	}
	
	@Override
	public boolean update(Integer ano, String account, String aname, String atitle, String acontext){
		if(ano != 0||ano!=null){
			ArticleBean result = (ArticleBean) getSession().get(ArticleBean.class, ano);
			result.setAccount(account);
			result.setAname(aname);
			result.setAtime(new Date());
			result.setAtitle(atitle);
			result.setAcontext(acontext);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(int ano){
		if(selectByAno(ano)!=null){
			getSession().delete(selectByAno(ano));
			return true;
		}
		return false;
	}

}
