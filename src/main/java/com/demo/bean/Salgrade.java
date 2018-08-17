package com.demo.bean;

import java.io.Serializable;
import java.util.List;

public class Salgrade<T> implements Serializable {

    private int grade;//工作等级
    private int losal;//最低薪资
    private int hical;//最高薪资
    private static final long serialVersionUID = 1L;

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getLosal() {
        return losal;
    }

    public void setLosal(int losal) {
        this.losal = losal;
    }

    public int getHical() {
        return hical;
    }

    public void setHical(int hical) {
        this.hical = hical;
    }
    @Override
    public String toString() {
        return "Salgrade{" +
                "grade=" + grade +
                ", losal=" + losal +
                ", hical=" + hical +
                '}';
    }
}
