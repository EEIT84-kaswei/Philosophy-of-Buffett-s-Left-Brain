package _05_newsArticle.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _05_newsArticle.model.NewsBean;
import _05_newsArticle.model.NewsService;
import _05_newsArticle.model.dao.NewsDAOHibernate;
import misc.HibernateUtil;

@WebServlet("/pages/_05_newsArticle/news.do")
//@WebServlet("/news.do")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	private NewsService service;
	
	@Override
	public void init() throws ServletException {
		NewsDAOHibernate dao = new NewsDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new NewsService();
		service.setDao(dao);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String prodaction = request.getParameter("prodaction");
		String nno = request.getParameter("nno");	
//		Map<String, String> error = new HashMap<String, String>();
//		request.setAttribute("error", error);
		
		if(nno != null && nno.trim().length() != 0){
			service.delete(nno);
			List<NewsBean> bean = service.selectAll();
			request.setAttribute("select", bean);
			request.getRequestDispatcher("/news.jsp").forward(request, response);
		}
			
		if("News".equals(prodaction)) {
			List<NewsBean> bean = service.selectAll();
			request.setAttribute("select", bean);
			request.getRequestDispatcher("/pages/_05_newsArticle/news.jsp").forward(request, response);
		} else if("keySearch".equals(prodaction)){
			String keyword = request.getParameter("keyword");
			if(keyword != null && keyword.trim().length() != 0){
				List<NewsBean> bean = service.selectByKeyWord(keyword);
				request.setAttribute("select", bean);
				request.getRequestDispatcher("/news.jsp").forward(request, response);				
			} else {
				request.getRequestDispatcher("/news.jsp").forward(request, response);
			}
		} else if("dateSearch".equals(prodaction)){
			String tempDate = request.getParameter("date");
			java.util.Date date = null;
			if(tempDate!=null && tempDate.trim().length()!=0) {
				try {
					date = sFormat.parse(tempDate.trim());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				List<NewsBean> bean = service.selectByDate(date);
				request.setAttribute("select", bean);
				request.getRequestDispatcher("/news.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/news.jsp").forward(request, response);
			} 
		} else if("送出".equals(prodaction)) {
			String updateNo = request.getParameter("updateNo");
			
			//request.setCharacterEncoding("UTF-8")只對位於請求本體的文字資料有效,對GET方法傳送的資料(如查詢字串)無效,
			//因為Tomcat8.0以前用ISO-8859-1編碼來解讀整個URL。
			//在Tomcat8.0以前有三種方法解決此問題：
			//1.在server.xml內的<Connector connectionTimeout="UTF-8" port="8080"...>標籤中,加上URIEncoding="UTF-8"。
			//2.在<Connector>標籤中加上useBodyEncodingForURI="true"。
			//3.在程式中使用：
			//  String name = request.getParameter('CustomerName');
			//  name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
			//(Tomcat8.0以後使用UTF-8編碼來解讀整個URL,所以不需要修改。)--------------詳情請參閱：Servlet/JSP 第一冊 ch02-21
//			java.util.Date Newsdate = null;
			if(updateNo != null && updateNo.trim().length() != 0) {
				String title = request.getParameter("title");
				//title = new String(title.getBytes("ISO-8859-1"), "UTF-8");		
				java.util.Date Newsdate = new Date();
				String context = request.getParameter("context");
				//context = new String(context.getBytes("ISO-8859-1"), "UTF-8");
				
				NewsBean result = new NewsBean();
				Integer i = Integer.parseInt(updateNo);
				result.setNno(i);
				result.setNtitle(title);
				result.setNtime(Newsdate);
				result.setNcontext(context);
				service.update(result);
				List<NewsBean> bean = service.selectAll();
				request.setAttribute("select", bean);
				request.getRequestDispatcher("/news.jsp").forward(request, response);
			} else {
				String title = request.getParameter("title");		
				java.util.Date Newsdate = new Date();
				String context = request.getParameter("context");
				
				NewsBean result = new NewsBean();
				result.setNtitle(title);
				result.setNtime(Newsdate);
				result.setNcontext(context);
				service.insert(result);
				List<NewsBean> bean = service.selectAll();
				HttpSession session = request.getSession();
				session.setAttribute("select", bean);
				
				String path = request.getContextPath();
				response.sendRedirect(path+"/news.jsp");
//				request.getRequestDispatcher("/news.jsp").forward(request, response);
			}
		}	
	}
}
