# how to distribute React project

with EC2, PM2, Nginx, RDS

## 1. EC2 인스턴스 생성

-   AWS 콘솔에서 EC2 서비스로 이동하여 "인스턴스 시작" 버튼을 클릭합니다.
-   AMI(Amazon Machine Image)를 선택합니다. 일반적으로 Amazon Linux 2 AMI를 선택하는 것이 좋습니다.
-   인스턴스 유형을 선택하고, 인스턴스 세부 정보를 구성합니다. (인스턴스 유형, 인스턴스 개수, 네트워크, 보안 그룹 등)
-   키페어를 생성하거나 기존 키페어를 선택하여 인스턴스에 접속할 수 있도록 설정합니다.
-   인스턴스 검토 및 시작 후, 인스턴스 시작 버튼을 클릭하여 인스턴스를 실행합니다.

## 2. EC2 인스턴스에 SSH로 접속

-   생성한 EC2 인스턴스의 퍼블릭 IP 주소를 확인합니다.
-   SSH 클라이언트를 사용하여 인스턴스에 접속합니다.
    ```
    ssh -i /path/to/your/key.pem ec2-user@your_ec2_public_ip
    ```
-   `git clone`을 통해 작업한 코드를 EC2 인스턴스로 전송

## 3. Nginx 설치 및 구성:

-   Nginx 설치
    ```
    sudo yum update
    sudo yum install nginx
    ```
-   Nginx 구성 파일 추가

    -   bash

    ```b
    sudo nano /etc/nginx/nginx.conf
    ```

    -   config

    ```
    server {
        listen 80;
        server_name your_domain.com;

        location / {
            root /path/to/your/react/app/build;
            index index.html;
            try_files $uri /index.html;
        }
    }
    ```

-   Nginx를 재시작하여 설정을 적용
    ```
    sudo service nginx restart
    ```

## 4. RDS 인스턴스 생성:

-   RDS 인스턴스 생성
    -   AWS Management Console에 로그인 후 RDS 서비스로 이동합니다.
    -   '데이터베이스 생성' 버튼을 클릭합니다.
    -   '표준 생성'을 선택하고, 'MySQL' 엔진을 선택합니다.
    -   원하는 MySQL 버전과 템플릿 (예: 프리 티어, 프로덕션)을 선택합니다.
    -   DB 인스턴스 식별자, 마스터 사용자 이름, 비밀번호를 설정합니다.
    -   나머지 설정 (예: 인스턴스 크기, 스토리지 등)을 구성한 후 '데이터베이스 생성' 버튼을 클릭하여 인스턴스를 시작합니다.
-   보안 그룹 설정
    -   RDS MySQL 인스턴스에 접속하기 위해서는 보안 그룹 설정이 중요합니다.
    -   RDS 대시보드에서 해당 DB 인스턴스를 선택합니다.
    -   '보안 그룹' 섹션에서 연결된 보안 그룹을 클릭합니다.
    -   인바운드 규칙을 편집하여 사용 중인 IP 또는 EC2 인스턴스의 IP를 추가하고, MySQL의 기본 포트인 3306을 허용하도록 설정합니다.

## 5. Node.js 앱 코드 배포:

-   node.js 설치

    -   EC2 인스턴스에 접속한 후, Node.js를 설치합니다.
    -   NVM(Node Version Manager)을 이용하여 설치하는 것이 추천됩니다.

        ```
        # NVM 설치
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
        source ~/.bashrc

        # Node.js 설치
        nvm install node
        ```

-   앱 실행
    -   `npm install` 으로 의존성 설치
-   PM2 설치
    ```
    npm install -g pm2
    ```
-   앱 실행
    ```
    pm2 start app.js
    ```
-   서버 부팅 시 자동 실행 설정
    ```
    pm2 startup
    ```

## 6. Node.js 앱에서 RDS와 연결:

