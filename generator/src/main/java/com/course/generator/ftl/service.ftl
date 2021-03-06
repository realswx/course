package com.course.server.service;

import com.course.server.domain.${Domain};
import com.course.server.domain.${Domain}Example;
import com.course.server.dto.${Domain}Dto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.${Domain}Mapper;
import com.course.server.util.CopyUtil;
import com.course.server.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
<#list typeSet as type>
    <#if type=='Date'>
        import java.util.Date;
    </#if>
</#list>

@Service
public class ${Domain}Service {

    @Resource
    private ${Domain}Mapper ${domain}Mapper;


    /**
     * 列表查询
     */
    public void list(PageDto pageDto) {
        PageHelper.startPage(pageDto.getPageNum(), pageDto.getPageSize());
        ${Domain}Example ${domain}Example = new ${Domain}Example();
        <#list fieldList as field>
            <#if field.nameHump=='sort'>
        ${domain}Example.setOrderByClause("sort asc");
            </#if>
        </#list>
//        ${domain}Example.createCriteria().andIdEqualTo("1"); //createCriteria()相当于where。查询id为1的记录
//        ${domain}Example.setOrderByClause("id desc");
        List<${Domain}> ${domain}List = ${domain}Mapper.selectByExample(${domain}Example);
        List<${Domain}Dto> ${domain}DtoList = new ArrayList<>();
        PageInfo<${Domain}> pageInfo = new PageInfo<>(${domain}List);
        pageDto.setTotal(pageInfo.getTotal());
//        for(int i = 0, l = ${domain}List.size(); i < l; i++){
//            ${Domain} ${domain} = ${domain}List.get(i);
//            ${Domain}Dto ${domain}Dto = new ${Domain}Dto();
//            BeanUtils.copyProperties(${domain}, ${domain}Dto);
//            ${domain}DtoList.add(${domain}Dto);
//        }
        ${domain}DtoList = ${domain}List.stream()
                .map( ${domain} -> {
                    ${Domain}Dto ${domain}Dto = new ${Domain}Dto();
                    BeanUtils.copyProperties(${domain}, ${domain}Dto);
                    return ${domain}Dto;
                }).collect(Collectors.toList());
        pageDto.setList(${domain}DtoList);
//        return pageDto;
    }


    /**
     * 保存，id有值时更新，无值时新增
     */
    public void save(${Domain}Dto ${domain}Dto) {
        ${Domain} ${domain} = CopyUtil.copy(${domain}Dto, ${Domain}.class);
        if (StringUtils.isEmpty(${domain}Dto.getId())) {
            this.insert(${domain});
        } else {
            this.update(${domain});
        }
    }

    /**
     * 新增
     */
    private void insert(${Domain} ${domain}) {
        <#list typeSet as type>
            <#if type=='Date'>
        Date now = new Date();
            </#if>
        </#list>
        <#list fieldList as field>
            <#if field.nameHump=='createdAt'>
        ${domain}.setCreatedAt(now);
            </#if>
            <#if field.nameHump=='updatedAt'>
        ${domain}.setUpdatedAt(now);
            </#if>
        </#list>
        ${domain}.setId(UuidUtil.getShortUuid());
//        BeanUtils.copyProperties(${domain}Dto, ${domain});
        ${domain}Mapper.insert(${domain});
    }

    /**
     * 更新
     */
    private void update(${Domain} ${domain}) {
        <#list fieldList as field>
            <#if field.nameHump=='updatedAt'>
        ${domain}.setUpdatedAt(new Date());
            </#if>
        </#list>
        ${domain}Mapper.updateByPrimaryKey(${domain});
    }


    /**
     * 删除
     */
    public void delete(String id) {
        ${domain}Mapper.deleteByPrimaryKey(id);
    }



}
