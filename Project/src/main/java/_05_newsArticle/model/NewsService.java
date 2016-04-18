package _05_newsArticle.model;

import java.util.List;

import org.hibernate.Session;

import _05_newsArticle.model.dao.NewsDAOHibernate;
import misc.HibernateUtil;

public class NewsService {
	private NewsDAOHibernate dao;
	
	public void setDao(NewsDAOHibernate dao) {
		this.dao = dao;
	}

	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			NewsService service = new NewsService();
			NewsDAOHibernate dao = new NewsDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
			service.setDao(dao);
			
			List<NewsBean> bean = service.selectAll();
			System.out.println(bean);
			
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	public List<NewsBean> selectAll(){
		return dao.select();
	}
	
	public NewsBean selectByNno(int nno) {
			return dao.select(nno);
	}
	
	public List<NewsBean> selectByDate(java.util.Date date){
		List<NewsBean> result = null;
		if(date != null){
			result = dao.selectByDate(date);			
		}
		return result;
	}
	
	public List<NewsBean> selectByKeyWord(String keyWord){
		List<NewsBean> result = null;
		if(keyWord != null && keyWord.trim().length() != 0){
			result = dao.selectByKeyWord(keyWord);
		}
		return result;
	}
	
	public boolean delete(String nno) {
		Integer i = Integer.parseInt(nno);
		return dao.delete(i);
	}
	
	public NewsBean update(NewsBean bean){
		return dao.update(bean);
	}
	
	public NewsBean insert(NewsBean bean){
		return dao.insert(bean);
	}
}







