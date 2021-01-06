package com.lit.controller;

import com.lit.entity.Admin;
import com.lit.entity.Survey;
import com.lit.service.adminService;
import com.lit.utils.MD5Utils;
import com.lit.utils.MapController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class adminControl {
    @Autowired
    private adminService adminService;

    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> insert( Admin admin){
        adminService.insert(admin);
        return MapController.getInstance().success("添加成功").put("data",admin).getMap();
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(@RequestBody Admin admin,HttpServletRequest request){
        admin.setPassword(MD5Utils.getMD5(admin.getPassword()));
        Admin info = adminService.detail(admin);
        if(info==null){
            return MapController.getInstance().error("用户名或密码错误").getMap();
        }
        request.getSession().setAttribute("adminID", info.getId());
        return MapController.getInstance().success().getMap();
    }

    @RequestMapping("/pageList")
    @ResponseBody
    public Map<String,Object> list( Admin admin){

        //count：查询的总数量，
        Integer count = adminService.count(admin);
        System.out.println(admin.getName());

        //设置分页条件，page为当前页，limit为每页数量
        admin.setPage((admin.getPage() - 1) * admin.getLimit());
        if (admin.getLimit()>count)
        admin.setLimit(count);
        List<Admin> admins = adminService.query(admin);

        return MapController.getInstance().success().page(admins, count).getMap();

    }

    @RequestMapping("/update")
    @ResponseBody
    public Map<String,Object> update(Admin admin){
        adminService.update(admin);
        System.out.println(admin.getAccount());
        return MapController.getInstance().success("修改成功").getMap();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String,Object> delete(String id){
        adminService.deleteBatch(id);
        return MapController.getInstance().success("删除成功").put("data",id).getMap();

    }
    @RequestMapping("/detail")
    public String detail(Admin admin, Model model){
        model.addAttribute("admin", adminService.detail(admin));
        return "adminEdit";
    }

}
