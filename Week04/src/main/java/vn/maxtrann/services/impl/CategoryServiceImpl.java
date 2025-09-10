package vn.maxtrann.services.impl;

import java.util.List;

import vn.maxtrann.dao.CategoryDAO;
import vn.maxtrann.dao.impl.CategoryDAOImpl;
import vn.maxtrann.entity.Category;
import vn.maxtrann.services.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	CategoryDAO cateDAO = new CategoryDAOImpl();
	
	@Override
	public void insert(Category category) {
		cateDAO.create(category);
	}

	@Override
	public void edit(Category category) {
		cateDAO.update(category);
	}

	@Override
	public void delete(int id) {
		cateDAO.remove(id);
	}

	@Override
	public Category getIdCategory(int id) {
		return cateDAO.findById(id);
	}

	@Override
	public Category getNameCategory(String name) {
		return cateDAO.findByName(name);
	}

	@Override
	public List<Category> getAll() {
		return cateDAO.findAll();
	}

	@Override
	public List<Category> search(String keyword) {
		return cateDAO.search(keyword);
	}
	

}
