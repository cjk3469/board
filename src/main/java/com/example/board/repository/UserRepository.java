package com.example.board.repository;

import com.example.board.vo.BoardVO;
import com.example.board.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserRepository {
    UserVO getSelectUser(UserVO userVO);
    void insertUser(UserVO userVO);
}
