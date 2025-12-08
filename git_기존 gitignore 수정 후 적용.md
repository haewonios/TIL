# [git] 기존 gitignore 수정 후 적용

- 이미 기존에 `.gitignore` 파일이 있었는데, 이를 수정하고 이미 올라가 있는 파일을 삭제하고 싶을 때

```bash
$ git rm -r --cached .

$ git add .
$ git commit -m "commit message"
$ git push origin main 
```

