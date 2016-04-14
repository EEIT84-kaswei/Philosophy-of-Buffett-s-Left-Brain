package _04_stock.model;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.util.ArrayList;
import java.util.List;

import misc.HibernateUtil;
import _04_stock.model.dao.StockCodeDAOHibernate;

import org.hibernate.Session;
import org.hibernate.loader.custom.Return;

import javassist.expr.NewArray;

public class StockCodeService {
	private StockCodeDAO stockCodeDAO;

	public void setStockCodeDAO(StockCodeDAO stockCodeDAO) {
		this.stockCodeDAO = stockCodeDAO;
	}

	public static void main(String[] args) {
		StockCodeDAOHibernate dao = new StockCodeDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		StockCodeService service = new StockCodeService();		
		service.setStockCodeDAO(dao);;
				
		try {
			dao.getSession().beginTransaction();				  //測試:查詢資料
//			List<StockCodeBean> beans = service.select(null);
//			service.selectStockCodByType("s1");
//			List<Integer> list = service.selectStockCodByType("s1");
			List<Integer> list = service.selectStockCodByCS("c1");
			for(Integer code:list){                        //enhanced for loop 讀取資料
				System.out.println(code);
			}
			dao.getSession().getTransaction().commit();
		} catch (Exception e) {
			dao.getSession().getTransaction().rollback();
			e.printStackTrace();
		}
		
//		StockCodeBean bean = new StockCodeBean();				  //測試:新增資料
//		StockCodeBean bean1 = null;
//		try {			
//			dao.getSession().beginTransaction();
//			bean.setStock_Code(4174);
//			bean.setStock_Name("浩鼎");
//			bean.setStock_TypeCode("s1");
//			bean.setCs_Code("c1");
//			bean.setCommend("風險低");
//			bean1 = service.insert(bean);
//			System.out.println("bean1"+bean1);
//			dao.getSession().getTransaction().commit();
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		
//		boolean bean = false;
//		try {
//			dao.getSession().beginTransaction();				  //測試:刪除資料			
//			bean = service.delete(4147);
//			System.out.println(bean);
//			dao.getSession().getTransaction().commit();
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		
//		StockCodeBean bean = new StockCodeBean();				  //測試:修改資料
//		StockCodeBean bean1 = null;
//		try {
//			dao.getSession().beginTransaction();
//			bean.setStock_Code(4105);
//			bean.setStock_Name("東洋");
//			bean.setStock_TypeCode("s1");
//			bean.setCs_Code("c3");
//			bean.setCommend("風險中等");
//			bean1 = service.update(bean);
//			System.out.println(bean1);
//			dao.getSession().getTransaction().commit();
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		
	}

	public List<Integer> selectStockCodByCS(String cs_Code){
		List<Integer> codeList = null;
		if(cs_Code!=null){
			List<StockCodeBean> beans = stockCodeDAO.selectBycs_Code(cs_Code);
			codeList = new ArrayList<Integer>();
			for(StockCodeBean xBean:beans){
				Integer code = xBean.getStock_Code();
//				System.out.println(code);
				codeList.add(code);
			}
		}
		return codeList;
	}

	
	public List<Integer> selectStockCodByType(String stock_TypeCode){
		List<Integer> codeList = null;
		if(stock_TypeCode!=null){
			List<StockCodeBean> beans = stockCodeDAO.selectByTypeCode(stock_TypeCode);
			codeList = new ArrayList<Integer>();
			for(StockCodeBean xBean:beans){
				Integer code = xBean.getStock_Code();
//				System.out.println(code);
				codeList.add(code);
			}
		}
		return codeList;
	}
	

	public List<StockCodeBean> select(StockCodeBean bean) {
		List<StockCodeBean> result = null;
		if (bean != null && bean.getStock_Code() != 0) {
			StockCodeBean temp = stockCodeDAO.select(bean.getStock_Code());
			if (temp != null) {
				result = new ArrayList<StockCodeBean>();
				result.add(temp);
			}
		} else {
			result = stockCodeDAO.selectAll();
		}
		return result;
	}
	
	
	public List<StockCodeBean> selectAll() {
		List<StockCodeBean> result = new ArrayList<StockCodeBean>();
		result = stockCodeDAO.selectAll();
		return result;		
	}

	public StockCodeBean insert(StockCodeBean bean) {
		StockCodeBean result = null;
		if (bean != null) {
			result = stockCodeDAO.insert(bean);
		}
		return result;
	}

	public StockCodeBean update(StockCodeBean bean) {
		StockCodeBean result = null;
		if (bean != null) {
			result = stockCodeDAO.update(bean.getStock_Code(),
					bean.getStock_Name(), bean.getStock_TypeCode(),
					bean.getCs_Code(), bean.getCommend());
		}
		return result;
	}

	public boolean delete(Integer stock_Code) {
		boolean result = false;
		if (stock_Code != null) {
			result = stockCodeDAO.delete(stock_Code);
		}
		return result;
	}

}
