package vn.maxtrann.dao;

import vn.maxtrann.models.UserModel;

public interface UserDao {
	void insert(UserModel user);

	boolean checkExistEmail(String email);

	boolean checkExistUsername(String username);

	boolean checkExistPhone(String phone);
	
	public boolean existsByUsername(String username);

	public UserModel findByUsername(String username);
	
	public boolean updatePasswordByUsername(String username, String newPassword);
}
