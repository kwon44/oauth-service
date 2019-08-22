package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.mapper.RoleMapper;
import com.oauth.service.mybatis.service.RoleService;
import com.oauth.service.entity.Role;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色資料表 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
