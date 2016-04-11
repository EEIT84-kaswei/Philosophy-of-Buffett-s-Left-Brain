package _05_newsArticle.model;

import java.util.List;

import _05_newsArticle.model.NewsBean;

public interface NewsDAO {

	public abstract List<NewsBean> select();

	public abstract NewsBean select(int nno);

	public abstract List<NewsBean> selectByDate(java.util.Date ntime);
	
	public abstract List<NewsBean> selectByKeyWord(String keyWord);

	public abstract NewsBean insert(NewsBean bean);

	public abstract NewsBean update(NewsBean bean);

	public abstract boolean delete(int nno);

}