package com.course.server.service;

import com.course.server.domain.Course;
import com.course.server.domain.CourseExample;
import com.course.server.dto.CourseDto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.CourseMapper;
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
public class CourseService {

    @Resource
    private CourseMapper courseMapper;


    /**
     * 列表查询
     */
    public void list(PageDto pageDto) {
        PageHelper.startPage(pageDto.getPageNum(), pageDto.getPageSize());
        CourseExample courseExample = new CourseExample();
        courseExample.setOrderByClause("sort asc");
//        courseExample.createCriteria().andIdEqualTo("1"); //createCriteria()相当于where。查询id为1的记录
//        courseExample.setOrderByClause("id desc");
        List<Course> courseList = courseMapper.selectByExample(courseExample);
        List<CourseDto> courseDtoList = new ArrayList<>();
        PageInfo<Course> pageInfo = new PageInfo<>(courseList);
        pageDto.setTotal(pageInfo.getTotal());
//        for(int i = 0, l = courseList.size(); i < l; i++){
//            Course course = courseList.get(i);
//            CourseDto courseDto = new CourseDto();
//            BeanUtils.copyProperties(course, courseDto);
//            courseDtoList.add(courseDto);
//        }
        courseDtoList = courseList.stream()
                .map( course -> {
                    CourseDto courseDto = new CourseDto();
                    BeanUtils.copyProperties(course, courseDto);
                    return courseDto;
                }).collect(Collectors.toList());
        pageDto.setList(courseDtoList);
//        return pageDto;
    }


    /**
     * 保存，id有值时更新，无值时新增
     */
    public void save(CourseDto courseDto) {
        Course course = CopyUtil.copy(courseDto, Course.class);
        if (StringUtils.isEmpty(courseDto.getId())) {
            this.insert(course);
        } else {
            this.update(course);
        }
    }

    /**
     * 新增
     */
    private void insert(Course course) {
        Date now = new Date();
        course.setCreatedAt(now);
        course.setUpdatedAt(now);
        course.setId(UuidUtil.getShortUuid());
//        BeanUtils.copyProperties(courseDto, course);
        courseMapper.insert(course);
    }

    /**
     * 更新
     */
    private void update(Course course) {
        course.setUpdatedAt(new Date());
        courseMapper.updateByPrimaryKey(course);
    }


    /**
     * 删除
     */
    public void delete(String id) {
        courseMapper.deleteByPrimaryKey(id);
    }



}
