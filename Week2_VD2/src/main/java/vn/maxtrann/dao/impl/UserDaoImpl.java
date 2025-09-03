package vn.maxtrann.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.maxtrann.configs.DBConnect;
import vn.maxtrann.dao.UserDao;
import vn.maxtrann.models.UserModel;

public class UserDaoImpl implements UserDao {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public void insert(UserModel user) {
		String sql = "INSERT INTO Users (email, userName, fullName, passWord, avatar, roleid, phone, createdDate) "
		           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = new DBConnect().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getPassWord());
			ps.setString(5, user.getAvatar());
			ps.setInt(6, user.getRoleid());
			ps.setString(7, user.getPhone());
			ps.setDate(8, user.getCreatedDate());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkExistEmail(String email) {
		boolean duplicate = false;
		String query = "select * from Users where email = ?";
		try {
			conn = new DBConnect().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception ex) {
		}
		return duplicate;
	}

	@Override
	public boolean checkExistUsername(String username) {
		boolean duplicate = false;
		String query = "select * from Users where userName = ?";
		try {
			conn = new DBConnect().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception ex) {
		}
		return duplicate;

	}

	@Override
	public boolean checkExistPhone(String phone) {
		boolean duplicate = false;
		String query = "select * from Users where phone = ?";
		try {
			conn = new DBConnect().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception ex) {
		}
		return duplicate;
	}

	@Override
	public boolean updatePasswordByUsername(String username, String newPassword) {
		String sql = "UPDATE Users SET passWord = ? WHERE userName = ?";
		try (Connection con = new DBConnect().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, newPassword);
			ps.setString(2, username);
			return ps.executeUpdate() > 0;
		} catch (Exception ex) {
		}
		return false;
	}

	@Override
	public UserModel findByUsername(String username) {
		final String sql = "SELECT id, email, userName, passWord, fullName, avatar, roleid, phone, createdDate " +
		        "FROM Users WHERE userName = ?";
		try (Connection con = new DBConnect().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, username == null ? null : username.trim());
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					UserModel u = new UserModel();
					u.setId(rs.getInt("id"));
					u.setEmail(rs.getString("email"));
					u.setUserName(rs.getString("userName")); // <-- đúng cột
					u.setPassWord(rs.getString("passWord")); // <-- đúng cột
					u.setFullName(rs.getString("fullName"));
					u.setRoleid(rs.getInt("roleid"));
					u.setPhone(rs.getString("phone"));
					 u.setCreatedDate(rs.getDate("createdDate"));
					 
					// debug: xác nhận đọc được mật khẩu từ DB
		                System.out.println("[DAO] findByUsername ok: user=" + u.getUserName()
		                    + ", dbPass(len)=" + (u.getPassWord() == null ? 0 : u.getPassWord().length()));
					return u;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean existsByUsername(String username) {
		String sql = "SELECT 1 FROM Users WHERE userName = ?";
		try (Connection con = new DBConnect().getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, username);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next(); // có record nào không
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
