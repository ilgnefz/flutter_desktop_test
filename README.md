# flutter_desktop_test

该项目的作用是用于学习Flutter Desktop开发常用功能插件。

目前所有内容仅适用于 Windows 端，Liunx 和 macOs平台可能需要另外进行配置，具体请查看各个第三方插件的官方文档。

目前该应用已拥有以下功能：

- [x] 发送桌面端悬浮通知 —— [local_notifier](https://pub.dev/packages/local_notifier) 、[win_toast](https://pub.dev/packages/win_toast)

  > 详细教程：[Flutter桌面端开发——发送本地悬浮通知🔔](https://juejin.cn/post/7074482758747160590)

- [x] 应用系统托盘管理 —— [tray_manager](https://pub.dev/packages/tray_manager) 、[system_tray](https://pub.dev/packages/system_tray)

  > 详细教程：[Flutter桌面端开发——系统托盘](https://juejin.cn/post/7074873704773058568)

- [x] 文件拖入程序 —— [desktop_drop](https://pub.dev/packages/desktop_drop)

  > 详细教程：[Flutter桌面端开发——拖动文件到应用](https://juejin.cn/post/7075261040744726559)

- [ ] 选取本地文件 —— [file_selector](https://pub.dev/packages/file_selector) 、[file_picker](https://pub.dev/packages/file_picker)

一些辅助插件：

- [window_manager](https://pub.dev/packages/window_manager)：强大的桌面程序管理插件
- [provider](https://pub.dev/packages/provider)：跨组件状态管理插件
- [bot_toast](https://pub.dev/packages/bot_toast)：展示 Toast 信息插件
- [cross_file](https://pub.dev/packages/cross_file)：文件信息管理插件
- [dotted_decoration](https://pub.dev/packages/dotted_decoration)：绘制虚线插件
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)：瀑布流显示插件

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

如果你是初学者，以下内容可以帮助你：

- [Flutter中文官网](https://flutter.cn/)
- [《Flutter实战第二版》](https://book.flutterchina.club/)
- [《Flutter实战入门》](http://laomengit.com/guide/introduction/mobile_system.html)
- [FlutterUnit](https://github.com/toly1994328/FlutterUnit)

