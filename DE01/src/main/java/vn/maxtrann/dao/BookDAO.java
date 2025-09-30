package vn.maxtrann.dao;

import java.util.List;

import vn.maxtrann.entity.Book;

public interface BookDAO {
	public List<Book> findAll();
    Book findById(Integer bookId);

    Book crate(Book book);
    Book update(Book book);
    Book remove(Integer bookId);
    List<Book> findAll(int pageNumber, int pageSize);
    long countAll();
}
