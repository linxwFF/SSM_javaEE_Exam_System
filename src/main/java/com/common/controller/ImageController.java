package com.common.controller;

import com.common.utils.FTPUtil;
import com.common.utils.PropertiesUtil;
import com.google.common.collect.Lists;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


/**
 * Created by LINxwFF on 2017/12/26.
 */
@Controller
public class ImageController {

    //日志监控
    private Logger logger = LoggerFactory.getLogger(ImageController.class);

    @RequestMapping(value="/uploadImage",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String,Object> uploadFile(@RequestParam(value = "upfile", required = false) MultipartFile file,
                                         HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map = new HashMap<String, Object>();

        //上传路径
        String path = "upload";
        //文件原来的名称
        String fileName = file.getOriginalFilename();
        //扩展名
        String fileExtensionName = fileName.substring(fileName.lastIndexOf(".")+1);
        //上传文件名
        String uploadFile = UUID.randomUUID().toString()+"."+fileExtensionName;

        logger.info("开始上传文件,上传文件名：{},上传路径:{},新文件名:{}",fileName,path,uploadFile);

        File fileDir = new File(path);
        if(!fileDir.exists()){
            fileDir.setWritable(true);  //设置可写权限
            fileDir.mkdirs();           //创建文件夹
        }

        File targetFile = new File(path,uploadFile);

        try {
            file.transferTo(targetFile);    //复制文件到指定目录
            FTPUtil.uploadFile(Lists.newArrayList(targetFile));
            String targetFileName = targetFile.getName();
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;

            map.put("state", "SUCCESS");               // UEDITOR的规则:不为SUCCESS则显示state的内容
            map.put("url",url);          //能访问到你现在图片的路径 这里
            map.put("title","");
            map.put("original","realName" );

        } catch (IOException e) {
            logger.error("上传文件异常",e);

            map.put("state", "文件上传失败!"); //在此处写上错误提示信息，这样当错误的时候就会显示此信息
            map.put("url","");
            map.put("title", "");
            map.put("original", "");
            e.printStackTrace();
        }
        return map;
    }


}
