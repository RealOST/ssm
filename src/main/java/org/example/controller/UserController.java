package org.example.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.pojo.User;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;


    // 假设这是获取用户列表的方法
    @GetMapping()
    public String getUsers(Model model) {
        List<User> users = userService.findAllUsers();

        model.addAttribute("users", users);
        return "list";
    }
    @GetMapping("/toInsert")
    public String toInsert(){
        return "insert";
    }
    @PostMapping("/insert")
    public String insert(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        userService.add(user);
        redirectAttributes.addFlashAttribute("successMessage", "用户添加成功！");
        return "redirect:/user"; // 更新成功后重定向到用户列表页面
    }

    @GetMapping("/toUpdateUser/{id}")
    public String showUpdateForm(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id);
        if (user != null) {
            model.addAttribute("user", user);
            return "userUpdateForm"; // 假设你的编辑表单页面名为userUpdateForm.jsp
        } else {
            // 如果用户不存在，重定向到用户列表页面，并显示错误消息
            model.addAttribute("errorMessage", "用户不存在");
            return "redirect:/user"; // 假设用户列表页面的路径为/users
        }
    }

    // 处理用户更新请求
    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        userService.edit(user);
        redirectAttributes.addFlashAttribute("successMessage", "用户更新成功！");
        return "redirect:/user"; // 更新成功后重定向到用户列表页面
    }

    // 处理用户删除请求
    @GetMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        userService.delete(id);
        redirectAttributes.addFlashAttribute("successMessage", "用户删除成功！");
        return "redirect:/user"; // 删除成功后重定向到用户列表页面
    }

}
