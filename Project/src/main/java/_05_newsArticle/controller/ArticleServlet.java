package _05_newsArticle.controller;

import java.io.IOException;
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

import misc.HibernateUtil;
import _05_newsArticle.model.ArticleBean;
import _05_newsArticle.model.ArticleService;
import _05_newsArticle.model.dao.ArticleDAOHibernate;

import _06_message.model.MessageBean;
import _06_message.model.MessageService;
import _06_message.model.dao.MessageDAOHibernate;

@WebServlet(urlPatterns = { "/pages/article.controller" })
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ArticleService articleService;
	private MessageService messageService;

	@Override
	public void init() throws ServletException {
		ArticleDAOHibernate dao = new ArticleDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		articleService = new ArticleService();
		articleService.setArticleDAO(dao);	
		
		MessageDAOHibernate messageDao = new MessageDAOHibernate();
		messageDao.setSessionFactory(HibernateUtil.getSessionFactory());
		messageService = new MessageService();
		messageService.setDao(messageDao);
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		
		String no = request.getParameter("ano");
		String prodaction = request.getParameter("prodaction");
		String revise = request.getParameter("revise");
		System.out.println("revise = " + revise);
		
		if(no != null && no.trim().length() != 0){
			Integer ano = Integer.parseInt(no);
			ArticleBean aresult = articleService.selectByAno(ano);
			List<MessageBean> mresult = messageService.selectByAno(ano);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", aresult);
			session.setAttribute("msg", mresult);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/singleArticle.jsp");
			return;
		}
		
		if (prodaction == null && no == null && revise == null) {
			List<ArticleBean> result = articleService.selectAll();
			HttpSession session = request.getSession();
			session.setAttribute("select", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
			return;
			
		} else if ("修改".equals(prodaction)) {
			String sano = request.getParameter("sano");
			if(sano != null && sano.trim().length() != 0){
				Integer ano = Integer.parseInt(sano);
				ArticleBean result = articleService.selectByAno(ano);
				HttpSession session = request.getSession();
				session.setAttribute("updArticle", result);
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_05_article/updArticle.jsp");
				return;
			}
			
		} else if ("刪除".equals(prodaction)) {
			String sano = request.getParameter("sano");
			if(sano != null && sano.trim().length() != 0){
				Integer ano = Integer.parseInt(sano);
				articleService.delete(ano);
				List<ArticleBean> result = articleService.selectAll();
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
				return;
			}
			
		} else if ("Insert".equals(prodaction)) {
			String uano = request.getParameter("uano");
			if(uano != null && uano.trim().length() != 0){
				Integer ano = Integer.parseInt(uano);
				String account = request.getRemoteUser();
				String aname =  request.getParameter("aname");
				String atitle =  request.getParameter("atitle");
				java.util.Date atime = new Date();
				String acontext =  request.getParameter("acontext");
				if(acontext.trim().length() == 0){
					error.put("acontext", "請輸入文章內容");
					request.getRequestDispatcher("/secure/_05_article/updArticle.jsp").forward(request, response);
					return;
				}
				ArticleBean bean = new ArticleBean();
				bean.setAno(ano);
				bean.setAccount(account);
				bean.setAname(aname);
				bean.setAtitle(atitle);
				bean.setAtime(atime);
				bean.setAcontext(acontext);
				
				articleService.update(bean);
				List<ArticleBean> result = articleService.selectAll();
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
				return;
				
			} else {
				String account = request.getRemoteUser();
				String aname =  request.getParameter("aname");
				String atitle =  request.getParameter("atitle");
				java.util.Date atime = new Date();
				String acontext =  request.getParameter("acontext");
				if(acontext.trim().length() == 0){
					error.put("acontext", "請輸入文章內容");
					request.getRequestDispatcher("/secure/_05_article/newArticle.jsp").forward(request, response);
					return;
				}
				ArticleBean bean = new ArticleBean();
				bean.setAccount(account);
				bean.setAname(aname);
				bean.setAtitle(atitle);
				bean.setAtime(atime);
				bean.setAcontext(acontext);
				if(acontext.trim().length() == 0){
					error.put("acontext", "請輸入文章內容");
					request.getRequestDispatcher("/pages/_05_newsArticle/updArticle.jsp").forward(request, response);
					return;
				}
				articleService.insert(bean);
				List<ArticleBean> result = articleService.selectAll();
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
				return;
			}
			
		} 
		System.out.println("revise = " + revise);
		if ("編輯".equals(revise)) {			
			String updm = request.getParameter("updm");
			String smno = request.getParameter("mno");
			Integer ano = Integer.parseInt(updm);
			Integer mno = Integer.parseInt(smno);			
			ArticleBean aresult = articleService.selectByAno(ano);
			List<MessageBean> mresult = messageService.selectByAno(ano);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", aresult);
			session.setAttribute("msg", mresult);
			session.setAttribute("updno", mno);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/updMessage.jsp");
			return;
			
		} else if("刪除".equals(revise)){
			String updm = request.getParameter("updm");
			String smno = request.getParameter("mno");
			Integer ano = Integer.parseInt(updm);
			messageService.delete(smno);
			ArticleBean aresult = articleService.selectByAno(ano);
			List<MessageBean> mresult = messageService.selectByAno(ano);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", aresult);
			session.setAttribute("msg", mresult);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/singleArticle.jsp");
			return;
		} else if("留言".equals(revise)){
			String account = request.getParameter("account");
			System.out.println("account = " + account);
			String sano = request.getParameter("sano");
			Integer ano = Integer.parseInt(sano);
			System.out.println("ano = " + ano);
			java.util.Date mtime = new Date();
			System.out.println("mtime = " + mtime);
			String mcontext = request.getParameter("content");
			System.out.println("mcontext = " + mcontext);
			MessageBean bean = new MessageBean();
			bean.setAccount(account);
			bean.setAno(ano);
			bean.setMtime(mtime);
			bean.setMcontext(mcontext);
			System.out.println("bean = " + bean);
			ArticleBean aresult = articleService.selectByAno(ano);
			MessageBean result = messageService.insert(bean);
			List<MessageBean> mresult = messageService.selectByAno(ano);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", aresult);
			session.setAttribute("msg", mresult);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/singleArticle.jsp");
			return;
		} else if("確認".equals(revise)){
			String umno = request.getParameter("umno");
			String uano = request.getParameter("uano");
			
			Integer mno = Integer.parseInt(umno);
			String account = request.getParameter("account");
			Integer ano = Integer.parseInt(uano);
			java.util.Date mtime = new Date();
			String mcontext = request.getParameter("mcontent");
			
			MessageBean bean = new MessageBean();
			bean.setMno(mno);
			bean.setAccount(account);
			bean.setAno(ano);
			bean.setMtime(mtime);
			bean.setMcontext(mcontext);
			messageService.update(bean);
			ArticleBean aresult = articleService.selectByAno(ano);
			List<MessageBean> mresult = messageService.selectByAno(ano);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", aresult);
			session.setAttribute("msg", mresult);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/singleArticle.jsp");
			return;
						
		} else if("取消".equals(revise)){
			String uano = request.getParameter("uano");
			Integer ano = Integer.parseInt(uano);
			ArticleBean aresult = articleService.selectByAno(ano);
			List<MessageBean> mresult = messageService.selectByAno(ano);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", aresult);
			session.setAttribute("msg", mresult);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/singleArticle.jsp");
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
