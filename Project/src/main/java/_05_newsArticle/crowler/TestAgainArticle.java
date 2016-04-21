package _05_newsArticle.crowler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class TestAgainArticle {

	public static void main(String[] args) throws IOException {
		
		int i=1000000;
		while(i<1600000){
			String s = Integer.toString(i);
			String url = "http://money.udn.com/money/story/8543/" + s;
			URL newURL  = new URL(url);
			
			Document doc = Jsoup.parse(newURL, 5000);
			Elements innerDiv = doc.select("div#story_body_content h2");
			Elements date = doc.select("div#story_body_content h3");
        	Elements author = doc.select("div#story_body_content span");
        	Elements p = doc.select("div#story_body_content p"); 
        	
        	if(!p.isEmpty()){
        		if(p.toString().contains("財")||p.toString().contains("股票")||p.toString().contains("錢")){
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
        		
        		
        		
        		ArticleBean articleBean = new ArticleBean();
        		articleBean.setAno(150);//id
        		articleBean.setAccount("Irina");//帳號
        		articleBean.setAname(textInfo2);//作家名稱
        		articleBean.setAtime(textInfo1);//時間
        		articleBean.setAtitle(textTitle);//文章名稱
        		articleBean.setAcontext(textP);//文章內容
        		
        		
        		
        		
        		//UTF-8
        		File file = new File("E:\\Articles\\" + innerDiv.text() + ".txt");
        		
        		//把網頁存出來，放在E碟：Articles
        		
        		try (FileOutputStream fos = new FileOutputStream(file);
        			 OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
        				PrintWriter pw = new PrintWriter(osw)){
    				pw.println(textTitle);
    				pw.println(textInfo1);
    				pw.println(textInfo2);
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
