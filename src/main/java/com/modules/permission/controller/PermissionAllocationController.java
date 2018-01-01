package com.modules.permission.controller;

import com.common.controller.BaseController;
import com.modules.permission.bo.RolePermissionAllocationBo;
import com.modules.permission.bo.UPermissionBo;
import com.modules.permission.service.PermissionService;
import com.modules.permission.service.RoleService;
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
@RequestMapping("permission")
public class PermissionAllocationController extends BaseController {

	@Autowired
	PermissionService permissionService;
	@Autowired
	RoleService roleService;

	/**
	 * 权限分配
	 * @return
	 */
	@RequestMapping(value="allocation",method = RequestMethod.GET)
	public ModelAndView allocation(){
		return new ModelAndView("permission/allocation");
	}
	/**
	 * 权限分配 dataTables json数据返回
	 * @return
     */
	@RequestMapping(value="allocation",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> allocation_Table(){
		List<RolePermissionAllocationBo> list = roleService.findAllRoleAndPermission();
		resultMap.put("data",list);
		return resultMap;
	}
	/**
	 * 根据角色ID查询权限
	 * @param id
	 * @return
	 */
	@RequestMapping(value="selectPermissionById")
	@ResponseBody
	public List<UPermissionBo> selectPermissionById(Long id){
		List<UPermissionBo> permissionBos = permissionService.selectPermissionById(id);
		return permissionBos;
	}
	/**
	 * 操作角色的权限
	 * @param roleId 	角色ID
	 * @param ids		权限ID，以‘,’间隔
	 * @return
	 */
	@RequestMapping(value="addPermission2Role")
	@ResponseBody
	public Map<String,Object> addPermission2Role(Long roleId,String ids){
		return permissionService.addPermission2Role(roleId,ids);
	}
//	/**
//	 * 根据角色id清空权限。
//	 * @param roleIds	角色ID ，以‘,’间隔
//	 * @return
//	 */
//	@RequestMapping(value="clearPermissionByRoleIds")
//	@ResponseBody
//	public Map<String,Object> clearPermissionByRoleIds(String roleIds){
//		return permissionService.deleteByRids(roleIds);
//	}
}
