# GitHub Pages 켜기 (404 “Site not found” 해결)

GitHub에서 이 저장소를 확인한 결과, **아직 Pages 기능이 켜지지 않은 상태**일 수 있습니다.  
그래서 `https://imseungjun.github.io/imseungjun/` 에 접속하면 **404 · There isn’t a GitHub Pages site here** 가 뜹니다.

**코드는 GitHub에 올라가 있어도**, 아래 **방법 A(자동)** 또는 **방법 B(웹)** 중 하나를 해야 웹 주소로 열립니다.

---

## 방법 A — PowerShell로 한 번에 켜기 (추천)

1. GitHub에서 **Personal Access Token** 을 만듭니다.  
   **Settings → Developer settings → Personal access tokens**  
   - **Classic:** `repo` 체크  
   - **Fine-grained:** 저장소 `imseungjun` 에 대해 **Contents** 및 **Administration**(또는 Pages 설정) 권한

2. 이 폴더에서 PowerShell을 연 뒤:

```powershell
cd "배우 임승준 페이지 폴더 경로"
$env:GITHUB_TOKEN = "여기에_발급한_토큰_붙여넣기"
.\Pages-자동설정.ps1
```

3. 성공 메시지가 나오면 **1~5분** 뒤 `https://imseungjun.github.io/imseungjun/` 을 다시 열어 보세요.

> Cursor/AI가 **사용자 대신 GitHub에 로그인할 수는 없어서**, 토큰은 본인이 발급해야 합니다. 스크립트는 공식 API로 Pages만 켭니다.

---

## 방법 B — 웹에서 수동으로 켜기

### 1. 저장소 Settings 열기

1. 브라우저에서 저장소로 이동:  
   **https://github.com/imseungjun/imseungjun**
2. 상단 메뉴에서 **Settings** (설정) 클릭

### 2. Pages 메뉴로 이동

왼쪽 사이드바 아래쪽 **Code and automation** 구역에서 **Pages** 를 클릭합니다.

### 3. 배포 방식 선택 (가장 쉬운 방법)

**Build and deployment** 섹션에서:

1. **Source** (또는 배포 원본)를 **`Deploy from a branch`** 로 선택합니다.
2. **Branch**  
   - 첫 번째 드롭다운: **`main`** 선택  
   - 두 번째 드롭다운: **`/ (root)`** 선택  
3. 오른쪽 **Save** (저장) 버튼을 누릅니다.

> **주의:** README만 있는 빈 저장소가 아니라, **`main` 브랜치 루트에 `index.html` 이 있는지** 확인하세요.  
> 이 프로젝트는 이미 `index.html` 이 있으므로 그대로 두면 됩니다.

### 4. 반영까지 기다리기

- 저장 후 **1~5분** 정도 지나면 사이트가 열립니다.  
- 같은 Settings → Pages 화면 상단에 **녹색 체크**와 함께  
  `Your site is live at https://imseungjun.github.io/imseungjun/`  
  같은 문구가 나오면 성공입니다.

### 5. 다시 접속해 보기

**https://imseungjun.github.io/imseungjun/**

(끝에 `/` 있어도 없어도 됩니다.)

---

## GitHub Actions만 켜 둔 경우

**Source** 가 **GitHub Actions** 인데, Actions 탭에서 워크플로가 **실패(빨간색)** 이면 사이트가 안 뜹니다.  
그때는 위처럼 **`Deploy from a branch`** 로 바꾸고 `main` / `/(root)` 로 저장하는 것이 가장 빠릅니다.

---

## 여전히 안 될 때

- 저장소가 **Public** 인지 확인 (Private이면 무료 플랜에서 Pages 제한이 있을 수 있음)  
- 몇 분 더 기다린 뒤 **시크릿 창**에서 다시 열어 보기  
- 주소 오타: 사용자명 **`imseungjun`**, 저장소 이름 **`imseungjun`** → 경로 `/imseungjun/`

---

설정을 마치면 GitHub가 “Pages 사이트”로 인식하고, 위 주소로 페이지가 열립니다.
