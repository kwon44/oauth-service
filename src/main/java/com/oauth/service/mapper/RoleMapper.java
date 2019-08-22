package com.oauth.service.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.oauth.service.entity.Role;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 角色資料表 Mapper 接口
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
public interface RoleMapper extends BaseMapper<Role> {

    @Select({"<script>",
            "select r.role_code ",
            "from account_role ar, role r ",
            "where ar.role_id = r.id ",
            "and ar.account_name =  #{accountName}",
            "</script>"
    })
    List<String> listRole(@Param("accountName") String accountName);

}
