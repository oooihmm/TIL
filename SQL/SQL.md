# SQL


Structured Query Language : 데이터베이스 표준 질의어 </br>
CRUD의 기본 기능 및 DBMS 제어 제공
```SQL
CREATE TABLE
SELECT
INSERT
UPDATE
DELETE
...
```
---
## 1. CREATE
```SQL
SHOW databases; -- 데이타베이스 리스트를 표시
CREATE DATABASE <DB name>; -- 데이터베이스 생성
USE <DB name>; -- 해당 데이터베이스를 사용
show tables; -- 테이블 리스트 출력
```
---
## 2. SELECT
```SQL
SELECT <columns>
    FROM <table>
    WHERE <조건문 for rows & join>
    GROUP BY <list of grouping columns>
    HAVING <조건문 for groups>
    ORDER BY <정렬 방법>
```

- `*` (Asterosk)</br>
일반적으로 CS에서 전체를 의미함 </br>
`SELECT * FROM <table>` : 해당 테이블의 열 전체를 출력

### 2-1 WHERE
- Operator </br>
조건을 나타낼 때 쓰는 연산자 </br>
`=`, `!=`, `>`, `<`, `<=`, `>=`등이 있다.
```SQL
SELECT *
    FROM <table>
    WHERE column > 30;
```

- Like - Pattern </br>
문자열의 패턴을 검색할 때 사용 </br>
```SQL
SELECT *
    FROM <table>
    WHERE <column>
    LIKE <topic>
-- topic이라는 문자를 그대로 가진 row를 출력
```

#### 패턴에 사용되는 연산자
- `%` : 0을 포함하여 임의의 수의 문자와 일치할 때 사용

    - `%<topic>%` : 앞뒤의 글자와 관계 없이 해당 topic이 포함된 row를 출력
    
    - `<topic>%` : 앞의 글자와 관계 없이 topic으로 끝나는 row를 출력

    - `%<topic>` : 뒤의 글자와 관계 없이 topic으로 시작하는 row를 출력

- `_` : 문자의 앞이나 뒤에 있어야 할 글자의 수를 나타냄

    - `__<topic>__` : topic의 앞에 두 글자, 뒤에 두 글자가 오는 row를 출력

```SQL
SELECT *
    FROM <table>
    WHERE <column>
    like "__L%" LIMIT 5;
-- table에서 column의 값이 맨 앞 두 글자 뒤에 L로 시작하는 데이터들을 5개 까지만 출력
```

### 2-2 GROUP BY
특정한 Filed값을 기준으로 데이터를 묶음
```SQL
SELECT <column>, SUM(<column>)
    FROM <table>
    GROUP BY <column>;
-- GROUP BY에서 지정한 열값을 기준으로 데이터를 묶어서 연산을 진행, 출력
```

### 2-3 HAVING
GROUP BY 후의 조건절
-> GROUP BY 결과에 대하여 출력 조건을 부과할 때 사용함
```SQL
SELECT <column>, SUM(<column>)
    FROM <table>
    GROUP BY <Field1>
    HAVING <Fiedl2> = 300;
```

### 2-4 ORDER BY
- `ORDER BY <column> ASC` : 특정 열에 대하여 오름차순으로 정렬

- `ORDER BY <column> DESC` : 특정 열에 대하여 내림차순으로 정렬

### 2-5 SELECT문을 이용한 연산 함수
ㅈㄴ만아요 찾아보세요 💞

---

## 3. JOIN과 관계형 데이터베이스

### 3-1 관계형 데이터베이스
테이블 간의 관계를 이용해서 정보를 표현. </br>
테이블들이 외래키 (Foreign Key)를 이용하여 연결됨

- Primary Key : 한 테이블에 들어있는 instance를 구분하는 key
- Foreign Key : 테이블간의 연결 정보를 표현하기 위해 사용하는 Key, 다른 테이블의 Primary Key

### 3-2 JOIN
테이블간의 연결 관계를 이용해서 두 가지 이상의 테이블을 하나로 합쳐서 표현하는 기법

- `INNER JOIN` : 교집합, 두 테이블이 공통적으로 가지는 값만 출력
- `LEFT JOIN` : 왼쪽 테이블이 가지는 값만 출력 -> 오른쪽 테이블의 값은 왼쪽 테이블과의 교집합만 출력
- `RIGHT JOIN` : 오른쪽 테이블이 가지는 값만 출력 -> 왼쪽 테이블의 값은 오른쪽 테이블과의 교집합만 출력
- `FULL JOIN` : 합집합, 두 테이블의 모든 값을 출력

`Multiple Join` : 두 개 이상의 table을 한 테이블에 조인
- join할 테이블을 list up
- column간에 join을 실행

### 3-3 INNER JOIN
```SQL
SELECT <TABLE A>.<column> <TABLE B>.<column>
    FROM <TABLE A> -- 기준이 되는 테이블
    INNER JOIN <TABLE B> -- 합쳐질 테이블
    ON <TABLE A>.<KEY column> = <TABLE B>.<Foregin KEY column> -- 두 테이블이 합쳐지는 기준 column
```
-> INNER JOIN을 WHERE문을 이용해서 표현한다면 다음과 같다.
```SQL
SELECT <TABLE A>.<column>, <TABLE B>.<column>
    FROM <TABLE A>, <TABLE B> -- 기준이 되는 테이블과 합쳐질 테이블
    WHERE <TABLE A>.<KEY column> = <TABLE B>.<Foregin KEY column> -- 두 테이블이 합쳐지는 기준 column

```

### 3-4 LEFT JOIN
```SQL
SELECT <colums>
    FROM <TABLE A>
    LEFT JOIN <TABLE B>
    ON <TABLE A>.<column> = <TABLE B>.<column>
```
- 왼쪽 테이블 = 기준이 되는 테이블 `<TABLE A>` : 모두 출력
- 오른쪽 테이블 `<TABLE B>` : 왼쪽에 key가 존재할 때만 출력

### 3-5 FULL JOIN
```SQL 
SELECT <colums>
    FROM <TABLE A>
    FULL OUTER JOIN <TABLE B>
    ON <TABLE A>.<column> = <TABLE B>.<column>
```
- 양쪽 테이블 모두를 기준으로 출력
- 양쪽 테이블의 모든 값을 출력하면서 빈 칸을 찾음
=> MYSQL은 FULL OUTER JOIN을 제공하지 않으므로 다음과 같이 표현.
```SQL
SELECT <columns>
    FROM <TABLE A>
    LEFT JOIN <TABLE B>
    ON <TABLE A>.<column> = <TABLE B>.<column>

UNION -- 위의 쿼리문과 아래의 쿼리문의 결과를 합침. (단, 중복되는 결과는 하나만 출력)

SELECT <columns>
    FROM <TABLE A>
    RIGHT JOIN <TABLE B>
    ON <TABLE A>.<column> = <TABLE B>.<column>
```


