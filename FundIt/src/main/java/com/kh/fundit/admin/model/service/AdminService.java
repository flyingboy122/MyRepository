package com.kh.fundit.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.fundit.admin.model.vo.AdminMember;
import com.kh.fundit.admin.model.vo.AdminMessage;
import com.kh.fundit.admin.model.vo.AdminProjectView;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectGift;

public interface AdminService {

	List<ListProjectView> indexProject();

	int updateIndexYN(String[] arr);

	List<ListProjectView> projectConfirmList();

	List<AdminProjectView> adminProjectView(Map<String, Object> map);

	List<ProjectGift> projectGiftList(Map<String, Object> map);

	Profile profileUser(String userEmail);

	int projectConfirmY(String no);

	int projectConfirmF(String no);

	List<AdminMember> memberList();

	int adminMemberDelete(String email);

	List<ListProjectView> projectDeadLineList();

	List<AdminProjectView> projectDeadlineView(Map<String, Object> map);

	List<AdminMember> memberSearchList(String email);

	List<AdminMessage> adminMessageList();

	AdminMessage selectMessage(String messageNo);

	int updateReadyn(String messageNo);

	List<AdminMessage> selectReadN();

	int replyMessage(Map<String,String> map1);

	List<AdminMessage> adminMessageSearch(String content);
}
