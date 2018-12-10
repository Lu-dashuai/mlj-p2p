package com.aaa.p2p.service;

import com.aaa.p2p.dao.EmpDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * className:EmpServiceImpl
 * discription:
 * author:luRuiHua
 * createTime:2018-12-09 14:50
 */
@Service
public class EmpServiceImpl implements EmpService{
    @Autowired
    private EmpDao empDao;
    /**
     * emp列表查询
     * @return
     */
    @Override
    public List<Map> getEmpList(Map map) {
        return empDao.getEmpList(map);
    }
    /**
     * 查询用户
     * @return
     */
    @Override
    public List<Map> selectEmp(String userName) {
        return empDao.selectEmp(userName);
    }
    /**
     * 更改员工
     * @param map
     * @return
     */
    @Override
    public int updateEmp(Map map) {
        return empDao.updateEmp(map);
    }

    /**
     * 新增员工
     * @param map
     * @return
     */
    @Override
    public int insertEmp(Map map) {
        return empDao.insertEmp(map);
    }

    /**
     * 删除员工
     * @param map
     * @return
     */
    @Override
    public int deleteEmp(Map map) {
        return empDao.deleteEmp(map);
    }
}
