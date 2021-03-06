package _02_login.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import misc.HibernateUtil;
import _02_login.model.CustFavoriteBean;
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
import _04_stock.model.StockCodeBean;
import _04_stock.model.StockCodeDAO;
import _04_stock.model.StockCodeService;
import _04_stock.model.dao.DailyStockDAOHibernate;
import _04_stock.model.dao.StockCodeDAOHibernate;

@WebServlet("/secure/SpecialFunctionServlet")
public class SpecialFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private SpecialFunctionService functionService;
	private CustFavoriteService favoriteService;
	private StockCodeService stockCodeService;
	

	public SpecialFunctionServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 接收HTML Form資料
		String stock = request.getParameter("stock_Code");
		// 轉換HTML Form資料
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sformat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = new Date();
		// System.out.println(date.getTime()-(86400000*2));
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -1);
		// System.out.println(cal.get(Calendar.DAY_OF_WEEK));
		String yesterdayStr = sformat.format(cal.getTime());
		String time = "00:00:00";
		Date sDate = null;
		
		String answer1 ;
		String answer2 ;
		String answer3 ;
		String answer4 ;
		String answer5 ;
		
		try {
			sDate = sformat2.parse(yesterdayStr + " " + time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(sDate);
		Date trading_Date = sDate;
		Integer stock_Code = null;
		if (stock != null) {
			stock_Code = Integer.parseInt(stock);
		}
		System.out.println("轉換資料後");
		// 驗證HTML Form資料
		// 呼叫Model
		DailyStockBean DBean = new DailyStockBean();
		SecuritiesTradeBean SBean = new SecuritiesTradeBean();
		LegalPersonBean LBean = new LegalPersonBean();
		DBean.setStock_Code(stock_Code);
		SBean.setStock_Code(stock_Code);
		LBean.setStock_Code(stock_Code);
		Integer B_s_sheetsMax = null;
		Integer B_s_sheetsMin = null;
		Integer[] top_B_s_sheets = null;
		Integer[] low_B_s_sheets = null;
		int trade_Volume = 0;
		Integer[] FC_Trade_Count = {null,null,null};
		Integer[] IT_Trade_Count = {null,null,null};
		// try {
		int i=1;
		while (i<=31) {
			
			try {
				B_s_sheetsMax = functionService.selectMax(sDate, stock_Code);
				B_s_sheetsMin = functionService.selectMin(sDate, stock_Code);
				top_B_s_sheets = functionService.selsctBuyTop15(sDate, stock_Code);
				low_B_s_sheets = functionService.selectBuyLow15(sDate, stock_Code);
				trade_Volume = functionService.selectTrade_Volume(trading_Date,
						stock_Code);
				FC_Trade_Count = functionService.select_FC_Trade(stock_Code);
				IT_Trade_Count = functionService.select_IT_Trade(stock_Code);
				if(B_s_sheetsMax!=null){
					break;
				}
			} catch (IndexOutOfBoundsException e1) {
				
				System.out.println(e1.getMessage());
				if (B_s_sheetsMax == null||B_s_sheetsMin==null||top_B_s_sheets==null||low_B_s_sheets==null
					||trade_Volume==0) {
					cal.add(Calendar.DAY_OF_MONTH, -1);
					yesterdayStr = sformat.format(cal.getTime());
					System.out.println(yesterdayStr);
					sDate = null;
					try {
						sDate = sformat2.parse(yesterdayStr + " " + time);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					System.out.println(sDate);
					trading_Date = sDate;
				}else {
					break;
					}				
			}
			i++;						
		}

		// } catch (Exception e) {

		// String index1 = "暫無資料";
		// String index2 = "暫無資料";
		// String index3 = "暫無資料";
		// String index4 = "暫無資料";
		// String index5 = "暫無資料";
		// request.setAttribute("index1", index1);
		// request.setAttribute("index2", index2);
		// request.setAttribute("index3", index3);
		// request.setAttribute("index4", index4);
		// request.setAttribute("index5", index5);
		// request.getRequestDispatcher("/secure/_04_stock/concept_Stock/historyInfo.jsp").forward(request,response);
		// }

//		favoriteService.selectByStock(stock_Code);
		
		boolean index1 = favoriteService.Stock_index1(stock_Code,
				B_s_sheetsMax, trade_Volume);
		boolean index2 = favoriteService.Stock_index2(B_s_sheetsMax,
				B_s_sheetsMin);
		boolean index3 = favoriteService.Stock_index3(top_B_s_sheets,
				low_B_s_sheets, trade_Volume);
		boolean index4 = favoriteService.Stock_index4(FC_Trade_Count[0],
				FC_Trade_Count[1], FC_Trade_Count[2], stock_Code);
		boolean index5 = favoriteService.Stock_index5(IT_Trade_Count[0],
				IT_Trade_Count[1], IT_Trade_Count[2], stock_Code);
		StockCodeBean bean=stockCodeService.selectStockCodeByStockCode(stock_Code);
		
		
		if(index1==true){
			answer1 = "符合";
		}else{answer1 = "尚未符合";}
		if(index2==true){
			answer2 = "符合";
		}else{answer2 = "尚未符合";}
		if(index3==true){
			answer3 = "符合";
		}else{answer3 = "尚未符合";}
		if(index4==true){
			answer4 = "符合";
		}else{answer4 = "尚未符合";}
		if(index5==true){
			answer5 = "符合";
		}else{answer5 = "尚未符合";}
		
		
		
		// 根據Model執行結果顯示View
//		request.setAttribute("stockTable", stockTable);
		
		request.setAttribute("bean", bean);
		request.setAttribute("index1", answer1);
		request.setAttribute("index2", answer2);
		request.setAttribute("index3", answer3);
		request.setAttribute("index4", answer4);
		request.setAttribute("index5", answer5);
		request.getRequestDispatcher(
				"/secure/_04_stock/concept_Stock/historyInfo.jsp").forward(
				request, response);

	}

	public void init() throws ServletException {
		SpecialFunctionDAOHibernate dao = new SpecialFunctionDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		functionService = new SpecialFunctionService();
		functionService.setSpecialFunctionDAO(dao);

		CustFavoriteDAOHibernate daoC = new CustFavoriteDAOHibernate();
		daoC.setSessionFactory(HibernateUtil.getSessionFactory());
		favoriteService = new CustFavoriteService();
		favoriteService.setCustFavoriteDAO(daoC);
		
		StockCodeDAOHibernate stockCodeDAOHibernate=new StockCodeDAOHibernate();
		stockCodeDAOHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
		stockCodeService = new StockCodeService();
		stockCodeService.setStockCodeDAO(stockCodeDAOHibernate);
	}

}
