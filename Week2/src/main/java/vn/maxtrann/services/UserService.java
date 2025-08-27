package vn.maxtrann.services;

import vn.maxtrann.models.UserModel;

public interface UserService {
	UserModel login(String username, String password);
	UserModel findByUserName(String username);
}