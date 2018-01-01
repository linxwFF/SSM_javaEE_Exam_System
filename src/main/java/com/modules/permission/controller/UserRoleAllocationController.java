package com.modules.permission.controller;

import com.common.controller.BaseController;
import com.modules.permission.bo.URoleBo;
import com.modules.permission.bo.UserRoleAllocationBo;
import com.modules.permission.service.PermissionService;
import com.modules.user.service.UUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@Scope(value="prototype")
@RequestMapping("role")
public class UserRoleAllocationController extends BaseController {
	@Autowired
	UUserService userService;
	@Autowired
	PermissionService permissionService;

	/**
	 * 用户角色权限列表
	 * @return
     */
	@RequestMapping(value="allocation",method = RequestMethod.GET)
	public ModelAndView allocation(){
		return new ModelAndView("role/allocation");
	}
	/**
	 * 用户角色权限列表 dataTables json数据返回
	 * @return
     */
	@RequestMapping(value="allocation",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> allocation_Table(){
		List<UserRoleAllocationBo> list = userService.findAllUserAndRole();
		resultMap.put("data",list);
		return resultMap;
	}
	/**
	 * 根据用户ID查询权限  //todo这里有小显示用户权限的BUG待解决
	 * @param id
	 * @return
	 */
	@RequestMapping(value="selectRoleByUserId")
	@ResponseBody
	public List<URoleBo> selectRoleByUserId(Long id){
		List<URoleBo> bos = userService.selectRoleByUserId(id);
		return bos;
	}
	/**
	 * 操作用户的角色
	 * @param userId 	用户ID
	 * @param ids		角色ID，以‘,’间隔
	 * @return
	 */
	@RequestMapping(value="addRole2User")
	@ResponseBody
	public Map<String,Object> addRole2User(Long userId,String ids){
		return userService.addRole2User(userId,ids);
	}
	/**
	 * 根据用户id清空角色。
	 * @param userIds	用户ID ，以‘,’间隔
	 * @return
	 */
	@RequestMapping(value="clearRoleByUserIds")
	@ResponseBody
	public Map<String,Object> clearRoleByUserIds(String userIds){
		return userService.deleteRoleByUserIds(userIds);
	}
}
