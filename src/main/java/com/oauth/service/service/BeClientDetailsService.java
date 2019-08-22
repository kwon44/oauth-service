package com.oauth.service.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.oauth.service.entity.OauthClientDetail;
import com.oauth.service.mapper.OauthClientGrantMapper;
import com.oauth.service.mybatis.service.OauthClientDetailService;
import com.oauth.service.mapper.ResourceMapper;
import com.oauth.service.mapper.ResourceScopeMapper;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.ClientRegistrationException;
import org.springframework.security.oauth2.provider.client.BaseClientDetails;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class BeClientDetailsService implements ClientDetailsService {
    @Resource
    private OauthClientDetailService oauthClientDetailService;
    @Resource
    private ResourceMapper resourceMapper;
    @Resource
    private ResourceScopeMapper resourceScopeMapper;
    @Resource
    private OauthClientGrantMapper oauthClientGrantMapper;

    @Override
    public ClientDetails loadClientByClientId(String clientId) throws ClientRegistrationException {
        List resourceIds = new ArrayList();
        List resourcesCodes = new ArrayList();

        EntityWrapper<OauthClientDetail> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("client_id", clientId);
        OauthClientDetail oauthClientDetail = oauthClientDetailService.selectOne(entityWrapper);
        BaseClientDetails baseClientDetails = new BaseClientDetails();
        baseClientDetails.setClientId(clientId);
        baseClientDetails.setClientSecret(oauthClientDetail.getClientSecret());

        List<com.oauth.service.entity.Resource> resources = resourceMapper.listByClientDetailId(oauthClientDetail.getId());

        for (com.oauth.service.entity.Resource resource : resources) {
            resourceIds.add(resource.getId());
            resourcesCodes.add(resource.getResourceCode());
        }

        baseClientDetails.setResourceIds(resourcesCodes);
        //resourceIds select table resource_scope
        List<String> scopes = resourceScopeMapper.listScopeCodeByResourceIds(resourceIds);
        baseClientDetails.setScope(scopes);

        //clientId select table oauth_client_grant
        List<String> authorizedGrantTypes = oauthClientGrantMapper.listGrantTypeByClientDetailId(oauthClientDetail.getId());
        baseClientDetails.setAuthorizedGrantTypes(authorizedGrantTypes);
        baseClientDetails.setAccessTokenValiditySeconds(oauthClientDetail.getAccessTokenValidity());
        baseClientDetails.setRefreshTokenValiditySeconds(oauthClientDetail.getRefreshTokenValidity());

        //isAutoApprove
        if (oauthClientDetail.getAutoApprove()) {
            baseClientDetails.setAutoApproveScopes(scopes);
        }

        return baseClientDetails;
    }
}
