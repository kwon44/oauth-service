package com.oauth.service.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 資源權限資料表
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("resource_scope")
public class ResourceScope extends Model<ResourceScope> {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String uid;

    /**
     * fk
     */
    @TableField("resource_id")
    private Long resourceId;

    /**
     * 權限代碼
     */
    @TableField("scope_code")
    private String scopeCode;

    /**
     * 權限標籤
     */
    private String label;

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
