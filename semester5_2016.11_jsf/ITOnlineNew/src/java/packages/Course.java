package packages;
// Generated 2016-12-29 11:01:46 by Hibernate Tools 4.3.1



/**
 * Course generated by hbm2java
 */
public class Course  implements java.io.Serializable {


     private int courseid;
     private String coursename;
     private String accountid;
     private Integer courseState;

    public Course() {
    }

	
    public Course(int courseid) {
        this.courseid = courseid;
    }
    public Course(int courseid, String coursename, String accountid, Integer courseState) {
       this.courseid = courseid;
       this.coursename = coursename;
       this.accountid = accountid;
       this.courseState = courseState;
    }
   
    public int getCourseid() {
        return this.courseid;
    }
    
    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }
    public String getCoursename() {
        return this.coursename;
    }
    
    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }
    public String getAccountid() {
        return this.accountid;
    }
    
    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }
    public Integer getCourseState() {
        return this.courseState;
    }
    
    public void setCourseState(Integer courseState) {
        this.courseState = courseState;
    }




}


