package _02_login.model;

import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import _01_register.model.AccountBean;
import _01_register.model.dao.AccountDAOHibernate;

public class ForgetPasswordService {
	
	AccountDAOHibernate dao = new AccountDAOHibernate();	
	
	public void setDao(AccountDAOHibernate dao) {
		this.dao = dao;
	}
	
	public String selectEmailByAccount(String account){
		return dao.selectEmailByAccount(account);
	}
	
	public AccountBean selectByAccount(String account){
		AccountBean result = null; 
		if(account != null && account.trim().length() != 0){
			result = dao.selectByAccount(account);
		}
		return result;
	}

	public StringBuffer createNum() {
		int[] word = new int[8];
		int mod;
		for (int i = 0; i < 8; i++) {
			mod = (int) ((Math.random() * 7) % 3);
			if (mod == 1) { // 數字
				word[i] = (int) ((Math.random() * 10) + 48);
			} else if (mod == 2) { // 大寫英文
				word[i] = (char) ((Math.random() * 26) + 65);
			} else { // 小寫英文
				word[i] = (char) ((Math.random() * 26) + 97);
			}
		}
		StringBuffer auth = new StringBuffer();
		for (int j = 0; j < 8; j++) {
			auth.append((char) word[j]);
		}
		return auth;
	}
	
	public boolean sendNewPasswordMail(StringBuffer newPassword, String email) {
		boolean result = false;
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "eeit84kaswei@gmail.com";
		final String password = "eeit84eeit84";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		javax.mail.Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("eeit84kaswei@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("[巴菲特的左腦哲學]新密碼寄送信函");
			message.setText("請回到原註冊網頁輸入這組新密碼：" + newPassword + "\n登入後請立刻更換您的密碼，以確保會員隱私權益。謝謝！\n專業理財顧問　黃　印楷　啾咪");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			Transport.send(message);
			System.out.println("成功寄送新密碼email。");
			result = true;
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return result;
	}
	
	public boolean changePassword(String account, StringBuffer newPassword){
		AccountBean bean = dao.selectByAccount(account);
		bean.setPassw(newPassword.toString());
		System.out.println("bean = " + bean);
		AccountBean result = dao.update(bean);
		if(result != null){
			return true;
		}
		return false;
	}
	
}
