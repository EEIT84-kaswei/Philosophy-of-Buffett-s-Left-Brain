package _02_login.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import misc.HibernateUtil;

import org.hibernate.Session;

import _02_login.model.CustFavoriteService;
import _02_login.model.SpecialFunctionService;
import _02_login.model.StockAnalysisBean;
import _03_stock_market.model.InstantStockOneBean;
import _03_stock_market.model.InstantStockOneService;
import _03_stock_market.model.LegalPersonBean;
import _04_stock.model.DailyStockBean;
import _04_stock.model.SecuritiesTradeBean;

import _04_stock.model.StockCodeService;
@WebServlet("/secure/StockAnalys")
public class StockAnalysServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private SpecialFunctionService functionService;
	private CustFavoriteService favoriteService;
	private StockCodeService stockCodeService;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

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
		try {
			sDate = sformat2.parse(yesterdayStr + " " + time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(sDate);
		Date trading_Date = sDate;

		String answer1;
		String answer2;
		String answer3;
		String answer4;
		String answer5;

		System.out.println("轉換資料後");
		// 驗證HTML Form資料
		// 呼叫Model
		DailyStockBean DBean = new DailyStockBean();
		SecuritiesTradeBean SBean = new SecuritiesTradeBean();
		LegalPersonBean LBean = new LegalPersonBean();
		InstantStockOneService service4 = new InstantStockOneService();
		List<InstantStockOneBean> IBean = service4.select(null);
		List<StockAnalysisBean> beanS = new ArrayList<StockAnalysisBean>();

		for (InstantStockOneBean temp : IBean) {
			Integer stock_Code = temp.getStock_Code();
			System.out.println(stock_Code);
			StockAnalysisBean bean = new StockAnalysisBean();
			bean.setStock_Code(stock_Code);
			bean.setStock_Name(temp.getStock_Name());
			DBean.setStock_Code(stock_Code);
			SBean.setStock_Code(stock_Code);
			LBean.setStock_Code(stock_Code);
			Integer B_s_sheetsMax = null;
			Integer B_s_sheetsMin = null;
			Integer[] top_B_s_sheets = null;
			Integer[] low_B_s_sheets = null;
			int trade_Volume = 0;
			Integer[] FC_Trade_Count = { null, null, null };
			Integer[] IT_Trade_Count = { null, null, null };
			// try {
			int i = 1;
			while (i <= 31) {

				try {
					B_s_sheetsMax = functionService.selectMax(sDate, stock_Code);
					B_s_sheetsMin = functionService.selectMin(sDate, stock_Code);
					top_B_s_sheets = functionService.selsctBuyTop15(sDate,
							stock_Code);
					low_B_s_sheets = functionService.selectBuyLow15(sDate,
							stock_Code);
					trade_Volume = functionService.selectTrade_Volume(trading_Date,
							stock_Code);
					FC_Trade_Count = functionService.select_FC_Trade(stock_Code);
					IT_Trade_Count = functionService.select_IT_Trade(stock_Code);
					if (B_s_sheetsMax != null) {
						break;
					}
				} catch (IndexOutOfBoundsException e1) {

					System.out.println(e1.getMessage());
					if (B_s_sheetsMax == null || B_s_sheetsMin == null
							|| top_B_s_sheets == null || low_B_s_sheets == null
							|| trade_Volume == 0) {
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
					} else {
						break;
					}
				}
				i++;
			}
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
			

			if (index1 == true) {
				bean.setIndex1("符合");
			} else {
				bean.setIndex1("尚未符合");
			}
			if (index2 == true) {
				bean.setIndex2("符合");
			} else {
				bean.setIndex2("尚未符合");
			}
			if (index3 == true) {
				bean.setIndex3("符合");
			} else {
				bean.setIndex3("尚未符合");
			}
			if (index4 == true) {
				bean.setIndex4("符合");
			} else {
				bean.setIndex4("尚未符合");
			}
			if (index5 == true) {
				bean.setIndex5("符合");
			} else {
				bean.setIndex5("尚未符合");
			}
			beanS.add(bean);
		}

		
		// 根據Model執行結果顯示View
		// request.setAttribute("stockTable", stockTable);		
		request.setAttribute("beanS", beanS);		
		request.getRequestDispatcher(
				"/secure/_02_login/StockAnalys.jsp").forward(
				request, response);

	}
}
