# [git] 브랜치 이름 변경

- 기존 브랜치 이름: `ready/scaffolding`
- 변경 브랜치 이름: `ready`
- 로컬 브랜치 이름 변경

```bash
$ git branch -m ready/scaffolding ready
```

- 원격 기존 브랜치 삭제

```bash
$ git push origin :ready/scaffolding
```

- 원격 변경 브랜치 적용

```bash
$ git push origin ready
```