-   애플리케이션 코드 내에서 MySQL 연결 설정을 변경하여 RDS 인스턴스를 가리키도록 합니다.
-   주로 사용되는 mysql 라이브러리를 예로 들면

    ```
    const mysql = require('mysql');

    const connection = mysql.createConnection({
      host: 'your-rds-endpoint.amazonaws.com',
      user: 'your-master-username',
      password: 'your-password',
      database: 'your-database-name'
    });

    connection.connect(err => {
      if (err) throw err;
      console.log('Connected to the database!');
    });

    ```

    </br> 여기서 `your-rds-endpoint.amazonaws.com`은 RDS 대시보드에서 해당 DB 인스턴스의 '엔드포인트' 섹션에서 찾을 수 있습니다.

## 7. Nginx와 React, Node.js 앱 연결:

-   react 폴더에서 `npm run build` 진행
-   Nginx 설정 파일에 React앱의 `build` 폴더 서빙
-   Nginx 설정 파일에 리버스 프록시 설정 추가

    ```
    sudo nano /etc/nginx/nginx.conf
    ```

    ```
    server {
      listen 80;
      server_name your_domain.com;

    location / {
    root /path/to/your/app/front/build;
    index index.html;
    try_files $uri /index.html;
    }

    location /api {
    proxy_pass http://localhost:3000;  # Node.js 앱이 3000번 포트에서 실행되고 있다고 가정
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    }
    }
    ```

-   Nginx를 재시작하여 설정을 적용

    ```
    sudo service nginx restart
    ```

## 8. 도메인 연결

-   도메인 등록 업체에서 원하는 도메인을 구매하고 등록합니다. (예: GoDaddy, Namecheap 등)
-   등록한 도메인을 EC2 인스턴스의 퍼블릭 IP 주소 또는 도메인과 연결하기 위해 DNS 레코드를 설정합니다.
-   도메인 관리 대시보드에서 DNS 레코드를 수정하여 A 레코드 또는 CNAME 레코드를 인스턴스의 퍼블릭 IP 주소 또는 도메인과 연결합니다.

## 9. SSL/TLS 인증서 설치:

-   Certbot을 설치

    ```
    sudo yum install certbot
    ```

-   Let's Encrypt를 사용하여 SSL/TLS 인증서를 발급

    ```
    sudo certbot certonly --webroot -w /path/to/your/react/app/build -d your_domain.com
    ```

    </br> `/path/to/your/react/app/build`은 React 앱의 빌드 폴더가 위치한 경로를 지정합니다.

-   SSL/TLS 인증서를 적용하기 위해 Nginx 설정 파일을 수정

    ```
    sudo nano /etc/nginx/nginx.conf
    ```

    ```
    server {
        listen 80;
        server_name your_domain.com;

        location / {
            root /path/to/your/react/app/build;
            index index.html;
            try_files $uri /index.html;
        }

        location /api {
            proxy_pass http://localhost:3000;  # Node.js 앱이 3000번 포트에서 실행되고 있다고 가정
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
        }

        # SSL/TLS 설정 추가
        listen 443 ssl;
        ssl_certificate /etc/letsencrypt/live/your_domain.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/your_domain.com/privkey.pem;
        include /etc/letsencrypt/options-ssl-nginx.conf;
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
    }
    ```

    </br>`listen 443 ssl;`은 HTTPS(포트 443)를 사용하기 위한 설정입니다.
    </br>`ssl_certificate`와 `ssl_certificate_key`는 발급받은 SSL/TLS 인증서의 경로를 지정합니다.
    </br>`include`와 `ssl_dhparam`은 보안 설정에 필요한 추가 옵션들입니다.

-   Nginx를 재시작하여 설정을 적용

    ```
    sudo service nginx restart
    ```

## 10. 서비스 확인:

-   브라우저를 통해 도메인 또는 퍼블릭 IP 주소로 접속하여 React 앱이 제대로 동작하는지 확인합니다.

---

### 주의 사항

-   your_domain.com은 실제 사용하는 도메인으로 바꿔주셔야 합니다.
-   React 프론트엔드 앱이 build된 경로가 /path/to/your/react/app/build로 설정되어야 합니다. 실제로 빌드된 경로를 설정해야 정상적으로 서빙될 수 있습니다.
-   Node.js 앱이 3000번 포트에서 실행되도록 가정하고 있습니다. 만약 다른 포트를 사용한다면 해당 포트로 수정해야 합니다.
-   SSL/TLS 인증서 발급 시 your_domain.com도 실제 도메인으로 변경해야 합니다.
