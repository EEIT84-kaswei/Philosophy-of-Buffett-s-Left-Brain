package _02_login.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import misc.HibernateUtil;

import org.hibernate.Session;

import _02_login.model.dao.CustFavoriteDAOHibernate;


public class CustFavoriteService {
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private CustFavoriteDAO custFavoriteDAO;

	public void setCustFavoriteDAO(CustFavoriteDAO custFavoriteDAO) {
		this.custFavoriteDAO = custFavoriteDAO;
	}

	

	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		CustFavoriteDAOHibernate dao = new CustFavoriteDAOHibernate();
		CustFavoriteService service = new CustFavoriteService();
		service.setCustFavoriteDAO(dao);
		// 測試查詢
		// try {
		// dao.getSession().beginTransaction();
		// List<CustFavoriteBean> selectBean = service.select();
		// dao.getSession().getTransaction().commit();
		// for(CustFavoriteBean beans:selectBean){
		// System.out.println(beans);
		// }
		// } catch (Exception e) {
		// dao.getSession().getTransaction().rollback();
		// e.printStackTrace();
		// }
		// 測試查詢ID
//		try {
//			dao.getSession().beginTransaction();
//			List<CustFavoriteBean> selectById = service.selectById(1);
//			dao.getSession().getTransaction().commit();
//			for (CustFavoriteBean beans : selectById) {
//				System.out.println(beans);
//			}
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
//	    //測試查詢Stock
//		try {
//			dao.getSession().beginTransaction();
//			List<CustFavoriteBean> selectByStock = service.selectByStock(4108);
//			dao.getSession().getTransaction().commit();
//			for (CustFavoriteBean beans : selectByStock) {
//				System.out.println(beans);
//			}
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
//		//測試查詢Stock && id
//		try {
//			dao.getSession().beginTransaction();
//			CustFavoriteBean selectByIdAndStock = service.selectByIdAndStock(1, 4108);
//			dao.getSession().getTransaction().commit();
//			System.out.println(selectByIdAndStock);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
//		//測試新增
//		try {
//			dao.getSession().beginTransaction();
//			CustFavoriteBean bean = new CustFavoriteBean();
//			bean.setId(20);
//			bean.setStock_Code(4147);
//			CustFavoriteBean insert = service.insert(bean);
//			dao.getSession().getTransaction().commit();
//			System.out.println(bean);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
//      //測試修改		
//		try {
//			dao.getSession().beginTransaction();
//			CustFavoriteBean update = new CustFavoriteBean();		
//			update = dao.update(20, 4147, 4174);
//			dao.getSession().getTransaction().commit();
//			System.out.println(update);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
//		//測試刪除
//		try {
//			dao.getSession().beginTransaction();
//			boolean delete = false;
//			delete = dao.delete(20, 4174);
//			dao.getSession().getTransaction().commit();
//			System.out.println(delete);
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		//測試指標1		
//		Integer stock_Code = 2330;
//		Integer B_s_sheets = 20000;
//		Integer trade_Volume = 42324;		
//		boolean test1 = false;
//		test1 = service.Stock_index1(stock_Code, B_s_sheets, trade_Volume);
//		System.out.println("是否符合指標1: "+ test1);

		//測試指標2
//		Integer top1_B_s_sheets = 1700;
//		Integer lowest_B_s_sheets = 300;
//		boolean test2 = false;
//		test2 = service.Stock_index2(top1_B_s_sheets, lowest_B_s_sheets);
//		System.out.println("是否符合指標2: "+ test2);
		
		//測試指標3
//		Integer [] top_B_s_sheets = {5985,5640,3528,2486,1507,1351,1067,838,794,526,332,219,167,105,77};
//		Integer  [] low_B_s_sheets = {-2842,-2774,-2229,-2198,-2027,-790,-657,-495,-349,-318,-263,-262,-228,-193,-172};
//		int trade_Volume = 42324;
//		boolean test3 = false;
//		test3 = service.Stock_index3(top_B_s_sheets, low_B_s_sheets, trade_Volume);
//		System.out.println("是否符合指標3: "+test3);
		
		//測試指標4
//		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date ldate1 = null;
//		Date ldate2 = null;
//		Date ldate3 = null;
//		try {
//			ldate1=sFormat.parse("2016-04-08");		
//			ldate2=sFormat.parse("2016-04-07");		
//			ldate3=sFormat.parse("2016-04-06");
//		} catch (ParseException e) {	
//			e.printStackTrace();
//		}
//		Integer FC_Trade_Count1 = 300;
//		Integer FC_Trade_Count2 = 300;
//		Integer FC_Trade_Count3 = 401;
//		Integer stock_Code = 2330;
//		boolean test4 = false;
//		test4 = service.Stock_index4(ldate1, FC_Trade_Count1, ldate2, FC_Trade_Count2, ldate3, FC_Trade_Count3, stock_Code);
//		System.out.println("是否符合指標4: "+test4);
		
