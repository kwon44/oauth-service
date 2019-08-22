package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.entity.OauthClientDetail;
import com.oauth.service.mapper.OauthClientDetailMapper;
import com.oauth.service.mybatis.service.OauthClientDetailService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 客戶端授權資料 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class OauthClientDetailServiceImpl extends ServiceImpl<OauthClientDetailMapper, OauthClientDetail> implements OauthClientDetailService {

}
