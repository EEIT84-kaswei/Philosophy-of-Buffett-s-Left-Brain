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
import _03_stock_market.model.TaiexService;
import _03_stock_market.model.dao.TaiexDAOHibernate;

@WebServlet(urlPatterns={"/pages/TaiexServlet"})
public class TaiexServlet extends HttpServlet {
	private TaiexService taiexService;
	
	@Override
	public void init() throws ServletException {
		TaiexDAOHibernate taiexDAOHibernate=new TaiexDAOHibernate();
		taiexDAOHibernate.setSessionFactory(HibernateUtil.getSessionFactory());
		taiexService=new TaiexService();
		taiexService.setTaiexDAO(taiexDAOHibernate);		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw=response.getWriter();
		//接收資料
		String codeStr=request.getParameter("code");
		List<String> errorMsg=new ArrayList<String>();
		response.setCharacterEncoding("UTF-8");
		

		
		//驗證資料
		if(codeStr==null || codeStr.trim().length()==0){
			errorMsg.add("<span>請輸入指數代碼</span><br>");
		}
		if(codeStr!=null && !codeStr.equals("taiex")){
			errorMsg.add("<span>請輸入正確的指數代碼</span><br>");
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
		String allData=taiexService.getTaiexData();
		response.setContentType("application/json; charset=UTF-8");
		pw.print(allData);
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse respones)
			throws ServletException, IOException {
		this.doGet(request, respones);
	}

}
