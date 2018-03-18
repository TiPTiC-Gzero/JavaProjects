/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import packages.Course;
import packages.HibernateUtil;
import packages.Users;

/**
 *
 * @author aa565
 */
public class Coursedao {

    public static void main(String[] args) {

        Coursedao cdao = new Coursedao();
        cdao.list();
    }

    public void list() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("from beans.Course");
        List<Course> clist = query.list();
        for (Course u : clist) {
        }
    }

    public void markCourse(String temp_id, int courseid, int course_state) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        //检索一个对象load或get
        Transaction tran = session.beginTransaction();
        Course c = (Course) session.load(Course.class, courseid); //email是传入的用户名
        //将用户的密码修改为传入的新密码
        c.setAccountid(temp_id);
        c.setCourseState(1);
        session.update(c);
        tran.commit();

    }
}
