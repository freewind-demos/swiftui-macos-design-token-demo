# SwiftUI macOS Design Token 主题系统

## 简介

演示 SwiftUI 中 Design Token 的用法，统一管理应用的视觉风格。

## 快速开始

```bash
cd swiftui-macos-design-token-demo
xcodegen generate
open SwiftUIDesignTokenDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### Design Token 结构

```swift
enum Design {
    enum Colors {
        static let primary = Color.blue
        static let secondary = Color.gray
    }

    enum Spacing {
        static let md: CGFloat = 16
    }
}
```

### 使用

```swift
Text("Hello")
    .foregroundColor(Design.Colors.primary)
    .padding(Design.Spacing.md)
```

## 完整示例

```swift
enum Design {
    static let primary = Color.blue
    static let spacing: CGFloat = 16
}

Button("Click")
    .padding(Design.spacing)
    .background(Design.primary)
```

## 完整讲解（中文）

### Design Token 的好处

1. **统一管理**：所有视觉属性在一个地方
2. **易于维护**：改一处全局生效
3. **主题切换**：可以支持多主题
4. **团队协作**：设计规范代码化
