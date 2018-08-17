package com.demo.service.impl;

import com.demo.bean.Department;
import com.demo.bean.Employee;
import com.demo.bean.PageBean;
import com.demo.dao.EmployeeDao;
import com.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2017/1/13 0013.
 */
@Service("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;
    private Employee employee;
    int mgr;
    int deptno;

    @Override
    public List<Employee> getAll() {
        return employeeDao.getAll();
    }
    public List getAllDept() {
        return employeeDao.getAllDept();
    }


    @Override
    public void insert(Employee employee) {

        System.out.println("===========insert===========" + employee.toString());

        employeeDao.insert(employee);
        System.out.println("**************insertImpl**********");
    }
    @Override
    public void insertDept(Department department){
        employeeDao.insertDept(department);
    }

    @Override
    public void deleteByEmpno(int empno) {
        employeeDao.deleteByEmpno(empno);
    }

    @Override
    public Employee getOneByEmpno(int empno) {
        employee = employeeDao.getOneByEmpno(empno);
        employee.setMgrname(employeeDao.getMgrName(employee.getMgr()));
        employee.setDname(employeeDao.getDname(employee.getDeptno()));
        return employee;
    }

    @Override
    public void update(Employee employee) {
        System.out.println("++++++++++Impl+++++++"+employee.toString());
        employeeDao.update(employee);
    }
    /**
     * 分页
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageBean<Employee> findAllEmpWithPage(int pageNum, int pageSize) {
        //查询所有数据，创建pagebean中的数据。获得总页数
        int totalRecord = employeeDao.getCount();

        //三个初始数据，创建pagebean
        PageBean pageBean = new PageBean(pageNum,pageSize,totalRecord);

        //获取开始索引
        int startIndex = pageBean.getStartIndex();

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("currIndex", startIndex);
        data.put("pageSize", pageSize);

        //拿到每页数据
        pageBean.setList(employeeDao.findAll(data));
        return pageBean;
    }
    /**
     * 排序
     */
    public PageBean<Employee> asc(int pageNum, int pageSize) {
        //查询所有数据，创建pagebean中的数据。获得总页数
        int totalRecord = employeeDao.getCount();

        //三个初始数据，创建pagebean
        PageBean pageBean = new PageBean(pageNum,pageSize,totalRecord);

        //获取开始索引
        int startIndex = pageBean.getStartIndex();

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("currIndex", startIndex);
        data.put("pageSize", pageSize);

        //拿到每页数据
        pageBean.setList(employeeDao.asc(data));
        return pageBean;
    }
    public PageBean<Employee> desc(int pageNum, int pageSize) {
        //查询所有数据，创建pagebean中的数据。获得总页数
        int totalRecord = employeeDao.getCount();

        //三个初始数据，创建pagebean
        PageBean pageBean = new PageBean(pageNum,pageSize,totalRecord);

        //获取开始索引
        int startIndex = pageBean.getStartIndex();

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("currIndex", startIndex);
        data.put("pageSize", pageSize);

        //拿到每页数据
        pageBean.setList(employeeDao.desc(data));
        return pageBean;
    }
}
