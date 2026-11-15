# MEMORY.md — 事实档案与历史结论

<!-- 规则：只记"已验证过的结论"，不记猜测。每条格式：日期 ｜ 主题 ｜ 结论 -->

## 常用目录

| 目录 | 用途 |
|---|---|
| `G:\open code\每日趋势报告` | 每日趋势内容生产 |
| `G:\open code\CF节点库` | Cloudflare 节点整理 |
| `G:\open code\节点检测` | 节点可用性检测 |
| `G:\open code\opencode-中文补丁` | OpenCode 中文化补丁 |
| `G:\open code\生成的图片` | 图片产物 |
| `G:\open code\ai-profile` | 本仓库（AI 偏好源文件） |

## 已验证结论

| 日期 | 主题 | 结论 |
|---|---|---|
| 2026-11-15 | OpenCode 凭据存储 | API Key 只走界面写入 `opencode.db` 的 `credential` 表；改 `.env`／`auth.json`／`opencode.json` 均不生效 |
| 2026-11-15 | `file://` 链接 | OpenCode 桌面版出于安全策略，点击常无反应；必须配合 `Start-Process explorer.exe` 或生成 `index.html` |
| 2026-11-15 | browse 稳定性 | 软件内直连脚本环境偶发 `Unknown identifier`，改用 `browse.exe execute --session ... --file ...` 稳定 |
| 2026-11-15 | PowerShell 传 JS | 单引号内联 JS 会被吞引号导致语法错误，必须写文件传参 |
| 2026-11-15 | 控制台中文 | 不设 `[Console]::OutputEncoding=UTF8` 时中文全乱码 |
| 2026-11-15 | v2rayN ECH | 关键在 DNS 能否返回 `ech=` 字段；国内 DoH（阿里／腾讯）常删掉该字段，国际 DoH 又常直连不通 → **非必要不开 ECH**。验证用 [Cloudflare ECH 检测页](https://defo.ie/ech-check.php) |

## 待补充

- 常用订阅／节点供应商的命名习惯（脱敏后记）
- 常跑的自动化任务与时间点
