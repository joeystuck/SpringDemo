package com.demo.bean;

import java.io.Serializable;
import java.util.List;

public class Department<T> implements Serializable {
    private int deptno;//部门编号
    private String dname;//部门名称
    private String loc;//location,地理位置

    private static final long serialVersionUID = 1L;

    public int getDeptno() {
        return deptno;
    }

    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }



    @Override
    public String toString() {
        return "Department{" +
                "deptno=" + deptno +
                ", dname='" + dname + '\'' +
                ", location='" + loc + '\'' +
                '}';
    }
}
