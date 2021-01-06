package com.lit.service;

import com.google.common.base.Splitter;
import com.google.common.collect.Maps;
import com.lit.entity.Admin;
import com.lit.mapper.adminMapper;
import com.lit.utils.BeanMapUtil;
import com.lit.utils.MapController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class adminService {
    @Autowired
    private adminMapper adminMapper;

    //查询全部
    public List<Admin> query(Admin admin){
        Map<String, Object> map =  BeanMapUtil.beanToMap(admin);
        List<Admin> questionList = adminMapper.query(map);
        return questionList;
    }
    //插入
    public int insert(Admin admin){
        return adminMapper.insert(admin);
    }
    //更新
    public int update(Admin admin){
        Map<String, Object> map =  BeanMapUtil.beanToMap(admin);
        return adminMapper.update(map);
    }
    //查询数量
    public int count(Admin admin){
        Map<String, Object> map =  BeanMapUtil.beanToMap(admin);
        return adminMapper.count(map);
    }
    //删除
    public int delete(Integer id){
        Map<String, Object> map = Maps.newHashMap();
        map.put("id", id);
        return adminMapper.delete(map);

    }
    //批量删除
    public int deleteBatch(String id){
        int flag=0;
        List<String> list = Splitter.on(",").splitToList(id);
        for (String s:list){
            adminMapper.delete(MapController.getInstance().put("id", Integer.parseInt(s)).getMap());
            flag++;
        }
        return flag;
    }

    //详细查询
    public Admin detail(Admin admin){
        Map<String, Object> map =  BeanMapUtil.beanToMap(admin);
        System.out.println(map);
        return adminMapper.detail(map);
    }


}
