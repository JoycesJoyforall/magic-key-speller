# 🗝️ Magic Key Speller — 离线部署指南

## 方法一：GitHub Pages（推荐，5分钟搞定）

这是最简单的方式，完全免费，支持离线使用。

### 步骤：

1. **注册/登录 GitHub**
   - 打开 https://github.com，注册一个免费账号

2. **创建新仓库**
   - 点击右上角 "+" → "New repository"
   - 名字随意（如 `magic-key-speller`）
   - 勾选 "Public"
   - 点击 "Create repository"

3. **上传文件**
   - 在仓库页面点击 "uploading an existing file"
   - 把这 3 个文件全部拖进去：
     - `index.html`
     - `sw.js`
     - `manifest.json`
   - 点击 "Commit changes"

4. **开启 GitHub Pages**
   - 进入仓库 → Settings → Pages
   - Source 选 "Deploy from a branch"
   - Branch 选 "main"，文件夹选 "/ (root)"
   - 点击 Save
   - 等待 1-2 分钟，页面会显示你的网址，类似：
     `https://你的用户名.github.io/magic-key-speller/`

5. **手机/iPad 添加到主屏幕**
   - 用 Safari（iPhone/iPad）或 Chrome（Android）打开上面的网址
   - **iPhone/iPad**: 点击分享按钮 → "添加到主屏幕"
   - **Android**: 点击菜单 → "添加到主屏幕"
   - 图标会出现在你的主屏幕，打开后就像一个原生 App

6. **离线使用**
   - 第一次打开需要联网（下载并缓存所有资源）
   - 之后即使没有网络也可以正常使用
   - 所有学习进度保存在设备本地

---

## 方法二：本地文件直接打开

如果不想用 GitHub，也可以直接用手机浏览器打开 HTML 文件：

1. 把 `index.html` 发送到手机（微信/AirDrop/邮件）
2. 用文件管理器找到文件，用浏览器打开
3. 注意：这种方式不支持 Service Worker（无法离线缓存），但 localStorage 仍然可以保存进度

---

## 文件说明

| 文件 | 作用 |
|------|------|
| `index.html` | 主应用（包含全部 1000 个 Fry 词汇和例句） |
| `sw.js` | Service Worker（实现离线缓存） |
| `manifest.json` | PWA 配置（添加到主屏幕的图标和名称） |

## 技术说明

- 进度数据存储在浏览器 localStorage 中
- 每个设备的进度独立（不会跨设备同步）
- 发音使用设备自带的 Web Speech API
- 首次加载需要网络（React CDN），之后完全离线可用
