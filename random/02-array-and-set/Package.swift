// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "02-array-and-set",
	products: [
		.executable(name: "02-array-and-set", targets: ["02-array-and-set"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "02-array-and-set", dependencies: [])
	]
)
