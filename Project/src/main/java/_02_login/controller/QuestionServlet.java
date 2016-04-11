package _02_login.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;
import org.junit.runner.Request;

import _02_login.model.QuestionBean;
import _02_login.model.QuestionService;
import _02_login.model.dao.QuestionDAOHibernate;
import misc.HibernateUtil;


@WebServlet("/_02_login.controller/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private QuestionService service;   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
//接收HTML Form資料		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		
		request.setCharacterEncoding("UTF-8");
//驗證HTML Form資料			
		int Q1=0,Q2=0,Q3=0,Q4=0,Q5=0,Q6=0;
		Integer id = 4;
		Integer Risk_Tolerance = 0;
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
//		Date date = null;
//		try {
//			date = sformat.parse("2016-02-02 13-30-30");
//		} catch (ParseException e1) {			
//			e1.printStackTrace();
//		}
		Timestamp QDate = new Timestamp(new Date().getTime());

		String q1 = request.getParameter("question1");
		if(q1==null){
			q1="0";
			error.put("question1","請回答第一題");
		}
		Q1=Integer.parseInt(q1);
		String q2 = request.getParameter("question2");
		if(q2==null){
			q2="0";
			error.put("question2","請回答第二題");			
		}
		Q2=Integer.parseInt(q2);
		String q3 = request.getParameter("question3");
		if(q3==null){
			q3="0";
			error.put("question3","請回答第三題");
		}
		Q3=Integer.parseInt(q3);
		String q4 = request.getParameter("question4");
		if(q4==null){
			q4="0";
			error.put("question4","請回答第四題");
		}
		Q4=Integer.parseInt(q4);		
		if(Q4>4){
			Q4=5;
		}else if(Q4>3){
			Q4=4;
		}else if(Q4>2){
			Q4=3;
		}else if(Q4>1){
			Q4=2;
		}else Q4=1;
		String q5 = request.getParameter("question5");
		if(q5==null){
			q5="0";
			error.put("question5","請回答第五題");
		}
		Q5=Integer.parseInt(q5);
		String q6 = request.getParameter("question6");
		if(q6==null){
			q6="0";
			error.put("question6","請回答第六題");
		}
		Q6=Integer.parseInt(q6);
		
		Integer scores = service.scores(Q1, Q2, Q3, Q4, Q5, Q6);
		Risk_Tolerance = service.risk(scores);
		
//		Integer scores = Q1+Q2+Q3+Q4+Q5+Q6;
//		if(scores <= 11){
//			Risk_Tolerance = 1;
//		}else if(scores>11 && scores<=21){
//			Risk_Tolerance = 2;
//		}else Risk_Tolerance = 3;
//		
//		if(!error.isEmpty()&&error!=null){
//			RequestDispatcher rd = request.getRequestDispatcher("/secure/register/questionError.jsp");
//			rd.forward(request, response);
//			return;
//		}
		
			
		
		QuestionBean bean = new QuestionBean();
		try {
			bean.setId(id);
			bean.setQDate(QDate);
			bean.setRisk_Tolerance(Risk_Tolerance);
			bean.setScores(scores);

			service.insert(bean);
	//		request.setAttribute("AnswerBean", bean);
			RequestDispatcher rd = request.getRequestDispatcher("/secure/register/questionnaire.jsp");
			rd.forward(request, response);
//			if(Risk_Tolerance == 1){
//			rd = request.getRequestDispatcher("/secure/register/questionnaire.jsp");
//			rd.forward(request, response);
//			}else if(Risk_Tolerance == 2){
//				rd = request.getRequestDispatcher("/secure/register/questionnaire.jsp");
//				rd.forward(request, response);
//			}else if(Risk_Tolerance == 3){
//				rd = request.getRequestDispatcher("/secure/register/questionnaire.jsp");
//				rd.forward(request, response);
//			}
			
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("/secure/register/questionError.jsp");
			e.printStackTrace();
			rd.forward(request, response);
					
		}
	}

	//在未使用spring前，先使用init方法取得session
	@Override
	public void init() throws ServletException {  
		QuestionDAOHibernate dao= new QuestionDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new QuestionService();
		service.setQuestionDAO(dao);
	}

}
