//
//  AssetTests.swift
//  SwiftUIUltimatePortfolioTests
//
//  Created by Noora Maeda on 2023/06/05.
//

import XCTest
@testable import SwiftUIUltimatePortfolio

final class AssetTests: XCTestCase {
    func testColorsExist() {
        let allColors = ["Dark Blue", "Dark Gray", "Gold", "Gray", "Green",
                        "Light Blue", "Midnight", "Orange", "Pink", "Purple", "Red", "Teal"]

        for color in allColors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }

    func testAwardsLoadCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
