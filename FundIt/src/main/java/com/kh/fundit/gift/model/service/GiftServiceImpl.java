package com.kh.fundit.gift.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.gift.model.dao.GiftDAO;
import com.kh.fundit.gift.model.vo.Gift;
import com.kh.fundit.gift.model.vo.GiveGift;

@Service
public class GiftServiceImpl implements GiftService {
	
	@Autowired
	private GiftDAO giftDAO;
	
	@Override
	public List<Gift> selectMyGift(Map<String, String> map, int myGiftPage, int numPerPage) {
		// TODO Auto-generated method stub
		return giftDAO.selectMyGift(map,myGiftPage , numPerPage);
	}

	

	@Override
	public int updateDeliveryAddr(Gift gift) {
		// TODO Auto-generated method stub
		return giftDAO.updateDeliveryAddr(gift);
	}

	@Override
	public List<GiveGift> selectGiveGift(Map<String, String> map, int giftPage, int numPerPage) {
		// TODO Auto-generated method stub
		return giftDAO.selectGiveGift(map, giftPage, numPerPage);
	}

	

	

}
