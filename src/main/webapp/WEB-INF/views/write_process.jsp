<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.board.vo.BoardVO" %>
<%@ page import="com.example.board.repository.BoardRepository" %>
<%
    // 로그인된 아이디 세션 확인
    String loggedInId = (String) session.getAttribute("loggedInId");

    // 제목과 내용 가져오기
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // 게시물 객체 생성
    BoardVO boardVO = new BoardVO();
    boardVO.setTitle(title);
    boardVO.setContent(content);
    boardVO.setId(loggedInId); // 작성자는 로그인된 아이디로 설정

    // 게시물 등록하기
    BoardRepository boardRepository = new BoardRepository(); // BoardMapper 객체 생성 (이 부분은 실제로는 프레임워크 또는 라이브러리에서 제공하는 방식으로 구현되어야 합니다.)
    boardRepository.insertBoard(board); // 게시물 등록 메서드 호출

    // 등록 완료 후 게시판으로 이동
    response.sendRedirect("board.jsp");
%>
