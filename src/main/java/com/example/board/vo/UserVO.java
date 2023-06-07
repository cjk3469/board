package com.example.board.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
    // 계정 아이디
    private String userId; //PK
    // 계정 패스워드
    private String userPw;
    // 계정 이름
    private String userName;
    // 계정 생성 일자
    private String userCreateDate;
    // 계정 탈퇴 일자
    private String userDeleteDate;
    // 계정 삭제(1 = 기본,2 = 탈퇴)
    private int userStatus;
}
