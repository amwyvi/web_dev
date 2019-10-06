package com.bo.listener;

import com.bo.entity.Book;
import com.bo.entity.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author mq_xu
 * @ClassName ContextLoaderListener
 * @Description 上下文加载监听，在服务器启动的时候即刻生效，用来生成用户数据和图书数据
 * @Date 2019/9/27
 * @Version 1.0
 **/

@WebListener
public class ContextLoaderListener implements ServletContextListener {

    /**
     * @Description 容器初始化方法
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("容器启动");
        //创建并生成用户数据列表
        List<User> userList = new ArrayList<>(3);
        User[] users = {
                new User(1, "aaa@qq.com", "698d51a19d8a121ce581499d7b701668", "孤芳自赏", "tx1.jpg", "北京", LocalDate.of(2001, 4, 11)),
                new User(2, "bbb@qq.com", "698d51a19d8a121ce581499d7b701668", "暗示分离", "tx2.jpg", "江苏", LocalDate.of(1999, 11, 22)),
                new User(3, "ccc@qq.com", "698d51a19d8a121ce581499d7b701668", "记念", "tx3.jpg", "南京", LocalDate.of(2010, 8, 19))
        };
        userList = Arrays.asList(users);

        //创建并生成图书数据列表
        List<Book> bookList = new ArrayList<>(10);
        Book[] books = {
                new Book(1, "何典", "book01.jpg", "[中] 刘半农"),
                new Book(2, "戏年", "book02.jpg", "[中] 葛亮"),
                new Book(3, "和我们的女儿谈话", "book03.jpg", "[中] 王朔"),
                new Book(4, "我是猫", "book04.jpg", "[外] 夏目漱石"),
                new Book(5, "华丽的丧服", "book05.jpg", "[外] 土屋隆夫"),
                new Book(6, "庭守之犬", "book06.jpg", "[外] 岩井俊二"),
                new Book(7, "了不起的盖茨比", "book07.jpg", "[外] F. S.菲茨杰拉德"),
                new Book(8, "起风了", "book08.jpg", "[外] 堀辰雄"),
                new Book(9, "何典", "book01.jpg", "[中] 刘半农"),
                new Book(10, "戏年", "book02.jpg", "[中] 葛亮"),
                new Book(11, "和我们的女儿谈话", "book03.jpg", "[中] 王朔"),
                new Book(12, "我是猫", "book04.jpg", "[外] 夏目漱石"),
                new Book(13, "华丽的丧服", "book05.jpg", "[外] 土屋隆夫"),
                new Book(14, "庭守之犬", "book06.jpg", "[外] 岩井俊二"),
                new Book(15, "了不起的盖茨比", "book07.jpg", "[外] F. S.菲茨杰拉德")
        };
        bookList = Arrays.asList(books);

        //获得全局变量
        ServletContext servletContext = sce.getServletContext();
        //设置全局变量属性，将用户和图书列表数据记入，整个应用可以共享
        servletContext.setAttribute("userList", userList);
        servletContext.setAttribute("bookList", bookList);
    }

    /**
     * 销毁方法
     *
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("容器销毁");
    }
}
