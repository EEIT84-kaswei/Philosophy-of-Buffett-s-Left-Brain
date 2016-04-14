package _04_stock.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import misc.HibernateUtil;

import org.hibernate.Session;

import _04_stock.model.StockCodeService;
import _04_stock.model.dao.StockCodeDAOHibernate;


@WebServlet("/StockCodeServlet")
public class StockCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private StockCodeService codeService ;  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	}
	public void init() throws ServletException {
		StockCodeDAOHibernate dao = new StockCodeDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		codeService = new StockCodeService();
		codeService.setStockCodeDAO(dao);
	
	}
}
