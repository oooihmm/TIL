# MySQL

`S`tructured `Q`uery `L`anguage

databace server > database(schema) > table > row/column

### 서버 접속
```command
-u<username> -p
```

### 데이터베이스 생성
```SQL
CREATE DATABASE <schema name>;
SHOW DATABASES;
USE <schema name>;
```

### 테이블 생성
```SQL
CREATE TABLE <table name>(
  <column1> datatype(length) /*NOT NULL*/ /*AUTO-INCREMENT*/,
  <column2> datatype(length) /*NOT NULL*/ /*AUTO-INCREMENT*/,
  ...
  PRIMARY KEY(<column name>)
);

SHOW TABLES;
DESC <table name>;
```

### 행 추가
```SQL
INSERT INTO <table name> (column name, column name, ...) VALUES('value', 'value', ...);

SELECT * FROM <table name>;

SELECT <colume name>,<colume name>,...  FROM <table name>;
```

### 값 수정
```SQL
UPDATE <table name> SET <colume name 1>='value 1' WHERE <colume name 2>='value 2'

--- <colume name 2> 열의 'value 2' 값을 가진 행에서 <colume name 1>의 값을 'value 1'으로 수정 
```

### 값 삭제
```SQL
DELETE FROM <table name> WHERE <colume name>='value';
```

### 관계형 데이터베이스
``` SQL
FROM <table name 1> LEFT JOIN <table name 2> author ON <table name 1>.<colume name 1> = <table name 2>.<colume name 2>;
```
