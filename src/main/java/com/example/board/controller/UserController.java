package com.example.board.controller;

import com.example.board.service.UserService;
import com.example.board.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signinform")
    public String signInForm() {
        return "signin";
    }

    @PostMapping("/signin")
    public String signIn(UserVO userVO, HttpSession session, Model model) {
        System.out.println(userVO.getUserId());
        UserVO loggedInUser = userService.userLogin(userVO);
        if (loggedInUser != null) {
            session.setAttribute("member", loggedInUser);
            model.addAttribute("test", loggedInUser);
            return "redirect:/boardlist";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "signin";
        }
    }

    @GetMapping("/signupform")
    public String signUpForm() {
        return "signup";
    }

    @PostMapping("/checkId")
    @ResponseBody
    public String checkId(String userId) {
        String id = "";
        try {
            id = userService.checkId(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(id);
        return id;
    }

    @PostMapping("/signup")
    public String signUp(UserVO userVO, Model model) {
        userService.insertUser(userVO);
        return "signin";
    }

}
