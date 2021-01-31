package com.baizhi.controller;

import com.baizhi.entities.User;
import com.baizhi.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@RestController// @Controller + @ResponseBody
@RequestMapping(value = "/FormUserManager")
public class FormUserController {
    //注入Service的实现类
    @Autowired
    private IUserService userService;

    // (1)、 注册用户
    @PostMapping(value = "/registUser")
    @ResponseBody
    public User registUser(User user, @RequestParam(value = "photoFile"
            , required = false) MultipartFile multipartFile) throws Exception {
        //创建一个和上传文件命名相同的文件  该文件没有内容
        //把上传文件的内容  传输到空的文件中
        String realPath = "E:/uploadfiles1";
        File file = new File(realPath + "/" + multipartFile.getOriginalFilename());
        multipartFile.transferTo(file);

        //将用户插入到数据库
        user.setPhoto(multipartFile.getOriginalFilename());
        userService.registUser(user);
        return user;
    }

    //（2）、删除用户
    @DeleteMapping(value = "/deleteByIds")
    @ResponseBody
    public void deleteByIds(@RequestParam(value = "ids") Integer[] ids) {
        userService.deleteByIds(ids);

    }

    //（3）、改
    @PutMapping(value = "/updateUser")
    @ResponseBody
    public User updateUser(User user) {
        User user1 = userService.updateUser(user);
        System.out.println("++更新后+" + user1);
        return user1;
    }

    //（4）、数据库中查询
    @GetMapping("/queryById")
    @ResponseBody
    public User queryById(@RequestParam(value = "id") Integer id) {
        User user1 = userService.queryById(id);
        System.out.println(user1);
        return user1;
    }

    //    （5）、分页查询
    @GetMapping("/queryByPage")
    @ResponseBody
    public List<User> queryByPage(@RequestParam(value = "pageNow", defaultValue = "1") Integer pageNow,
                                  @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                  @RequestParam(value = "column", required = true) String column,
                                  @RequestParam(value = "value", required = true) String value) {

        List<User> userList = userService.queryByPage(pageNow, pageSize, column, value);
        for (User user : userList) {
            System.out.println(user);
        }
        return userList;
    }


    @PostMapping(value = "/userLogin")
    @ResponseBody
    public User userLogin(User user) {
        User loginUser = userService.login(user);
        return loginUser;
    }

}
