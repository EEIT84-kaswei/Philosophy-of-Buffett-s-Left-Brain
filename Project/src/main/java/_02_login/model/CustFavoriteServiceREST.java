package _02_login.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import _02_login.model.dao.CustFavoriteDAOHibernate;
import _03_stock_market.model.InstantStockOneBean;
import _03_stock_market.model.InstantStockOneServiceREST;
import misc.HibernateUtil;


@Path("/custFavorites")
public class CustFavoriteServiceREST {
	/*不能用set注入工廠，所以改在方法內產生工廠並注入*/
	private CustFavoriteDAOHibernate custFavoriteDAO ;
	

	public void setCustFavoriteDAO(CustFavoriteDAOHibernate custFavoriteDAO) {
		this.custFavoriteDAO = custFavoriteDAO;
	}


	public static void main(String[] args) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		CustFavoriteDAOHibernate dao = new CustFavoriteDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		CustFavoriteServiceREST service = new CustFavoriteServiceREST();
		service.setCustFavoriteDAO(dao);
		// 測試查詢
		try {
			dao.getSession().beginTransaction();
			List<InstantStockOneBean> result = service.selectInstantByAccount("lara");
			for(InstantStockOneBean xBean : result){
				System.out.println(xBean);
			}
//			List<Integer> selectBean = service.selectByAccount("lara");
//			for (Integer beans : selectBean) {
//				System.out.println(beans);
//			}
			dao.getSession().getTransaction().commit();
		} catch (Exception e) {
			dao.getSession().getTransaction().rollback();
			e.printStackTrace();
		}
	
		HibernateUtil.closeSessionFactory();
	}


	//用使用者帳號，找出自選股的所有股票代號，再找出所有股票資料。RESTful用
	@GET
	@Path("/list/{account}")
	@Produces({MediaType.APPLICATION_XML , MediaType.APPLICATION_JSON})
	public List<InstantStockOneBean> selectInstantByAccount(@PathParam("account") String account) {
		custFavoriteDAO = new CustFavoriteDAOHibernate();
		custFavoriteDAO.setSessionFactory(HibernateUtil.getSessionFactory());
		InstantStockOneServiceREST instantService = new InstantStockOneServiceREST();
		List<InstantStockOneBean> result = null;
		List<CustFavoriteBean> temp = null;
		
		if (account != null) {
			temp = custFavoriteDAO.selectByAccount(account);
			result = new ArrayList<InstantStockOneBean>();
			for(CustFavoriteBean xBean : temp){ 
				InstantStockOneBean bean = instantService.selectOne(xBean.getStock_Code()); //取ID xBean.getStock_Code()
				System.out.println(bean);
				result.add(bean);
			}
		}
		return result;
	}

	
	//用使用者帳號，找出自選股的所有股票代號
	public List<Integer> selectByAccount(String account) {
		List<CustFavoriteBean> result = null;
		List<Integer> stock_Code = new ArrayList<Integer>();
		if (account != null) {
			result = custFavoriteDAO.selectByAccount(account);
			for(CustFavoriteBean xBean : result){
				stock_Code.add(xBean.getStock_Code());
			}
		}
		return stock_Code;
	}

}
