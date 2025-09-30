package vn.maxtrann.service;

import java.util.List;

import vn.maxtrann.entity.Book;

public interface IBookService {
	public List<Book> findAll();
    Book getBook(Integer bookId);
    void insert(Book book);
    void edit(Book book);
    void delete(int id);
    List<Book> findAll(int pageNumber, int pageSize);
    long countAll();
}
