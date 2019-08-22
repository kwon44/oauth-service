package com.oauth.service.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.oauth.service.entity.OauthClientGrant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 客戶端可用授權方式 Mapper 接口
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
public interface OauthClientGrantMapper extends BaseMapper<OauthClientGrant> {

    @Select("select grant_type from oauth_client_grant where oauth_client_detail_id = #{oauthClientResourceId}")
    List<String> listGrantTypeByClientDetailId(@Param("oauthClientResourceId") Long oauthClientResourceId);

}
