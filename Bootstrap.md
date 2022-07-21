# [Bootstrap](https://getbootstrap.com/)

<h3>-> 반응형 웹사이트 제작<h3>

Place the `<link>` tag in the `<head>` for our CSS, and the `<script>` tag for our JavaScript bundle (including Popper for positioning dropdowns, poppers, and tooltips) before the closing </body>.

| Description | URL                                                                          | 위치         |
| ----------- | ---------------------------------------------------------------------------- | ------------ |
| CSS         | https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css      | `</head>` 위 |
| JS          | https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js | `</body>`위  |

> `<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">`

> `<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>`

---

## Grid

`<div class="container">`
하나의 컨텐츠 -> 하나의 컨테이너로 묶는 것이 좋음

여백 제거 : container-fluid

container안에 `row`와 `col` class를 사용하여 행과 열 설정 가능
