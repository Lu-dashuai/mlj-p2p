package com.aaa.p2p.dao;

import java.util.List;
import java.util.Map;

/**
 * className:AccountDao
 * discription:
 * author:luRuiHua
 * createTime:2018-12-19 08:56
 */
public interface AccountDao {
    /**
     * 通过用户名查该人的账户
     * @param map
     * @return
     */
    List<Map> selectAccountByUserId(Map map);
    /**
     * 检验重置密码
     * @param map
     * @return
     */
    List<Map> selectAccountPsd(Map map);
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
}
