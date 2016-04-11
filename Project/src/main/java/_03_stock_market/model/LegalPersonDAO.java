package _03_stock_market.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import _03_stock_market.model.LegalPersonBean;

public interface LegalPersonDAO {

	public abstract List<LegalPersonBean> select();

	public abstract LegalPersonBean selectByDate(java.util.Date ldate);

	public abstract LegalPersonBean insert(LegalPersonBean bean);

	public abstract LegalPersonBean update(LegalPersonBean bean);

	public abstract boolean delete(java.util.Date ldate);

}