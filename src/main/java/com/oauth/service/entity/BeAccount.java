package com.oauth.service.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 使用者帳號
 * </p>
 *
 * @author wei
 * @since 2019-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("be_account")
public class BeAccount extends Model<BeAccount> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String uid;

    /**
     * 工號
     */
    @TableField("employee_number")
    private String employeeNumber;

    /**
     * 姓名
     */
    private String name;

    /**
     * 帳戶名稱
     */
    @TableField("account_name")
    private String accountName;

    /**
     * 密碼
     */
    private String password;

    /**
     * 電子郵件
     */
    private String email;

    /**
     * 部門代碼
     */
    @TableField("be_department_id")
    private Long beDepartmentId;

    /**
     * 是否鎖定 1:是 0:否
     */
    private Integer locked;

    /**
     * 邏輯刪除 1:是 0:否
     */
    private Integer deleted;

    /**
     * 登入錯誤次數
     */
    @TableField("failed_count")
    private Integer failedCount;

    /**
     * 語系
     */
    private String language;

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
