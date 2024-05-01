# [terminal] 열려있는 포트 확인 및 닫기

- 열려있는 포트 전체 확인

```bash
$ sudo lsof -PiTCP -sTCP:LISTEN
```

- 특정 포트(3000번) 정보 확인

```bash
$ sudo lsof -i :3000
```

- 위 두 방법을 통해 알아낸 포트의 pid 이용해 포트 닫기

```bash
$ sudo kill -9 [PID]
```

