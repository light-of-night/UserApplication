package com.baizhi.controller;

import com.baizhi.entities.User;
import com.baizhi.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@RestController// @Controller + @ResponseBody
@RequestMapping(value = "/UserManager")
public class RestUserController {
    //注入Service的实现类
    @Autowired
    private IUserService userService;

    // (1)、 注册用户
    @PostMapping(value = "/user")
    public User registUser(@RequestPart User user, @RequestParam(value = "photoFile", required = false) MultipartFile multipartFile) throws Exception {
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
    @DeleteMapping(value = "/user/{ids}")
    public void deleteByIds(@PathVariable(value = "ids") Integer[] ids) {
        userService.deleteByIds(ids);

    }

    //（3）、更新用户信息
    @PutMapping(value = "/user")
    public User updateUser(@RequestBody User user) {
        User user1 = userService.updateUser(user);
        System.out.println("跟新后" + user1);
        System.out.println("");
        return user1;

    }


    //（4）、数据库中查询
    @GetMapping("/user/{id}")
    public User queryById(@PathVariable(value = "id") Integer id) {
        User user1 = userService.queryById(id);
        System.out.println(user1);
        return user1;
    }

    //    （5）、分页查询
    @GetMapping("/user/{pageNow}/{pageSize}")
    public List<User> queryByPage(@PathVariable(value = "pageNow") Integer pageNow,
                                  @PathVariable(value = "pageSize") Integer pageSize,
                                  @RequestParam(value = "column", required = false) String column,
                                  @RequestParam(value = "value", required = false) String value) {

        List<User> userList = userService.queryByPage(pageNow, pageSize, column, value);
        for (User user : userList) {
            System.out.println(user);
        }
        return userList;
    }

    @PostMapping(value = "/userLogin")
    public User userLogin(@RequestBody User user) {
        User loginUser = userService.login(user);
        return loginUser;
    }
}
