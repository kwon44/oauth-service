package com.oauth.service.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.oauth.service.entity.BeAccount;
import com.oauth.service.mapper.RoleMapper;
import com.oauth.service.mybatis.service.BeAccountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class BeUserService implements UserDetailsService {
    @Autowired
    private BeAccountService beAccountService;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String accountName) throws UsernameNotFoundException {
        log.debug("loadUserByUsername:{}",accountName);
        EntityWrapper<BeAccount> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("account_name", accountName);
        BeAccount beAccount = beAccountService.selectOne(entityWrapper);
        if(beAccount == null){
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        List<String> roleCodeList = roleMapper.listRole(beAccount.getAccountName());
        List<SimpleGrantedAuthority> grantedList = new ArrayList<>();
        roleCodeList.forEach(roleCode->grantedList.add(new SimpleGrantedAuthority(roleCode)));
        return new User(beAccount.getAccountName(),beAccount.getPassword(), grantedList);
    }
}
