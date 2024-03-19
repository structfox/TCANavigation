import SwiftUI
import ComposableArchitecture

struct AppView: View {
	@State var store: StoreOf<AppFeature>
	
	var body: some View {
		if store.destination == nil {
			ContentView(store: store.scope(state: \.contentViewState, action: \.contentFeature))
		} else {
			if let store = store.scope(state: \.destination?.firstView, action: \.destination.firstView) {
				FirstTreeView(store: store)
			}
			
			if let store = store.scope(state: \.destination?.secondView, action: \.destination.secondView) {
				SecondTreeView(store: store)
			}
		}
	}
}


struct ContentView: View {
	@State var store: StoreOf<ContentFeature>
	
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Hello, world!")
			
			Button("first") {
				store.send(.goFirst)
			}
			
			Button("second") {
				store.send(.goSecond)
			}
		}
		.padding()
	}
}
