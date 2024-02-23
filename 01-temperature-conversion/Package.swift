// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "01-temperature-conversion",
	products: [
		.executable(name: "01-temperature-conversion", targets: ["01-temperature-conversion"])
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "01-temperature-conversion", dependencies: [])
	]
)
