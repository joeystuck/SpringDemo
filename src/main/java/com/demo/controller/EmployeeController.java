package com.demo.controller;


import com.alibaba.fastjson.JSONArray;
import com.demo.bean.Department;
import com.demo.bean.Employee;
import com.demo.bean.PageBean;
import com.demo.service.EmployeeService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.List;
import org.slf4j.Logger;

/**
 * Created by Administrator on 2017/1/13 0013.
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    private static Logger logger= LoggerFactory.getLogger(EmployeeController.class);
        /**
         * 查询所有
         * @param model
         * @return
         */
        @RequestMapping("/getAll")
        public  String getAll(Model model){
            List<Employee> list =employeeService.getAll();
            for (Employee employee: list){
                if (employee.getComm()==null||employee.getComm()==BigDecimal.ZERO){
                    employee.setComm("0");
                }
                System.out.println("///////////////getALL////////////"+employee.toString());
            }
            model.addAttribute("list",list);

            return "/getAll";
        }
    /**
     * 分页查询所有
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public  String findAll(Integer pageNum,Model model){
        if(pageNum==0){ pageNum=1; }
        int pageSize = 5;
        PageBean pageBean = employeeService.findAllEmpWithPage(pageNum,pageSize);
        model.addAttribute("pageBean",pageBean);
        return "findAll";
    }
    /**
     * 排序
     * @return
     */
    //升序
    //映射一个action 这里一定要设置编码否则前台获取时会乱码
    @RequestMapping(value = "/asc",produces="text/html;charset=UTF-8;")
    @ResponseBody//表示直接输出返回内容，不进行jsp或html跳转
    public String asc(Integer pageNum,Integer pageSize){

        PageBean pageBean = employeeService.asc(pageNum,pageSize);

        List<Employee> list = pageBean.getList();


        //转成json对象
        String json = JSONArray.toJSONString(list);
        System.out.println("json : "+json);
        return json;
    }
    //降序
    @RequestMapping("/desc")
    @ResponseBody//表示直接输出返回内容，不进行jsp或html跳转
    public String desc(Integer pageNum,Integer pageSize){
        System.out.println(pageNum+"======================="+pageSize);
        PageBean pageBean = employeeService.desc(pageNum,pageSize);
        List<Employee> list = pageBean.getList();


        for (Employee e: list) {
            System.out.println("list"+e.toString());
        }
        //转成json对象
        String json = JSONArray.toJSONString(list);
        System.out.println("json : "+json);
        return json;
    }

    /**
     * 添加雇员
     */
    @RequestMapping("goInsert")
    public String goInsert(Model model) {
        List<Employee> list = employeeService.getAll();
        model.addAttribute("insertlist",list);
        List<Department> dlist = employeeService.getAllDept();
        model.addAttribute("dlist",dlist);
        return "/insert";
    }
    @RequestMapping("/insert")
    public String insert(Employee employee) {
        /*if (employee.getMgr()==null){

        }*/
        employeeService.insert(employee);
        System.out.println("*******controller******"+employee.toString());
        return "redirect:findAll?pageNum=1";
    }
    /**
     * 添加雇员
     */
    @RequestMapping("goInsertdept")
    public String goInsertdept() {

        return "insertDept";
    }
    @RequestMapping("/insertDept")
    public String insertdept(Department department) {
        employeeService.insertDept(department);
        System.out.println("*******controller******"+department.toString());
        return "redirect:findAll?pageNum=1";
    }
    //删除
    @RequestMapping("/delete")
    public  String delete(int empno){
        employeeService.deleteByEmpno(empno);
        return "redirect:findAll?pageNum=1";
    }
    //修改
    @RequestMapping("/getOne")
    public  String getOne(int empno,Model model){
        Employee employee=employeeService.getOneByEmpno(empno);
        System.out.println("+=======+++++==+===++++="+employee.toString());
        List<Department> list = employeeService.getAllDept();
        List<Employee> emplist = employeeService.getAll();
        model.addAttribute("deptlist",list);
        model.addAttribute("emplist",emplist);
        model.addAttribute("employee",employee);
        return "update";
    }
    @RequestMapping("/update")
    public String update(Employee employee){
        System.out.println("*****************Controller*****************"+employee.toString());
        employeeService.update(employee);
        return "redirect:findAll?pageNum=1";
    }
}
