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
 * 客戶端可用授權方式
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("oauth_client_grant")
public class OauthClientGrant extends Model<OauthClientGrant> {

    private static final long serialVersionUID = 1L;

    /**
     * pk
     */
    private Long id;

    private String uid;

    /**
     * fk
     */
    @TableField("oauth_client_detail_id")
    private Long oauthClientDetailId;

    /**
     * accesstoken的授權的類型
     */
    @TableField("grant_type")
    private String grantType;

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
