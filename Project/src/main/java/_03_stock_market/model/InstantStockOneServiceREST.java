package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.List;

import javax.ws.rs.*;

import misc.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _03_stock_market.model.dao.InstantStockOneDAOHibernate;


@Path("/instantStockOnes")
public class InstantStockOneServiceREST {
	
	//因為Restful搭配的是spring，Spring的工廠是一開機就由XML注入了；但只有Hibernate的狀況下，直接使用service沒有人給工廠，所以要在這手動加入工廠
	private InstantStockOneDAOHibernate instantStockOneDAO
									= new InstantStockOneDAOHibernate(HibernateUtil.getSessionFactory());
	
	public void setInstantStockOneDAO(InstantStockOneDAOHibernate instantStockOneDAO) {
		this.instantStockOneDAO = instantStockOneDAO;
	}
	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
		
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction transaction = session.beginTransaction();

			InstantStockOneServiceREST service = new InstantStockOneServiceREST();
			service.setInstantStockOneDAO(new InstantStockOneDAOHibernate(sessionFactory));
			//上市股搜尋  or 概念股搜尋
//			List<InstantStockOneBean> list = service.selectByType("s1");
			List<InstantStockOneBean> list = service.selectByCS("c1");
			for(InstantStockOneBean xBean : list){
				System.out.println(xBean);
			}
			
			
			
//			InstantStockOneBean isb =new InstantStockOneBean();
//			
////			isb.setStock_Code(52); 	 	//模糊搜尋 Code
////			isb.setStock_Name("新");  	//模糊搜尋 Name
////			isb.setStock_Name("新'or 1=1 or stock_Name like '新");  	// Name隱碼攻擊測試
//			List<InstantStockOneBean> beans = service.select(isb);
//			for(InstantStockOneBean bean:beans){
//			System.out.println("bean="+bean);
//			}
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	
	
	@GET
	@Path("/code/{stock_Code}")
	@Produces({ "application/xml", "application/json" })
	public InstantStockOneBean selectOne(@PathParam("stock_Code")Integer stock_Code) {
		System.out.println("stock_Code : " + stock_Code);
		List<InstantStockOneBean> oneStock = null;
		if (stock_Code != null) {
			oneStock = instantStockOneDAO.select(stock_Code);
		}
		return oneStock.get(0);
	}
	
	
	/*用上市股分類搜尋*/
	@GET
	@Path("/list/{stock_TypeCode}")
	@Produces({ "application/xml", "application/json" })
	public List<InstantStockOneBean> selectByType(@PathParam("stock_TypeCode") String stock_TypeCode) {
		if (stock_TypeCode == null || stock_TypeCode.trim().length() == 0) {
			return null;
		} else {
			return (List<InstantStockOneBean>) instantStockOneDAO.selectByType(stock_TypeCode);
		}
	}

	/*用概念股分類搜尋*/
	@GET
	@Path("/CS/{concept_Stock}")
	@Produces({ "application/xml", "application/json" })
	public List<InstantStockOneBean> selectByCS(@PathParam("concept_Stock") String concept_Stock){
		if(concept_Stock==null || concept_Stock.trim().length()==0 ){
			return null;
		}else{
			return (List<InstantStockOneBean>)instantStockOneDAO.selectByCS(concept_Stock);
		}
	}
	
	public List<InstantStockOneBean> select(InstantStockOneBean bean) {
		List<InstantStockOneBean> result = null;
		
		if(bean!=null &&bean.getStock_Code()!=null &&bean.getStock_Code()!=0) {
			result = instantStockOneDAO.select(bean.getStock_Code());
//			if(temp!=null) {
//				result = new ArrayList<InstantStockOneBean>();
//				result.add(temp);
//			}
		}else if(bean!=null && bean.getStock_Name()!=null){
			result = instantStockOneDAO.select(bean.getStock_Name());
//			if(temp!=null) {
//				result = new ArrayList<InstantStockOneBean>();
//				result.add(temp);
//			}
		}else{
			result = instantStockOneDAO.select(); 
		}
		return result;
	}
	public InstantStockOneBean insert(InstantStockOneBean bean) {
		InstantStockOneBean result = null;
		if(bean!=null) {
			result = instantStockOneDAO.insert(bean);
		}
		return result;
	}
	public InstantStockOneBean update(InstantStockOneBean bean) {
		InstantStockOneBean result = null;
		if(bean!=null) {
			result = instantStockOneDAO.update(bean.getStock_TypeCode(),bean.getConcept_Stock(),
					bean.getStock_Name(),bean.getPurchase_Price(),bean.getSelling_Price(),
					bean.getFinal_price(),bean.getChange_Amount(),bean.getChange_extent(),
					bean.getAcc_Trade_Volume(),bean.getStock_Code());
		}
		return result;
	}
	public boolean delete(InstantStockOneBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = instantStockOneDAO.delete(bean.getStock_Code());
		}
		return result;
	}

}
