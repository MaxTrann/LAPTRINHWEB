package vn.maxtrann.dao;

import java.util.List;

import vn.maxtrann.entity.Video;

public interface VideoDAO {
	Video create(Video video);
	Video update(Video video);
	Video remove(int id);
	Video findById(int id);
	Video findByTittle(String title);
	List<Video> findAll();
	List<Video> search(String keyword);
	
}
