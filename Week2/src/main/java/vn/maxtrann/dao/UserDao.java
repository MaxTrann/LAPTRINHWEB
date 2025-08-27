package vn.maxtrann.dao;

import vn.maxtrann.models.UserModel;

public interface UserDao {
	UserModel findByUserName(String username);
}
