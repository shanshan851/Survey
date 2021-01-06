package com.lit.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapController {

    private static final int success=0;
    private static final int error=-1;
    private Map<String,Object> map=new HashMap<>();

    private MapController(){}

    public  static MapController getInstance(){
       return new MapController();
    }

    public  Map<String,Object> getMap(){
        return map;
    }

    public MapController success(){
        return put("msg", "登录成功").put("code", success);
    }
    public MapController error(){
        return put("msg", "登录失败").put("code", error);
    }

    public MapController success(String msg){
        return put("msg", msg).put("code", success);
    }
    public MapController error(String msg){
        return put("msg", msg).put("code", error);
    }
    public MapController put(String key,Object val){
        map.put(key, val);
        return this;
    }

    public MapController page(List<?> data,Integer count){
        return put("msg", "操作成功").put("code", success).put("data",data).put("count",count);
    }


    public static void main(String[] args) {
        System.out.println(MapController.getInstance().success().getMap());
    }
}
