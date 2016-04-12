package _05_newsArticle.model;

import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _05_newsArticle.model.dao.ArticleDAOHibernate;

public class ArticleService {
	private ArticleDAO ArticleDAO;
	public void setArticleDAO(ArticleDAO ArticleDAO) {
		this.ArticleDAO = ArticleDAO;
	}
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction transaction = session.beginTransaction();

			ArticleDAOHibernate dao = new ArticleDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
			ArticleService service = new ArticleService();
			service.setArticleDAO(dao);
			List<ArticleBean> beans = service.selectByAname("Lara");
			for(ArticleBean bs:beans){
			System.out.println("bs="+bs);
			}
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	public List<ArticleBean> select() {
		System.out.println("Servicec呼叫DAO.selectPage前");
		List<ArticleBean> result = ArticleDAO.select(); 
		System.out.println("Servicec呼叫DAO.selectPage後");
		return result;
	}
	public List<ArticleBean> selectByAname(String bean) {
		List<ArticleBean> result = null;
		if(bean!=null && bean.trim().length()!=0) {
			result = ArticleDAO.selectByAname(bean);
		}
		return result;
	}
	public ArticleBean selectByAno(ArticleBean bean) {
		ArticleBean result = null;
		if(bean!=null && bean.getAname().trim().length()!=0) {
			result = ArticleDAO.selectByAno(bean.getAno());
		}
		return result;
	}
	public ArticleBean insert(ArticleBean bean) {
		ArticleBean result = null;
		if(bean!=null) {
			result = ArticleDAO.insert(bean);
		}
		return result;
	}
	public boolean update(ArticleBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = ArticleDAO.update(bean.getAno(),bean.getId(),bean.getAname(),bean.getAtitle(),bean.getAcontext());
		}
		return result;
	}
	public boolean delete(ArticleBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = ArticleDAO.delete(bean.getAno());
		}
		return result;
	}

}
