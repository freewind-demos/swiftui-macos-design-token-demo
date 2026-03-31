import SwiftUI

// Design Token 定义
enum Design {
    // 颜色
    enum Colors {
        static let primary = Color.blue
        static let secondary = Color.gray
        static let success = Color.green
        static let warning = Color.orange
        static let danger = Color.red

        static let background = Color(nsColor: .windowBackgroundColor)
        static let card = Color(nsColor: .controlBackgroundColor)
    }

    // 间距
    enum Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
    }

    // 圆角
    enum CornerRadius {
        static let sm: CGFloat = 4
        static let md: CGFloat = 8
        static let lg: CGFloat = 16
    }

    // 字体
    enum Typography {
        static let largeTitle = Font.largeTitle
        static let title = Font.title
        static let headline = Font.headline
        static let body = Font.body
        static let caption = Font.caption
    }

    // 阴影
    enum Shadow {
        static let small = (color: Color.black.opacity(0.1), radius: CGFloat(2), x: CGFloat(0), y: CGFloat(1))
        static let medium = (color: Color.black.opacity(0.15), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(4))
        static let large = (color: Color.black.opacity(0.2), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(8))
    }
}

// 使用 Design Token 的组件
struct TokenCard: View {
    let title: String
    let content: String
    let type: CardType

    enum CardType {
        case primary, success, warning, danger

        var color: Color {
            switch self {
            case .primary: return Design.Colors.primary
            case .success: return Design.Colors.success
            case .warning: return Design.Colors.warning
            case .danger: return Design.Colors.danger
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Design.Spacing.sm) {
            HStack {
                Circle()
                    .fill(type.color)
                    .frame(width: 12, height: 12)

                Text(title)
                    .font(Design.Typography.headline)
            }

            Text(content)
                .font(Design.Typography.body)
                .foregroundColor(Design.Colors.secondary)
        }
        .padding(Design.Spacing.md)
        .background(Design.Colors.card)
        .cornerRadius(Design.CornerRadius.md)
        .shadow(
            color: Design.Shadow.medium.color,
            radius: Design.Shadow.medium.radius,
            x: Design.Shadow.medium.x,
            y: Design.Shadow.medium.y
        )
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: Design.Spacing.lg) {
                Text("Design Token 示例")
                    .font(Design.Typography.largeTitle)

                Text("使用 Design Token 统一管理应用的视觉风格")
                    .font(Design.Typography.body)
                    .foregroundColor(Design.Colors.secondary)

                Divider()

                // 颜色示例
                VStack(alignment: .leading, spacing: Design.Spacing.md) {
                    Text("颜色")
                        .font(Design.Typography.headline)

                    HStack(spacing: Design.Spacing.md) {
                        ForEach([Design.Colors.primary, Design.Colors.success, Design.Colors.warning, Design.Colors.danger], id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 40, height: 40)
                        }
                    }
                }

                // 卡片示例
                VStack(alignment: .leading, spacing: Design.Spacing.md) {
                    Text("卡片组件")
                        .font(Design.Typography.headline)

                    TokenCard(title: "主要信息", content: "这是一个使用 Design Token 的卡片", type: .primary)
                    TokenCard(title: "成功状态", content: "操作已成功完成", type: .success)
                    TokenCard(title: "警告", content: "请注意这个重要提示", type: .warning)
                    TokenCard(title: "错误", content: "发生了某些问题", type: .danger)
                }

                // 按钮示例
                VStack(alignment: .leading, spacing: Design.Spacing.md) {
                    Text("按钮")
                        .font(Design.Typography.headline)

                    HStack(spacing: Design.Spacing.sm) {
                        DesignButton(title: "主要", style: .primary)
                        DesignButton(title: "成功", style: .success)
                        DesignButton(title: "警告", style: .warning)
                        DesignButton(title: "危险", style: .danger)
                    }
                }
            }
            .padding(Design.Spacing.lg)
        }
        .background(Design.Colors.background)
    }
}

struct DesignButton: View {
    let title: String
    let style: TokenCard.CardType

    var body: some View {
        Text(title)
            .font(Design.Typography.body)
            .foregroundColor(.white)
            .padding(.horizontal, Design.Spacing.md)
            .padding(.vertical, Design.Spacing.sm)
            .background(style.color)
            .cornerRadius(Design.CornerRadius.sm)
    }
}
