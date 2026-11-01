# 一键发布：构建自检 -> commit -> push
# 退出码：0 = 已发布  3 = 没有改动  1 = 出错
$ErrorActionPreference = 'Continue'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

Write-Host ''
Write-Host '  笔记站 · 发布' -ForegroundColor Cyan
Write-Host '  -------------------------------' -ForegroundColor DarkGray

$changes = git -c core.quotepath=false status --porcelain
if (-not $changes) {
    Write-Host '  没有改动，不用发布。' -ForegroundColor Yellow
    Write-Host '  （是不是文件没保存？或者改的不是 docs 里的东西）' -ForegroundColor DarkGray
    Write-Host ''
    exit 3
}

Write-Host '  改动：' -ForegroundColor DarkGray
$changes | ForEach-Object { Write-Host ('    ' + $_) -ForegroundColor Gray }
Write-Host ''

Write-Host '  [1/3] 构建自检 ...' -ForegroundColor Cyan
$build = npm run build 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host '  构建失败，没有推送。线上还是上一个好版本。错误如下：' -ForegroundColor Red
    Write-Host $build -ForegroundColor DarkRed
    Write-Host ''
    exit 1
}
Write-Host '        OK' -ForegroundColor Green

Write-Host '  [2/3] 提交 ...' -ForegroundColor Cyan
git add -A
$msg = '更新笔记 ' + (Get-Date -Format 'yyyy-MM-dd HH:mm')
$out = git commit -q -m $msg 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host '  提交失败：' -ForegroundColor Red
    Write-Host $out -ForegroundColor DarkRed
    exit 1
}
Write-Host ('        ' + $msg) -ForegroundColor Green

Write-Host '  [3/3] 推送到 GitHub ...' -ForegroundColor Cyan
$push = git push 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host '  推送失败，检查网络或 GitHub 登录：' -ForegroundColor Red
    Write-Host $push -ForegroundColor DarkRed
    exit 1
}
Write-Host '        OK' -ForegroundColor Green

Write-Host ''
Write-Host '  已推送。大约一分钟后上线：' -ForegroundColor Cyan
Write-Host '  https://linkcuty.github.io/' -ForegroundColor White
Write-Host ''
exit 0
