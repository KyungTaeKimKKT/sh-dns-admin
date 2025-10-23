### ✅ dns-admin/Dockerfile ==> 25-10-22 버젼으로 만듬
### 1. 빌드 : docker build -t shinwoohipo/pihole-admin:1.0.0 .
### 2. test: docker run --rm -p 53:53/tcp -p 53:53/udp -p 8888:80  shinwoohipo/pihole-admin:1.0.0
### 3. push: docker push shinwoohipo/pihole-admin:1.0.0




### ✅ Pi-hole 기반 커스텀 이미지
FROM pihole/pihole:latest

### ✅ 기본 환경 설정
ENV TZ="Asia/Seoul" \
    FTLCONF_webserver_api_password="1q2w3e4r5*!!" \
    FTLCONF_dns_listeningMode="all" \
    DNS1="1.1.1.1" \
    DNS2="168.126.63.1"



# 추가 작업 예시 (필요시)
# RUN apt-get update && apt-get install -y vim curl && apt-get clean

# 로그와 설정 볼륨 유지
VOLUME ["/etc/pihole", "/etc/dnsmasq.d"]

# 포트 노출 (DNS + Web)
EXPOSE 53/tcp 53/udp 80/tcp

# Pi-hole 실행
# Pi-hole 정상 부팅 후 비밀번호 강제 변경
# CMD ["bash", "-c", "s6-svscan /etc/s6"]

# docker run --name pihole -p 53:53/tcp -p 53:53/udp -p 80:80/tcp -p 443:443/tcp 
# -e TZ=Europe/London 
# -e FTLCONF_webserver_api_password="correct horse battery staple" 
# -e FTLCONF_dns_listeningMode=all 
# -v ./etc-pihole:/etc/pihole 
# -v ./etc-dnsmasq.d:/etc/dnsmasq.d -
# -cap-add NET_ADMIN 
# --restart unless-stopped 
# pihole/pihole:latest