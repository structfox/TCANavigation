import SwiftUI
import ComposableArchitecture

struct SecondStackView: View {
	@State var store: StoreOf<SecondStackFeature>
	
	var body: some View {
		Text("SecondStackView")
		Button("Close") { store.send(.closeButtonTapped) }
	}
}
