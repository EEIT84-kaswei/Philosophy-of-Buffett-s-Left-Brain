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

@WebServlet(urlPatterns = { "/pages/article.controller" })
public class ArticleServlet extends HttpServlet {
	private ArticleService articleService;

	@Override
	public void init() throws ServletException {
		ArticleDAOHibernate dao = new ArticleDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		articleService = new ArticleService();
		articleService.setArticleDAO(dao);
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收HTML Form資料
		request.setCharacterEncoding("UTF-8");
		String no = request.getParameter("ano");
		String strId = request.getParameter("id");
		String aname = request.getParameter("aname");
		String atitle = request.getParameter("atitle");
		String acontext = request.getParameter("acontext");
		String prodaction = request.getParameter("prodaction");
		String sname = request.getParameter("sname");
		// 轉換HTML Form資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		Integer ano = 0;
		if (no != null && no.trim().length() != 0) {
			try {
				ano = Integer.parseInt(no.trim());
			} catch (NumberFormatException e) {
			}
		}
		
		int id = 0;
		if (strId != null && strId.trim().length() != 0) {
			try {
				id = Integer.parseInt(strId.trim());
			} catch (NumberFormatException e) {
			}
		}
		//帳號ID暫時寫死
		id=131;
		
		
		// 驗證HTML Form資料
		if ("Insert".equals(prodaction)) {
			if (aname == null || aname.trim().length() == 0) {
				error.put("aname", "名稱欄位請勿空白");
			}
			if (atitle == null || atitle.trim().length() == 0) {
				error.put("atitle", "標題欄位請勿空白");
			}
			if (acontext == null || acontext.trim().length() == 0) {
				error.put("acontext", "內文欄位請勿空白");
			}
		}

		if (error != null && !error.isEmpty() && "Insert".equals(prodaction)) {
			request.getRequestDispatcher("/secure/_05_article/newArticle.jsp")
					.forward(request, response);
			return;
		}
		// 呼叫Model
		ArticleBean bean = new ArticleBean();
		bean.setId(id);
		bean.setAno(ano);
		bean.setAname(aname);
		bean.setAtime(new Date());
		bean.setAtitle(atitle);
		bean.setAcontext(acontext);
		System.out.println(bean);
		// 根據Model執行結果顯示View
		
		
		
//		System.out.println("01"+prodaction);
//		System.out.println("02"+(sname.trim().length() == 0));//沒資料為Null 打開會NullPointerException
//		System.out.println(bean.getAno());
		if (prodaction == null&&no!=null) {
			ArticleBean result = articleService.selectByAno(bean);
			HttpSession session = request.getSession();
			session.setAttribute("singleArticle", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/singleArticle.jsp");
		}
		if ((prodaction == null||("搜尋".equals(prodaction)&&sname.trim().length() == 0))&&no==null) {
			List<ArticleBean> result = articleService.select();
			HttpSession session = request.getSession();
			session.setAttribute("select", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
		}
		if ("搜尋".equals(prodaction)&&sname.trim().length() != 0) {
			List<ArticleBean> result = articleService.selectByAname(sname);
			HttpSession session = request.getSession();
			session.setAttribute("select", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
		}
		
		if ("修改".equals(prodaction)) {
			ArticleBean result = articleService.selectByAno(bean);
			HttpSession session = request.getSession();
			session.setAttribute("updArticle", result);
			String path = request.getContextPath();
			response.sendRedirect(path
					+ "/secure/_05_article/updArticle.jsp");
		}
		
		if ("Insert".equals(prodaction)) {
			ArticleDAOHibernate dao = new ArticleDAOHibernate();
			ArticleBean bano = articleService.selectByAno(bean);
			System.out.println("bano=" + bano);
			if (bano != null && ano.equals(bano.getAno())) {
				articleService.update(bean);
				List<ArticleBean> result = articleService.select();
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				String path = request.getContextPath();
				response.sendRedirect(path
						+ "/secure/_05_article/articleIndex.jsp");
			} else {
				articleService.insert(bean);
				List<ArticleBean> result = articleService.select();
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				String path = request.getContextPath();
				response.sendRedirect(path
						+ "/secure/_05_article/articleIndex.jsp");
			}
		}
		if ("刪除".equals(prodaction)) {
			articleService.delete(bean);
			List<ArticleBean> result = articleService.select();
			HttpSession session = request.getSession();
			session.setAttribute("select", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
