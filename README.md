# flutter_desktop_test

![img](https://github.com/ilgnefz/flutter_desktop_test/blob/main/img.png)

该项目的作用是学习Flutter Desktop开发常用功能插件。

目前所有内容仅适用于 Windows 端，Liunx 和 macOS平台可能需要另外进行配置，具体请查看各个第三方插件的官方文档。

目前该应用已拥有以下功能：

- [x] 发送桌面端悬浮通知 —— [local_notifier](https://pub.dev/packages/local_notifier) 、[win_toast](https://pub.dev/packages/win_toast)

  > 详细教程：[Flutter桌面端开发——发送本地悬浮通知🔔](https://juejin.cn/post/7074482758747160590)

- [x] 应用系统托盘管理 —— [tray_manager](https://pub.dev/packages/tray_manager) 、[system_tray](https://pub.dev/packages/system_tray)

  > 详细教程：[Flutter桌面端开发——系统托盘](https://juejin.cn/post/7074873704773058568)

- [x] 文件拖入程序 —— [desktop_drop](https://pub.dev/packages/desktop_drop)

  > 详细教程：[Flutter桌面端开发——拖动文件到应用](https://juejin.cn/post/7075261040744726559)

- [x] 选取本地文件 —— [file_selector](https://pub.dev/packages/file_selector) 、[file_picker](https://pub.dev/packages/file_picker)

  > 详细教程：[Flutter桌面端开发——选择读取本地文件](https://juejin.cn/post/7075889517210632200/)
  
- [x] 复制和粘贴内容 —— [screen_capturer](https://pub.dev/packages/screen_capturer) 、[screen_text_extractor](https://pub.dev/packages/screen_text_extractor) 、[pasteboard](https://pub.dev/packages/pasteboard) 、[clipboard](https://pub.dev/packages/clipboard)

  > 详细教程：[Flutter桌面端开发——复制和粘贴内容](https://juejin.cn/post/7076983397691686919/)
  
- [x] 打开Web窗口 —— [desktop_webview_window](https://pub.dev/packages/desktop_webview_window)

  > 详细教程：[Flutter桌面端开发——WebView](https://juejin.cn/post/7078481800846114847/)
  
- [x] 上下文菜单 —— [context_menus](https://pub.dev/packages/context_menus) 、[contextmenu](https://pub.dev/packages/contextmenu) 、~~[native_context_menu](https://pub.dev/packages/native_context_menu)~~、[desktop_context_menu](https://pub.dev/packages/desktop_context_menu)、[contextual_menu](https://pub.dev/packages/contextual_menu)

  > 详细教程：[Flutter桌面端开发——上下文菜单](https://juejin.cn/post/7081069597591339039/)
  
- [x] MouseRegion组件

  > 简单介绍：[鼠标事件组件MouseRegion](https://www.cnblogs.com/ilgnefz/p/16141838.html)
  
- [x] 自定义Tooltip

  > 简单教程：[Flutter自定义Tooltip](https://www.cnblogs.com/ilgnefz/p/16143779.html)

- [x] 快捷键的使用 —— [hotkey_manager](https://pub.dev/packages/hotkey_manager)
  > 详细教程：[Flutter桌面端开发——快捷键](https://www.cnblogs.com/ilgnefz/p/16257263.html)
  

一些辅助插件：

- [window_manager](https://pub.dev/packages/window_manager)：强大的桌面程序管理插件
- [provider](https://pub.dev/packages/provider)：跨组件状态管理插件
- [bot_toast](https://pub.dev/packages/bot_toast)：展示 Toast 信息插件
- [cross_file](https://pub.dev/packages/cross_file)：文件信息管理插件
- [dotted_decoration](https://pub.dev/packages/dotted_decoration)：绘制虚线插件
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)：瀑布流显示插件
- [url_launcher](https://pub.dev/packages/url_launcher) ：运行URL的插件
- [path_provider](https://pub.dev/packages/path_provider) ：用于查找文件系统上常用位置

## 使用

👻注意：在进行以下操作前，请确保你已安装了 Flutter 开发桌面端必备的程序和库

下载或克隆该库到本地，使用 VScode 或 Android Studio打开，运行以下命令

```shell
flutter pub get
```

获取完所需内容后运行以下命令以运行程序

```shell
flutter run -d windows
```

如果你想要项目运行在新平台，请使用以下命令：

```shell
flutter create --platforms=web,macos,linux .
```

如果你是初学者，以下内容可以帮助到你：

- [Flutter中文官网](https://flutter.cn/)
- [《Flutter实战第二版》](https://book.flutterchina.club/)
- [《Flutter实战入门》](http://laomengit.com/guide/introduction/mobile_system.html)
- [FlutterUnit](https://github.com/toly1994328/FlutterUnit)

