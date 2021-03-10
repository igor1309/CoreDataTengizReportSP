#  Core Data Stack README

For Core Data Stack to be testable it needs to be defined with explicit use of NSManagedObjectModel as static property. That prevents from using such Core Data Stack definition in Swift Package.  


**Model in Framework Bundle**
> Donny Wals: I'm using a subclass so the persistent container will look for the data model in the framework bundle rather than the app bundle


##  CoreData Stack & iCloud

Use **NSPersistentCloudKitContainer** to define CoreData Stack with CloudKit.

Donny Wals “Practical Core Data”:  
1. Switch to using an NSPersistentCloudKitContainer  
2. Enable persistent history tracking  
3. Add the CloudKit capability to your project  
4. Create a CloudKit container for your app  
5. Add the required background capabilities  
6. Mark your model configuration to be used with CloudKit  

## Signing & Capabilities  
for **App** & **Widget** targets: 

* Add **App Groups** named "group.com.`<developer>`.`<name>`" with the same name for App and Widget targets.
* Use it in code defining CoreData Stack use `.containerURL(forSecurityApplicationGroupIdentifier: "group.com.<developer>.<name>")`.  
* In **Background Modes** add *Remote Notifications*.  
* In **iCloud** check *CloudKit* with the same container for App and Widget `iCloud.com.<developer>.<name>` ("iCloud" part is auto-added by Xcode).  

## Migration  

* Practical CoreData by Donny Wals, chapter 9  
* [How to migrate existing Core Data to Shared App Group for use in extension? - Stack Overflow](https://stackoverflow.com/a/57020353/11793043)  

## Migrate to Group App Container

* [swift - Migrating Data to App Groups Disables iCloud Syncing - Stack Overflow](https://stackoverflow.com/a/64359268/11793043)  
* [objective c - iOS 11+ How to migrate existing Core Data to Shared App Group for use in extension? - Stack Overflow](https://stackoverflow.com/a/57020353/11793043) 
* [swift - How to Migrate Core Data's Data to App Group's Data - Stack Overflow](https://stackoverflow.com/questions/61846766/how-to-migrate-core-datas-data-to-app-groups-data)  
* [Sharing data using Core Data: iOS App and Extension | by Mani Batra | Medium](https://medium.com/@manibatra23/sharing-data-using-core-data-ios-app-and-extension-fb0a176eaee9)  


***
### References  

* Practical CoreData by Donny Wals, chapter 8  
* [Core Data by Tutorials, Chapter 10](https://store.raywenderlich.com/products/core-data-by-tutorials)  
* [Designing a great model – Hacking with Swift+](https://www.hackingwithswift.com/plus/ultimate-portfolio-app/designing-a-great-model) (for App Settings & CoreDate Stack)
* [CloudKit Tutorial: Getting Started | raywenderlich.com](https://www.raywenderlich.com/4878052-cloudkit-tutorial-getting-started)
* [Using Core Data With CloudKit - WWDC 2019 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2019/202/)  
* [Enabling CloudKit in Your App](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/CloudKitQuickStart/EnablingiCloudandConfiguringCloudKit/EnablingiCloudandConfiguringCloudKit.html)
* [Setting Up Core Data with CloudKit | Apple Developer Documentation](https://developer.apple.com/documentation/coredata/mirroring_a_core_data_store_with_cloudkit/setting_up_core_data_with_cloudkit)
* [Syncing a Core Data Store with CloudKit | Apple Developer Documentation](https://developer.apple.com/documentation/coredata/mirroring_a_core_data_store_with_cloudkit/syncing_a_core_data_store_with_cloudkit)  
* [swift3 - How to sync records between Core Data and CloudKit efficiently - Stack Overflow](https://stackoverflow.com/a/56619225/11793043)  
* why need explicit use of NSManagedObjectModel? [Testing development data – Hacking with Swift+](https://www.hackingwithswift.com/plus/ultimate-portfolio-app/testing-development-data)  
