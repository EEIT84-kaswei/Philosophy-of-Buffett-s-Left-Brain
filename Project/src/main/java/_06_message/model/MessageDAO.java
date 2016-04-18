package _06_message.model;

import java.util.List;
import _06_message.model.MessageBean;

public interface MessageDAO {

	public abstract List<MessageBean> select();

	public abstract MessageBean selectByMno(int mno);

	public abstract List<MessageBean> selectByAccount(String account);

	public abstract List<MessageBean> selectByAno(int ano);

	public abstract MessageBean insert(MessageBean bean);

	public abstract MessageBean update(MessageBean bean);

	public abstract boolean delete(int mno);

}