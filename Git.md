# Git

## 1. Git

#### 실행

- window + r : command line -> cmd

### 환경 설정

```
 git config  --global user.name "name"
 git config --global user.email "email"
```

### 이동 및 폴더 생성

```
cd \ : C드라이브로 이동

mkdir <directory name> : 폴더 생성
cd <directory> : 해당 폴더로 이동
dir : 해당 폴더 안에 어떤 파일이 있는지 탐색
move <file name> <new name> : 파일명 변경
```

---

## 2. Local Repository

### 개요

- 파일의 이력을 관리하기 위한 저장소  
  : directory 형태의 저장소로, [.git] 이라는 폴더 명으로 생성됨

### 파일 상태 관리

```
git status : 상태 확인
git add <file> : to include/update what will be committed
git commit <file> -m "" : history에 변경 사항 저장
```

### 파일의 상태

```
1. untracked files -> nothing added to commit
.git에서 해당 파일의 상태를 추적하지 않음
2. tracked modified file -> not staged for committed
파일을 수정하여 변경 사항이 add되지 않은 상태
3. staged file -> changes to be committed
상태 변화를 지속 관찰할 대상
4. committed unmodified file
현재 상태가 git repository에 저장된 파일
```

### git ignore

```
move .gitignore.txt .gitignore
```

`[.gitignore]` : traking 하지 않을 특정 파일 목록을 관리

git ignore에 추가되면 더이상 **tracked 대상이 되지 않음**

### 파일의 제거와 변경

```
git rm <file> : remove file
git mv <file> <name> : rename
```

commit이 된 상태에서 파일 제거시, 폴더에서는 파일이 지워지지만 directory에서는 파일이 안 지워지는 경우가 발생할 수 있음!

---

## 3. Log

### 개요

- 파일의 이력 관리

### log 조회 방법

```
git log : log 조회
git log —stat : 통계 정보 조회
git log —pretty=oneline : 한 줄에 예쁘게 정보 출력
git log —pretty=format:“%h - %an, %ar :%s ”
git log —pretty=format:“%h - %an, %ar :%s ” --graph

```

### check out

```
git checkout ‘ ’
```

1. 이동하려는 시점의 **log 코드 앞 7글자**를 입력하면 해당 log의 시점으로 이동
2. 이동하려는 **branch 이름**을 입력하면 해당 branch의 시점으로 이동

-> 1번 방식보단 2번 방식을 권함!

- log 코드를 이해하기 어려움 -> 사용에 불편
- 목적을 가지고 수정을 해나가는 것 추천
- test를 위한 새로운 갈래를 만들어서 실행하는 것이 좋음

---

## 4. Branch

### 개요

- 코드 개발의 새로운 갈래길을 만드는 방법

### branch의 조회와 생성

```
git branch : 만들어진 branch 리스트를 보여줌
git branch <name> : 새로운 branch 생성
git merge <branch name> : master branch의 head에서 branch의 내용 추가
gitk : 만들어진 branch들 사이의 관계도를 확인
```

`master` : 제일 처음 committed 완료된 세팅 값. -> main이 됨 (뼈대)

---
