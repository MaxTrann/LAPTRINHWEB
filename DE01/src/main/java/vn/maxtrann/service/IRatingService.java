package vn.maxtrann.service;

import java.util.List;

import vn.maxtrann.entity.Rating;

public interface IRatingService {
	List<Rating> getRating(Integer bookId);
    void insert(Rating rating);
    int countRatings(Integer bookId);
}
