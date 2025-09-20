package vn.maxtrann.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import vn.maxtrann.config.JPAConfig;
import vn.maxtrann.dao.VideoDAO;
import vn.maxtrann.entity.Video;

public class VideoDAOImpl implements VideoDAO{

	@Override
	public Video create(Video video) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(video);
			trans.commit();
			return video;
		} catch(Exception ex) {
			ex.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
			throw ex;
		} finally {
			enma.close();
		}
	}

	@Override
	public Video update(Video video) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(video);
			trans.commit();
			return video;
		} catch(Exception ex) {
			ex.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
			throw ex;
		} finally {
			enma.close();
		}
	}

	@Override
	public Video remove(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			Video video = enma.find(Video.class, id);
			if (video != null) {
				enma.remove(video);
			}
			trans.commit();
			return video;
		} catch(Exception ex) {
			ex.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
			throw ex;
		} finally {
			enma.close();
		}
	}

	@Override
	public Video findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.find(Video.class, id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public Video findByTittle(String title) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT v FROM Video v WHERE v.title = :title";
			TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
			query.setParameter("title", title);
			return query.getSingleResult();
		} catch (NoResultException ex) {
			return null;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public List<Video> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
			return query.getResultList();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public List<Video> search(String keyword) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT v FROM Video v WHERE LOWER(v.title) LIKE LOWER(:keyword) OR LOWER(v.link) LIKE LOWER(:keyword)";
			TypedQuery<Video> query = enma.createQuery(jpql, Video.class);
			query.setParameter("keyword", "%" + keyword + "%");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			enma.close();
		}
	}
	
}
