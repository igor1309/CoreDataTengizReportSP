// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDataTengizReportSP",
    platforms: [
        .macOS(.v10_15), .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreDataTengizReportSP",
            targets: ["CoreDataTengizReportSP"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreDataTengizReportSP",
            dependencies: [],
            resources: [.process("Core Data Stack/Core Data Stack README.md")]
        ),
        .testTarget(
            name: "CoreDataTengizReportSPTests",
            dependencies: ["CoreDataTengizReportSP"],
            resources: [.process("CoreDataUnitTests/Unit Testing Core Date README.md")]
        ),
    ]
)
