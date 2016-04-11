package _05_newsArticle.model.dao;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import _05_newsArticle.model.ArticleBean;
import _05_newsArticle.model.ArticleDAO;
import misc.HibernateUtil;

public class ArticleDAOHibernate implements ArticleDAO{
	private Session session = null;

	public ArticleDAOHibernate(Session session) {
		this.session = session;
	}

	public Session getSession() {
		return session;
	}
	
	public static void main(String[] args) {
		try {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			ArticleDAOHibernate dao = new ArticleDAOHibernate(session);
			
//			List<ArticleBean> bean = dao.select();
//			ArticleBean bean = dao.select(5);
			
			ArticleBean ab = new ArticleBean();
//			ab.setAno(11);
			ab.setId(5);
			ab.setAname("ABC");
			ab.setAtime(new Date());
			ab.setAtitle("ABCdefg");
			ab.setAcontext("123456789");
			ArticleBean bean = dao.insert(ab);
//			ArticleBean bean = dao.update(ab);
//			boolean bean = dao.delete(12);
//			List<ArticleBean> bean = dao.selectByid(1);
//			List<ArticleBean> bean = dao.selectByAname("Lara");
			
			System.out.println(bean);
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}

	@Override
	public List<ArticleBean> select(){
		Query query = getSession().createQuery("from ArticleBean");
		return (List<ArticleBean>) query.list();
	}

	@Override
	public List<ArticleBean> selectByid(int id) {
		Query query = getSession().createQuery("from ArticleBean where id = ?");
		query.setParameter(0, id);
		return (List<ArticleBean>) query.list();
	}

	@Override
	public ArticleBean selectByAno(int ano){
		return (ArticleBean) getSession().get(ArticleBean.class, ano);
	}
	
	@Override
	public List<ArticleBean> selectByAname(String aname) {
		Query query = getSession().createQuery("from ArticleBean where aname = ?");
		query.setParameter(0, aname);
		return (List<ArticleBean>) query.list();
	}
	
	@Override
	public ArticleBean insert(ArticleBean bean){
		if(selectByAno(bean.getAno()) == null){
			getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	@Override
	public ArticleBean update(ArticleBean bean){
		if(selectByAno(bean.getAno()) != null){
			ArticleBean result = (ArticleBean) getSession().get(ArticleBean.class, bean.getAno());
			result.setId(bean.getId());
			result.setAname(bean.getAname());
			result.setAtime(bean.getAtime());
			result.setAtitle(bean.getAtitle());
			result.setAcontext(bean.getAcontext());
			return result;
		}
		return null;
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
