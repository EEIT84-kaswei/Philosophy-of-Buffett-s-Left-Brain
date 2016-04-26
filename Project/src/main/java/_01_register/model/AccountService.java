package _01_register.model;

import java.util.Properties;
import java.util.regex.Pattern;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import misc.HibernateUtil;
import _01_register.model.dao.AccountDAOHibernate;
import _01_register.model.dao.AccountRoleDAOHibernate;

public class AccountService {
	private AccountDAOHibernate dao;
	private AccountRoleDAOHibernate ardao;

	public void setDao(AccountDAOHibernate dao) {
		this.dao = dao;
	}

	public static void main(String[] args) {
		org.hibernate.Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			AccountDAOHibernate dao = new AccountDAOHibernate();
			dao.setSessionFactory(HibernateUtil.getSessionFactory());
			AccountService service = new AccountService();
			service.setDao(dao);
			// boolean id = service.isValidId("A123456789");
			// boolean email = service.isValidEmail("f90432@yahoo.com.tw");
			// System.out.println(id);
			// System.out.println(email);
			// System.out.println(service.accountExists("peterpig"));
			StringBuffer auth = service.createNum();
			boolean result = service.sendMail(auth, "f90432@yahoo.com.tw");
			System.out.println(result);
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
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

	public boolean sendMail(StringBuffer auth, String email) {
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
			message.setSubject("[巴菲特的左腦哲學]會員註冊認證碼");
			message.setText("請回到原註冊網頁輸入這組驗證碼:" + auth + "\n感謝您的支持，祝您使用愉快，賺大錢！\n專業理財顧問　啾咪");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);
			Transport.send(message);
			System.out.println("寄送email結束.");
			result = true;
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		return result;
	}
	
	public String selectPasswByAccount(String account){
		return dao.selectPasswByAccount(account);
	}

	public boolean accountExists(String account) {
		AccountBean bean = dao.selectByAccount(account);
		if (bean == null) {
			return false;
		} else {
			return true;
		}
	}
	
	public AccountBean updateAccount(AccountBean bean){
		return dao.update(bean);
	}
	
	public AccountBean saveAccount(AccountBean bean) {
		return dao.insert(bean);
	}

	private static final Pattern EMAIL_PATTERN = Pattern
			.compile("^\\w+\\.*\\w+@(\\w+\\.){1,5}[a-zA-Z]{2,3}$");

	public static boolean isValidEmail(String email) {
		boolean result = false;
		if (EMAIL_PATTERN.matcher(email).matches()) {
			result = true;
		}
		return result;
	}

	public boolean isValidId(String idc) {
		if (!idc.matches("[a-zA-Z]\\d{9}")) {
			// System.out.println("格式錯誤!!");
			return false;
		} else {
			return this.checkID(idc);
		}
	}

	private boolean checkID(String id) {
		id=id.toUpperCase(); // 轉大寫
		char first = id.charAt(0); // 取出第一個字母
		//A-Z的對應數字 
		int idum[] = { 10, 11, 12, 13, 14, 15, 16, 17, 34, 18, 19, 20, 21, 22,
				35, 23, 24, 25, 26, 27, 28, 29, 32, 30, 31, 33 };
		//轉成11碼的字串,'A'=65； substring:從index:1開始取String
		id = idum[first - 'A'] + id.substring(1);
		//把第一碼放到sum中,'0'=48
		int sum = id.charAt(0) - '0';
		//取2-10的總合 
		for (int i = 1; i < 10; i++)
			sum += id.charAt(i) * (10 - i);
		//10-加總的尾數 = 第11碼 
		int checksum = (10 - (sum % 10)) % 10;
		if (checksum == id.charAt(10) - '0') {
			return true;
		} else {
			return false;

		}	

	
	}
	public AccountBean update(AccountBean bean){
		AccountBean result = null;
		if(bean!=null){
			result = dao.update(bean);
		}
		return bean;
		
	}
	
	
}
