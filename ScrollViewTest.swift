import SwiftUI

// PreferenceKey: ScrollView 내부 좌표계(named: "SCROLL") 기준에서 target의 minY를 전달
private struct TargetMinYKey: PreferenceKey {
    static var defaultValue: CGFloat = .greatestFiniteMagnitude
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct DividerThenStickyExample: View {
    // 측정값 / 상태
    @State private var targetMinY: CGFloat = .greatestFiniteMagnitude
    @State private var showSticky: Bool = false

    // 레이아웃 상수 — 실제 레이아웃에 맞게 조절하세요
    private let headerHeight: CGFloat = 80
    private let searchHeight: CGFloat = 56
    private let stickyHeight: CGFloat = 40
    /// 스티키가 상단(고정된 헤더들 아래)에 붙을 때 추가 여유(px). 헤더가 있을 때 '좀 여유' 둔다고 하셔서 기본 6px 줌.
    private let stickyTopExtra: CGFloat = 6 // 없어도 될듯

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    // 1) 고정 헤더 (스크롤되지 않음)
                    headerView
                        .frame(height: headerHeight)

                    // 2) 고정 검색창 (스크롤되지 않음)
                    searchView
                        .frame(height: searchHeight)
                        .padding(.bottom, 8)

                    // 4) ScrollView (부분 높이)
                    ScrollView {
                        VStack(spacing: 12) {
                            // 위쪽 여유 콘텐츠(예시)
                            ForEach(0 ..< 3) { i in
                                Text("비스크롤 컨텐츠 \(i)")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 80)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }

                            // -----------------------------
                            // 여기가 '타겟 위치' 입니다.
                            // 평상시엔 얇은 디바이더만 보이고 (height:5),
                            // 스크롤되어 이 위치가 ScrollView의 보이는 top(=y == 0)에 닿으면 스티키가 나타납니다.
                            // -----------------------------
                            Rectangle()
                                .fill(Color.secondary.opacity(0.6))
                                .frame(height: 5) // 얇은 디바이더
                                .cornerRadius(2.5)
                                .padding(.horizontal)
                                .opacity(showSticky ? 0 : 1)
                                .background(
                                    GeometryReader { proxy in
                                        // 이 값은 ScrollView 내부(=named "SCROLL") 기준의 minY
                                        Color.clear
                                            .preference(key: TargetMinYKey.self,
                                                        value: proxy.frame(in: .named("SCROLL")).minY)
                                    }
                                )

                            // 실제 섹션의 내용(예시) — 필요하면 여기에 섹션 아이템을 넣으세요.
                            VStack(spacing: 8) {
                                Text("이 섹션의 컨텐츠")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(Color(.systemBackground))
                                    .cornerRadius(8)
                                    .shadow(radius: 1)
                            }
                            .padding(.horizontal)

                            // 이후 스크롤용 더미 콘텐츠
                            ForEach(0 ..< 10) { i in
                                Text("아이템 \(i)")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 80)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }

                            Spacer().frame(height: 40)
                        } // VStack
                        .padding(.vertical)
                    } // ScrollView
                    .coordinateSpace(name: "SCROLL")
                    // ScrollView의 높이: 화면에서 차지하는 영역을 계산해서 줌
                    .frame(height: geo.size.height - (headerHeight + searchHeight))
                } // VStack

                // ==========================
                // 스티키 오버레이 (조건부)
                // 위치: 고정 상단들 바로 아래(=ScrollView의 visible top)
                // ==========================
                if showSticky {
                    stickyView
                        .frame(height: stickyHeight)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        // padding top을 통해 '스크롤 영역의 상단' 위치로 내립니다.
                        .padding(.top, headerHeight + searchHeight + stickyTopExtra)
                        .transition(.opacity)
                        .zIndex(10)
                }
            } // ZStack
            // Preference 변화 수신 — 타겟의 minY가 변할 때마다 showSticky 판단
            .onPreferenceChange(TargetMinYKey.self) { newMinY in
                targetMinY = newMinY
                evaluateSticky()
            }
            .animation(.easeInOut(duration: 0.12), value: showSticky)
        } // GeometryReader
    }

    // 스티키 표시/숨김 판단
    private func evaluateSticky() {
        guard targetMinY != .greatestFiniteMagnitude else { return }
        // 기준: ScrollView의 보이는 영역 최상단에서 타겟의 top(minY)가 0 이하이거나, 조금 여유를 주려면 <= x 로 조절
        let shouldShow = targetMinY <= 40

        if shouldShow != showSticky {
            withAnimation {
                showSticky = shouldShow
            }
        }
    }

    // MARK: - 서브뷰들 (간단)
    private var headerView: some View {
        ZStack { Color(.systemBlue); Text("헤더").foregroundColor(.white).bold() }
    }

    private var searchView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("검색", text: .constant(""))
        }
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(.horizontal)
    }

    private var topArea: some View {
        ZStack { Color(.systemTeal); Text("고정 상단 영역").foregroundColor(.white).bold() }
    }

    private var stickyView: some View {
        HStack {
            Text("B: 스티키 (높이 40)")
                .bold()
            Spacer()
        }
        .padding(.horizontal)
    }
}

// Preview
struct DividerThenStickyExample_Previews: PreviewProvider {
    static var previews: some View {
        DividerThenStickyExample()
            .previewDevice("iPhone 14")
    }
}
