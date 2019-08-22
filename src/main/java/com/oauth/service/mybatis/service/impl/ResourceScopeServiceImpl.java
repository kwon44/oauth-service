package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.mapper.ResourceScopeMapper;
import com.oauth.service.mybatis.service.ResourceScopeService;
import com.oauth.service.entity.ResourceScope;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 資源權限資料表 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class ResourceScopeServiceImpl extends ServiceImpl<ResourceScopeMapper, ResourceScope> implements ResourceScopeService {

}
