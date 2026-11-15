# ENVIRONMENT.md — 本机环境专属规则

<!-- 最后更新：2026-11-15 ｜ 换机器时优先改这个文件 -->

## 机器

- Windows 10 教育版，用户名 `Administrator`
- 已装：git 2.56、Node v26.13.0、Python 3.14.7
- 工作盘：`G:\open code\`；临时目录优先用 `C:\Users\Administrator\AppData\Local\Temp\opencode\`
- **控制台中文乱码**：PowerShell 输出中文前先执行
  `[Console]::OutputEncoding=[Text.Encoding]::UTF8`

## 第三方服务凭证（强制）

配置搜索、模型等第三方服务时，**先在应用界面完成，不要先去改配置文件**：

- OpenCode 的凭据（Tavily / Exa / Firecrawl 等搜索服务、各类模型提供商）以 **credential** 形式存放，
  **只能通过界面写入**：`设置 → 提供商 → 选中服务 → 填 API Key → 连接`
- 实际落库位置：`~/.local/share/opencode/opencode.db` 的 `credential` 表；
  **不写**进 `.env`、`auth.json`、`opencode.json` —— 改这些文件不生效（2026-11-15 实测）
- 凭据接好后，再到 `设置 → 服务器 → 偏好设置 → 第三方搜索` 选搜索提供方
- 判断原则：凡是「要填 API Key 才能用」的服务，先找界面里的「提供商／集成」入口；
  界面确实没有入口时才退回改配置文件，并说明为什么必须改
- 密钥已在剪贴板时，直接进界面粘贴，不要绕环境变量或重启服务

## 浏览器使用优先级（强制）

需要打开浏览器或操作网页时，**按顺序选**，前一条失败（报错、启动不了、页面打不开）才降级：

1. **首选：browse（OpenCode 官方扩展）**（`browse.exe` / `tools.browse.*`）
   - 驱动用户真实在用的 **Chrome**（已配对：Chrome「常发常顺」0.0.16），带登录状态和插件，用户能看到操作过程
   - 查状态：`"C:\Users\Administrator\.local\bin\browse.exe" status`；排障：`browse doctor`；参考：`browse skill`
   - **稳定用法＝指定会话＋脚本文件**：`browse.exe execute --session <会话ID> --file <脚本路径>`
     （软件内直连脚本环境偶发不稳定，`page`/`context`/`snapshot` 可能未注入；遇 `Unknown identifier` 就切命令行）
   - **禁止用 PowerShell 单引号内联传 JS**（引号会被吞、报语法错），一律写 `.js` 文件再 `--file`
   - 用完执行 `browse.exe session reset <会话ID>`（或 `session delete`）
2. **备选一：agent-browser 命令行技能**（`agent-browser.cmd`）
   - 启动独立 Edge 实例，**没有登录状态**，默认隐形；要用户看见就加 `--headed`
   - 最稳参数：`--executable-path "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"`
   - 用独立会话 `--session <名称>`，结束执行 `agent-browser --session <名称> close`
3. **备选二：Playwright 服务**（`tools.playwright.*`）
4. **备选三：OpenCode 内置浏览器**（`tools.browser.tabs.*`）
5. **备选四：magpie 的 browser-tool**（`tools["browser-tool"].bt_cli`）

补充：

- **任务结束必须清理浏览器**：browse 用 `session reset`/`session delete`；agent-browser 用 `close`；
  Playwright 用 `browser_close`；内置浏览器关掉对应标签页。遗留窗口会造成「看到的窗口和实际页面对不上」
- 只有 **browse**（真实 Chrome）和 **Kimi 扩展**（真实傲游）能读到已登录页面；其余都是独立浏览器。
  要看傲游当前页面，用 `open-computer-use` 读 Maxthon 窗口，不受本优先级约束
- 一次任务选定技能后不要中途混用，除非在回复里登记更换理由
