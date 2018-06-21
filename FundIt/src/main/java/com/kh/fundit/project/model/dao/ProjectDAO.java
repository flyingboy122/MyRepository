package com.kh.fundit.project.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.fundit.member.model.vo.Member;
import com.kh.fundit.project.model.vo.ListProjectView;
import com.kh.fundit.project.model.vo.Profile;
import com.kh.fundit.project.model.vo.ProjectOutline;
import com.kh.fundit.project.model.vo.ProjectView;

public interface ProjectDAO {

	List<ProjectOutline> selectIndexProject();

	List<ListProjectView> selectIndexNewProject(int newProjectPage, int numPerpage);

	List<ListProjectView> selectIndexDeadlineProject(int deadlineProjectPage, int numPerpage);

	List<ListProjectView> selectIndexPopularProject(int popularProjectPage, int numPerpage);

	List<ListProjectView> selectMyProjectYet(Member member);
	
	List<ListProjectView> selectMyProjectYes(Member member);
	
	List<ListProjectView> selectMyProjectNo(Member member);
	
	int selectMyProjectCnt(Member member);
	
	List<ListProjectView> projectList(Map<String, String> map);

	List<ProjectView> projectView(Map<String, Integer> map);

	List<ListProjectView> interestList(String email);

	Profile profileUser(String userEmail);

	List<ProjectView> oriProjectList(Map<String, String> map);

}
