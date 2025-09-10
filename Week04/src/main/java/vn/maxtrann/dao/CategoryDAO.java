package vn.maxtrann.dao;

import java.util.List;

import vn.maxtrann.entity.Category;

public interface CategoryDAO {
	Category create(Category category);
	Category update(Category category);
    Category remove(int id);
    Category findById(int id);
    Category findByName(String name);
    List<Category> findAll();
    List<Category> search(String keyword);
}