		//測試指標5
//		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date ldate1 = null;
//		Date ldate2 = null;
//		Date ldate3 = null;
//		try {
//			ldate1=sFormat.parse("2016-04-08");		
//			ldate2=sFormat.parse("2016-04-07");		
//			ldate3=sFormat.parse("2016-04-06");
//		} catch (ParseException e) {	
//			e.printStackTrace();
//		}
//		Integer IT_Trade_Count1 = 300;
//		Integer IT_Trade_Count2 = 300;
//		Integer IT_Trade_Count3 = 401;
//		Integer stock_Code = 2330;
//		boolean test5 = false;
//		test5 = service.Stock_index5(ldate1, IT_Trade_Count1, ldate2, IT_Trade_Count2, ldate3, IT_Trade_Count3, stock_Code);
//		System.out.println("是否符合指標5 = "+ test5);
		
		
		
		
		
		HibernateUtil.closeSessionFactory();
	}

	public List<CustFavoriteBean> select() {
		List<CustFavoriteBean> result = new ArrayList<CustFavoriteBean>();
		result = custFavoriteDAO.select();
		return result;
	}

	public List<CustFavoriteBean> selectById(Integer id) {
		List<CustFavoriteBean> result = null;
		if (id != null) {
			result = custFavoriteDAO.selectById(id);
		}
		return result;
	}

	public List<CustFavoriteBean> selectByStock(Integer stock_Code) {
		List<CustFavoriteBean> result = null;
		if (stock_Code != null) {
			result = custFavoriteDAO.selectByStock(stock_Code);
		}
		return result;
	}

	public CustFavoriteBean selectByIdAndStock(Integer id, Integer stock_Code) {
		CustFavoriteBean result = null;
		if (id != null && stock_Code != null) {
			result = custFavoriteDAO.selectByIdAndStock(id, stock_Code);
		}
		return result;
	}

	public CustFavoriteBean insert(CustFavoriteBean bean) {
		CustFavoriteBean result = null;
		if (bean != null) {
			result = custFavoriteDAO.insert(bean);
		}
		return result;
	}

	public CustFavoriteBean update(Integer id, Integer stock_Code,
			Integer new_stock_Code) {
		CustFavoriteBean result = null;
		if (selectByIdAndStock(id, stock_Code) != null
				&& selectByIdAndStock(id, new_stock_Code) == null) {
			result = custFavoriteDAO.update(id, stock_Code, new_stock_Code);
		}
		return result;
	}

	public boolean delete(Integer id, Integer stock_Code) {
		boolean result = false;
		if (id != null && stock_Code != null) {
			result = custFavoriteDAO.delete(id, stock_Code);
		}
		return result;
	}
	//指標1
	public boolean Stock_index1(Integer stock_Code,Integer B_s_sheets,int trade_Volume){
		boolean result = false;
		double dou_B_s_sheets = B_s_sheets;
		double dou_Trade_Volume = trade_Volume;
		double weight_proportion = dou_B_s_sheets/dou_Trade_Volume;//重壓比例
		System.out.println("重壓比例 = "+weight_proportion);
		if(weight_proportion> 0.3){//重壓比例>30%
			result = true;			
		}
		return result;		
	}
	//指標2
	public boolean Stock_index2(Integer top1_B_s_sheets,Integer lowest_B_s_sheets){
		boolean result = false;		
		int Overoverbought = top1_B_s_sheets/lowest_B_s_sheets;//超額買超
		System.out.println("超額買超 = "+Overoverbought);
		if(top1_B_s_sheets>500){//卷商買超張數>500
			if(Overoverbought>4){//超額買超>4倍
				result = true;				
			}
		}		
		return result;		
	}
	//指標3
	public boolean Stock_index3(Integer [] top_B_s_sheets,Integer  [] low_B_s_sheets,int trade_Volume){
		boolean result = false;
		int top = 0;
		int low = 0;
		for(Integer i:top_B_s_sheets){//前15買超
			top += i;
		}System.out.println("top = "+top);
		for(Integer i:low_B_s_sheets){//前15賣超
			low += i;
		}System.out.println("low = "+low);
		int sum = top+low;//籌碼集中
		if((sum)>0){
			double dou_Sum = sum;
			double dou_trade_Volume = trade_Volume;
			double answer = dou_Sum/dou_trade_Volume;//籌碼集中度
			System.out.println("籌碼集中度 = "+answer);
			 if(answer>0.2){
				 result=true;
			 }
		}		
		return result;		
	}
	
	//指標6
	public boolean Stock_index4(Integer FC_Trade_Count1,Integer FC_Trade_Count2,Integer FC_Trade_Count3,
			Integer stock_Code){
		boolean result = false;
		//FC_Trade_Count外資				
		if(FC_Trade_Count1>0 && FC_Trade_Count2>0 && FC_Trade_Count3>0){//外資連買三天
			int sum = FC_Trade_Count1 + FC_Trade_Count2 + FC_Trade_Count3;
			System.out.println("外資三天加總 = "+sum);
			if(sum>1000){//買超>1000張
				result = true;
			}
		}		
		return result;		
	}
	//IT_Trade_Count投信
	//指標7
	public boolean Stock_index5(Integer IT_Trade_Count1,Integer IT_Trade_Count2,Integer IT_Trade_Count3,Integer stock_Code){
		boolean result = false;
		if(IT_Trade_Count1>0 && IT_Trade_Count2>0 && IT_Trade_Count3>0){//投信連買三天
			int sum = IT_Trade_Count1 + IT_Trade_Count2 + IT_Trade_Count3;
			System.out.println("投信三天加總 = "+sum);
			if(sum>1000){//買超>1000張
				result = true;
			}
		}		
		return result;		
	}
}
