package com.modules.user.service;

import com.common.model.UUser;
import com.modules.core.mybatis.page.Pagination;
import com.modules.permission.bo.URoleBo;
import com.modules.permission.bo.UserRoleAllocationBo;
import org.springframework.ui.ModelMap;

import java.util.List;
import java.util.Map;

public interface UUserService {

	int deleteByPrimaryKey(Long id);

	UUser insert(UUser record);

    UUser insertSelective(UUser record);

    UUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UUser record);

    int updateByPrimaryKey(UUser record);
    
    UUser login(String email, String pswd);

	UUser findUserByEmail(String email);

	//获取某一页的数据
	Pagination<UUser> findByPage(Map<String, Object> resultMap, Integer pageNo,
								 Integer pageSize);

	Map<String, Object> deleteUserById(String ids);

	Map<String, Object> updateForbidUserById(Long id, Long status);

	Pagination<UserRoleAllocationBo> findUserAndRole(ModelMap modelMap,
													 Integer pageNo, Integer pageSize);

	List<URoleBo> selectRoleByUserId(Long id);

	Map<String, Object> addRole2User(Long userId, String ids);

	Map<String, Object> deleteRoleByUserIds(String userIds);

	//获取用户的列表的全部数据
	List<UUser> findAllTable();
}
