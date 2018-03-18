/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import java.util.Date;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;
import packages.Users;

/**
 *
 * @author aa565
 */
@ManagedBean
@SessionScoped
public class UserManagedBean implements Serializable {
//    SessionFactory sf=HibernateUtil.getSessionFactory();

    /**
     * Creates a new instance of UserManagedBean
     */
    private String accountid;
    private String username;
    private String password;
    private Integer age;
    private Date birthdate;
    private String email;
    private String country;
    private String phonenumber;
    private String repassword;
    public String temp_id_bean;
 
    

    public UserManagedBean() {
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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the age
     */
    public Integer getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(Integer age) {
        this.age = age;
    }

    /**
     * @return the birthdate
     */
    public Date getBirthdate() {
        return birthdate;
    }

    /**
     * @param birthdate the birthdate to set
     */
    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the phonenumber
     */
    public String getPhonenumber() {
        return phonenumber;
    }

    /**
     * @param phonenumber the phonenumber to set
     */
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String insert() {
        Users u = new Users();
        u.setAccountid(accountid);
        u.setUsername(username);
        u.setPassword(password);
        u.setAge(age);
        u.setBirthdate(new java.sql.Date(birthdate.getTime()));
        u.setEmail(email);
        u.setCountry(country);
        u.setPhonenumber(phonenumber);

        Userdao udao = new Userdao();
        udao.insert(u);

        return "successRegister";
    }

    public void checkId(FacesContext fc, UIComponent c, Object value) {
        String s = (String) value;
        Users users = new Users();
        Userdao udao = new Userdao();
        int temp = udao.findAccount(s);
        if (temp == 1) {
            throw new ValidatorException(new FacesMessage("TiP:Existed Account."));
        }
    }

    public void checkRepass(FacesContext fc, UIComponent c, Object value) {
        String s = (String) value;
        if (!s.equals(getPassword())) {
            throw new ValidatorException(new FacesMessage("TiP:Passwords dont match"));
        }
    }

    public void checkPass(FacesContext fc, UIComponent c, Object value) {
        password = (String) value;

    }

    public void checkMail(FacesContext fc, UIComponent c, Object value) {
        String s = (String) value;
        if (!(s.endsWith(".com") && s.contains("@"))) {
            throw new ValidatorException(new FacesMessage("TiP:Check Email format."));
        }
    }

    

    public String login() {
        Users users = new Users();
//        users.setAccountid(accountid);
//        users.setPassword(password);
       

        Userdao udao = new Userdao();
        users = udao.login(accountid, password);
        if (users != null) {
            
            
            return "successPage";
        } else {
            return "failPage";
        }
        //        Users users2=udao.login(users.getAccountid(),users.getPassword());
        //        accountid=users2.getAccountid();
        //        password=users2.getPassword()
    }

    public String getRepassword() {
        return repassword;
    }

    /**
     * @param repassword the repassword to set
     */
    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    /**
     * @return the temp_id
     */
    public String getTemp_id() {
        return temp_id_bean;
    }

    /**
     * @param temp_id the temp_id to set
     */
    public void setTemp_id(String temp_id_bean) {
        this.temp_id_bean = temp_id_bean;
    }

   
 

   
}
