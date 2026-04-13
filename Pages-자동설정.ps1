# GitHub Pages 를 REST API로 켭니다. (imseungjun/imseungjun · main · 루트)
#
# 이 PC에서는 사용자의 GitHub 비밀번호/토큰에 접근할 수 없으므로,
# 아래처럼 본인이 발급한 토큰을 한 번 넣고 실행해야 합니다.
#
#   $env:GITHUB_TOKEN = "ghp_xxxxxxxx"
#   Set-Location "이 스크립트가 있는 폴더"
#   .\Pages-자동설정.ps1
#
# 토큰: GitHub → Settings → Developer settings → Personal access tokens
#       Classic: repo 범위 / Fine-grained: 이 저장소에 Administration 또는 Pages 관련 권한

$ErrorActionPreference = "Stop"
$owner = "imseungjun"
$repo = "imseungjun"
$token = $env:GITHUB_TOKEN

if (-not $token) {
    Write-Host ""
    Write-Host "GITHUB_TOKEN 이 필요합니다. (저장소 관리자 권한의 Personal Access Token)" -ForegroundColor Yellow
    Write-Host '예: $env:GITHUB_TOKEN = "ghp_..." ; .\Pages-자동설정.ps1'
    Write-Host ""
    exit 1
}

$base = "https://api.github.com/repos/$owner/$repo/pages"
$headers = @{
    Authorization            = "Bearer $token"
    Accept                     = "application/vnd.github+json"
    "X-GitHub-Api-Version"     = "2022-11-28"
}

# 이미 Pages 가 있으면 조회만
try {
    $existing = Invoke-RestMethod -Uri $base -Method Get -Headers $headers
    Write-Host ""
    Write-Host "[안내] GitHub Pages 가 이미 설정되어 있습니다." -ForegroundColor Green
    Write-Host "상태: $($existing.status)"
    if ($existing.html_url) { Write-Host "URL:  $($existing.html_url)" }
    Write-Host "공개 주소: https://${owner}.github.io/${repo}/"
    exit 0
} catch {
    if ($_.Exception.Response.StatusCode -ne 404) {
        Write-Host ""
        Write-Host "[오류] GET /pages 실패: $($_.Exception.Message)"
        if ($_.Exception.Response.StatusCode -eq 401) {
            Write-Host "토큰 권한(repo) 또는 만료를 확인하세요."
        }
        exit 1
    }
}

# POST: 새로 Pages 생성 (문서 예시와 동일하게 source 만 전달)
$bodyObj = @{
    source = @{
        branch = "main"
        path   = "/"
    }
}
$body = $bodyObj | ConvertTo-Json -Depth 5

try {
    $r = Invoke-RestMethod -Uri $base -Method Post -Headers $headers -Body $body -ContentType "application/json"
    Write-Host ""
    Write-Host "[성공] GitHub Pages 를 켰습니다." -ForegroundColor Green
    Write-Host "상태: $($r.status)"
    Write-Host "공개 주소 (반영까지 1~5분): https://${owner}.github.io/${repo}/"
} catch {
    $code = $_.Exception.Response.StatusCode.value__
    $err = $_.ErrorDetails.Message
    if (-not $err) { $err = $_.Exception.Message }

    # 이미 다른 방식으로 존재하면 PUT 으로 legacy + branch 로 맞춤
    if ($code -eq 409 -or $code -eq 422) {
        $putBody = @{
            build_type = "legacy"
            source     = @{
                branch = "main"
                path   = "/"
            }
        } | ConvertTo-Json -Depth 5
        try {
            Invoke-RestMethod -Uri $base -Method Put -Headers $headers -Body $putBody -ContentType "application/json" | Out-Null
            Write-Host ""
            Write-Host "[성공] GitHub Pages 소스를 main / (root) 로 맞췄습니다." -ForegroundColor Green
            Write-Host "공개 주소: https://${owner}.github.io/${repo}/"
            exit 0
        } catch {
            Write-Host ""
            Write-Host "[오류] PUT 도 실패했습니다. 웹에서 Settings → Pages 를 확인하세요." -ForegroundColor Red
            Write-Host $err
            exit 1
        }
    }

    Write-Host ""
    Write-Host "[오류] POST 실패 ($code)" -ForegroundColor Red
    Write-Host $err
    exit 1
}
