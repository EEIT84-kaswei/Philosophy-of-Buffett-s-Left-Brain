package rest.restfulService.model.dao;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.util.List;

import misc.HibernateUtil;
import rest.restfulService.model.InstantStockOneBean;
import rest.restfulService.model.InstantStockOneDAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;





public class InstantStockOneDAOHibernate implements InstantStockOneDAO {
	private SessionFactory sessionFactory = null;
	public InstantStockOneDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction trx = session.beginTransaction();
			InstantStockOneDAO dao = new InstantStockOneDAOHibernate(sessionFactory);
			InstantStockOneBean bean = new InstantStockOneBean();
			//測試新增
//			bean.setStock_TypeCode("s1");
//			bean.setConcept_Stock("c1");
//			bean.setStock_Code(8080);
//			bean.setStock_Name("測試新增");
//			bean.setPurchase_Price(new BigDecimal(199));
//			bean.setSelling_Price(new BigDecimal(299));
//			bean.setFinal_price(new BigDecimal(299));
//			bean.setChange_Amount(new BigDecimal(29));
//			bean.setChange_extent(new BigDecimal(39));
//			bean.setAcc_Trade_Volume(999);
//			InstantStockOneBean beans = dao.insert(bean);
//			System.out.println(beans);

			//測試修改
//			bean=dao.update("s2","c2","測試update",new BigDecimal(30), new BigDecimal(40), new BigDecimal(50), new BigDecimal(55),new BigDecimal(60),655,8080);
//			System.out.println(bean);
//			=========================================================
//			List<InstantStockOneBean> beanList = dao.select();
//			for(InstantStockOneBean showbean:beanList){
//				System.out.println(showbean);
//			}
			
//			=========================================================
//			模糊搜尋 編號
			List<InstantStockOneBean> beanList = dao.select(11);
			for(InstantStockOneBean showbean:beanList){
				System.out.println(showbean);
			}		
//			=========================================================
//			模糊搜尋 名稱
//			List<InstantStockOneBean> beanList = dao.select("新");
//			for(InstantStockOneBean showbean:beanList){
//				System.out.println(showbean);
//			}		

			//用上市股代號s1 搜尋   or 用概念股c1搜尋
			
//			List<InstantStockOneBean> list = dao.selectByType("s1");
//			List<InstantStockOneBean> list = dao.selectByCS("c1");
//			for(InstantStockOneBean xBean : list){
//				System.out.println(xBean);
//			}
			//測試刪除
//				boolean  beanDel=dao.delete(8080);
//				System.out.println(beanDel);

			
			trx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}	
	
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockOneDAO#getSession()
	 */
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/* 用股票分類[上市股]查詢*/
	@Override
	public List<InstantStockOneBean> selectByType(String stock_TypeCode){
		Query query = getSession().createQuery("from InstantStockOneBean where stock_TypeCode = ?");
		query.setParameter(0, stock_TypeCode);
		return (List<InstantStockOneBean>) query.list();
	}
	
	/* 用概念股分類查詢*/
	@Override
	public List<InstantStockOneBean> selectByCS(String concept_Stock){
		Query query = getSession().createQuery("from InstantStockOneBean where concept_Stock = ?");
		query.setParameter(0, concept_Stock);
		return (List<InstantStockOneBean>) query.list();
	}
	
	
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockOneDAO#select(java.lang.Integer)
	 */
//	@Override
//	public InstantStockOneBean select(Integer stock_Code) {
//		return (InstantStockOneBean)this.getSession().get(InstantStockOneBean.class, stock_Code);	
//	}
	@Override
	public List<InstantStockOneBean> select(int stock_Code){
		Query query=getSession().createQuery("from InstantStockOneBean where str(stock_Code) like :code");
		query.setParameter("code", "%"+stock_Code+"%");
		return (List<InstantStockOneBean>) query.list();
	}
	@Override
	public List<InstantStockOneBean> select(String stock_Name){
		Query query=getSession().createQuery("from InstantStockOneBean where stock_Name like :name");
		query.setParameter("name", "%"+stock_Name+"%");
		return (List<InstantStockOneBean>) query.list();
	}
	/* (non-Javadoc)
	 * @see model.dao.InstantStockOneDAO#select()
	 */
	@Override
	public List<InstantStockOneBean> select() {
		Query query =
				this.getSession().createQuery("from InstantStockOneBean");
		return (List<InstantStockOneBean>) query.list();
	}
	
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockOneDAO#insert(model.InstantStockOneBean)
	 */
	@Override
	public InstantStockOneBean insert(InstantStockOneBean bean) {
		InstantStockOneBean result = (InstantStockOneBean)
				this.getSession().get(InstantStockOneBean.class, bean.getStock_Code());
		if(result==null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockOneDAO#update(java.lang.String, java.lang.String, java.lang.String, java.math.BigDecimal, java.math.BigDecimal, java.math.BigDecimal, java.math.BigDecimal, java.math.BigDecimal, java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public InstantStockOneBean update(String stock_TypeCode,String concept_Stock,
			String stock_Name,BigDecimal purchase_Price,
			BigDecimal selling_Price,BigDecimal final_price,BigDecimal change_Amount,
			BigDecimal change_extent,Integer acc_Trade_Volume,Integer stock_Code) {
		InstantStockOneBean result = (InstantStockOneBean)
				this.getSession().get(InstantStockOneBean.class, stock_Code);
		if(result!=null) {
			result.setStock_TypeCode(stock_TypeCode);
			result.setConcept_Stock(concept_Stock);
			result.setStock_Name(stock_Name);
			result.setPurchase_Price(purchase_Price);
			result.setSelling_Price(selling_Price);
			result.setFinal_price(final_price);
			result.setChange_Amount(change_Amount);
			result.setChange_extent(change_extent);
			result.setAcc_Trade_Volume(acc_Trade_Volume);
		}
		return result;
	}
	
	
	/* (non-Javadoc)
	 * @see model.dao.InstantStockOneDAO#delete(java.lang.Integer)
	 */
	@Override
	public boolean delete(Integer stock_Code) {
		InstantStockOneBean beandel = (InstantStockOneBean) this.getSession().get(InstantStockOneBean.class, stock_Code);
		if(beandel!=null) {
			this.getSession().delete(beandel);
			return true;
		}
		return false;
	}
	
}
