package _05_newsArticle.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import misc.HibernateUtil;

import org.hibernate.HibernateException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import _05_newsArticle.model.ArticleBean;
import _05_newsArticle.model.dao.ArticleDAOHibernate;

public class TestAgainArticle {

	public static void main(String[] args) throws IOException {
		
		int i=1710000;
		while(i<1720000){
			System.out.println(i);
			String s = Integer.toString(i);
			String url = "http://money.udn.com/money/story/8543/" + s;
			URL newURL  = new URL(url);
			
			Document doc = Jsoup.parse(newURL, 5000);
			Elements innerDiv = doc.select("div#story_body_content h2");
			Elements date = doc.select("div#story_body_content h3");
        	Elements author = doc.select("div#story_body_content span");
        	Elements p = doc.select("div#story_body_content p"); 
        	
        	if(!p.isEmpty()){
        		if((p.toString().contains("股票"))&(!author.text().toString().contains("記者"))&(!author.text().toString().contains("報導"))){

        		System.out.println("title:" + innerDiv.text());
        		System.out.println("info:" + date.text().substring(0, 19));
        		System.out.println("author:" + author.text());
        		System.out.print(p);
        		System.out.println();
        		System.out.println();
        	
        		String textTitle = innerDiv.text();
        		String textInfo1 =  date.text().substring(0, 19);
        		String textInfo2 = author.text();
        		String textP = p.toString(); //if text(), 標籤會不見
        		
        		
        		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        		Date dateTime = null;
        			if(textInfo1!=null) {
        				try {
							dateTime = sFormat.parse(textInfo1);
						} catch (ParseException e) {
							e.printStackTrace();
						}
       				}
      		
        		ArticleBean articleBean = new ArticleBean();
//        		articleBean.setAno(150);//id
        		articleBean.setAccount("irina");//帳號
        		articleBean.setAname(textInfo2);//作家名稱
        		articleBean.setAtime(dateTime);//時間
        		articleBean.setAtitle(textTitle);//文章名稱
        		articleBean.setAcontext(textP);//文章內容
        		
        		ArticleDAOHibernate adh = new ArticleDAOHibernate();
        		adh.setSessionFactory(HibernateUtil.getSessionFactory());
        		        		
        		try {
					HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
					ArticleBean ab;
					ab = adh.insert(articleBean);
					System.out.println(ab);
					HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
				} catch (HibernateException e1) {
					HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
					e1.printStackTrace();
				}
        		
        		
        		//UTF-8
        		File file = new File("E:\\Articles\\" + innerDiv.text() + ".txt");
        		
        		//把網頁存出來，放在E碟：Articles
        		
        		try (FileOutputStream fos = new FileOutputStream(file);
        			 OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
        				PrintWriter pw = new PrintWriter(osw)){
    				pw.println(textTitle);
    				pw.println(textInfo1);
    				pw.println(textInfo2);
    				pw.println(newURL.toString());
    				pw.println(textP);
        			
    				System.out.println(innerDiv.text() + " 讀取完畢!!!");

    			} catch (IOException e) {
    				System.out.println(e.getMessage());
    			}
        		
        	
        	}
			}
			i++;
		}
		
	}

}
