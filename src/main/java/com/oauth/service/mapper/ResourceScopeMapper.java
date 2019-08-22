package com.oauth.service.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.oauth.service.entity.ResourceScope;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 資源權限資料表 Mapper 接口
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
public interface ResourceScopeMapper extends BaseMapper<ResourceScope> {

    @Select({
            "<script>",
            "select scope_code from resource_scope where resource_id in ",
            "<foreach item='item' index='index' collection='resourceIds' open='(' separator=',' close=')'> #{item} </foreach>",
            "</script>"
    })
    @Results(value = {
            @Result(property = "scope_code", column = "scope_code")
    })
    List<String> listScopeCodeByResourceIds(@Param("resourceIds") List<String> resourceIds);

    @Select({
            "<script>",
            "select res.scope_code scope_code ",
            "from resource_scope res, role_scope ros, role ro ",
            "where res.id = ros.resource_scope_id ",
            "and ros.role_id = ro.id ",
            "and ro.role_code in ",
            "<foreach item='item' index='index' collection='list' open='(' separator=',' close=')'> #{item} </foreach>",
            "</script>"
    })
    @Results(value = {
            @Result(property = "scope_code", column = "scope_code")
    })
    Set<String> listScopeCodeByRoleCodes(@Param("list") List<String> roleCodes);
}
