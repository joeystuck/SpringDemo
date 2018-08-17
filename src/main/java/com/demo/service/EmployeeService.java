package com.demo.service;

import com.demo.bean.Department;
import com.demo.bean.Employee;
import com.demo.bean.PageBean;

import java.util.List;

/**
 * Created by Administrator on 2017/1/13 0013.
 */
public interface EmployeeService {

    public List getAll();//查询所有
    public List getAllDept();//查询所有
    public void insert(Employee employee);
    public void insertDept(Department department);
    public void deleteByEmpno(int empno);
    public Employee getOneByEmpno(int empno);
    public void  update(Employee employee);
    public PageBean<Employee> findAllEmpWithPage(int pageNum, int pageSize);
    public PageBean<Employee> asc(int pageNum,int pageSize);
    public PageBean<Employee> desc(int pageNum,int pageSize);

}
