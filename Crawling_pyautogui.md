# Python crawling basic - Pyautogui

```python
pip install pyautogui

python
import pyautogui
```

---

## 1. 마우스, 키보드 자동화

- 마우스 제어  
  `pyautogui.position()`  
  : 현재 좌표 출력

  `pyautogui.moveTo(x,y,time)`  
  : 화면상의 절대적인 좌표값으로 이동

  `pyautogui.moveRel(x,y,time)`  
  : 현재 위치에서 주어진 좌표값만큼 상대적으로 이동

  `pyautogui.click(clicks=number, interval=time)`  
  : 마우스 클릭

  `pyautogui.doubleClick()`  
  : 마우스 더블클릭

- 키보드 제어
  `pyautogui.typewrite('sentence')`  
  : 내용 입력

  `pyautogui.typewrite(['key'])`  
  : 특정 키를 누른 결과 입력

- time module

  ```python
  import time
  ```

  `time.sleep(time)`  
  : 앞의 명령 실행 후, 주어진 시간만큼 쉬고 다음 명령 실행

---

## 2. 이미지 좌표 알아내기

```python
pip install opencv-python

i = pyautogui.locateOnScreen('file') #좌표 출력
j = pyautogui.center(i) # 중심 좌표 받음
pyautogui.click(j)
```

### 센터값 한번에 구하기

```python
i = pyautogui.locateCenterOnScreen('file')
#중심 좌표 한 번에 받음
pyautogui.click(i)
```

### 스크린샷

```python
pyautogui.screenshot('file', region=(시작x, 시작y, 가로, 세로))

# 이미지가 시작하는 점의 좌표를 받아 지정한 크기만큼 잘라서 저장
```
