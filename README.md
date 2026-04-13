# 배우 임승준 페이지 (정적 사이트)

이 폴더만 복사해 두면 **인터넷 연결**이 있을 때 폰트·YouTube 임베드까지 포함해 동일하게 작업을 이어갈 수 있습니다. 별도 빌드 도구는 없습니다.

## 폴더 구성

| 파일 / 폴더 | 설명 |
|-------------|------|
| `index.html` | 페이지 구조·콘텐츠·YouTube(프로필 배경) 스크립트 |
| `styles.css` | 레이아웃·테마(다크/시네마틱)·반응형 |
| `assets/` | 이미지·배너·프로필 사진 등 **전부 상대 경로**로 참조 |

### `assets/` 안에 있는 것

- `hero-banner.png` — 상단 Rolling 배너 이미지
- `hero-study-bg.png` — 히어로 **배경**(서재 톤 정적 이미지)
- `main-profile.jpg` — 프로필 큰 사진
- `profile-avatar.png` — 이름 옆 원형 작은 사진
- `profile/01.png` ~ `profile/60.png` 중 **52번 제외**, 실제 **59장** 그리드

## 미리보기 방법

1. **`로컬미리보기.bat`** 을 더블클릭 (Python이 PATH에 있어야 함)  
   → `http://127.0.0.1:8010/` 로 브라우저가 열리고, **프로필 영역 배경 YouTube**가 정상 재생되기 쉽습니다.

2. 또는 터미널에서 이 폴더로 이동 후:
   ```text
   python -m http.server 8010
   ```
   브라우저에서 `http://127.0.0.1:8010/` 접속.

3. `index.html`만 더블클릭으로 열면 대부분 보이지만, **YouTube iframe**은 브라우저·보안 정책 때문에 `file://`에서 막힐 수 있습니다. 영상 배경까지 확인하려면 위 **로컬 서버**를 권장합니다.

## 외부 의존성 (인터넷)

- **Google Fonts** — 본문·제목 폰트 로드
- **YouTube IFrame API** (`iframe_api`) — 프로필 카드 배경 영상만 사용 (상단 히어로는 정적 배경 이미지)

오프라인에서는 폰트·YouTube가 빠질 수 있습니다. 페이지 자체는 로컬 파일만으로 열립니다.

## 인터넷 어디서나 링크로 보기 (배포)

이 프로젝트는 **빌드 없이** `index.html` + `assets/`만 있으면 됩니다. **공개 웹 주소**를 만들려면 아래 중 하나를 쓰면 됩니다.

### 방법 A — GitHub Pages (무료, 고정 주소)

1. [GitHub](https://github.com)에 로그인하고 **새 저장소(repository)** 를 만듭니다. (이름은 영문·숫자 권장, 예: `im-seungjun-page`)
2. PC에서 이 폴더를 Git 저장소로 연 뒤 GitHub에 **push** 합니다.  
   (이미 이 폴더에 `.git`이 있다면 원격만 추가하면 됩니다.)
3. GitHub 저장소 **Settings → Pages** 로 이동합니다.
4. **Build and deployment** 의 **Source**를 **GitHub Actions** 로 선택합니다.
5. **Actions** 탭에서 워크플로 **Deploy to GitHub Pages** 가 성공하면, 몇 분 뒤 다음 형태의 주소로 접속할 수 있습니다.  
   `https://<사용자이름>.github.io/<저장소이름>/`  
   예: 저장소가 `https://github.com/myuser/im-seungjun-page` 이면  
   `https://myuser.github.io/im-seungjun-page/`

이 저장소에는 `.github/workflows/deploy-github-pages.yml` 이 포함되어 있어, `master` 또는 `main` 브랜치에 **push** 할 때마다 사이트가 자동으로 갱신됩니다.

### 방법 B — Netlify Drop (가장 빠름)

1. [Netlify Drop](https://app.netlify.com/drop) 에 접속합니다.
2. **이 폴더 전체**를 브라우저 창에 끌어다 놓습니다.
3. 임시 주소(예: `random-name-123.netlify.app`)가 바로 생깁니다. **고정 도메인·HTTPS**는 Netlify 가입 후 사이트 설정에서 연결할 수 있습니다.

### 방법 C — Cloudflare Pages / Vercel 등

같은 정적 파일을 업로드하는 호스팅이면 대부분 동작합니다. 루트 디렉터리에 `index.html` 이 있게 배포하면 됩니다.

### 배포 후 참고

- **클립 편집 내용**(`localStorage`)은 **각 방문자 브라우저**에만 저장됩니다. “누구나 같은 목록”을 보이게 하려면 나중에 서버·CMS가 필요합니다.
- 이미지·CSS 경로는 **상대 경로**라 GitHub Pages의 `https://…/저장소이름/` 하위 경로에서도 동작하도록 되어 있습니다.

## 작업 이어가기 팁

- 스타일 전역 변수·색은 `styles.css` 상단 `:root` 참고.
- 프로필 배경 영상 ID·시작 초는 `index.html` 하단 `<script>`의 `profileVideoId`, `profileStartSec` 근처에서 수정.
- **연기·광고·모션캡쳐·브이로그** 원형 클립의 링크·순서는 브라우저 **`localStorage`**(`imseungjun_cliprows_v1`)에 저장됩니다. 다른 PC·브라우저에는 자동으로 이어지지 않습니다.
