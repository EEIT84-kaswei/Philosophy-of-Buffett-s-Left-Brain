package _06_message.model;

import java.util.List;

import _06_message.model.dao.MessageDAOHibernate;

public class MessageService {
	private MessageDAOHibernate dao = new MessageDAOHibernate();

	public void setDao(MessageDAOHibernate dao) {
		this.dao = dao;
	}
	
	public List<MessageBean> selectByAno(int ano){
		List<MessageBean> result = dao.selectByAno(ano);
		if(result.isEmpty()){
			return null;
		} else {
			return result;
		}
	}
	
	public MessageBean insert(MessageBean bean){
		return dao.insert(bean);
	}
	
	public MessageBean update(MessageBean bean){
		return dao.update(bean);
	}
	
	public boolean delete(String mno){
		if(mno != null && mno.trim().length() != 0){
			Integer i = Integer.parseInt(mno);
			dao.delete(i);
			return true;
		}
		return false;
	}
}
