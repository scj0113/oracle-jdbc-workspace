DROP TABLE VIDEO_LIKE;
DROP TABLE COMMENT_LIKE;
DROP TABLE VIDEO_COMMENT;
DROP TABLE SUBSCRIBE;
DROP TABLE VIDEO;
DROP TABLE CHANNEL;
DROP TABLE CATEGORY;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_CHANNEL;
DROP SEQUENCE SEQ_COMMENT_LIKE;
DROP SEQUENCE SEQ_SUBSCRIBE;
DROP SEQUENCE SEQ_VIDEO;
DROP SEQUENCE SEQ_VIDEO_COMMENT;
DROP SEQUENCE SEQ_VIDEO_LIKE;

CREATE TABLE VIDEO(
    VIDEO_CODE NUMBER,
    VIDEO_TITLE VARCHAR2(100) NOT NULL,
    VIDEO_DESC VARCHAR2(200),
    VIDEO_DATE DATE DEFAULT SYSDATE,
    VIDEO_VIEWS NUMBER DEFAULT 0,
    VIDEO_URL VARCHAR2(300) NOT NULL,
    VIDEO_PHOTO VARCHAR2(300) NOT NULL,
    CATEGORY_CODE NUMBER,
    CHANNEL_CODE NUMBER,
    MEMBER_ID VARCHAR2(200)
);

CREATE TABLE CHANNEL(
    CHANNEL_CODE NUMBER,
    CHANNEL_NAME VARCHAR2(100) NOT NULL,
    CHANNEL_DESC VARCHAR2(200),
    CHANNEL_DATE DATE DEFAULT SYSDATE,
    MEMBER_ID VARCHAR2(200)
);

CREATE TABLE MEMBER(
    ID VARCHAR2(200),
    PASSWORD VARCHAR2(200) NOT NULL,
    NAME VARCHAR2(200) NOT NULL,
    AUTHORITY VARCHAR2(200) DEFAULT 'ROLE_USER'
);

CREATE TABLE VIDEO_LIKE(
    V_LIKE_CODE NUMBER,
    V_LIKE_DATE DATE DEFAULT SYSDATE,
    VIDEO_CODE NUMBER,
    MEMBER_ID VARCHAR2(200)
);

CREATE TABLE VIDEO_COMMENT(
    COMMENT_CODE NUMBER,
    COMMENT_DESC VARCHAR2(300) NOT NULL,
    COMMENT_DATE DATE DEFAULT SYSDATE,
    COMMENT_PARENT NUMBER,
    VIDEO_CODE NUMBER,
    MEMBER_ID VARCHAR2(200)
);

CREATE TABLE SUBSCRIBE(
    SUBS_CODE NUMBER,
    SUBS_DATE DATE DEFAULT SYSDATE,
    MEMBER_ID VARCHAR2(200),
    CHANNEL_CODE NUMBER
);

CREATE TABLE COMMENT_LIKE(
    COMM_LIKE_CODE NUMBER,
    COMM_LIKE_DATE DATE DEFAULT SYSDATE,
    COMMENT_CODE NUMBER,
    MEMBER_ID VARCHAR2(200)
);

CREATE TABLE CATEGORY(
    CATEGORY_CODE NUMBER,
    CATEGORY_NAME VARCHAR2(50)
);

ALTER TABLE CATEGORY ADD CONSTRAINT CATEGORY_CODE_PK PRIMARY KEY(CATEGORY_CODE);
ALTER TABLE CHANNEL ADD CONSTRAINT CHANNEL_CODE_PK PRIMARY KEY(CHANNEL_CODE);
ALTER TABLE COMMENT_LIKE ADD CONSTRAINT COMMENT_LIKE_CODE_PK PRIMARY KEY(COMM_LIKE_CODE);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_ID_PK PRIMARY KEY(MEMBER_ID);
ALTER TABLE SUBSCRIBE ADD CONSTRAINT SUBS_CODE_PK PRIMARY KEY(SUBS_CODE);
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_CODE_PK PRIMARY KEY(VIDEO_CODE);
ALTER TABLE VIDEO_COMMENT ADD CONSTRAINT VIDEO_COMMENT_CODE_PK PRIMARY KEY(COMMENT_CODE);
ALTER TABLE VIDEO_LIKE ADD CONSTRAINT V_LIKE_CODE_PK PRIMARY KEY(V_LIKE_CODE);

