package com.example.board.service;

import com.example.board.repository.BoardRepository;
import com.example.board.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class BoardService {

    private BoardRepository boardRepository;

    @Autowired
    public BoardService(BoardRepository boardRepository){
        this.boardRepository = boardRepository;
    }

    public List<BoardVO> getBoardList(){
        BoardVO boardVO = new BoardVO();

        List<BoardVO> boardList = new ArrayList<>();
        boardList = boardRepository.getBoardList();
        if (boardList == null) {
            return Collections.emptyList(); // 비어있는 리스트 반환
        }
        return boardList;
    }

    public BoardVO getBoardDetail(){
        BoardVO boardVO = new BoardVO();
        boardVO = boardRepository.getBoardDetail();
        System.out.println(boardVO);
        System.out.println(boardVO.getBoardAuthor());


        return boardVO;
    }

    public void insertBoard(BoardVO boardVO) {
        boardRepository.insertBoard(boardVO);
    }


}
