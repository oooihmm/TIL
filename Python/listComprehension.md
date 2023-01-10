# List Conprehension

리스트 컴프리헨션
: 리스트 안에 for문을 포함

```python
a = [1, 2, 3, 4]
result = []
for num in a:
    result.append(num*3)
print(result)
```

result = `[3, 6, 9, 12]`

이를 리스트 컨프리헨션으로 작성하면

```python
a = [1, 2, 3, 4]
result = [num*3 for num in a]
print(result)
```

result = `[3, 6, 9, 12]`

으로 줄일 수있다.
만약 result에 for문의 결과값 중 짝수만 담고 싶다면

```python
a = [1, 2, 3, 4]
result = [num*3 for num in a if num%2==0]
print(result)
```

result = `[6, 12]`

---

### 정리

리스트 컨프리헨션 : for문의 결과값을 리스트에 받으려고 할 때 사용

```python
[표현식 for 반복할 변수 in 반복문을 돌 구간 if 조건문]
```
