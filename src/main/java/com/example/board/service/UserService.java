package com.example.board.service;


import com.example.board.repository.UserRepository;
import com.example.board.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    //로그인
    public UserVO getSelectUser(UserVO userVO){
        return userRepository.loginUser(userVO);
    };

    //회원가입
    public void insertUser(UserVO userVO) {
        userRepository.insertUser(userVO);
    }

    //아이디 중복확인
    public String checkId(String userId){
        return userRepository.checkId(userId);
    }

    public String dbnow(){
        return userRepository.dbnow();
    }
}
