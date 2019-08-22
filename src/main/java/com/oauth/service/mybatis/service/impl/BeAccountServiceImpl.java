package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.entity.BeAccount;
import com.oauth.service.mapper.BeAccountMapper;
import com.oauth.service.mybatis.service.BeAccountService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 使用者帳號 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class BeAccountServiceImpl extends ServiceImpl<BeAccountMapper, BeAccount> implements BeAccountService {

}
