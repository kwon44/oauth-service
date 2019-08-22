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
 * 客戶端授權資料
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("oauth_client_detail")
public class OauthClientDetail extends Model<OauthClientDetail> {

    private static final long serialVersionUID = 1L;

    /**
     * pk
     */
    private Long id;

    private String uid;

    /**
     * oauth2 client id
     */
    @TableField("client_id")
    private String clientId;

    /**
     * oauth2 client secret
     */
    @TableField("client_secret")
    private String clientSecret;

    /**
     * 服務端pre-established的跳轉URI
     */
    @TableField("web_server_redirect_uri")
    private String webServerRedirectUri;

    /**
     * accesstoken存活時間
     */
    @TableField("access_token_validity")
    private Integer accessTokenValidity;

    /**
     * refreshtoken的有效時間
     */
    @TableField("refresh_token_validity")
    private Integer refreshTokenValidity;

    /**
     * 是否自動授權
     */
    @TableField("auto_approve")
    private Boolean autoApprove;

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