ALTER TABLE CHANNEL ADD CONSTRAINT CHANNEL_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER;
ALTER TABLE COMMENT_LIKE ADD CONSTRAINT COMMENT_LIKE_COMMENT_CODE_FK FOREIGN KEY(COMMENT_CODE) REFERENCES VIDEO_COMMENT;
ALTER TABLE COMMENT_LIKE ADD CONSTRAINT COMMENT_LIKE_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER;
ALTER TABLE SUBSCRIBE ADD CONSTRAINT SUBSCRIBE_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER;
ALTER TABLE SUBSCRIBE ADD CONSTRAINT SUBSCRIBE_CHANNEL_CODE_FK FOREIGN KEY(CHANNEL_CODE) REFERENCES CHANNEL;
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_CATEGORY_CODE_FK FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY;
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_CHANNEL_CODE_FK FOREIGN KEY(CHANNEL_CODE) REFERENCES CHANNEL;
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER;
ALTER TABLE VIDEO_COMMENT ADD CONSTRAINT VIDEO_COMMENT_VIDEO_CODE_FK FOREIGN KEY(VIDEO_CODE) REFERENCES VIDEO;
ALTER TABLE VIDEO_COMMENT ADD CONSTRAINT VIDEO_COMMENT_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER;
ALTER TABLE VIDEO_LIKE ADD CONSTRAINT VIDEO_LIKE_VIDEO_CODE_FK FOREIGN KEY(VIDEO_CODE) REFERENCES VIDEO;
ALTER TABLE VIDEO_LIKE ADD CONSTRAINT VIDEO_LIKE_MEMBER_ID_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER;

CREATE SEQUENCE SEQ_CATEGORY;
CREATE SEQUENCE SEQ_CHANNEL;
CREATE SEQUENCE SEQ_COMMENT_LIKE;
CREATE SEQUENCE SEQ_SUBSCRIBE;
CREATE SEQUENCE SEQ_VIDEO;
CREATE SEQUENCE SEQ_VIDEO_COMMENT;
CREATE SEQUENCE SEQ_VIDEO_LIKE;

INSERT INTO CATEGORY(CATEGORY_CODE, CATEGORY_NAME) VALUES(SEQ_CATEGORY.NEXTVAL, '쇼핑');
INSERT INTO CATEGORY(CATEGORY_CODE, CATEGORY_NAME) VALUES(SEQ_CATEGORY.NEXTVAL, '음악');
INSERT INTO CATEGORY(CATEGORY_CODE, CATEGORY_NAME) VALUES(SEQ_CATEGORY.NEXTVAL, '영화');
INSERT INTO CATEGORY(CATEGORY_CODE, CATEGORY_NAME) VALUES(SEQ_CATEGORY.NEXTVAL, '게임');
INSERT INTO CATEGORY(CATEGORY_CODE, CATEGORY_NAME) VALUES(SEQ_CATEGORY.NEXTVAL, '스포츠');
INSERT INTO CATEGORY(CATEGORY_CODE, CATEGORY_NAME) VALUES(SEQ_CATEGORY.NEXTVAL, '학습');

COMMIT;

SELECT * FROM CATEGORY;

-- 테스트와 관련된 쿼리문들!
-- 회원가입(register)
INSERT INTO MEMBER(MEMBER_ID, MEMBER_PASSWORD, MEMBER_NICKNAME) VALUES('user1', '1234', 'user');
COMMIT;
SELECT * FROM MEMBER;

-- 로그인(login)
SELECT * FROM MEMBER WHERE MEMBER_ID='user1' AND MEMBER_PASSWORD='1234';

-- 채널 추가(addChannel)
INSERT INTO CHANNEL(CHANNEL_CODE, CHANNEL_NAME, MEMBER_ID) VALUES(SEQ_CHANNEL.NEXTVAL, 'Blue rain', 'user1');

-- 채널 수정(updateChannel)
UPDATE CHANNEL SET CHANNEL_NAME='주황색 ORANGE MUSIC' WHERE CHANNEL_CODE=1;

-- 채널 삭제(deleteChannel)
DELETE FROM CHANNEL WHERE CHANNEL_CODE=1;

-- 내 채널 보기(myChannel)
SELECT CHANNEL_CODE, CHANNEL_NAME, MEMBER_NICKNAME 
FROM CHANNEL JOIN MEMBER USING(MEMBER_ID) 
WHERE MEMBER_ID='user1';

COMMIT;
SELECT * FROM CHANNEL;

-- 비디오 추가
INSERT INTO VIDEO(VIDEO_CODE, VIDEO_TITLE, VIDEO_URL, VIDEO_PHOTO, CATEGORY_CODE, CHANNEL_CODE, MEMBER_ID)
VALUES(SEQ_VIDEO.NEXTVAL, '250만원 받던 직장 그만두고 귀어해서 하루 500만원 버는 39살', 'URL01', 'PHOTO01', 1, 3, 'user1');

-- 비디오 수정
UPDATE VIDEO SET VIDEO_TITLE='강남에서 만화카페로 매출 8천 찍고 2호점까지 차린 60대 부부' WHERE VIDEO_CODE=1;

-- 비디오 삭제
DELETE FROM VIDEO WHERE VIDEO_CODE=1;

COMMIT;

-- 비디오 전체 목록보기
SELECT * FROM VIDEO;

-- 채널별 목록보기
SELECT * FROM VIDEO WHERE CHANNEL_CODE=3;

-- 비디오 1개 보기
SELECT * FROM VIDEO WHERE VIDEO_CODE=1;

-- 카테고리 보기
SELECT * FROM CATEGORY;






