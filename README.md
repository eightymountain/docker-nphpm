# laravel-docker
docker [mariadb, nginx, php-fpm]

## 참고한 자료
- [laradock의 mariadb](https://laradock.io/)
- [docker-nginx-reverse proxy](https://medium.com/sjk5766/docker-compose%EB%A1%9C-localhost-nginx-%EB%A6%AC%EB%B2%84%EC%8A%A4-%ED%94%84%EB%A1%9D%EC%8B%9C-%EA%B5%AC%EC%84%B1-8214d41a94fc)
- [php-fpm](https://medium.com/sjk5766/dockerfile%EB%A1%9C-laravel-%EA%B5%AC%EC%B6%95%ED%95%98%EA%B8%B0-8a5db266d2ef)
- [docker 명령어](https://www.daleseo.com/docker-compose/)

## install
설치 및 실행

```bash 
docker-compose up -d
```

yml 또는 Dockerfile을 수정했을때

```bash 
docker-compose up -d --build
```

## 