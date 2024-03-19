import Foundation
import ComposableArchitecture

@Reducer
struct FirstTreeFeature {
	@Dependency(\.dismiss) var dismiss

	@ObservableState
	struct State {}

	enum Action {
		case closeButtonTapped
	}

	var body: some Reducer<State, Action> {
		Reduce { state, action in
			switch action {
			case .closeButtonTapped:
				return .run { _ in await self.dismiss() }
			}
		}
	}
}
