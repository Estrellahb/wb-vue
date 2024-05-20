package com.example.wb.controller;

import com.example.wb.config.NonStaticResourceHttpRequestHandler;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.nio.charset.StandardCharsets;

@Controller

public class BaseSourceApiController {


    @Autowired
    private NonStaticResourceHttpRequestHandler nonStaticResourceHttpRequestHandler;

    @GetMapping("/api/video")
    @ResponseBody
    public String getVideoUrl() {
        // 指定视频文件的路径
        String videoPath = "D:/workspace/wb/src/main/resources/static/KFC.mp4";
        // 返回视频文件的路径
        return videoPath;
    }

    @GetMapping("/video")
    public void video(HttpServletRequest request, HttpServletResponse response) {
        try {
            String videoUrl = getVideoUrl();
            File file = new File(videoUrl);
            if (file.exists()) {
                request.setAttribute(NonStaticResourceHttpRequestHandler.ATTR_FILE, videoUrl);
                nonStaticResourceHttpRequestHandler.handleRequest(request, response);
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.setCharacterEncoding(StandardCharsets.UTF_8.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
