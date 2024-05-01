# [git] 브랜치 Merge

## 케이스#1

- master(main) 브랜치와 작업 브랜치의 시작 커밋이 같지 않은 경우
- 레포 처음 생성하고 master브랜치에서 따서 시작한게 아니라 PR 도 생성이 안됨
  - `There isn’t anything to compare.` 
- 무시하고 걍 merge 해보자

```bash
$ git merge readyJS
fatal: refusing to merge unrelated histories.
```

- 그렇담 옵션 `--allow-unrelated-histories` 을 추가해서 merge

```bash
$ git merge readyJS --allow-unrelated-histories
```

- 성공