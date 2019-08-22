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
 * 客戶端可存取資源
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("oauth_client_resource")
public class OauthClientResource extends Model<OauthClientResource> {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String uid;

    /**
     * fk
     */
    @TableField("oauth_client_detail_id")
    private Long oauthClientDetailId;

    /**
     * fk
     */
    @TableField("resource_id")
    private Long resourceId;

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
