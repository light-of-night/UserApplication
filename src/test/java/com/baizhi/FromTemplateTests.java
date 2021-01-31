package com.baizhi;

import com.baizhi.entities.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {UserApplication.class})
public class FromTemplateTests {
    @Autowired
    private RestTemplate restTemplate;


    //@RequestPart 解决同时上传文件和json的解决方案
    @Test
    public void testRegisterUser() throws JsonProcessingException {
        String url = "http://localhost:8088/UserApplication/FormUserManager/registUser";

        //设置请求体，注意是LinkedMultiValueMap
        FileSystemResource fileUpload = new FileSystemResource("D:\\testpicture.JPG");

        MultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();
        //文件上传参数
        formData.add("photoFile", fileUpload);
        //表单参数
        formData.add("name", "ss");
        formData.add("sex", "false");
        formData.add("password", "123456");
        formData.add("birthday", "1889-10-10");

        User u = restTemplate.postForObject(url, formData, User.class);
        System.out.println(u);

    }

    //    删除
    @Test
    public void testDeleteUserById() {
        String url = "http://localhost:8088/UserApplication/FormUserManager/deleteByIds?ids={ids}";
        String ids = Arrays.asList(21, 20).stream().map(id -> id + "").reduce((v1, v2) -> v1 + "," + v2).get();
        restTemplate.delete(url, ids);
    }

    // 改
    @Test
    public void testUpdateUser() {
        String url = "http://localhost:8088/UserApplication/FormUserManager/updateUser";

        MultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();
        formData.add("id", "22");
        formData.add("sex", "true");
        formData.add("password", "000009");
//        formData.add("birthday","Thu Apr 12 17:57:00 CST 2018");

        restTemplate.put(url, formData);
    }


    @Test
    public void testQueryUserById() {
        String url = "http://localhost:8088/UserApplication/FormUserManager/queryById?id={id}";
        User user = restTemplate.getForObject(url, User.class, 24);
        System.out.println(user);
    }

    @Test
    public void testQueryUserByPage() {
        String url = "http://localhost:8088/UserApplication/FormUserManager/queryByPage?pageNow={pageNow}&pageSize={pageSize}&column={column}&value={value}";

        Map<String, Object> params = new HashMap<>();
        params.put("pageNow", "1");
        params.put("pageSize", "2");
        params.put("column", "name");
        params.put("value", "s");
        List<User> users = restTemplate.getForObject(url, List.class, params);
        for (int i = 0; i < users.size(); i++) {
            System.out.println(users.get(i));
        }
    }


    @Test
    public void testUserLogin() {
        restTemplate.setErrorHandler(new ResponseErrorHandler() {
            //是否抛出异常 返回false
            @Override
            public boolean hasError(ClientHttpResponse response) throws IOException {
                System.out.println(response.getStatusCode());
                return false;
            }

            @Override
            public void handleError(ClientHttpResponse response) throws IOException {
                System.out.println("粗错了！" + response.getStatusCode());
            }
        });

        String url = "http://localhost:8088/UserApplication/FormUserManager/userLogin";

        MultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();
        formData.add("name", "huxz");
        formData.add("password", "123456");

        User u = restTemplate.postForObject(url, formData, User.class);
        System.out.println(u);
    }
}
