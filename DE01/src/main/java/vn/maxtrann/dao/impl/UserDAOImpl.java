package vn.maxtrann.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import vn.maxtrann.config.JPAConfig;
import vn.maxtrann.dao.UserDAO;
import vn.maxtrann.entity.User;

public class UserDAOImpl implements UserDAO{

	@Override
	public User create(User user) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(user);
			trans.commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public User update(User user) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(user);
			trans.commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public User remove(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			User user = enma.find(User.class, id);
			if (user != null) {
				enma.remove(user);
			}
			trans.commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public User findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.find(User.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public List<User> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public List<User> search(String keyword) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT u FROM User u WHERE LOWER(u.fullname) LIKE LOWER(:keyword)  OR LOWER(u.email) LIKE LOWER(:keyword) OR LOWER(u.phone) LIKE LOWER(:keyword)";
			TypedQuery<User> query = enma.createQuery(jpql, User.class);
			query.setParameter("keyword", "%" + keyword + "%");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public User login(String email, String password) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";
			TypedQuery<User> query = enma.createQuery(jpql, User.class);
			query.setParameter("email", email);
			query.setParameter("password", password);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public boolean checkEmailExist(String email) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<Long> query = enma.createQuery(
				"SELECT COUNT(u) FROM User u WHERE u.email = :email", 
				Long.class
			);
			query.setParameter("email", email);
			return query.getSingleResult() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			enma.close();
		}
	}

	@Override
	public boolean updatePasswordByEmail(String email, String newPassword) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			User user = findByEmail(email);
			if (user != null) {
				user.setPassword(newPassword);
				enma.merge(user);
				trans.commit();
				return true;
			}
			trans.commit();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			return false;
		} finally {
			enma.close();
		}
	}

	@Override
	public User findByEmail(String email) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<User> query = enma.createQuery(
				"SELECT u FROM User u WHERE u.email = :email", 
				User.class
			);
			query.setParameter("email", email);
			List<User> results = query.getResultList();
			return results.isEmpty() ? null : results.get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}
	
}
