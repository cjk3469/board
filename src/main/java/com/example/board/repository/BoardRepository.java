package com.example.board.repository;

import com.example.board.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardRepository {

    void insertBoard(BoardVO boardVO);

    List<BoardVO> getBoardList();


}
