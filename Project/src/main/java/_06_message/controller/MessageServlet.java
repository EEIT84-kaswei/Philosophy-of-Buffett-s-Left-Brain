package _06_message.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import misc.HibernateUtil;
import _01_register.model.AccountBean;
import _06_message.model.MessageBean;
import _06_message.model.MessageService;
import _06_message.model.dao.MessageDAOHibernate;

@WebServlet("/secure/_05_article/message.do")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MessageService messageService;

	@Override
	public void init() throws ServletException {
		MessageDAOHibernate messageDao = new MessageDAOHibernate();
		messageDao.setSessionFactory(HibernateUtil.getSessionFactory());
		messageService = new MessageService();
		messageService.setDao(messageDao);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodaction = request.getParameter("prodaction");
		
		HttpSession session = request.getSession();
		
		if ("Send".equals(prodaction)) {
			String account = request.getParameter("account");
			String sano = request.getParameter("ano");
			Integer ano = Integer.parseInt(sano);
			String content = request.getParameter("content");
			java.util.Date mtime = new Date();
			MessageBean result = new MessageBean();
			result.setAccount(account);
			result.setAno(ano);
			result.setMtime(mtime);
			result.setMcontext(content);
			messageService.insert(result);
			List<MessageBean> bean = messageService.selectByAno(ano);
			System.out.println("bean = " + bean);
			if (bean != null) {
				session.removeAttribute("msg");
				session.setAttribute("msg", bean);
			}
			String path = request.getContextPath();
			response.sendRedirect(path+"/showMessage.jsp");
		} else if ("刪除".equals(prodaction)) {
			String mno = request.getParameter("mno");
			messageService.delete(mno);
			int ano = (int) session.getAttribute("ano");
			System.out.println("刪除第" + ano + "篇文章的一個留言!");
			List<MessageBean> bean = messageService.selectByAno(ano);
			System.out.println("bean = " + bean);
			if (bean != null) {
				session.removeAttribute("msg");
				session.setAttribute("msg", bean);
			}
			String path = request.getContextPath();
			response.sendRedirect(path+"/showMessage.jsp");
		} else if ("編輯".equals(prodaction)) {
			String smno = request.getParameter("mno");
			Integer mno = Integer.parseInt(smno);
			if(session.getAttribute("mno") != null){
				session.removeAttribute("mno");
			}
			session.setAttribute("mno", mno);
			int ano = (int) session.getAttribute("ano");
			List<MessageBean> bean = messageService.selectByAno(ano);
			System.out.println("bean = " + bean);
			if (bean != null) {
				session.removeAttribute("msg");
				session.setAttribute("msg", bean);
			}
			String path = request.getContextPath();
			response.sendRedirect(path+"/updateMessage.jsp");
		} else if ("確認".equals(prodaction)) {
			//1.取得mno
			String smno = request.getParameter("mno");
			Integer mno = Integer.parseInt(smno);
			//2.取得mcontent
			String mcontent = request.getParameter("mcontent");
			//3.取得account
			AccountBean user = (AccountBean) session.getAttribute("user");
			String account = user.getAccount();
			//4.取得ano
			int ano = (int) session.getAttribute("ano");
			//5.取得mtime(修改時間)
			java.util.Date mtime = new Date();
			MessageBean result = new MessageBean();
			result.setMno(mno);
			result.setAccount(account);
			result.setAno(ano);
			result.setMtime(mtime);
			result.setMcontext(mcontent);
			messageService.update(result);
			List<MessageBean> bean = messageService.selectByAno(ano);
			System.out.println("bean = " + bean);
			if (bean != null) {
				session.removeAttribute("msg");
				session.setAttribute("msg", bean);
			}
			String path = request.getContextPath();
			response.sendRedirect(path+"/showMessage.jsp");
		} else if ("取消".equals(prodaction)) {
			int ano = (int) session.getAttribute("ano");
			List<MessageBean> bean = messageService.selectByAno(ano);
			System.out.println("bean = " + bean);
			if (bean != null) {
				session.removeAttribute("msg");
				session.setAttribute("msg", bean);
			}
			String path = request.getContextPath();
			response.sendRedirect(path+"/showMessage.jsp");
		}
	}

}
