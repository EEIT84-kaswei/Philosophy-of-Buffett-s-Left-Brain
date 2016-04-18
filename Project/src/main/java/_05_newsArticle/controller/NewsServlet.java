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
		request.setCharacterEncoding("UTF-8");
		
		String prodaction = request.getParameter("prodaction");
		String nno = request.getParameter("nno");
		String newUrl = request.getParameter("newUrl");
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		
		if(newUrl != null && newUrl.trim().length() != 0){
			Integer num = Integer.parseInt(newUrl);
			NewsBean bean = service.selectByNno(num);
			HttpSession session = request.getSession();
			session.setAttribute("select", bean);				
			String path = request.getContextPath();
			response.sendRedirect(path+"/pages/_05_newsArticle/showNews.jsp");
			return;
		}
		
		if(nno != null && nno.trim().length() != 0){
			service.delete(nno);
			List<NewsBean> bean = service.selectAll();
			HttpSession session = request.getSession();
			session.setAttribute("select", bean);				
			String path = request.getContextPath();
			response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
			return;
		}
			
		if(prodaction == null && newUrl == null && nno == null) {
			List<NewsBean> bean = service.selectAll();
			HttpSession session = request.getSession();
			session.setAttribute("select", bean);				
			String path = request.getContextPath();
			response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
			return;
			
		} else if("keySearch".equals(prodaction)){
			String keyword = request.getParameter("keyword");
			if(keyword != null && keyword.trim().length() != 0){
				List<NewsBean> bean = service.selectByKeyWord(keyword);				
				HttpSession session = request.getSession();
				session.setAttribute("select", bean);				
				String path = request.getContextPath();
				response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
				
			} else {
				String path = request.getContextPath();
				response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
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
				HttpSession session = request.getSession();
				session.setAttribute("select", bean);				
				String path = request.getContextPath();
				response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
			} else {
				String path = request.getContextPath();
				response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
			} 
			
		} else if("修改".equals(prodaction)){
			String updtno = request.getParameter("updtno");
			Integer n = Integer.parseInt(updtno);
			NewsBean bean = service.selectByNno(n);			
			HttpSession session = request.getSession();
			session.setAttribute("select", bean);				
			String path = request.getContextPath();
			response.sendRedirect(path+"/pages/_05_newsArticle/updateNews.jsp");
			
		} else if("送出".equals(prodaction)) {
			String updateNo = request.getParameter("updateNo");
			if(updateNo != null && updateNo.trim().length() != 0) {
				String title = request.getParameter("title");		
				java.util.Date newsDate = new Date();
				String context = request.getParameter("context");
				if(context == null || context.trim().length() == 0){
					error.put("content", "請輸入新聞內容");
					request.getRequestDispatcher("/pages/_05_newsArticle/updateNews.jsp").forward(request, response);
					return;
				}
				NewsBean result = new NewsBean();
				Integer i = Integer.parseInt(updateNo);
				result.setNno(i);
				result.setNtitle(title);
				result.setNtime(newsDate);
				result.setNcontext(context);
				service.update(result);
				List<NewsBean> bean = service.selectAll();				
				HttpSession session = request.getSession();
				session.setAttribute("select", bean);				
				String path = request.getContextPath();
				response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");				
			} else {
				String title = request.getParameter("title");		
				java.util.Date newsDate = new Date();
				String context = request.getParameter("context");	
				if(context == null || context.trim().length() == 0){
					error.put("content", "請輸入新聞內容");
					request.getRequestDispatcher("/pages/_05_newsArticle/insertNews.jsp").forward(request, response);
					return;
				}
				NewsBean result = new NewsBean();
				result.setNtitle(title);
				result.setNtime(newsDate);
				result.setNcontext(context);
				service.insert(result);
				List<NewsBean> bean = service.selectAll();
				HttpSession session = request.getSession();
				session.setAttribute("select", bean);				
				String path = request.getContextPath();
				response.sendRedirect(path+"/pages/_05_newsArticle/news.jsp");
			}
		}	
	}
}
