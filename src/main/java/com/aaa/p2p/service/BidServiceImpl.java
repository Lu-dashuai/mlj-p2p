package com.aaa.p2p.service;

import com.aaa.p2p.dao.BidDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * className:BidServiceImpl
 * discription:
 * author:mx
 * createTime:2018-12-18 15:53
 */
@Service
public class BidServiceImpl implements BidService{
   @Autowired
   private BidDao bidDao;

    @Override
    public List<Map> getList() {
        return bidDao.getList();
    }

    @Override
    public List<Map> getListByBidId(int bidid) {
        return bidDao.getListByBidId(bidid);
    }

    @Override
    public Map getMaxMoneyByBidId(int bidid) {
        return bidDao.getMaxMoneyByBidId(bidid);
    }

    @Override
    public List<Map> getListBy(Map map) {
          return bidDao.getListBy(map);
    }
}
