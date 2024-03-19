import SwiftUI
import ComposableArchitecture

struct SecondTreeView: View {
	@Bindable var store: StoreOf<SecondTreeFeature>
	
	var body: some View {
		NavigationStack(
			path: $store.scope(state: \.path, action: \.path)
		) {
			VStack {
				Button("First Stack") { store.send(.goFirst) }
				Button("Second Stack") { store.send(.goSecond) }
				
				Text("SecondTreeView")
				Button("Close") { store.send(.closeButtonTapped) }
			}
		} destination: { store in
			switch store.state {
			case .firstView:
				if let store = store.scope(state: \.firstView, action: \.firstView) {
					FirstStackView(store: store)
				}
			case .secondView:
				if let store = store.scope(state: \.secondView, action: \.secondView) {
					SecondStackView(store: store)
				}
			}
		}
	}
}
