package vn.maxtrann.service;

import java.util.List;

import vn.maxtrann.entity.Author;

public interface IAuthorService {
	List<Author> findAll();
    Author getAuthor(Integer authorId);
    void insert(Author author);
    void edit(Author author);
    void delete(int id);
    List<Author> findAll(int pageNumber, int pageSize);
    long countAll();
}
