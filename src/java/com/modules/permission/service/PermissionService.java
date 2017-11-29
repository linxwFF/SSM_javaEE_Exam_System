package com.modules.permission.service;

import com.common.model.UPermission;
import com.modules.core.mybatis.page.Pagination;
import com.modules.permission.bo.UPermissionBo;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface PermissionService {

	int deleteByPrimaryKey(Long id);

	UPermission insert(UPermission record);

    UPermission insertSelective(UPermission record);

    UPermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UPermission record);

    int updateByPrimaryKey(UPermission record);

	Map<String, Object> deletePermissionById(String ids);

	Pagination<UPermission> findPage(Map<String, Object> resultMap, Integer pageNo,
									 Integer pageSize);
	List<UPermissionBo> selectPermissionById(Long id);

	Map<String, Object> addPermission2Role(Long roleId, String ids);

	Map<String, Object> deleteByRids(String roleIds);
	//根据用户ID查询权限（permission），放入到Authorization里。
	Set<String> findPermissionByUserId(Long userId);
}
