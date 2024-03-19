import SwiftUI
import ComposableArchitecture

struct FirstTreeView: View {
	@State var store: StoreOf<FirstTreeFeature>
	
	var body: some View {
		Text("FirstTreeView")
		Button("Close") { store.send(.closeButtonTapped) }
	}
}
