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

    @RequestMapping(value = "/signin",method = RequestMethod.GET)
    public String signInForm() {
        return "signin";
    }

    @RequestMapping(value = "/signin",method = RequestMethod.POST)
    public String signIn(UserVO userVO, HttpSession session, Model model) {
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

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping (value = "/signup",method=RequestMethod.GET)
    public String signUpForm() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signUp(UserVO userVO, Model model) {
        userService.insertUser(userVO);
        return "signin";
    }

    @RequestMapping(value = "/checkId", method = RequestMethod.POST)
    @ResponseBody
    public int checkId(String userId) {
        int result = 0;
        System.out.println(userId);
        try {
            result = userService.checkId(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}
