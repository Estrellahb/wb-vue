package com.example.wb.service;

import com.example.wb.dao.BookDao;
import com.example.wb.dao.CategoryDao;
import com.example.wb.pojo.Book;
import com.example.wb.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    BookDao bookDao;
    @Autowired
    CategoryService categoryService;
    //查
    public List<Book> list(){
        Sort sort =Sort.by(Sort.Direction.DESC,"id");
        return bookDao.findAll(sort);
    }
    //增
    public void  addOrUpdate(Book book){
        bookDao.save(book);
    }
    //删
    public void deleteById(int id) {
        bookDao.deleteById(id);
    }
    //分类查询
    public List<Book> listByCategory(int cid) {
        Category category = categoryService.get(cid);
        return bookDao.findAllByCategory(category);
    }
    public List<Book> Search(String keywords) {
        return bookDao.findAllByTitleLikeOrAuthorLike('%' + keywords + '%', '%' + keywords + '%');
    }

}
