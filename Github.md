# Github

## 1. Github

Git의 본래 목적

1. 형상 관리 도구
2. 코드 공유 도구 -> `Remote Repository`가 필요!

가장 대중적인 remote repository **Github**

---

## 2. Local -> Remote

1. Github에서 create a new repository
2. command line에 다음 코드 입력

```
echo "# <repository name>" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin <repository URL>
git push -u origin master
```

`git remote add origin <repository URL>` : 해당 URL을 가지는 origin 이라는 repository를 remote에 add

`git push -u origin master` : origin 이라는 repository에 master라는 branch를 업로드

### remote 명령어

```
git remote : remote 저장소 이름 확인
git remote -v : remote 저장소의 이름을 주소와 함께 출력
git remote add <name> <repository URL> : remote에 repository 추가
git remote rm <name> : 해당 repository 삭제
```

### git remote 저장소에 commit 올리기

```
git add - git commit - git push
```

---

## 3. Remote -> Local

### remote 명령어

```
git clonde <repository URL> : 전체를 다 가져옴
git pull <repository name> <branch name> : 같은 branch일 때 최신 버전을 합침
git fetch <repository name> <branch name> : 변경 내용만 가져오고 안 합침
git merge <repository name> <branch name>
```

---

## 4. Fork & Pull Request

### 개요

- Github를 이용한 코드 공유

### Fork & Pull Request

```
Fork : 다른 사람의 Github Repository를 내 걸로 가져옴
Pull Request : 다른 사람의 Github Repository를 가져와 수정한 후, 원래 주인에게 이를 반영해줄 것을 요청
```

### Fork & Pull Request 과정

1. 원하는 gitgub repository에서 fork
2. local 영역에 clone
3. 수정(add-commit)
4. push
5. 원하는 github repository에서 pull request
6. 원래 주인이 pull/fetch/merge

### Permisson Setting

`Permission Setting` : 작업 권한을 공동 작업자에게 넘김

setting -> collaborators & teams -> collaborators에 공동 작업자 지정

github -> `F11 단축키` : 각 코드의 영역 확인 가능
