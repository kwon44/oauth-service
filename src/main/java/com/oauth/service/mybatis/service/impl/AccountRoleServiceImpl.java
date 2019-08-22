package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.mybatis.service.AccountRoleService;
import com.oauth.service.entity.AccountRole;
import com.oauth.service.mapper.AccountRoleMapper;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 帳號角色映射表 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class AccountRoleServiceImpl extends ServiceImpl<AccountRoleMapper, AccountRole> implements AccountRoleService {

}
