# 部署说明 (Deployment Guide)

## 问题：本地打开 HTML 文件出现 CORS 错误

当直接双击打开 `index.html` 文件时（使用 `file:///` 协议），浏览器会因为安全策略阻止加载 JSON 文件，显示 CORS 错误：

```
Access to fetch at 'file:///...' from origin 'null' has been blocked by CORS policy
```

## 解决方案

### 方案一：使用本地服务器（推荐）

**最简单的方法 - 使用提供的启动脚本：**

#### Windows 用户：
双击运行 `start-server.bat`

#### macOS/Linux 用户：
在终端中运行：
```bash
./start-server.sh
```

脚本会自动：
1. 检测您系统中已安装的运行环境（Python/Node.js/PHP）
2. 启动本地服务器（端口 8080）
3. 自动打开浏览器访问 `http://localhost:8080`

**手动启动服务器：**

如果您已安装 Python（推荐）：
```bash
# Python 3
python -m http.server 8080

# Python 2
python -m SimpleHTTPServer 8080
```

如果您已安装 Node.js：
```bash
# 首次需要安装 http-server（仅需一次）
npm install -g http-server

# 启动服务器
http-server -p 8080
```

如果您已安装 PHP：
```bash
php -S localhost:8080
```

然后在浏览器中打开：`http://localhost:8080`

### 方案二：部署到网络服务器（生产环境推荐）

#### 1. GitHub Pages（免费）
1. 在 GitHub 仓库设置中启用 GitHub Pages
2. 选择分支（通常是 `main` 或 `gh-pages`）
3. 访问：`https://[用户名].github.io/[仓库名]/`

#### 2. 其他静态托管服务
- **Netlify**：拖放文件夹即可部署
- **Vercel**：连接 GitHub 仓库自动部署
- **Cloudflare Pages**：从 Git 直接部署

#### 3. 传统 Web 服务器
1. 将所有文件上传到 Web 服务器
2. 确保以下文件在同一目录：
   - `index.html`
   - `rdpoptions.json`
   - `rdpoptions.zh.json`
   - `rdp.png`
3. 通过服务器 URL 访问

### 方案三：使用 VS Code Live Server 扩展

1. 在 VS Code 中安装 "Live Server" 扩展
2. 右键点击 `index.html`
3. 选择 "Open with Live Server"

### 方案四：修改浏览器启动参数（不推荐）

⚠️ **警告**：此方法会降低浏览器安全性，仅用于开发测试

**Chrome/Edge (Windows)**：
```batch
chrome.exe --allow-file-access-from-files
```

**Chrome (Mac)**：
```bash
open -a "Google Chrome" --args --allow-file-access-from-files
```

**Chrome (Linux)**：
```bash
google-chrome --allow-file-access-from-files
```

## 文件结构

```
rdpfileeditor/
├── index.html              # 主应用程序（包含 UI 翻译）
├── rdpoptions.json         # 英文 RDP 选项和描述
├── rdpoptions.zh.json      # 中文 RDP 选项和描述
├── rdp.png                 # 应用图标
├── README.md               # 英文说明
├── DEPLOYMENT.zh.md        # 本文件（中文部署说明）
├── start-server.bat        # Windows 启动脚本
└── start-server.sh         # macOS/Linux 启动脚本
```

## 常见问题

### 1. 为什么不能直接打开 HTML 文件？

现代浏览器出于安全考虑，禁止 `file:///` 协议的页面使用 `fetch()` 加载本地文件。这是标准的安全策略，所有主流浏览器都有此限制。

### 2. 我没有安装 Python/Node.js/PHP 怎么办？

推荐安装 Python，因为：
- 安装简单，体积小
- 自带 HTTP 服务器模块
- 跨平台支持

下载地址：https://www.python.org/downloads/

### 3. 可以创建不需要服务器的独立版本吗？

可以，但需要修改代码：
1. 将 JSON 文件内容内嵌到 HTML 中
2. 替换 `fetch()` 调用为直接对象访问
3. 这会使 HTML 文件变大（约 60KB）

如需此版本，请联系维护者。

### 4. 端口 8080 已被占用怎么办？

使用其他端口，例如：
```bash
python -m http.server 3000
```
然后访问 `http://localhost:3000`

## 推荐部署方式

- **开发测试**：使用本地服务器（Python/Node.js/PHP）
- **个人使用**：部署到 GitHub Pages
- **团队使用**：部署到公司内网服务器
- **公开服务**：使用 Netlify/Vercel 等专业托管服务

## 技术说明

应用使用 `fetch()` API 异步加载 JSON 配置文件。此 API 遵循同源策略（Same-Origin Policy），`file:///` 协议被视为 `null` 源，无法访问其他本地文件。

解决方案是通过 HTTP/HTTPS 协议提供文件，即使是本地服务器（localhost）也满足同源策略要求。

## 获取帮助

如果您在部署过程中遇到问题：
1. 检查浏览器控制台的错误信息
2. 确认所有文件都在同一目录
3. 尝试不同的本地服务器方案
4. 在 GitHub Issues 中寻求帮助
