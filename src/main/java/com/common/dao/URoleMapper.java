package com.common.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.common.model.URole;
import com.modules.permission.bo.RolePermissionAllocationBo;

public interface URoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(URole record);

    int insertSelective(URole record);

    URole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(URole record);

    int updateByPrimaryKey(URole record);

	Set<String> findRoleByUserId(Long id);

	List<URole> findNowAllPermission(Map<String, Object> map);
	
	void initData();

    //查询所有role列表  - 不分页
    List<URole> findAllRole();

    //查询所有的角色和角色拥有的所有权限 - 不分页
    List<RolePermissionAllocationBo> findAllRoleAndPermission();
}