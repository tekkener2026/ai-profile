# 我的 AI 使用偏好（唯一源文件）

换 Agent、换模型、换电脑时，让新环境快速了解我的沟通习惯、执行边界和已验证过的结论。

仓库地址：[github.com/tekkener2026/ai-profile](https://github.com/tekkener2026/ai-profile)

## 文件分工

| 文件 | 作用 | 何时读 |
|---|---|---|
| [AGENTS.md](AGENTS.md) | 通用行为规则：语言、沟通、执行纪律、路径格式 | 每次必读 |
| [ENVIRONMENT.md](ENVIRONMENT.md) | 本机专属：机器信息、凭证规则、浏览器优先级 | 做具体任务时读 |
| [MEMORY.md](MEMORY.md) | 事实档案：常用目录、历史结论、踩坑记录 | 需要背景知识时读 |
| [CHANGELOG.md](CHANGELOG.md) | 规则改了什么、为什么 | 规则异常时可回滚 |
| [sync.ps1](sync.ps1) | 一键把规则同步到各 AI 工具 | 改完规则后运行 |

## 给新 Agent 的一句话开场

```
先读 https://raw.githubusercontent.com/tekkener2026/ai-profile/main/AGENTS.md 再开始。
需要环境细节读 ENVIRONMENT.md，需要历史结论读 MEMORY.md。
```

## 本机挂载（自动生效）

`sync.ps1` 会把 `AGENTS.md` + `ENVIRONMENT.md` 合并写入：

- OpenCode：`~/.config/opencode/global-instructions.md`
- Claude Code：`~/.claude/CLAUDE.md`（只有该目录存在时才写）

运行方式：

```powershell
cd "G:\open code\ai-profile"
.\sync.ps1
```

改动流程：**编辑仓库文件 → 跑 `sync.ps1` → 各工具同步生效**（仓库永远是唯一源，不要直接改生成出来的那个文件）。

## 换到其他工具

| 工具 | 挂载方式 |
|---|---|
| OpenCode | 已由 `sync.ps1` 自动覆盖 |
| Claude Code | 已由 `sync.ps1` 自动覆盖 |
| Cursor | Settings → Rules → User Rules，粘贴 `AGENTS.md` 内容 |
| Cline / Roo Code | Custom Instructions 粘贴 |
| ChatGPT / Gemini 网页版 | 字数受限，只放精简版：中文、先给结论、不准编造、命令要完整、危险操作先问 |
| 任意陌生 Agent | 开场贴上面的 raw 链接 |

## 隐私

本仓库可能公开：**不要写 API Key、密码、token、订阅链接、真实姓名、电话、地址、公司内部信息**。推送前跑一次 `git diff --cached` 检查。
