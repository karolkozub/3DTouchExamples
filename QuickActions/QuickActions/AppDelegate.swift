//
//  AppDelegate.swift
//  QuickActions
//
//  Created by Karol Kozub on 2016-02-19.
//  Copyright © 2016 Karol Kozub. All rights reserved.
//

import UIKit
import ContactsUI


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let contactStore = CNContactStore()

        contactStore.requestAccessForEntityType(.Contacts) {_,_ in
            do {
                // This will crash if the contact doesn't exist
                // Use a name that exists in your contacts
                let contact = try contactStore.unifiedContactsMatchingPredicate(CNContact.predicateForContactsMatchingName("Karol Kozub"), keysToFetch: []).first!

                self.setupShortcutItems(contact)

            } catch _ {
            }
        }

        return true
    }

    func setupShortcutItems(contactFromContactStore: CNContact) {
        let iconTypeIcon = UIApplicationShortcutIcon(type: .Search)
        let iconTypeItem = UIApplicationShortcutItem(type: "icon-type-item",
            localizedTitle: "Search",
            localizedSubtitle: "icon from an icon type",
            icon: iconTypeIcon,
            userInfo: nil)

        let templateIcon = UIApplicationShortcutIcon(templateImageName: "triangle")
        let templateItem = UIApplicationShortcutItem(type: "template-item",
            localizedTitle: "Triangle",
            localizedSubtitle: "icon from template image",
            icon: templateIcon,
            userInfo: nil)

        let contactStoreContactIcon = UIApplicationShortcutIcon(contact: contactFromContactStore)
        let contactStoreContactItem = UIApplicationShortcutItem(type: "real-contact-item",
            localizedTitle: "Karol",
            localizedSubtitle: "icon from real contact",
            icon: contactStoreContactIcon,
            userInfo: nil)

        let temporaryContact = CNMutableContact()
        temporaryContact.givenName = "Hiro";
        temporaryContact.familyName = "Protagonist";

        // this will be ignored
        temporaryContact.imageData = UIImagePNGRepresentation(UIImage(named: "triangle")!)

        let temporaryContactIcon = UIApplicationShortcutIcon(contact: temporaryContact)
        let temporaryContactItem = UIApplicationShortcutItem(type: "temporary-contact-item",
            localizedTitle: "Hiro",
            localizedSubtitle: "icon from tmp contact",
            icon: temporaryContactIcon,
            userInfo: nil)

        UIApplication.sharedApplication().shortcutItems = [iconTypeItem, templateItem,
            contactStoreContactItem, temporaryContactItem]
    }

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        completionHandler(true)
    }
}

