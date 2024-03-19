import SwiftUI
import ComposableArchitecture

@main
struct TCANavigationApp: App {
	var body: some Scene {
		WindowGroup {
			AppView(store: Store(initialState: AppFeature.State()) { AppFeature() })
		}
	}
}
