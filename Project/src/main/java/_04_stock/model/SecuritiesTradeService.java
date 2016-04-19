package _04_stock.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;
import _04_stock.model.dao.SecuritiesTradeDAOHibernate;



public class SecuritiesTradeService {
	private SecuritiesTradeDAO securitiesTradeDAO;
	public void setSecuritiesTradeDAO(SecuritiesTradeDAO securitiesTradeDAO) {
		this.securitiesTradeDAO = securitiesTradeDAO;
	}
	SecuritiesTradeDAOHibernate dao = new SecuritiesTradeDAOHibernate();

	public static void main (String[] args){
		SecuritiesTradeDAOHibernate dao = new SecuritiesTradeDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		SecuritiesTradeService service = new SecuritiesTradeService();
		service.setSecuritiesTradeDAO(dao);
		SecuritiesTradeBean bean1 = null;	
		SecuritiesTradeBean bean = null;
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date sDate = null ;
		Integer stock_Code = 6446;
		try {
			sDate = sFormat.parse("2016-03-30");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//測試查詢
//		try {
//			dao.getSession().beginTransaction();
//			List<SecuritiesTradeBean> selectBean = service.select(sDate, stock_Code);
//			dao.getSession().getTransaction().commit();
//			System.out.println(selectBean);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		//測試新增
		
//		try {
//			dao.getSession().beginTransaction();
//			SecuritiesTradeBean temp = new SecuritiesTradeBean();
//			temp.setStock_Code(6446);
//			temp.setsDate(sDate);
//			temp.setSecurities_Supplier("富邦-敦南");
//			temp.setBuy_Sheets(2800);
//			temp.setSell_Sheets(1600);
//			temp.setB_s_sheets(1200);//		
//			bean1 = dao.insert(temp);
//			dao.getSession().getTransaction().commit();
//			System.out.println(bean1);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		//測試修改
//		bean1 = new SecuritiesTradeBean();
//		
//		try {			
//			dao.getSession().beginTransaction();
//			bean1.setStock_Code(6446);
//			bean1.setsDate(sDate);
//			bean1.setSecurities_Supplier("富邦-忠孝");
//			bean1.setBuy_Sheets(4000);
//			bean1.setSell_Sheets(1250);
//			bean1.setB_s_sheets(2750);
//			bean = dao.update(bean1);
//			dao.getSession().getTransaction().commit();
//			System.out.println(bean);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
//		
		HibernateUtil.closeSessionFactory();
		
	}
	
	//尋找某一隻股，某一天的 主力進出
	public List<SecuritiesTradeBean> select(Date sDate, Integer stock_Code){
		List<SecuritiesTradeBean> result = new ArrayList<SecuritiesTradeBean>();
		result = securitiesTradeDAO.select(sDate, stock_Code);		
		return result;
	}
	//尋找某一隻股，某一個證劵自營商   全部買賣資料
	public List<SecuritiesTradeBean> select(Integer stock_Code, String securities_Supplier){
		List<SecuritiesTradeBean> result = new ArrayList<SecuritiesTradeBean>();
		result = securitiesTradeDAO.select(stock_Code, securities_Supplier);
		return result;
		
	}
	public SecuritiesTradeBean insert(SecuritiesTradeBean bean){
		SecuritiesTradeBean result = new SecuritiesTradeBean();
		if(bean!=null){
			result = securitiesTradeDAO.insert(bean);
		}
		return result;
		
	}
	public SecuritiesTradeBean update(SecuritiesTradeBean bean){			
		SecuritiesTradeBean updateBean = new SecuritiesTradeBean();
		SecuritiesTradeBean result = dao.getSession().get(SecuritiesTradeBean.class, updateBean);
		updateBean.setStock_Code(bean.getStock_Code());
		updateBean.setsDate(bean.getsDate());
		updateBean.setSecurities_Supplier(bean.getSecurities_Supplier());
		if(result!=null){
			result = securitiesTradeDAO.update(bean);
		}
		return result;
		
	}
	

}
