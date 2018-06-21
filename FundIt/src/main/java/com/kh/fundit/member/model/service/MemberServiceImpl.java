package com.kh.fundit.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.fundit.member.model.dao.MemberDAO;
import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.member.model.vo.Profile;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int selectMemberCnt(Member member) {
		
		return memberDAO.selectMemberCnt(member);
	}

	@Override
	public int updateMemberPwd(Member member) {

		return memberDAO.updateMemberPwd(member);
	}
	
	@Override
	public Member selectMember(String email) {
		return memberDAO.selectMember(email);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public int updateProfile(Profile profile) {
		return memberDAO.updateProfile(profile);
	}
	
	@Override
	public int insertMember(Member member) {
	
		return memberDAO.insertMember(member); 
	}

	@Override
	public int checkEmailDuplicate(String email) {
		return memberDAO.checkEmailDuplicate(email);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return memberDAO.selectMemberByEmail(email);
	}
	
	@Override
	public String selectProfileImg(Profile profile) {
		return memberDAO.selectProfileImg(profile);
	}

	@Override
	public Profile selectProfile(String email) {
		return memberDAO.selectProfile(email);
	}

	@Override
	public Member selectNaverByEmail(String naverEmail) {
		return memberDAO.selectNaverByEmail(naverEmail);
	}

	@Override
	public int insertNaver(Map<String, Object> map) {
		return memberDAO.insertNaver(map);
	}

}
