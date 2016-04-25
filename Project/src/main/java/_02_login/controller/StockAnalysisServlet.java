package _02_login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import misc.HibernateUtil;
import _02_login.model.StockAnalysisBean;
import _02_login.model.StockAnalysisService;
import _02_login.model.dao.StockAnalysisDAOHibernate;


@WebServlet("/secure/StockAnalysis")
public class StockAnalysisServlet extends HttpServlet {

	
	private StockAnalysisService service;
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 轉換HTML Form資料
		List<StockAnalysisBean> beanS = service.select();
		
		
		// 根據Model執行結果顯示View
		// request.setAttribute("stockTable", stockTable);		
		request.setAttribute("beanS", beanS);		
		request.getRequestDispatcher(
				"/secure/_02_login/StockAnalysis.jsp").forward(
				request, response);

	}
	public void init() throws ServletException {
		StockAnalysisDAOHibernate daoAnalysis = new StockAnalysisDAOHibernate();
		daoAnalysis.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new StockAnalysisService();
		service.setDao(daoAnalysis);
		
	}
}
