package vn.maxtrann.service.impl;

import java.util.List;

import vn.maxtrann.dao.AuthorDAO;
import vn.maxtrann.dao.impl.AuthorDAOImpl;
import vn.maxtrann.entity.Author;
import vn.maxtrann.service.IAuthorService;

public class AuthorServiceImpl implements IAuthorService{
	AuthorDAO authorDAO = new AuthorDAOImpl();

    @Override
    public List<Author> findAll() {
        return authorDAO.findAll();
    }

    @Override
    public Author getAuthor(Integer authorId) {
        return authorDAO.findById(authorId);
    }

    @Override
    public void insert(Author author) {
        authorDAO.create(author);
    }

    @Override
    public void edit(Author author) {
        authorDAO.update(author);
    }

    @Override
    public void delete(int id) {
        authorDAO.remove(id);
    }

    @Override
    public List<Author> findAll(int pageNumber, int pageSize) {
        return authorDAO.findAll(pageNumber, pageSize);
    }

    @Override
    public long countAll() {
        return authorDAO.countAll();
    }
}
