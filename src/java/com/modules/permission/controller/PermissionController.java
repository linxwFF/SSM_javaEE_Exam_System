package com.modules.permission.controller;

import com.alibaba.fastjson.JSON;
import com.common.controller.BaseController;
import com.common.model.UPermission;
import com.common.utils.LoggerUtils;
import com.modules.core.mybatis.page.Pagination;
import com.modules.permission.service.PermissionService;
import com.modules.user.bo.UserOnlineBo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户权限管理
 *
 */
@Controller
@Scope(value="prototype")
@RequestMapping("permission")
public class PermissionController extends BaseController {
	
	@Autowired
	PermissionService permissionService;
	/**
	 * 权限列表
	 * @param findContent	查询内容
	 * @param pageNo		页码
	 * @param modelMap		参数回显
	 * @return
	 */
//	@RequestMapping(value="index")
//	public ModelAndView index(String findContent,ModelMap modelMap,Integer pageNo){
//		modelMap.put("findContent", findContent);
//		Pagination<UPermission> permissions = permissionService.findPage(modelMap,pageNo,pageSize);
//		return new ModelAndView("permission/index","page",permissions);
//	}

	/**
	 * 权限列表
	 */
	@RequestMapping(value="index",method = RequestMethod.GET)
	public ModelAndView allocation(){
		return new ModelAndView("permission/index2");
	}

	//权限列表 _table
	@RequestMapping(value="index",method = RequestMethod.POST)
	@ResponseBody
	public String allocation(ModelMap map){

		List<UPermission> uPermissionList = permissionService.findAllPermission();
		map.put("data",uPermissionList);
		String jsonString = JSON.toJSONString(map);
		return jsonString;
	}

	/**
	 * 权限添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="addPermission",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addPermission(UPermission psermission){
		try {
			UPermission entity = permissionService.insertSelective(psermission);
			resultMap.put("status", 200);
			resultMap.put("entity", entity);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "添加失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "添加权限报错。source[%s]", psermission.toString());
		}
		return resultMap;
	}
	/**
	 * 删除权限，根据ID，但是删除权限的时候，需要查询是否有赋予给角色，如果有角色在使用，那么就不能删除。
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deletePermissionById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteRoleById(String ids){

		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("status", 200);
		resultMap.put("count", 1);
		resultMap.put("message","假装删除成功了");
		return resultMap;

//		return permissionService.deletePermissionById(ids);
	}
}
