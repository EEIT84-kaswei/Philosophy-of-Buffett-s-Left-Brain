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
	private SessionFactory sessionFactory=null;
	
	public ArticleDAOHibernate(){
		
	}
	
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
			
			
//			List<Object[]> bean = dao.selectPage();
//			for(Object[] ab:bean){
//				System.out.print(ab[0]+" ");
//				System.out.print(((ArticleBean)ab[1]).getAname()+" ");
//				System.out.print(ab[2]+" ");
//				System.out.print(ab[3]+" ");
//				System.out.println();
//			}
			
//			List<ArticleBean> bean = dao.selectAdmin();
//			List<ArticleBean> bean = dao.selectByid(5);
//			List<ArticleBean> bean = dao.selectByAname("Lara");
			
			ArticleBean ab = new ArticleBean();
//			ab.setAno(15);
			ab.setId(5);
			ab.setAname("Shiu");
			ab.setAtime(new Date());
			ab.setAtitle("oooxxxnnnmmm");
			ab.setAcontext("1312223");
			ArticleBean bean = dao.insert(ab);
			System.out.println(bean);
//			ArticleBean bean = dao.update(15, 5,"Chang",new Date(),"標題", "文章內容");
//			System.out.println(bean);
//			boolean bean = dao.delete(17);
//			System.out.println(bean);
//			List<ArticleBean> bean = dao.selectByid(1);
//			List<ArticleBean> bean = dao.selectByAname("Lara");
			
//			for(ArticleBean beans:bean){
//				System.out.println(beans);
//			}
			
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
		} finally {
			HibernateUtil.getSessionFactory().close();
		}
	}
	@Override
	public List<ArticleBean> select(){
		Query query = getSession().createQuery("from ArticleBean ORDER BY ano DESC");
		
		
		return query.list();
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
		Query query = getSession().createQuery("from ArticleBean where aname like:name ORDER BY ano DESC");
		query.setParameter("name","%"+aname+"%");
		return (List<ArticleBean>) query.list();
	}
	
	@Override
	public ArticleBean insert(ArticleBean bean){
			getSession().save(bean);
			return bean;
	}
	
	@Override
	public boolean update(Integer ano,Integer id,String aname,String atitle,String acontext){
		if(ano != 0||ano!=null){
			ArticleBean result = (ArticleBean) getSession().get(ArticleBean.class, ano);
			result.setId(id);
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
