# Magic Key Speller PWA 使用说明

这是 Fry Sight Words 1000 拼写练习 App 的视力友好新版。

## 在 Windows + Edge 安装

1. 解压这个文件夹。
2. 双击 `Open-in-Edge-PWA.bat`。
3. Edge 打开后，点地址栏右侧的“安装应用”图标。
4. 如果没有看到图标，点 Edge 右上角 `...` > `应用` > `将此站点作为应用安装`。

说明：PWA 需要通过本机网址打开，直接双击 `index.html` 通常不会出现安装按钮。

## 在 iPad 或手机使用

推荐把这个文件夹上传到 GitHub Pages、Netlify 或学校/家庭可访问的网址，然后：

- iPad/iPhone：用 Safari 打开网址，点分享按钮，选择“添加到主屏幕”。
- Android：用 Chrome 打开网址，点菜单，选择“添加到主屏幕”或“安装应用”。

## 本次优化内容

- 大字体、大键盘、大字母块，更适合 7 岁孩子和 iPad 观看。
- Star Fill 里的空缺字母可以选位置、拖动换位置、双击清除。
- Key Spell 和 Star Fill 的进度与 End 放到底部，方便点击。
- 发音速度调慢，优先选择清晰的英文语音。
- 答对会说 “Great job!”；答错会说 “Keep trying.”，再慢速读正确单词。
- PWA manifest 改成标准 192/512 图标，Edge 更容易识别安装。

## 文件说明

- `index.html`：主应用。
- `manifest.json`：PWA 安装配置。
- `sw.js`：离线缓存。
- `icons/`：PWA 图标。
- `Open-in-Edge-PWA.bat`：Windows 一键打开 Edge 安装入口。
- `Start-Magic-Key-Speller.ps1`：本机启动脚本。

第一次打开需要联网加载浏览器组件；之后会缓存到本机。学习记录保存在当前设备浏览器中。
