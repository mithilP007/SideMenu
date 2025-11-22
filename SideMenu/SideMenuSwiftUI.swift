import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func sideMenu(isPresented: Binding<Bool>, menu: @escaping () -> AnyView) -> some View {
        self.modifier(SideMenuModifier(isPresented: isPresented, menu: menu))
    }
}

struct SideMenuModifier: ViewModifier {
    @Binding var isPresented: Bool
    let menu: () -> AnyView

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                menu()
                Color.black.opacity(0.4)
                  .ignoresSafeArea()
                  .onTapGesture { isPresented = false }
            }
        }
    }
}
