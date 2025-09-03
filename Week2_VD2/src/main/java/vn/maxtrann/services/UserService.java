package vn.maxtrann.services;

import vn.maxtrann.models.UserModel;

public interface UserService {
	void insert(UserModel user);

	boolean register(String email, String password, String username, String fullname, String phone);

	boolean checkExistEmail(String email);

	boolean checkExistUsername(String username);

	boolean checkExistPhone(String phone);
	boolean existsByUsername(String username);


	UserModel authenticate(String username, String password); // trả về user nếu đúng
    boolean updatePasswordByUsername(String username, String newPassword);
}
