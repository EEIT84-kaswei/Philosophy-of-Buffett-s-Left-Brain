package _04_stock.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import misc.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.jpa.criteria.expression.function.TrimFunction;

import _04_stock.model.StockCodeBean;
import _04_stock.model.StockCodeService;
import _04_stock.model.dao.StockCodeDAOHibernate;

@WebServlet("/secure/StockCodeServlet")
public class StockCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	private StockCodeService codeService;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 接收HTML Form資料
		String stockManage = request.getParameter("stockManage");
		String stock_Code = request.getParameter("stock_Code");
		String stock_Name = request.getParameter("stock_Name");
		String stock_TypeCode = request.getParameter("stock_TypeCode");
		String cs_Code = request.getParameter("cs_Code");
		String commend = request.getParameter("commend");

		// 轉換HTML Form資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		Integer code = 0;
		if (stock_Code != null && stock_Code.trim().length() != 0) {
			try {
				code = Integer.parseInt(stock_Code.trim());
			} catch (NumberFormatException e) {

			}
		}
		// 驗證HTML Form資料 好像也不用
		if ("Insert".equals(stockManage)||"Update".equals(stockManage)) {
			if (stock_Code == null || stock_Code.trim().length() == 0) {
				error.put("error", "請填上號碼");
			} else if (stock_Name == null || stock_Name.trim().length() == 0) {
				error.put("error", "請填上股票名稱");
			} else if (stock_TypeCode == null
					|| stock_TypeCode.trim().length() == 0) {
				error.put("error", "請填上股票分類");
			} else if (cs_Code == null || cs_Code.trim().length() == 0) {
				error.put("error", "請填上概念股分類");
			} else if (commend == null || commend.trim().length() == 0) {
				error.put("error", "請填上風險分類");
			}
		}
		if(error!=null && !error.isEmpty()) {
			request.getRequestDispatcher("").forward(request, response);
			return;
		}

		// 呼叫Model		
		StockCodeBean bean = new StockCodeBean();
		bean.setStock_Code(code);
		bean.setStock_Name(stock_Name);
		bean.setStock_TypeCode(stock_TypeCode);
		bean.setCs_Code(cs_Code);
		bean.setCommend(commend);
		
		// 根據Model執行結果顯示View
		if ("Select".equals(stockManage)){
			List<StockCodeBean> result = codeService.selectAll();
		}
		if(stockManage!=null||"Insert".equals(stockManage)){
			StockCodeBean result = codeService.insert(bean);
			if(result==null) {
				error.put("error", "Insert fail");
			} else {
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher("").forward(request, response);
		}
		if(stockManage!=null||"Update".equals(stockManage)){
			StockCodeBean result = codeService.insert(bean);
			if(result==null) {
				error.put("error", "Update fail");
			} else {
				request.setAttribute("update", result);
			}
			request.getRequestDispatcher("").forward(request, response);
		}
		

	}

	public void init() throws ServletException {
		StockCodeDAOHibernate dao = new StockCodeDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		codeService = new StockCodeService();
		codeService.setStockCodeDAO(dao);

	}
}
