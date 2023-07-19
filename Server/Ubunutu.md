# Ubuntu Setting

## Ubuntu 기본 세팅

### Ubuntu 부팅 USB 생성

1. 설치하고자 하는 버전의 우분투 iso 파일 다운로드 (https://ubuntu.com/download)
   </br> 일반적으로 다음과 같은 기준으로 버전 선택
    - LTS(Long Term Support) : 가장 안정성 있는 버전으로 선택
    - recently : 가장 최신의 버전 선택 -> 호환성이 떨어질 수 있음
2. 맥북에 USB 연결 후 `디스크 유틸리티.app` 접속 -> `지우기` 진행
3. `Etcher` 다운로드 (https://www.balena.io/etcher)
    - Flash from File : 다운로드한 우분투 iso 파일 선택
    - Select Target : 연결된 USB 장치 선택
    - Flash! : password 입력 후 부팅 USB 생성 완료

### Ubuntu 데스크탑 세팅

1. 데스크탑에 부팅 USB 연결 후 재부팅
2. 부팅 화면에서 `BIOS`로 진입
    - 일반적으로 `F2`, `F10`, `F11`, `F12`중 하나를 통헤 진입 가능
3. 우분투 설치 진행
    - `full ubuntu` : 디스크에 우분투 서버 하나만 할당 -> 디스크를 지우고 우분투 설치
    - `dual booting` : 디스크에 일정 파티션을 할당하여 우분투를 설치하고, 나머지앤 다른 운영체제(일반적으로 윈도우)를 사용 -> 윈도우 부트 매니저를 그대로 두고 우분투 설치
    - 기타 선택시 파티션을 만들거나 크기 변경, 여러 파티션 선택 가능

### 고정 IP setting

1. `setting - network`에 접속한다
2. `Aquantla Ethernet`의 톱니바퀴를 눌러 `IPv4`항목으로 들어간다.
3. IPv4 Method를 `Manual`로 변경하고, 입력사항을 작성한다.
    - `Addresses` : 컴퓨터 네트워크에서 장치들이 서로를 인식하고 통신하기 위해 사용하는 특수한 번호이다. (변경 가능)
    - `Netmask(Subnet Mast)` : 서브넷마스크는 호스트와 네트워크를 구분할 때 사용된다. 일반적으로 225와 0으로 구성되며, 0으로 된 부분에서 IP를 나눠쓰게 된다.
    - `Gateway(MAC; Media Access Control Address)` : MAC Address는 네트워크 상에서 서로 구분하기 위해 디바이스마다 할당된 물리적인 주소이다. (변경 불가능)
    - `DNS; Domain Name Server` : 응용 계층 시스템에서 도메인 이름과 IP 주소 이름 확인을 제공한다.
4. 터미널에서 `curl ifconfig.me` 또는 `ifconfig -a`를 입력하여 변경 사항을 확인한다.

---

## client 접속 가능 환경 구현

### open ssh 설정

1. 터미널에서 openssh-server를 설치한다.
    ```bash
    sudo apt update
    sudo apt install openssh-server
    ```
2. ssh를 활성화 시킨 후 active를 확인한다.
    ```bash
    sudo systemctl enable ssh
    sudo systemctl start ssh
    sudo systemctl status ssh
    ```
3. 방화벽(ufw; ubuntu firewall)을 활성화한 후, ssh를 허용한다.
    ```bash
    sudo ufw enable
    sudo ufw allow ssh
    ```
4. ssh 포트 번호를 지정해준다.
   </br>Port 22는 ssh 기본 포트로, 보안에 취약하므로 자신만의 포트 번호를 지정하는 것을 지향한다.

    ```bash
    vim /etc/ssh/sshd_config

    Port ****
    ```

5. ssh 접속 허용 그룹 및 유저를 설정한다.

    ```bash
    vim /etc/ssh/sshd_config

    AllowGroups [접속을 허용할 그룹]
    AllowUsers  [접속을 허용할 유저]
    ```

6. ssh를 재시작 후 client에서 접속한다.

    ```bash
    systemct restart sshd

    sudo apt-get install openssh-client
    ssh username@ip_address
    ```
