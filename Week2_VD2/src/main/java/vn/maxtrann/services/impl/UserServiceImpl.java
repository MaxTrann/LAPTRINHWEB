package vn.maxtrann.services.impl;

import vn.maxtrann.dao.UserDao;
import vn.maxtrann.dao.impl.UserDaoImpl;
import vn.maxtrann.models.UserModel;
import vn.maxtrann.services.UserService;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();

	@Override
	public void insert(UserModel user) {
		userDao.insert(user);

	}

	@Override
	public boolean register(String email, String password, String username, String fullname, String phone) {
		if (userDao.checkExistUsername(username)) {
			return false;
		}
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		userDao.insert(new UserModel(email, username, fullname, password, null, 5, phone, date));
		return true;

	}

	@Override
	public boolean checkExistEmail(String email) {
		return userDao.checkExistEmail(email);
	}

	@Override
	public boolean checkExistUsername(String username) {
		return userDao.checkExistUsername(username);
	}

	@Override
	public boolean checkExistPhone(String phone) {
		return userDao.checkExistPhone(phone);
	}

	@Override
	public UserModel authenticate(String username, String password) {
		 UserModel u = userDao.findByUsername(username);
		    if (u == null) return null;

		    String dbPass = u.getPassWord();               // đúng getter của bạn
		    if (dbPass == null) return null;

		    // debug tạm (xong việc nhớ bỏ)
		    System.out.println("[LOGIN] input=" + password + " / db=" + dbPass);

		    return password.equals(dbPass) ? u : null;     // nếu có hash thì thay bằng hasher.matches
	}

	@Override
	public boolean updatePasswordByUsername(String username, String newPassword) {
		return userDao.updatePasswordByUsername(username, newPassword);
	}

	@Override
	public boolean existsByUsername(String username) {
		return userDao.existsByUsername(username);
	}

}
