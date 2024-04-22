// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "07-class",
	products: [
		.executable(name: "07-class", targets: ["07-class"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "07-class", dependencies: [])
	]
)
