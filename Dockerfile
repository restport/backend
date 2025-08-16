# 1. 베이스 이미지 설정
FROM openjdk:17-jdk-slim
# 2. 작업 디렉토리 설정
WORKDIR /app
# 3. 로컬 jar 파일을 컨테이너 내부로 복사
COPY ./build/libs/restport-0.0.1-SNAPSHOT.jar app.jar
# 4. 시스템 시간대 설정
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN echo "Asia/Seoul" > /etc/timezone
# 5. 외부에서 접근할 수 있도록 포트 개방
EXPOSE 8080
# 6. jar 실행 명령어
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "app.jar"]