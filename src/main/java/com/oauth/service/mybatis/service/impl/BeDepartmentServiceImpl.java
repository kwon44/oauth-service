package com.oauth.service.mybatis.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.oauth.service.entity.BeDepartment;
import com.oauth.service.mybatis.service.BeDepartmentService;
import com.oauth.service.mapper.BeDepartmentMapper;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 部門資料表 服务实现类
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Service
public class BeDepartmentServiceImpl extends ServiceImpl<BeDepartmentMapper, BeDepartment> implements BeDepartmentService {

}
