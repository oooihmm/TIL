# Nginx

## 1. Nginx의 작동 원리

Nginx는 비동기 이벤트 기반 구조를 갖춘 웹 서버로서, 아래와 같은 방식으로 작동한다

-   요청 수신: 클라이언트로부터의 HTTP 요청을 받는다.
-   이벤트 처리: 요청을 비동기적으로 처리하기 위해 이벤트 처리 메커니즘을 사용한다. 이는 많은 연결을 동시에 처리하는 데 유리한 구조이다.
-   요청 처리: 요청을 처리하고, 정적 파일인 경우 해당 파일을 반환하거나, 동적 컨텐츠를 처리하기 위해 백엔드 서버로 프록시를 전달한다.
-   응답 전송: 최종적으로 클라이언트로 응답을 전송한다.

## 2. Nginx를 사용하는 이유

Nginx를 사용하는 이유는 다음과 같다

-   높은 성능: Nginx는 비동기적 구조로 설계되어 많은 연결과 요청을 효율적으로 처리하며 빠른 속도를 제공한다.
-   낮은 자원 사용: 경량이며 메모리 사용량이 적어서 하드웨어 리소스를 효율적으로 활용한다.
-   리버스 프록시 및 로드 밸런싱: 여러 백엔드 서버에 대한 로드 밸런싱 및 리버스 프록시 설정을 통해 부하 분산과 고가용성을 달성할 수 있다.
-   정적 파일 서버: 정적 파일을 빠르게 서빙하여 웹 서버의 성능을 향상시킨다.
-   SSL 종단점: SSL 인증서를 사용하여 암호화 통신을 지원한다.

### \* 비동기적 처리

비동기적 처리는 프로그램이 작업을 순차적으로 처리하는 것이 아니라, 작업이 완료될 때까지 기다리지 않고 다른 작업을 동시에 실행하는 방식을 말한다. 이는 특히 I/O 작업(입출력 작업)과 네트워크 작업에서 유용하며, 오랜 시간이 걸리는 작업으로 인해 프로그램이 블로킹(Blocking)되는 상황을 피할 수 있다.

### \* 비동기적 작동 방식

-   요청 발생: 비동기 작업을 시작하려면 우선 작업을 요청한다. 이 요청은 일반적으로 콜백 함수, 프로미스, 또는 async/await과 같은 비동기적인 메커니즘을 사용하여 처리된다.
-   작업 실행: 요청된 작업은 백그라운드에서 별도의 스레드나 프로세스, 또는 이벤트 루프(Event Loop)와 같은 메커니즘을 통해 실행된다. 이렇게 하면 메인 스레드는 다른 작업을 수행할 수 있다.
-   블로킹이 없음: 비동기 작업이 백그라운드에서 실행되는 동안 프로그램은 다른 작업을 수행하며, 비동기 작업이 완료될 때까지 기다릴 필요가 없다. 따라서 블로킹이 없이 다른 작업을 계속할 수 있다.
-   완료 처리: 비동기 작업이 완료되면 해당 작업에 대한 콜백 함수가 호출되거나, 프로미스가 resolve되거나, async/await과 같은 구문을 사용하여 결과를 처리할 수 있다.

## 3. Nginx 설정 파일

-   전역 블록 (http 블록): http 블록은 Nginx 서버의 전역 설정을 정의한다. 이 블록 내에는 server 블록과 upstream 블록을 포함할 수 있다.
    </br>예를 들어, server 블록은 단일 웹 서버를 정의하고, upstream 블록은 로드 밸런싱을 위해 여러 백엔드 서버를 정의할 때 사용된다.
-   서버 블록 (server 블록): server 블록은 개별 웹 서버 또는 가상 호스트(Virtual Host)의 설정을 정의한다.
    </br>각각의 server 블록은 서로 다른 도메인 또는 IP 주소에 대한 요청을 처리할 수 있다.
-   위치 블록 (location 블록): location 블록은 특정 URL 경로에 대한 설정을 정의한다.
    </br>이를 통해 URI 경로에 따라 특정 작업을 수행할 수 있다. 예를 들어, 정적 파일 요청은 서버의 파일 시스템에서 처리하고,
    </br>동적 컨텐츠 요청은 백엔드 서버로 프록시를 전달하도록 설정할 수 있다.
-   이벤트 블록 (events 블록): events 블록은 Nginx의 이벤트 설정을 정의한다.
    </br>이 블록 내에서는 워커 프로세스의 수, 연결 시간 초과 등과 같은 이벤트 관련 설정을 할 수 있다.
-   워커 블록 (worker 블록): worker 블록은 워커 프로세스의 설정을 정의한다. 워커 프로세스는 실제로 요청을 처리하는 Nginx 프로세스를 말한다.
    </br>이 블록 내에서는 워커 프로세스의 개수, 연결 제한 등을 설정할 수 있다.

    ```
    # 전역 블록
    http {
        # 이벤트 블록
        events {
            worker_connections 1024;
        }

        # 서버 블록
        server {
            listen 80;
            server_name example.com;

            # 위치 블록
            location / {
                root /var/www/html;
                index index.html;
            }
        }
    }
    ```

## 4. Nginx 사용 방법

### React로 작업한 프로젝트의 경우

-   서버에 Nginx 설치: 먼저 서버에 Nginx를 설치한다.
    -   Ubuntu
    ```
    sudo apt update
    sudo apt install nginx
    ```
    -   maxOS
    ```
    brew update
    brew install nginx
    ```
-   리액트 앱 빌드: 리액트 앱을 최적화된 정적 파일로 빌드한다.
    ```
    npm run build
    ```
-   Nginx 설정: Nginx 설정 파일을 열어 리액트 앱의 위치와 라우팅 규칙을 설정한다.
    </br> 일반적으로 /etc/nginx/ 또는 /usr/local/nginx/와 같은 디렉토리에 저장되어 있다.

    ```
    server {
        listen 80;
        server_name yourdomain.com;

        location / {
            root /path/to/your/react/app;
            try_files $uri /index.html;
        }
    }
    ```

-   Nginx 재시작 : Nginx를 재시작하여 변경 사항이 적용되도록 한다.
