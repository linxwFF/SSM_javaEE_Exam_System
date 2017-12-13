package com.modules.permission.service;

import com.common.model.URole;
import com.modules.core.mybatis.page.Pagination;
import com.modules.permission.bo.RolePermissionAllocationBo;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface RoleService {

	int deleteByPrimaryKey(Long id);

    int insert(URole record);

    int insertSelective(URole record);

    URole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(URole record);

    int updateByPrimaryKey(URole record);

	Pagination<URole> findPage(Map<String, Object> resultMap, Integer pageNo,
							   Integer pageSize);

	Map<String, Object> deleteRoleById(String ids);

	Pagination<RolePermissionAllocationBo> findRoleAndPermissionPage(
			Map<String, Object> resultMap, Integer pageNo, Integer pageSize);
	//根据用户ID查询角色（role），放入到Authorization里。
	Set<String> findRoleByUserId(Long userId);

	List<URole> findNowAllPermission();
	//初始化数据
	void initData();

	//获取所有的角色列表
	List<URole> findAllRole();

	//获取 角色和角色拥有的权限列表
	List<RolePermissionAllocationBo> findAllRoleAndPermission();
}
