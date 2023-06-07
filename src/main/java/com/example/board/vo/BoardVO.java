package com.example.board.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
    // 게시물 번호
    private int boardSeq; //pk
    // 게시물 작성자
    private String boardAuthor;
    // 게시물 제목
    private String boardTitle;
    // 게시물 내용
    private String boardContent;
    // 게시물 작성 일자
    private String boardCreateDate;
    // 게시물 수정 일자
    private String boardModifyDate;
    // 게시물 상태(1 = 기본, 2 = 수정 , 3 = 삭제)
    private int boardStatus;
}
