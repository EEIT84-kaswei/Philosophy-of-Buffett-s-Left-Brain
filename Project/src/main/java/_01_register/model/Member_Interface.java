package _01_register.model;

public interface Member_Interface {

	/* (non-Javadoc)
	 * @see member_model.Member_DAO_interface#insert(member_model.Member_Bean)
	 */
	public abstract void insert(Member_Bean bean);

	/* (non-Javadoc)
	 * @see member_model.Member_DAO_interface#delete(int)
	 */
	public abstract void delete(int id);

	/* (non-Javadoc)
	 * @see member_model.Member_DAO_interface#update(member_model.Member_Bean)
	 */
	public abstract void update(Member_Bean bean);

}