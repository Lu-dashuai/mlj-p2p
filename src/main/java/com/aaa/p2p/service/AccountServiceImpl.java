package com.aaa.p2p.service;

import com.aaa.p2p.dao.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * className:AccountService
 * discription:
 * author:luRuiHua
 * createTime:2018-12-19 08:59
 */
@Service
public class AccountServiceImpl implements AccountService{
    @Autowired
    private AccountDao accountDao;
    /**
     * 通过用户名查该人的账户
     * @param map
     * @return
     */
    @Override
    public List<Map> selectAccountByUserId(Map map) {
        List<Map> mapList = accountDao.selectAccountByUserId(map);
        //计算代收本息=代收利息+代收本金
        if (mapList.size()>0){
            Double receiveprincipal = Double.parseDouble(mapList.get(0).get("AVAILABLEBALANCE") + "");//可用余额
            Double receiveInterest = Double.parseDouble(mapList.get(0).get("FREEZINGAMOUNT") + "");//冻结金额
            Double totle = receiveInterest + receiveprincipal;//账户总额
            System.out.println(totle);
            mapList.get(0).put("TOTLE",totle);
        }
        return mapList;
    }
}
