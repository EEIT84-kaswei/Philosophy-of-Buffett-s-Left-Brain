package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _03_stock_market.model.dao.InstantStockOneDAOHibernate;


public class InstantStockOneService {
	private InstantStockOneDAO InstantStockOneDAO;
	public void setInstantStockOneDAO(InstantStockOneDAO InstantStockOneDAO) {
		this.InstantStockOneDAO = InstantStockOneDAO;
	}
	public static void main(String[] args) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
		
		try {
			Session session = sessionFactory.getCurrentSession();
			Transaction transaction = session.beginTransaction();

			InstantStockOneService service = new InstantStockOneService();
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
	
	/*用上市股分類搜尋*/
	public List<InstantStockOneBean> selectByType(String stock_TypeCode){
		if(stock_TypeCode==null || stock_TypeCode.trim().length()==0 ){
			return null;
		}else{
			return (List<InstantStockOneBean>)InstantStockOneDAO.selectByType(stock_TypeCode);
		}
	}

	/*用概念股分類搜尋*/
	public List<InstantStockOneBean> selectByCS(String concept_Stock){
		if(concept_Stock==null || concept_Stock.trim().length()==0 ){
			return null;
		}else{
			return (List<InstantStockOneBean>)InstantStockOneDAO.selectByCS(concept_Stock);
		}
	}
	
	public InstantStockOneBean selectOne(Integer code){
		List<InstantStockOneBean> oneStock=null;
		if(code!=null){
			oneStock=InstantStockOneDAO.select(code);
		}
		return oneStock.get(0);
	}
	
	public List<InstantStockOneBean> select(InstantStockOneBean bean) {
		List<InstantStockOneBean> result = null;
		
		if(bean!=null &&bean.getStock_Code()!=null &&bean.getStock_Code()!=0) {
			result = InstantStockOneDAO.select(bean.getStock_Code());
//			if(temp!=null) {
//				result = new ArrayList<InstantStockOneBean>();
//				result.add(temp);
//			}
		}else if(bean!=null && bean.getStock_Name()!=null){
			result = InstantStockOneDAO.select(bean.getStock_Name());
//			if(temp!=null) {
//				result = new ArrayList<InstantStockOneBean>();
//				result.add(temp);
//			}
		}else{
			result = InstantStockOneDAO.select(); 
		}
		return result;
	}
	public InstantStockOneBean insert(InstantStockOneBean bean) {
		InstantStockOneBean result = null;
		if(bean!=null) {
			result = InstantStockOneDAO.insert(bean);
		}
		return result;
	}
	public InstantStockOneBean update(InstantStockOneBean bean) {
		InstantStockOneBean result = null;
		if(bean!=null) {
			result = InstantStockOneDAO.update(bean.getStock_TypeCode(),bean.getConcept_Stock(),
					bean.getStock_Name(),bean.getPurchase_Price(),bean.getSelling_Price(),
					bean.getFinal_price(),bean.getChange_Amount(),bean.getChange_extent(),
					bean.getAcc_Trade_Volume(),bean.getStock_Code());
		}
		return result;
	}
	public boolean delete(InstantStockOneBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = InstantStockOneDAO.delete(bean.getStock_Code());
		}
		return result;
	}

}
