package _02_login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _04_stock.model.DailyStockService;
import _04_stock.model.SecuritiesTradeService;

@WebServlet("/CustFavoriteServlet")
public class CustFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CustFavoriteServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 接收HTML Form資料
		String stock_Code = request.getParameter("stock_Code");
		// 轉換HTML Form資料
		int soock_Number ;
		try {
			soock_Number = Integer.parseInt(stock_Code);
		} catch (NumberFormatException e) {
			System.out.println("股票代碼有誤");
			e.printStackTrace();
		}
		// 驗證HTML Form資料	//似乎不需要
		
		// 呼叫Model
		SecuritiesTradeService TradeService = new SecuritiesTradeService();
		DailyStockService dailyStockService = new DailyStockService();
		
		// 根據Model執行結果顯示View
	}

}
