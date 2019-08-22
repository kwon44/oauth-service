package com.oauth.service.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.oauth.service.entity.Resource;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 資源表 Mapper 接口
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
public interface ResourceMapper extends BaseMapper<Resource> {

    @Select("select r.* " +
            "from oauth_client_resource ocr, resource r " +
            "where ocr.resource_id = r.id " +
            "and ocr.oauth_client_detail_id = #{clientDetailId}")
    List<Resource> listByClientDetailId(@Param("clientDetailId") Long clientDetailId);

}
