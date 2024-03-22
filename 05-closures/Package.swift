// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "05-closures",
	products: [
		.executable(name: "05-closures", targets: ["05-closures"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "05-closures", dependencies: [])
	]
)
