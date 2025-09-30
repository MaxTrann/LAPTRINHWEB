package vn.maxtrann.dao;

import java.util.List;

import vn.maxtrann.entity.Author;

public interface AuthorDAO {
	List<Author> findAll();
    Author findById(Integer authorId);
    Author create(Author author);
    Author update(Author author);
    Author remove(Integer authorId);
    List<Author> findAll(int pageNumber, int pageSize);
    long countAll();
}
