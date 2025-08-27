package vn.maxtrann.services.impl;

import vn.maxtrann.models.UserModel;
import vn.maxtrann.services.UserService;
import vn.maxtrann.dao.UserDao;
import vn.maxtrann.dao.impl.UserDaoImpl;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();

	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.findByUserName(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}

		return null;
	}

	@Override
	public UserModel findByUserName(String username) {
		return userDao.findByUserName(username);
	}

}
