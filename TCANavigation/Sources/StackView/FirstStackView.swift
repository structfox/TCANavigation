import SwiftUI
import ComposableArchitecture

struct FirstStackView: View {
	@State var store: StoreOf<FirstStackFeature>
	
	var body: some View {
		Text("FirstStackView")
		Button("Close") { store.send(.closeButtonTapped) }
	}
}
