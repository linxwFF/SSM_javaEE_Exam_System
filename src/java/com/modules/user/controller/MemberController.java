package com.modules.user.controller;

import com.alibaba.fastjson.JSON;
import com.common.controller.BaseController;
import com.common.model.UUser;
import com.modules.core.mybatis.page.Pagination;
import com.modules.core.shiro.session.CustomSessionManager;
import com.modules.user.bo.UserOnlineBo;
import com.modules.user.service.UUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 *
 * 用户会员管理
 * 
 */
@Controller
@Scope(value="prototype")
@RequestMapping("member")
public class MemberController extends BaseController {
	/***
	 * 用户手动操作Session
	 * */
	@Autowired
	CustomSessionManager customSessionManager;
	@Autowired
	UUserService userService;

	/**
	 * 用户列表管理 list页面
	 */
	@RequestMapping(value="list",method=RequestMethod.GET)
	public ModelAndView list(){
		return new ModelAndView("member/list2");
	}

	/**
	 * 用户列表管理 dataTables
	 * @return
	 */
	//dataTables 返回json数据
	@RequestMapping(value="list_table")
	@ResponseBody
	public String list_Table(ModelMap map){
		List<UUser> userList = userService.findAllTable();
		map.put("data", userList);
		String jsonString = JSON.toJSONString(map);
		return jsonString;
	}

	/**
	 * 在线用户管理
	 * @return
	 */
	@RequestMapping(value="online")
	public ModelAndView online(){
		List<UserOnlineBo> list = customSessionManager.getAllUser();
		return new ModelAndView("member/online","list",list);
	}
	/**
	 * 在线用户详情
	 * @return
	 */
	@RequestMapping(value="onlineDetails/{sessionId}",method=RequestMethod.GET)
	public ModelAndView onlineDetails(@PathVariable("sessionId")String sessionId){
		UserOnlineBo bo = customSessionManager.getSession(sessionId);
		return new ModelAndView("member/onlineDetails","bo",bo);
	}
	/**
	 * 改变Session状态
	 * @param status
	 * @param sessionId
	 * @return
	 */
	@RequestMapping(value="changeSessionStatus",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> changeSessionStatus(Boolean status,String sessionIds){
		return customSessionManager.changeSessionStatus(status,sessionIds);
	}
	/**
	 * 根据ID删除，
	 * @param ids	如果有多个，以“,”间隔。
	 * @return
	 */
	@RequestMapping(value="deleteUserById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteUserById(String ids){
		return userService.deleteUserById(ids);
	}
	/**
	 * 禁止登录
	 * @param id		用户ID
	 * @param status	1:有效，0:禁止登录
	 * @return
	 */
	@RequestMapping(value="forbidUserById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> forbidUserById(Long id,Long status){
		return userService.updateForbidUserById(id,status);
	}
	
}
