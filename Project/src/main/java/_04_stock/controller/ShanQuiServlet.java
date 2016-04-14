package _04_stock.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import _03_stock_market.model.InstantStockOneBean;
import _03_stock_market.model.InstantStockOneService;
import _03_stock_market.model.dao.InstantStockOneDAOHibernate;
import _04_stock.model.StockCodeService;
import _04_stock.model.dao.StockCodeDAOHibernate;
import misc.HibernateUtil;

@WebServlet(
		urlPatterns={"/secure/shanQui.view"}    )

public class ShanQuiServlet extends HttpServlet{
	/*用即時UpdateService找出股票資料，找出分類在 上市股這分類內的，所有股票即時交易資料（興櫃股沒抓到）*/
	private InstantStockOneService instantStockOneService; 
	
	@Override
	public void init() throws ServletException {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		InstantStockOneDAOHibernate oneDao = new InstantStockOneDAOHibernate(sessionFactory);
		instantStockOneService = new InstantStockOneService();
		instantStockOneService.setInstantStockOneDAO(oneDao);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**進到這個servlet，就是代表要取上市股的資料，所以直接抓。未來看可否改良成都用同一個servlet卻可以判斷連結點的是哪一個值
		 * param "s1"（上市股）
		 * return
		 * **/
		
		//呼叫model
		List<InstantStockOneBean> beans = instantStockOneService.selectByType("s2");
		
		//將值 設定到request內，並轉到承接的View
		request.setAttribute("stockTypeName", "上櫃股");
		request.setAttribute("stockType", beans);
		request.getRequestDispatcher("/secure/_04_stock/stockType.jsp").forward(request, response);
		System.out.println("這是上櫃股servlet");

//		HttpSession session = request.getSession();
//		session.setAttribute("stockTypeName", "上市股");
//		session.setAttribute("stockType", beans);
//		String path = request.getContextPath();
//		response.sendRedirect(path + "");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, resp);
	}



}
