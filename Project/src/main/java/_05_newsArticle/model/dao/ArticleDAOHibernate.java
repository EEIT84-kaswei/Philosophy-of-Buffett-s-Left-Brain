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
		Query query = getSession().createQuery("from ArticleBean ORDER BY atime DESC");			
		return (List<ArticleBean>) query.list();
	}

	@Override
	public List<ArticleBean> selectByAccount(String account) {
		Query query = getSession().createQuery("from ArticleBean where account = ?");
		query.setParameter(0, account);
		return (List<ArticleBean>) query.list();
	}

	@Override
	public ArticleBean selectByAno(int ano){	//改用HQL
		ArticleBean bean = null;
		Query query = getSession().createQuery("from ArticleBean where ano = ?");
		query.setParameter(0, ano);
		List<ArticleBean> list = query.list();
		if(!list.isEmpty()){
			bean = list.get(0);
		}
		return bean;
//		return (ArticleBean) getSession().get(ArticleBean.class, ano);
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
		if(atitle!=null){
			Query query=getSession().createQuery("update ArticleBean set account=:account, aname=:aname, atime=:atime, atitle=:atitle, acontext=:acontext where atitle=:atitle");
			query.setParameter("account", account);
			query.setParameter("aname", aname);
			query.setParameter("atime", new Date());
			query.setParameter("atitle", atitle);
			query.setParameter("acontext", acontext);
			query.setParameter("atitle", atitle);
			int result=query.executeUpdate();
			System.out.println(result);
//			ArticleBean result = (ArticleBean) getSession().get(ArticleBean.class, atitle);
//			result.setAccount(account);
//			result.setAname(aname);
//			result.setAtime(new Date());
//			result.setAtitle(atitle);
//			result.setAcontext(acontext);
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
