 -- 1번
 SELECT STUDENT_NO, STUDENT_NAME, ENTRANCE_DATE
 FROM TB_STUDENT
 WHERE DEPARTMENT_NO = '002'
 ORDER BY 3;
 
 -- 2번
 SELECT PROFESSOR_NAME, PROFESSOR_SSN
 FROM TB_PROFESSOR
 WHERE LENGTH(PROFESSOR_NAME)<>3;
 

-- 3번 
SELECT PROFESSOR_NAME,  FLOOR(CEIL( SYSDATE -  TO_DATE('19'||SUBSTR(PROFESSOR_SSN,1,6)))/365) 나이
 FROM TB_PROFESSOR
 WHERE SUBSTR(PROFESSOR_SSN,8,1) = '1'
 ORDER BY 2;
 
 
 -- 4번 
 SELECT SUBSTR(PROFESSOR_NAME,2,2) 
 FROM TB_PROFESSOR;

-- 5번 
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN, ENTRANCE_DATE
FROM TB_STUDENT;

-- 6번
SELECT TO_CHAR(TO_DATE('20201225','YYYYMMDD'),'DAY')  FROM DUAL;

-- 7번
SELECT TO_DATE('99/10/11','YY/MM/DD') FROM DUAL;     -- 1999년 10월 11일
SELECT TO_DATE('49/10/11','YY/MM/DD') FROM DUAL;     -- 1949년 10월 11일
SELECT TO_DATE('99/10/11','RR/MM/DD') FROM DUAL;     -- 1999년 10월 11일
SELECT TO_DATE('4/10/11','RR/MM/DD') FROM DUAL;      -- 1949년 10월 11일

-- 8번
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO,1,1) <> 'A' ;

-- 9번
SELECT ROUND(AVG(POINT),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10번
SELECT DEPARTMENT_NO 학과번호, COUNT(*) 학생수
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;


-- 11번 
 SELECT COUNT(*)
 FROM TB_STUDENT
 GROUP BY COACH_PROFESSOR_NO 
 HAVING COUNT(COACH_PROFESSOR_NO) = 0;

-- 12번
SELECT SUBSTR(TERM_NO,1,4) 년도,  ROUND(AVG(NVL(POINT,0)),1) "년도 별 평점"
FROM TB_GRADE 
GROUP BY SUBSTR(TERM_NO,1,4),STUDENT_NO 
HAVING STUDENT_NO = 'A112113' 
ORDER BY 1;

-- 13번
SELECT DEPARTMENT_NO, COUNT(*)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO,ABSENCE_YN
HAVING ABSENCE_YN = 'Y'
ORDER BY 1;
-- 14번


-- 15번









