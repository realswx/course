package com.course.gateway.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import org.springframework.web.util.pattern.PathPatternParser;

@Configuration
public class CorsConfig {

    /**
     * 配置跨域
     */
    @Bean
    public CorsWebFilter corsFilter() {
        //初始化cors配置
        CorsConfiguration config = new CorsConfiguration();
        //允许携带cookie
        config.setAllowCredentials(Boolean.TRUE);
        //代表所有请求方式,post。。。
        config.addAllowedMethod("*");
        //允许跨域的域名，如果要携带cookie不能写*.*代表所有域名都可以跨域访问
        config.addAllowedOriginPattern("*");
        //允许携带任何头信息
        config.addAllowedHeader("*");
        config.setMaxAge(3600L);

        //初始化cors配置源对象
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource(new PathPatternParser());
        source.registerCorsConfiguration("/**", config);

        //返回corsFilter实例，参数:cors配置源对象
        return new CorsWebFilter(source);
    }

}