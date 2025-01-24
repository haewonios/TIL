# [git] 커밋 되돌리기

- 로컬에만 커밋한 경우

```bash
$ git reset HEAD^ // 바로 직전 커밋으로
$ git reset [commit hash] // 특정 커밋으로
```

- 옵션
  - `--soft`
  - `--mixed`
  - `--hard`