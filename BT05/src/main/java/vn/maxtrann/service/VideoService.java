package vn.maxtrann.service;

import java.util.List;

import vn.maxtrann.entity.Video;

public interface VideoService {
	void insert (Video video);
	
	void edit (Video video);
	
	void delete (int id);
	
	Video getIdVideo (int id);
	
	Video getTitleVideo (String title);
	
	List<Video> getAll();
	
	List<Video> search(String keyword);
	
}
