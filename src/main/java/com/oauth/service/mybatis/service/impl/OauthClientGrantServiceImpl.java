package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.entity.OauthClientGrant;
import com.oauth.service.mapper.OauthClientGrantMapper;
import com.oauth.service.mybatis.service.OauthClientGrantService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 客戶端可用授權方式 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class OauthClientGrantServiceImpl extends ServiceImpl<OauthClientGrantMapper, OauthClientGrant> implements OauthClientGrantService {

}
