package com.aaa.p2p.service;

import com.aaa.p2p.entity.Emp;

import java.util.List;

/**
 * className:EmpService
 * discription:
 * author:luRuiHua
 * createTime:2018-11-29 09:54
 */
public interface EmpService {
    /**
     * 查询员工
     * @return
     */
    public List<Emp> selectEmpList();
}
