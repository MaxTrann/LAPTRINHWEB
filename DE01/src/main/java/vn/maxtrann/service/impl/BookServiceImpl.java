package vn.maxtrann.service.impl;

import java.util.List;

import vn.maxtrann.dao.BookDAO;
import vn.maxtrann.dao.impl.BookDAOImpl;
import vn.maxtrann.entity.Book;
import vn.maxtrann.service.IBookService;

public class BookServiceImpl implements IBookService{
	BookDAO bookDAO = new BookDAOImpl();
    @Override
    public List<Book> findAll() {
        return bookDAO.findAll();
    }

    @Override
    public Book getBook(Integer bookId) {
        return bookDAO.findById(bookId);
    }

    @Override
    public void insert(Book book) {
        bookDAO.crate(book);
    }

    @Override
    public void edit(Book book) {
        bookDAO.update(book);
    }

    @Override
    public void delete(int id) {
        bookDAO.remove(id);
    }

    @Override
    public List<Book> findAll(int pageNumber, int pageSize) {
        return bookDAO.findAll(pageNumber, pageSize);
    }

    @Override
    public long countAll() {
        return bookDAO.countAll();
    }
}
