package _02_login.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import misc.HibernateUtil;
import _02_login.model.CustFavoriteService;
import _02_login.model.QuestionService;
import _02_login.model.SpecialFunctionService;
import _02_login.model.dao.CustFavoriteDAOHibernate;
import _02_login.model.dao.QuestionDAOHibernate;
import _02_login.model.dao.SpecialFunctionDAOHibernate;
import _03_stock_market.model.LegalPersonBean;
import _04_stock.model.DailyStockBean;
import _04_stock.model.DailyStockService;
import _04_stock.model.SecuritiesTradeBean;
import _04_stock.model.SecuritiesTradeService;

@WebServlet("/CustFavoriteServlet")
public class CustFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    private SpecialFunctionService functionService ;
    private CustFavoriteService favoriteService ; 
    
    public CustFavoriteServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 接收HTML Form資料
		String stock = request.getParameter("stock_Code");	
		// 轉換HTML Form資料
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd");
		Date sDate = new Date();
		Date trading_Date = sDate;
		Integer stock_Code = null;	
		if(stock!=null){
			stock_Code = Integer.parseInt(stock); 
		}
		
		// 驗證HTML Form資料	//似乎不需要
		// 呼叫Model
		DailyStockBean DBean = new DailyStockBean();
		SecuritiesTradeBean SBean = new SecuritiesTradeBean();
		LegalPersonBean LBean = new LegalPersonBean();
		DBean.setStock_Code(stock_Code);
		SBean.setStock_Code(stock_Code);
		LBean.setStock_Code(stock_Code);
		Integer B_s_sheetsMax = functionService.selectMax(sDate, stock_Code);
		Integer B_s_sheetsMin = functionService.selectMin(sDate, stock_Code);
		Integer [] top_B_s_sheets = functionService.selsctBuyTop15(sDate, stock_Code);
		Integer [] low_B_s_sheets = functionService.selectBuyLow15(sDate, stock_Code);
		int trade_Volume = functionService.selectTrade_Volume(trading_Date, stock_Code);
		Integer [] FC_Trade_Count = functionService.select_FC_Trade(stock_Code);
		Integer [] IT_Trade_Count = functionService.select_IT_Trade(stock_Code);
		
		favoriteService.selectByStock(stock_Code);
		boolean index1 = favoriteService.Stock_index1(stock_Code, B_s_sheetsMax, trade_Volume);
		boolean index2 = favoriteService.Stock_index2(B_s_sheetsMax, B_s_sheetsMin);
		boolean index3 = favoriteService.Stock_index3(top_B_s_sheets, low_B_s_sheets, trade_Volume);
		boolean index4 = favoriteService.Stock_index4(FC_Trade_Count[0], FC_Trade_Count[1], FC_Trade_Count[2], stock_Code);
		boolean index5 = favoriteService.Stock_index5(IT_Trade_Count[0], IT_Trade_Count[1], IT_Trade_Count[2], stock_Code);
		// 根據Model執行結果顯示View
		request.setAttribute("index1", index1);
		request.setAttribute("index2", index2);
		request.setAttribute("index3", index3);
		request.setAttribute("index4", index4);
		request.setAttribute("index5", index5);
		request.getRequestDispatcher("");
		
		
		
	}
	
	
	
	public void init() throws ServletException {
		SpecialFunctionDAOHibernate dao = new SpecialFunctionDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		functionService = new SpecialFunctionService();
		functionService.setSpecialFunctionDAO(dao);
		
		CustFavoriteDAOHibernate daoC = new CustFavoriteDAOHibernate(session);
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		favoriteService = new CustFavoriteService();
		favoriteService.setCustFavoriteDAO(daoC);
	}


}
