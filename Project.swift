import ProjectDescription
import DependencyPlugin
import Foundation

let appName = "TCANavigation"

let project = Project(
	name: "\(appName)",
	packages: [
		.remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.9"))
	],
	targets: [
		.target(
			name: "\(appName)",
			destinations: .iOS,
			product: .app,
			bundleId: "\(Project.Environment.bundlePrefix).\(appName)",
			deploymentTargets: Project.Environment.iOSDeploymentTarget,
			infoPlist: .extendingDefault(
				with: [
					"UILaunchStoryboardName": "LaunchScreen.storyboard",
				]
			),
			sources: ["TCANavigation/Sources/**"],
			resources: ["TCANavigation/Resources/**"],
			scripts: [],
			dependencies: [
				.package(product: "ComposableArchitecture", type: .runtime, condition: .when([.ios, .macos]))
			]
		)
	]
)
