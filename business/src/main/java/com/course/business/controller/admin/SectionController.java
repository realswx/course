package com.course.business.controller.admin;

import com.course.server.dto.PageDto;
import com.course.server.dto.ResponseDto;
import com.course.server.dto.SectionDto;
import com.course.server.service.SectionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/admin/section")
public class SectionController {

    public static final String BUSINESS_NAME = "小节";
    private static final Logger LOG = LoggerFactory.getLogger(SectionController.class);

    @Resource
    private SectionService sectionService;

    /**
     * 列表查询
     */
    @PostMapping("/list")
    public ResponseDto list(@RequestBody PageDto pageDto) {
//        LOG.info("====pageDto: {}", pageDto);
        ResponseDto responseDto = new ResponseDto();
        sectionService.list(pageDto);
        responseDto.setContent(pageDto);
        return responseDto;
    }

    /**
     * 保存，id有值时更新，无值时新增
     */
    @PostMapping("/save")
    public ResponseDto save(@RequestBody SectionDto sectionDto) {
//        LOG.info("====sectionDto1: {}", sectionDto);

        // 保存校验


        ResponseDto responseDto = new ResponseDto();
        sectionService.save(sectionDto);
//        LOG.info("====sectionDto2: {}", sectionDto);
        responseDto.setContent(sectionDto);
        return responseDto;
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public ResponseDto delete(@PathVariable String id) {
//        LOG.info("id: {}", id);
        ResponseDto responseDto = new ResponseDto();
        sectionService.delete(id);
        return responseDto;
    }

}