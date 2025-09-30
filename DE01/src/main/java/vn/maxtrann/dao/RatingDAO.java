package vn.maxtrann.dao;

import java.util.List;

import vn.maxtrann.entity.Rating;

public interface RatingDAO {
	List<Rating> findByBookId(Integer bookId);
    void insert(Rating rating);
    int countByBookId(Integer bookId);
}
