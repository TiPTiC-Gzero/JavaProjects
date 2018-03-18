/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import static java.util.Collections.list;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import packages.HibernateUtil;
import packages.Users;

/**
 *
 * @author aa565
 */
public class Userdao {
//    SessionFactory  sf=HibernateUtil.getSessionFactory();

    public static void main(String[] args) {

        Userdao udao = new Userdao();
        udao.list();
    }

    public void list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("from beans.Users");
        List<Users> ulist = query.list();
        for (Users u : ulist) {
            System.out.println("name:" + u.getAccountid() + "pass:" + u.getPassword());

        }

    }

    public Users login(String id, String password) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
//        Transaction tx = session.beginTransaction();
//        Criteria criteria = session.createCriteria(Users.class);
//        criteria.add(Restrictions.eq("id", id));
            Query query = session.createQuery("from Users where accountid=:id and password=:password ");
            query.setString("id", id);
            query.setString("password", password);
            List<Users> ulist = (List<Users>) query.list();
            
            if (ulist.size() != 0) {
                
                return ulist.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            if (session != null) {
                session.close();
            }
        }
//        String hql = "FROM USERS WHERE ACCOUNTID = ?  AND PASSWORD = ?";

//        List<Users> ulist = criteria.list();
//        for (Users u : ulist) {
//            users.setAccountid(u.getAccountid());
//            users.setPassword(u.getPassword());
//        }
        return null;
    }
   

    public void insert(Users users) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(users);
        tx.commit();
    }
    public int findAccount(String id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Users where accountid=:id");
            query.setString("id", id);
            List<Users> ulist = (List<Users>) query.list();
            
           if (ulist.size() != 0) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
               session.close();
            }
        }
        return 2;
    }

}
