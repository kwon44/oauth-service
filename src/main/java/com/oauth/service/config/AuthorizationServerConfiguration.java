package com.oauth.service.config;

import com.oauth.service.service.BeTokenService;
import com.oauth.service.service.BeUserService;
import com.oauth.service.service.BeClientDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfiguration extends AuthorizationServerConfigurerAdapter {
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private RedisConnectionFactory redisConnectionFactory;
    @Autowired
    private BeUserService beUserService;
    @Autowired
    private BeClientDetailsService beClientDetailsService;

    private BeTokenService beTokenService;

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.withClientDetails(beClientDetailsService);
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints.authenticationManager(authenticationManager)
                .userDetailsService(beUserService)
                .tokenServices(beTokenService(endpoints));
    }

    @Bean
    public TokenStore tokenStore() {
        RedisTokenStore redisTokenStore = new RedisTokenStore(redisConnectionFactory);
        return redisTokenStore;
    }

    @Override
    public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
        oauthServer
                .checkTokenAccess("isAuthenticated()")
//                .checkTokenAccess("permitAll()")
                //充許表單驗證
                .allowFormAuthenticationForClients();
    }

    @Bean
    @Primary
    public BeTokenService beTokenService(AuthorizationServerEndpointsConfigurer endpoints){
        BeTokenService beTokenService = new BeTokenService();
        beTokenService.setTokenStore(new RedisTokenStore(redisConnectionFactory));
        beTokenService.setSupportRefreshToken(true);
        beTokenService.setReuseRefreshToken(false);
        beTokenService.setClientDetailsService(endpoints.getClientDetailsService());
        return beTokenService;
    }

}
