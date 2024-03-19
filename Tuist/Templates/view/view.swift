import ProjectDescription

let viewName: Template.Attribute = .required("name")

let tree = Template(
	description: "새로운 View을 생성하기 위한 템플릿 입니다.",
	attributes: [
		viewName
	],
	items: [
		.file(path: "\(viewName)/\(viewName)View.swift",    templatePath: "View.stencil"),
		.file(path: "\(viewName)/\(viewName)Feature.swift", templatePath: "Feature.stencil"),
	]
)
