package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.entity.OauthClientResource;
import com.oauth.service.mapper.OauthClientResourceMapper;
import com.oauth.service.mybatis.service.OauthClientResourceService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 客戶端可存取資源 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class OauthClientResourceServiceImpl extends ServiceImpl<OauthClientResourceMapper, OauthClientResource> implements OauthClientResourceService {

}
