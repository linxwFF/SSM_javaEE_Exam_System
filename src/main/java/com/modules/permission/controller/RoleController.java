package com.modules.permission.controller;

import com.common.controller.BaseController;
import com.common.model.URole;
import com.common.utils.LoggerUtils;
import com.modules.permission.service.RoleService;
import com.modules.user.manager.UserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope(value="prototype")
@RequestMapping("role")
public class RoleController extends BaseController {
	@Autowired
	RoleService roleService;
	/**
	 * 角色列表
	 * @return
	 */
	@RequestMapping(value="index",method = RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("role/index");
	}
	/**
	 * 角色列表 dataTables json数据返回
	 * @return
     */
	@RequestMapping(value="index",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> online_Table(){
		List<URole> list = roleService.findAllRole();
		resultMap.put("data",list);
		return resultMap;
	}

	/**
	 * 角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="addRole",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addRole(URole role){
		try {
			int count = roleService.insertSelective(role);
			resultMap.put("status", 200);
			resultMap.put("successCount", count);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加角色报错。source[%s]",role.toString());
		}
		return resultMap;
	}
	/**
	 * 删除角色，根据ID，但是删除角色的时候，需要查询是否有赋予给用户，如果有用户在使用，那么就不能删除。
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteRoleById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteRoleById(String ids){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("status", 200);
		resultMap.put("count", 1);
		resultMap.put("message","假装删除成功了");
		return resultMap;

//		return roleService.deleteRoleById(ids);
	}

	/**
	 * 个人资料-我的权限 bootstrap tree data
	 * @return
	 */
	@RequestMapping(value="getPermissionTree",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getPermissionTree(){
		//查询我所有的角色 ---> 权限
		List<URole> roles = roleService.findNowAllPermission();
		//把查询出来的roles 转换成bootstarp 的 tree数据
		List<Map<String, Object>> data = UserManager.toTreeData(roles);
		return data;
	}
}
