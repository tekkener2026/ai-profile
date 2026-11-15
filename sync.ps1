# 把仓库里的规则文件同步到各 AI 工具的配置位置
# 用法：cd "G:\open code\ai-profile"; .\sync.ps1
# 说明：仓库是唯一源文件，本脚本只做单向覆盖；被覆盖的原文件会留 .bak 备份

$ErrorActionPreference = 'Stop'

$repo   = if ($PSScriptRoot) { $PSScriptRoot } else { (Get-Location).Path }
$stamp  = Get-Date -Format 'yyyyMMdd-HHmmss'
$merged = @('AGENTS.md', 'ENVIRONMENT.md') | ForEach-Object {
    Get-Content (Join-Path $repo $_) -Raw -Encoding UTF8
}
$content = ($merged -join "`r`n`r`n")

$targets = @(
    (Join-Path $env:USERPROFILE '.config\opencode\global-instructions.md'),
    (Join-Path $env:USERPROFILE '.claude\CLAUDE.md')
)

foreach ($t in $targets) {
    $dir = Split-Path $t -Parent
    if (-not (Test-Path $dir)) {
        Write-Host "跳过（该工具未安装）：$t"
        continue
    }
    if (Test-Path $t) {
        Copy-Item $t "$t.bak-$stamp" -Force
    }
    Set-Content -Path $t -Value $content -Encoding UTF8
    Write-Host "已同步：$t"
}

Write-Host ""
Write-Host "完成。原文件备份后缀：.bak-$stamp"
