package com.demo.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.beans.IntrospectionException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Employee<T> implements Serializable {

    private int empno;//雇员编号
    private String ename;//雇员姓名
    private String job;//雇员工作
    private int mgr;//雇员上级编号
    private String mgrname;//雇员姓名

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hiredate;//雇佣时间

    //private String hiredate;//雇佣时间
    private BigDecimal sal;//雇员薪金
    private int grade;//薪金等级
    private BigDecimal comm;//雇员奖金
    private int deptno;//雇员部门编号
    private String dname;//雇员姓名

    private static final long serialVersionUID = 1L;



    public int getEmpno() {
        return empno;
    }

    public void setEmpno(String empno) {
        this.empno = Integer.parseInt(empno);
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getMgr() {
        return mgr;
    }

    public void setMgr(String mgr) {
        this.mgr = Integer.parseInt(mgr);
    }

    public String getHiredate() throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String  now = df.format(hiredate);// hiredate为获取当前员工入职时间
        return now;
    }

    public void setHiredate(String hiredate) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        Date now = df.parse(hiredate);// new Date()为获取当前系统时间
        this.hiredate = now;
    }

    public BigDecimal getSal() {
        return sal;
    }

    public void setSal(String salary) {
        BigDecimal sal = new BigDecimal(salary);
        this.sal = sal;
    }
    public int getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = Integer.parseInt(grade);
    }

    public BigDecimal getComm() {
        return comm;
    }

    public void setComm(String commit) {
        BigDecimal comm = new BigDecimal(commit);
        this.comm = comm;
    }

    public int getDeptno() {
        return deptno;
    }

    public void setDeptno(String deptno) {
        this.deptno = Integer.parseInt(deptno);
    }
    public String getMgrname() {
        return mgrname;
    }

    public void setMgrname(String mgrname) {
        this.mgrname = mgrname;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empno=" + empno +
                ", ename=" + ename +
                ", job='" + job +
                ", mgr=" + mgr +
                ", hiredate=" + hiredate +
                ", sal=" + sal +
                ", comm=" + comm +
                ", deptno=" + deptno +
                '}';
    }
}
