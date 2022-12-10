//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <clipboard_watcher/clipboard_watcher_plugin.h>
#include <contextual_menu/contextual_menu_plugin.h>
#include <desktop_context_menu_windows/desktop_context_menu_windows_plugin.h>
#include <desktop_drop/desktop_drop_plugin.h>
#include <desktop_webview_window/desktop_webview_window_plugin.h>
#include <file_selector_windows/file_selector_windows.h>
#include <hotkey_manager/hotkey_manager_plugin.h>
#include <local_notifier/local_notifier_plugin.h>
#include <pasteboard/pasteboard_plugin.h>
#include <screen_capturer/screen_capturer_plugin.h>
#include <screen_retriever/screen_retriever_plugin.h>
#include <screen_text_extractor/screen_text_extractor_plugin.h>
#include <system_tray/system_tray_plugin.h>
#include <tray_manager/tray_manager_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>
#include <win_toast/win_toast_plugin.h>
#include <window_manager/window_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ClipboardWatcherPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ClipboardWatcherPlugin"));
  ContextualMenuPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ContextualMenuPlugin"));
  DesktopContextMenuWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopContextMenuWindowsPlugin"));
  DesktopDropPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopDropPlugin"));
  DesktopWebviewWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopWebviewWindowPlugin"));
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  HotkeyManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("HotkeyManagerPlugin"));
  LocalNotifierPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("LocalNotifierPlugin"));
  PasteboardPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PasteboardPlugin"));
  ScreenCapturerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenCapturerPlugin"));
  ScreenRetrieverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
  ScreenTextExtractorPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenTextExtractorPlugin"));
  SystemTrayPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SystemTrayPlugin"));
  TrayManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("TrayManagerPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
  WinToastPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WinToastPlugin"));
  WindowManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowManagerPlugin"));
}
