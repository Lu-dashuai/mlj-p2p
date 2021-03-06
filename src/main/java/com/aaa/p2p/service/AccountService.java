package com.aaa.p2p.service;

import java.util.List;
import java.util.Map;

/**
 * className:AccountService
 * discription:
 * author:luRuiHua
 * createTime:2018-12-19 08:59
 */
public interface AccountService {
    /**
     * 通过用户名查该人的账户
     * @param map
     * @return
     */
    List<Map> selectAccountByUserId(Map map);
    /**
     * 提现后更新账户余额
     * @param tixian
     * @return
     */
    int updateAccountId(Integer tixian, Integer userid);
    /**
     * 充值后更新账户余额
     * @param
     * @return
     */
    int updateAccount(Integer chongzhi, Integer userid);
    /**
     * 检验重置密码
     * @param map
     * @return
     */
    int selectAccountPsd(Map map);
}
