# 一键发布：图片自检 -> 构建自检 -> commit -> push
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

Write-Host '  [1/4] 图片自检 ...' -ForegroundColor Cyan
$bad = @()
Get-ChildItem -Path 'docs' -Recurse -Filter *.md -File | ForEach-Object {
    $mdFile = $_
    $text = [IO.File]::ReadAllText($mdFile.FullName, [Text.Encoding]::UTF8)
    $text = $text -replace '(?s)<!--.*?-->', ''
    foreach ($m in [regex]::Matches($text, '!\[[^\]]*\]\(([^)]+)\)')) {
        $target = $m.Groups[1].Value.Trim()
        if ($target -match '^(https?:|//|data:)') { continue }
        if ($target.StartsWith('/')) {
            $candidate = Join-Path (Get-Location) ('docs/public' + $target)
        } else {
            $candidate = Join-Path $mdFile.DirectoryName $target
        }
        if (-not (Test-Path $candidate)) {
            $bad += ('    ' + $mdFile.Name + '  ->  ' + $target)
        }
    }
}
if ($bad.Count -gt 0) {
    Write-Host '  这些图片找不到，构建一定会失败，没有推送：' -ForegroundColor Red
    $bad | ForEach-Object { Write-Host $_ -ForegroundColor DarkRed }
    Write-Host ''
    Write-Host '  两种改法：' -ForegroundColor Yellow
    Write-Host '    1. 把图片文件放到笔记旁边，链接写成  ![](图片名.png)' -ForegroundColor Yellow
    Write-Host '    2. 把图片放进 docs\public\images\，链接写成  ![](/images/文件名.png)' -ForegroundColor Yellow
    Write-Host '  注意：E:\xxx.png 这种本机绝对路径在网站上一律无效。' -ForegroundColor Yellow
    Write-Host ''
    exit 1
}
Write-Host '        OK' -ForegroundColor Green

Write-Host '  [2/4] 构建自检 ...' -ForegroundColor Cyan
$build = npm run build 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host '  构建失败，没有推送。线上还是上一个好版本。错误如下：' -ForegroundColor Red
    Write-Host $build -ForegroundColor DarkRed
    Write-Host ''
    exit 1
}
Write-Host '        OK' -ForegroundColor Green

Write-Host '  [3/4] 提交 ...' -ForegroundColor Cyan
git add -A
$msg = '更新笔记 ' + (Get-Date -Format 'yyyy-MM-dd HH:mm')
$out = git commit -q -m $msg 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host '  提交失败：' -ForegroundColor Red
    Write-Host $out -ForegroundColor DarkRed
    exit 1
}
Write-Host ('        ' + $msg) -ForegroundColor Green

Write-Host '  [4/4] 推送到 GitHub ...' -ForegroundColor Cyan
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
