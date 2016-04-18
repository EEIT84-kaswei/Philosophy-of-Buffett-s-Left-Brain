package _03_stock_market.model.controller;

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
import _03_stock_market.model.InstantStockService;
import _03_stock_market.model.dao.InstantStockDAOHibernate;

@WebServlet(urlPatterns={"/pages/InstantStockServlet"})
public class InstantStockServlet extends HttpServlet {
	private InstantStockService instantStockService;

	@Override
	public void init() throws ServletException {
		InstantStockDAOHibernate instantStockDAOHibernate=new InstantStockDAOHibernate();
		instantStockDAOHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
		instantStockService=new InstantStockService();
		instantStockService.setInstantStockDAO(instantStockDAOHibernate);;
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
			errorMsg.add("<span>請輸入股票代碼</span><br>");
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
		String allData=instantStockService.selectByOneStock(stock_Code);
		response.setContentType("application/json; charset=UTF-8");
		pw.print(allData);
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
