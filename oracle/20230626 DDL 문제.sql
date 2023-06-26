  -- 01. 계열 정보를 저장할 카테고리 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
  
  
  CREATE TABLE TB_CATEGORY(
  
      CATEGORY_NAME VARCHAR2(10),
      USE_YN  CHAR(1) CHECK  (USE_YN IN ('Y'))
  );

  
  -- 02. 과목 구분을 저장할 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
  
  CREATE TABLE TB_CLASS_TYPE(
  
     CLASS_TYPE_NO VARCHAR2(5) CONSTRAINT CLASSTYPENO_PK PRIMARY KEY,
     CLASS_TYPE_NAME VARCHAR2(10)
  )