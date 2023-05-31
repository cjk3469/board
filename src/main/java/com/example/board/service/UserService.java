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

    public UserVO getSelectUser(UserVO userVO){
        return userRepository.getSelectUser(userVO);
    };

    public void insertUser(UserVO userVO) {
        userRepository.insertUser(userVO);
    }
}
