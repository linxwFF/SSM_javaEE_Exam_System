package com.modules.user.controller;

import com.common.controller.BaseController;
import com.common.model.UUser;
import com.modules.core.shiro.session.CustomSessionManager;
import com.modules.user.bo.UserOnlineBo;
import com.modules.user.service.UUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 * 用户列表管理
	 * @return
     */
	@RequestMapping(value="list",method=RequestMethod.GET)
	public ModelAndView list(){
		return new ModelAndView("member/list");
	}

	/**
	 * 用户列表管理 dataTables json数据返回
	 * @return
	 */
	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list_Table(){
		List<UUser> userList = userService.findAllTable();
		resultMap.put("data", userList);
		return resultMap;
	}


	/**
	 * 在线用户列表
	 * @return
	 */
	@RequestMapping(value="online",method = RequestMethod.GET)
	public ModelAndView online(){
		List<UserOnlineBo> list = customSessionManager.getAllUser();
		return new ModelAndView("member/online","list",list);
	}
	/**
	 * 在线用户列表 dataTables json数据返回
	 * @return
     */
	@RequestMapping(value="online",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> online_Table(){
		List<UserOnlineBo> list = customSessionManager.getAllUser();
		resultMap.put("data",list);
		return resultMap;
	}
	/**
	 * 改变Session状态 踢出在线用户登录状态
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
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("status", 200);
		resultMap.put("count", 1);
		resultMap.put("message","假装删除成功了");
		return resultMap;
		//return userService.deleteUserById(ids);	//真正的删除
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


	/**
	 * //获取指定的用户的信息详情
	 * 直接放过了权限限制  查看resources/shiro/shiro_base_auth.ini 配置文件
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="get_user_info/{id}",method=RequestMethod.GET)
	@ResponseBody
	public UUser getUserInfo(@PathVariable("id") long userId){
		return userService.selectByPrimaryKey(userId);
	}

}
