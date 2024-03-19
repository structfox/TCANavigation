import Foundation
import ComposableArchitecture

@Reducer
struct AppFeature {
	@ObservableState
	struct State {
		@Presents var destination: Destination.State?
		var contentViewState = ContentFeature.State()
	}
	
	enum Action {
		case destination(PresentationAction<Destination.Action>)
		case contentFeature(ContentFeature.Action)
	}
	
	@Reducer
	enum Destination {
		case firstView(FirstTreeFeature)
		case secondView(SecondTreeFeature)
	}
	
	var body: some ReducerOf<Self> {
		Scope(state: \.contentViewState, action: \.contentFeature) {
			ContentFeature()
		}
		
		Reduce { state, action in
			switch action {
			case .contentFeature(.goFirst):
				state.destination = .firstView(FirstTreeFeature.State())
			case .contentFeature(.goSecond):
				state.destination = .secondView(SecondTreeFeature.State())
			case .destination:
				break
			}
			return .none
		}
		.ifLet(\.$destination, action: \.destination)
	}
}

@Reducer
struct ContentFeature {
	@ObservableState
	struct State {
	}
	
	enum Action {
		case goFirst
		case goSecond
	}
	
	var body: some ReducerOf<Self> {
		Reduce { _, _ in
			return .none
		}
	}
}
