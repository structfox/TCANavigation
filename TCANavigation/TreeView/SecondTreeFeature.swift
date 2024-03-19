import Foundation
import ComposableArchitecture

@Reducer
struct SecondTreeFeature {
	@Dependency(\.dismiss) var dismiss
	
	@ObservableState
	struct State {
		var path = StackState<Path.State>()
	}
	
	enum Action {
		case path(StackAction<Path.State, Path.Action>)
		case goFirst
		case goSecond
		case closeButtonTapped
	}
	
	@Reducer
	enum Path {
		case firstView(FirstStackFeature)
		case secondView(SecondStackFeature)
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .goFirst:
				state.path.append(.firstView(FirstStackFeature.State()))
			case .goSecond:
				state.path.append(.secondView(SecondStackFeature.State()))
			case .closeButtonTapped:
				return .run { _ in await self.dismiss() }
			case .path:
				break
			}
			return .none
		}
		.forEach(\.path, action: \.path)
	}
}
