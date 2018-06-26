package com.kh.fundit.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundit.message.model.dao.MessageDAO;
import com.kh.fundit.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;
	
	@Override
	public int insertMessage(Map<String, Object> map) {
		return messageDAO.insertMessage(map);
	}

	@Override
	public List<Message> selectMessageList(Map<String, Object> map, int cPage, int numPerPage) {
		return messageDAO.selectMessageList(map,cPage,numPerPage);
		
	}

	@Override
	public int totalMessageCount(String email) {
		return messageDAO.totalMessageCount(email);
	}

	@Override
	public int insertMessage2(Map<String, Object> map) {
		return messageDAO.insertMessage2(map);
	}

	@Override
	public String selectContent(Map<String, Object> map) {
		return messageDAO.selectContent(map);
	}

	@Override
	public List<Message> selectMessageList2(Map<String, Object> map, int cPage, int numPerPage) {
		return messageDAO.selectMessageList2(map,cPage,numPerPage);
		
	}

	@Override
	public int totalMessageCount2(String email) {
		return messageDAO.totalMessageCount2(email);
	}





	

}