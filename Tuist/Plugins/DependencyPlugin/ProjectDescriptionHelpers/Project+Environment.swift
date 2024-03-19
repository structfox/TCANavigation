import Foundation
import ProjectDescription

public extension Project {
	enum Environment {
		public static let iOSDeploymentTarget = DeploymentTargets.iOS("17.0")
		public static let macOSDeploymentTarget = DeploymentTargets.macOS("14.0")
		public static let bundlePrefix = "kr.sfox"
		
	}
}
