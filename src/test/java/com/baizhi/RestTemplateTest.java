package com.baizhi;

import com.baizhi.entities.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {UserApplication.class})
public class RestTemplateTest {
    @Autowired
    private RestTemplate restTemplate;


    //@RequestPart 解决同时上传文件和json的解决方案
    @Test
    public void testRegisterUser() throws JsonProcessingException {
        String url = "http://localhost:8088/UserApplication/UserManager/user";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("multipart/form-data"));

        //设置请求体，注意是LinkedMultiValueMap
        FileSystemResource fileUpload = new FileSystemResource("D:\\testpicture.JPG");

        MultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();
        //文件上传参数
        formData.add("photoFile", fileUpload);
        //表单参数
        formData.add("user", new User(null, "huxz", true, "123456", new Date(), null));

        //用HttpEntity封装整个请求报文
        HttpEntity<MultiValueMap<String, Object>> params = new HttpEntity<>(formData, headers);
        restTemplate.postForEntity(url, params, User.class);
    }

    @Test
    public void testDeleteUser() {
        String url = "http://localhost:8088/UserApplication/UserManager/user/12,13";
//        String url = "http://localhost:8088/UserApplication/UserManager/user/19";

        restTemplate.delete(url);
    }

    @Test
    public void testUpdateUser() {
        String url = "http://localhost:8088/UserApplication/UserManager/user";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("multipart/form-data"));
        MultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();

        formData.add("user", new User(17, "曹孟德", true, "000000", null, null));

        //用HttpEntity封装整个请求报文.
        HttpEntity<MultiValueMap<String, Object>> params = new HttpEntity<>(formData, headers);

        restTemplate.put(url, params, User.class);
    }

    @Test
    public void testQueryUser() {
        String url = "http://localhost:8088/UserApplication/UserManager/user/19";
        User user = restTemplate.getForObject(url, User.class);
        System.out.println(user);
    }

    @Test
    public void testByPage() {
        String url = "http://localhost:8088/UserApplication/UserManager/user/1/2?column={column}&value={value}";

        Map<String, Object> params = new HashMap<>();
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

        String url = "http://localhost:8088/UserApplication/UserManager/userLogin";

        User user = new User();
        user.setName("huxz");
        user.setPassword("123456");

        User u = restTemplate.postForObject(url, user, User.class);
        System.out.println(u);
    }

}