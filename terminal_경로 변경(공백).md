# [terminal] 경로 변경(공백)

- 경로 변경

```bash
$ cd [폴더명]
```

- 그런데 폴더명에 띄어쓰기(공백)가 있다면??
  - 폴더명: `today i learned`

```bash
$ cd today i learned
cd: string not in pwd: today
```

- 방법1: `\` 를 붙여줌

```bash
$ cd today\ i\ learned
-- 또는
$ cd today --까지만 치고 tab 누르면 자동완성됨
```

- 방법2: `'` 로 감싸줌

```bash
$ cd 'today i learned'
```

