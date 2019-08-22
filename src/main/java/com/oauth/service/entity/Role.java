package com.oauth.service.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 角色資料表
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String uid;

    @TableField("role_code")
    private String roleCode;

    /**
     * 岗位標籤
     */
    private String label;

    /**
     *  部門
     */
    @TableField("be_department_id")
    private Long beDepartmentId;

    /**
     * 備註
     */
    private String remark;

    private String creator;

    @TableField("gmt_create")
    private Date gmtCreate;

    private String modifier;

    @TableField("gmt_modified")
    private Date gmtModified;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
