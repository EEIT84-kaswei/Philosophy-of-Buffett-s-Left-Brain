package _02_login.model;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.sql.Timestamp;
import java.util.List;

public interface QuestionDAO {
	QuestionBean select(Integer id,Timestamp QDate);
	List<QuestionBean> selectAll();
	QuestionBean insert(QuestionBean bean);
}
