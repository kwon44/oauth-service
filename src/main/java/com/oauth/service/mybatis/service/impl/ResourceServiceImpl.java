package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.entity.Resource;
import com.oauth.service.mybatis.service.ResourceService;
import com.oauth.service.mapper.ResourceMapper;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 資源表 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

}
