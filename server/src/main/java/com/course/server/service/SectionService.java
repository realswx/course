package com.course.server.service;

import com.course.server.domain.Section;
import com.course.server.domain.SectionExample;
import com.course.server.dto.SectionDto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.SectionMapper;
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
        import java.util.Date;

@Service
public class SectionService {

    @Resource
    private SectionMapper sectionMapper;


    /**
     * 列表查询
     */
    public void list(PageDto pageDto) {
        PageHelper.startPage(pageDto.getPageNum(), pageDto.getPageSize());
        SectionExample sectionExample = new SectionExample();
        sectionExample.setOrderByClause("sort asc");
//        sectionExample.createCriteria().andIdEqualTo("1"); //createCriteria()相当于where。查询id为1的记录
//        sectionExample.setOrderByClause("id desc");
        List<Section> sectionList = sectionMapper.selectByExample(sectionExample);
        List<SectionDto> sectionDtoList = new ArrayList<>();
        PageInfo<Section> pageInfo = new PageInfo<>(sectionList);
        pageDto.setTotal(pageInfo.getTotal());
//        for(int i = 0, l = sectionList.size(); i < l; i++){
//            Section section = sectionList.get(i);
//            SectionDto sectionDto = new SectionDto();
//            BeanUtils.copyProperties(section, sectionDto);
//            sectionDtoList.add(sectionDto);
//        }
        sectionDtoList = sectionList.stream()
                .map( section -> {
                    SectionDto sectionDto = new SectionDto();
                    BeanUtils.copyProperties(section, sectionDto);
                    return sectionDto;
                }).collect(Collectors.toList());
        pageDto.setList(sectionDtoList);
//        return pageDto;
    }


    /**
     * 保存，id有值时更新，无值时新增
     */
    public void save(SectionDto sectionDto) {
        Section section = CopyUtil.copy(sectionDto, Section.class);
        if (StringUtils.isEmpty(sectionDto.getId())) {
            this.insert(section);
        } else {
            this.update(section);
        }
    }

    /**
     * 新增
     */
    private void insert(Section section) {
        Date now = new Date();
        section.setCreatedAt(now);
        section.setUpdatedAt(now);
        section.setId(UuidUtil.getShortUuid());
//        BeanUtils.copyProperties(sectionDto, section);
        sectionMapper.insert(section);
    }

    /**
     * 更新
     */
    private void update(Section section) {
        section.setUpdatedAt(new Date());
        sectionMapper.updateByPrimaryKey(section);
    }


    /**
     * 删除
     */
    public void delete(String id) {
        sectionMapper.deleteByPrimaryKey(id);
    }



}
