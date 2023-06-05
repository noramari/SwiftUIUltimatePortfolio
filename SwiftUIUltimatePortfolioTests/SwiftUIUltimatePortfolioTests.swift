//
//  SwiftUIUltimatePortfolioTests.swift
//  SwiftUIUltimatePortfolioTests
//
//  Created by Noora Maeda on 2023/06/05.
//

import CoreData
import XCTest
@testable import SwiftUIUltimatePortfolio

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
