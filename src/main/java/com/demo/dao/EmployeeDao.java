package com.demo.dao;

import com.demo.bean.Department;
import com.demo.bean.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeDao {
    public List getAll();//查询所有
    public List<Department> getAllDept();
    public void insert(Employee employee);//添加
    public void insertBoss(Employee employee);//添加
    public void insertDept(Department department);//添加部门
    public int getmgr(String mgrname);//获取上级编号
    public int getdeptno(String dname);//获取部门编号
    public void deleteByEmpno(int empno);//删除
    public Employee getOneByEmpno(int empno);//获取单个雇员
    public void update( Employee employee);//修改
    public String getMgrName(int mgr);
    public String getDname(int deptno);

    public int getCount();
    public List<Employee> findAll(Map<String,Object> data);

    public List<Employee> asc(Map<String,Object> data);
    public List<Employee> desc(Map<String,Object> data);

}
