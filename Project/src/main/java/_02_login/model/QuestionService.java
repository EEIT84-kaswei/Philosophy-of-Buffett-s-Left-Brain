package _02_login.model;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.RequestDispatcher;
import javax.xml.crypto.Data;

import _02_login.controller.QuestionServlet;
import misc.HibernateUtil;
import _02_login.model.dao.QuestionDAOHibernate;

public class QuestionService {
	private QuestionDAO questionDAO;

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}
	
	public static void main(String[]args){
		QuestionDAOHibernate dao = new QuestionDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		QuestionService service = new QuestionService();
		service.setQuestionDAO(dao);
		
//		try {
//			dao.getSession().beginTransaction();				//測試:查詢全部
//			List<QuestionBean> beans = service.selectAll();
//			for(QuestionBean bean:beans){
//				System.out.println(bean);
//			}
//			
//			dao.getSession().getTransaction().commit();
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
		
//		QuestionBean beans = new QuestionBean();				//測試:新增資料
//		QuestionBean bean2 = null;
//		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
//		Date date = null;
//		try {
//			date = sFormat.parse("2016-02-07 13-30-30");
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Timestamp stamp = new Timestamp(date.getTime());
//		try {
//			dao.getSession().beginTransaction();
//			beans.setId(3);
//			beans.setQDate(stamp);
//			beans.setRisk_Tolerance(2);
//			beans.setScores(14);
//			bean2 = service.insert(beans);
//			dao.getSession().getTransaction().commit();
//		} catch (Exception e) {
//			dao.getSession().getTransaction().rollback();
//			e.printStackTrace();
//		}
	}
	
	
	public List<QuestionBean> selectAll(){
		List<QuestionBean> result = null;
		result = questionDAO.selectAll();
		return result;
							
	}
	
	public List<QuestionBean> select(String account){
		List<QuestionBean> result = null;
		if(account!=null){
		result = questionDAO.select(account);
		}
		return result;
		
	}
	
	public QuestionBean selectLast(String account){
		QuestionBean result = null;
		if(account!=null){
			result = questionDAO.selectLast(account);
		}
		return result;
	}
		
	
	public QuestionBean insert(QuestionBean bean){
		QuestionBean result =new QuestionBean();
		QuestionServlet servlet = new QuestionServlet();
		
		if(bean!=null){
			result = questionDAO.insert(bean);
		}
		return result;
		
	}
	public  int scores(int Q1,int Q2,int Q3,int Q4,int Q5,int Q6){
		
		int total = Q1+Q2+Q3+Q4+Q5+Q6;				
		return total;		
	}
	public Integer risk(Integer scores){
		Integer Risk_Tolerance = 0;
		if(scores<=11){
			Risk_Tolerance = 3;
		}else if(scores>11 && scores<=21){
			Risk_Tolerance = 2;
		}else if(scores>21){
			Risk_Tolerance = 1;
		}
		
		return Risk_Tolerance;
		
	}
	
	
	
	


	
}
