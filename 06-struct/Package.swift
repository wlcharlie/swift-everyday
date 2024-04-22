// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "06-struct",
	products: [
		.executable(name: "06-struct", targets: ["06-struct"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "06-struct", dependencies: [])
	]
)
