package vn.maxtrann.service.impl;

import java.util.List;

import vn.maxtrann.dao.RatingDAO;
import vn.maxtrann.dao.impl.RatingDAOImpl;
import vn.maxtrann.entity.Rating;
import vn.maxtrann.service.IRatingService;

public class RatingServiceImpl implements IRatingService{
	private RatingDAO ratingDAO = new RatingDAOImpl();

	@Override
	public List<Rating> getRating(Integer bookId) {
		return ratingDAO.findByBookId(bookId);
	}

	@Override
	public void insert(Rating rating) {
		ratingDAO.insert(rating);
	}

	@Override
	public int countRatings(Integer bookId) {
		return ratingDAO.countByBookId(bookId);
	}
	
}
