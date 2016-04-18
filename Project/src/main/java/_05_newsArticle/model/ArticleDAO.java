package _05_newsArticle.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import _05_newsArticle.model.ArticleBean;

public interface ArticleDAO {

	public abstract List<ArticleBean> select();
	
	public List<ArticleBean> selectByAccount(String account); 

	public abstract ArticleBean selectByAno(int ano);
	
	public abstract List<ArticleBean> selectByAname(String aname);

	public abstract ArticleBean insert(ArticleBean bean);

	public boolean update(Integer ano, String account, String aname, String atitle, String acontext);


	public abstract boolean delete(int ano);

}
