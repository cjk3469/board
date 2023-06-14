package com.example.board.controller;

import com.example.board.repository.BoardRepository;
import com.example.board.service.BoardService;
import com.example.board.vo.BoardVO;
import com.example.board.vo.UserVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@Controller
public class BoardController {

    private final BoardService boardService;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @RequestMapping(value = "/boardwrite",method = RequestMethod.GET)
    public String boardWriteForm(Model model) {

        return "boardwrite";
    }

    @GetMapping("/boarddetail")
    public String boardDetail(@RequestParam(value="boardSeq")int boardSeq,Model model){
        BoardVO boardVO = boardService.getBoardDetail();
        System.out.println(boardSeq);
        model.addAttribute("boardVO", boardVO);
        return "boarddetail";
    }


    @RequestMapping (value = "/boardwrite",method = RequestMethod.POST)
    public String boardWrite(HttpSession session, HttpServletRequest request, @RequestParam("title") String title, @RequestParam("content") String content) {

        // 세션에서 로그인된 사용자 정보 가져오기
        session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("member");
        String id = userVO.getUserId();

        // BoardVO 객체 생성 및 데이터 설정
        if(id != null || !id.isEmpty()){
            BoardVO boardVO = new BoardVO();
            boardVO.setBoardAuthor(id);
            boardVO.setBoardTitle(title);
            boardVO.setBoardContent(content);
            // 게시물 등록
            try {
                boardService.insertBoard(boardVO);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "redirect:/boardlist";
        }else{
            return "redirect:/signin";
        }

    }

    @GetMapping("/boardlist")
    public String boardlist(Model model) {

        // 게시물 리스트 조회
        List<BoardVO> boardList = new ArrayList<>();
        try {
            boardList = boardService.getBoardList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (boardList != null && !boardList.isEmpty()) {

            // 모델에 게시물 리스트 추가
            model.addAttribute("boardList", boardList);

        }
        return "boardlist";
    }
}
