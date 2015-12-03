//
//  User+CoreDataProperties.swift
//  TestCoreData
//
//  Created by qimuyunduan on 15/12/3.
//  Copyright © 2015年 qimuyunduan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var userEmail: String?
    @NSManaged var userName: String?
    @NSManaged var userPassword: String?
    @NSManaged var userID: String?

}
