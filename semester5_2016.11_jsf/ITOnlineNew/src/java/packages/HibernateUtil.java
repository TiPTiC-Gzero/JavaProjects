/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package packages;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author aa565
 */
public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    
    static {
        try {
              
            Configuration  configuration = new Configuration().configure();
            //configure()用于加载hibernate.cfg.xml文件，用此文件中制定的映射和配置属性初始化Configuration类的对象；
            ServiceRegistryBuilder registry = new ServiceRegistryBuilder();
            registry.applySettings(configuration.getProperties());//getproperties()用于获取configure（）配置的配置属性；
            //applySetting（）借助ServiceRegistryBuilder这个对象 来应用通过getProperties（）获取的设置，
                                                                  //它将ServiceRegistry（）作为参数；
                                                                  
                                                                  
            ServiceRegistry serciceRegistry=registry.build();
            sessionFactory = configuration.buildSessionFactory(serciceRegistry);//通过configue（）返回的Configuration对象 实例化新sessionFactory对象，
                                                       //取ServiceRegistry作为参数， 此对象包含要应用的配置设置

//            //sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
