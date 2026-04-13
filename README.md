# 배우 임승준 페이지 (정적 사이트)

이 폴더만 복사해 두면 **인터넷 연결**이 있을 때 폰트·YouTube 임베드까지 포함해 동일하게 작업을 이어갈 수 있습니다. 별도 빌드 도구는 없습니다.

**USB·다른 PC에서 Cursor로 이어서 작업**할 때는 **`USB-다른PC-작업가이드.md`** 를 꼭 읽어 주세요. (숨김 폴더 `.git` 포함, `localStorage` 한계 등)

**`https://imseungjun.github.io/imseungjun/` 가 404이면** → GitHub에서 **Pages를 아직 켜지 않은 경우**가 많습니다. **`Pages-켜는방법.md`** 를 순서대로 따라 하세요.

## 폴더 구성

| 파일 / 폴더 | 설명 |
|-------------|------|
| `index.html` | 페이지 구조·콘텐츠·YouTube(프로필 배경) 스크립트 |
| `styles.css` | 레이아웃·테마(다크/시네마틱)·반응형 |
| `assets/` | 이미지·배너·프로필 사진 등 **전부 상대 경로**로 참조 |
| `data/cliprows.json` | 방문자에게 보일 **연기·광고·액션 등 클립 공개 목록** (배포 시 포함) |
| `.git/` | (숨김) Git 이력·GitHub 원격 주소 — **통째로 복사해야 이어서 커밋 가능** |
| `.github/` | (숨김) GitHub Pages 배포 워크플로 |
| `USB-다른PC-작업가이드.md` | USB 이동·다른 PC·Cursor 작업 시 체크리스트 |
| `Pages-켜는방법.md` | GitHub Pages 404일 때 **웹에서 켜는 순서** |
| `Pages-자동설정.ps1` | **GITHUB_TOKEN** 으로 API로 Pages 켜기 (PowerShell) |

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

#### 이 저장소에 있는 한 번에 올리기 (Windows)

계정이 **`imseungjun`** 인 경우, 아래 배치 파일을 사용하면 됩니다.

1. 이 폴더에서 **`깃허브에올리기.bat`** 을 더블클릭합니다.
2. 열리는 GitHub 페이지에서 저장소 이름 **`imseungjun`** 이 맞는지 확인한 뒤 **Create** 합니다.  
   (README, .gitignore, license 는 **추가하지 마세요**.)
3. 배치 파일이 안내한 대로 키를 누르면 `git push` 가 실행됩니다.

완료 후 저장소 주소: `https://github.com/imseungjun/imseungjun`  
Pages 설정 후 공개 주소: `https://imseungjun.github.io/imseungjun/`

다른 GitHub 아이디·저장소 이름을 쓰는 경우, `깃허브에올리기.bat` 안의 URL을 본인 것으로 바꾸면 됩니다.

#### 수동으로 할 때

1. [GitHub](https://github.com)에 로그인하고 **새 저장소(repository)** 를 만듭니다. (이름은 영문·숫자 권장, 예: `im-seungjun-page`)
2. PC에서 이 폴더를 Git 저장소로 연 뒤 GitHub에 **push** 합니다.  
   (이미 이 폴더에 `.git`이 있다면 원격만 추가하면 됩니다.)
3. GitHub 저장소 **Settings → Pages** 로 이동합니다.
4. **Build and deployment** 에서 아래 **둘 중 하나**만 선택합니다. (처음이면 **①** 을 권장합니다.)

   **① 브랜치에서 바로 배포 (가장 단순, 404 해결에 유리)**  
   - **Source** → **Deploy from a branch**  
   - **Branch** → `main` 선택, **Folder** → **`/ (root)`** 선택  
   - **Save** 를 누릅니다.  
   - 1~3분 뒤 `https://<사용자이름>.github.io/<저장소이름>/` 로 접속해 보세요.  
   - 이 방식은 **GitHub Actions 없이** 저장소 루트의 `index.html` 을 그대로 올립니다.

   **② GitHub Actions 로 배포 (자동 빌드)**  
   - **Source** → **GitHub Actions**  
   - **Actions** 탭에서 **Deploy to GitHub Pages** 워크플로가 **초록색(성공)** 인지 확인합니다.  
   - 실패(빨간색)면 로그를 열어 오류를 확인하세요.

5. 공개 주소 예시: `https://<사용자이름>.github.io/<저장소이름>/`  
   (예: `https://imseungjun.github.io/imseungjun/`)

#### `imseungjun.github.io/imseungjun/` 에서 404 (Site not found) 가 나올 때

- **Settings → Pages** 에서 **Source** 가 아직 **None** 이거나, **Actions** 만 켜 두고 워크플로가 한 번도 성공하지 않은 경우**에 자주 발생합니다.  
- 위 **① Deploy from a branch** 로 바꾸고 `main` / `/(root)` 로 저장한 뒤 2~3분 기다려 보세요.  
- **Actions** 를 쓰는 경우와 **Branch** 를 쓰는 경우는 **동시에 하나만** 쓰는 것이 좋습니다. 먼저 **①** 으로 사이트가 뜨는지 확인한 뒤 필요하면 **②** 로 바꿀 수 있습니다.

이 저장소에는 `.github/workflows/deploy-github-pages.yml` 이 있어, **GitHub Actions** 를 Source로 쓸 때 `main` 에 **push** 할 때마다 자동 배포를 시도합니다.

### 방법 B — Netlify Drop (가장 빠름)

1. [Netlify Drop](https://app.netlify.com/drop) 에 접속합니다.
2. **이 폴더 전체**를 브라우저 창에 끌어다 놓습니다.
3. 임시 주소(예: `random-name-123.netlify.app`)가 바로 생깁니다. **고정 도메인·HTTPS**는 Netlify 가입 후 사이트 설정에서 연결할 수 있습니다.

### 방법 C — Cloudflare Pages / Vercel 등

같은 정적 파일을 업로드하는 호스팅이면 대부분 동작합니다. 루트 디렉터리에 `index.html` 이 있게 배포하면 됩니다.

### 배포 후 참고

- **누구나 같은 클립 목록**을 `https://…github.io/…/` 에서 보이게 하려면 저장소의 **`data/cliprows.json`** 을 수정한 뒤 `git push` 하세요. (첫 방문·저장소 비어 있을 때 이 파일이 자동으로 불러와집니다.)
- 브라우저에서만 추가한 링크는 **`localStorage`** 에만 있으므로, 위 공개 목록에 반영하려면 **「클립 목록 백업(JSON)」** 으로 내려받은 내용을 `data/cliprows.json` 형식에 맞게 넣어 올리면 됩니다.
- **클립 편집 내용**(`localStorage`)은 **각 방문자 브라우저**에만 저장됩니다. 공개 JSON과 병행하면 방문자에게도 동일 목록을 보여 줄 수 있습니다.
- 이미지·CSS 경로는 **상대 경로**라 GitHub Pages의 `https://…/저장소이름/` 하위 경로에서도 동작하도록 되어 있습니다.

## 작업 이어가기 팁

- 스타일 전역 변수·색은 `styles.css` 상단 `:root` 참고.
- 프로필 배경 영상 ID·시작 초는 `index.html` 하단 `<script>`의 `profileVideoId`, `profileStartSec` 근처에서 수정.
- **연기·광고·모션캡쳐·브이로그** 원형 클립의 링크·순서는 브라우저 **`localStorage`**(`imseungjun_cliprows_v1`)에 저장됩니다. 다른 PC·브라우저에는 자동으로 이어지지 않습니다.
