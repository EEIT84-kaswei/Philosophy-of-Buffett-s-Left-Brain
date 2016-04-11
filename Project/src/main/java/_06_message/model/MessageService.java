package _06_message.model;

import _06_message.model.dao.MessageDAOHibernate;


	
public class MessageService{
	private MessageDAOHibernate messageDAO = new MessageDAOHibernate();
	
	
	
	
	public MessageBean insert(MessageBean bean){
		return bean;
		
	}

	}
	

