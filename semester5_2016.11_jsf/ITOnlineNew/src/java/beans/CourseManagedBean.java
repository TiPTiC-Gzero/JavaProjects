/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;
import packages.Course;
import packages.Users;

/**
 *
 * @author aa565
 */
@ManagedBean
@SessionScoped
public class CourseManagedBean  extends Users{

    /**
     * Creates a new instance of CourseManagedBean
     */
     private int courseid;
     private String coursename;
     private String accountid;
     private Integer courseState;
     public String temp_id2;
 
    public CourseManagedBean() {
    }

    /**
     * @return the courseid
     */
    public int getCourseid() {
        return courseid;
    }

    /**
     * @param courseid the courseid to set
     */
    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    /**
     * @return the coursename
     */
    public String getCoursename() {
        return coursename;
    }

    /**
     * @param coursename the coursename to set
     */
    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    /**
     * @return the accountid
     */
    public String getAccountid() {
        return accountid;
    }

    /**
     * @param accountid the accountid to set
     */
    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }

    /**
     * @return the courseState
     */
    public Integer getCourseState() {
        return courseState;
    }

    /**
     * @param courseState the courseState to set
     */
    public void setCourseState(Integer courseState) {
        this.courseState = courseState;
    }
    public void markCourse1( FacesContext fc, UIComponent c, Object value) {
        Users users = new Users();
        Userdao udao = new Userdao();
        temp_id2=users.getAccountid();
        if (temp_id2==null) {
            throw new ValidatorException(new FacesMessage("Please Login first."));
        }
    }
     public void markCourse2( FacesContext fc, UIComponent c, Object value) {
        Users users = new Users();
        Course course=new Course();
        Coursedao cdao=new Coursedao();
        temp_id2=users.getAccountid();
       
        cdao.markCourse(temp_id2,courseid, courseState);
        
        
    }

    /**
     * @return the temp_id2
     */
    public String getTemp_id2() {
        return temp_id2;
    }

    /**
     * @param temp_id2 the temp_id2 to set
     */
    public void setTemp_id2(String temp_id2) {
        this.temp_id2 = temp_id2;
    }
}
