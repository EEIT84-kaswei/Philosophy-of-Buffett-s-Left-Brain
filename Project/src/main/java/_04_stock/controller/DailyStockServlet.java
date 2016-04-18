package _04_stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import misc.HibernateUtil;
import _04_stock.model.DailyStockService;
import _04_stock.model.dao.DailyStockDAOHibernate;

@WebServlet(urlPatterns={"/secure/DailyStockServlet"})
public class DailyStockServlet extends HttpServlet {
	private DailyStockService dailyStockService;
	@Override
	public void init() throws ServletException {
		DailyStockDAOHibernate dao=new DailyStockDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		dailyStockService=new DailyStockService();
		dailyStockService.setDailyStockDAO(dao);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw=response.getWriter();
		//接收資料
		String stock_CodeStr=request.getParameter("stock_Code");
		List<String> errorMsg=new ArrayList<String>();
		response.setCharacterEncoding("UTF-8");
		
		//轉換資料
		int stock_Code=0;
		if(stock_CodeStr!=null && stock_CodeStr.trim().length()!=0){
			try {
				stock_Code=Integer.parseInt(stock_CodeStr);
			} catch (NumberFormatException e) {
				errorMsg.add("<span>請輸入正確的股票代碼</span><br>");
			}
		}
		
		//驗證資料
		if(stock_CodeStr==null || stock_CodeStr.trim().length()==0){
			errorMsg.add("<span>請輸入股票代號</span><br>");
		}
		if(!errorMsg.isEmpty()){
			response.setContentType("text/html; charset=UTF-8"); 
			for(String msg:errorMsg){
				pw.println(msg);
			}
			pw.close();
			return;
		}
		
		//呼叫Model

		String priceData=dailyStockService.selectAllofOneStock(stock_Code);
		response.setContentType("application/json; charset=UTF-8");
		pw.print(priceData);
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
