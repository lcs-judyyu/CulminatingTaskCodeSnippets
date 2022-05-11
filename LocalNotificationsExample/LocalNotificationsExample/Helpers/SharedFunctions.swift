//
//  SharedFunctions.swift
//  LocalNotificationsExample
//
//  Created by Russell Gordon on 2022-05-09.
//

import Foundation
import os
import UserNotifications

// Purpose:
//
// These two functions combined allow local notifications to be scheduled by the application.

/// Invoke this function once prior to the first time a notification needs to be published.
/// The user is prompted to allow this app to send them notifications.
func askNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            Logger().notice("Permission to receive notifications has been granted by the user.")
        } else if let error = error {
            Logger().notice("\(error.localizedDescription)")
        }
    }
}

/// Publish a local notification that runs after a specified wait time in seconds; creates a non-repeating notification.
/// Example arguments are for an application that allows a student to request campus leave and report back in when on campus again. See [this article for full details](https://developer.apple.com/documentation/usernotifications/scheduling_a_notification_locally_from_your_app) and [this article for how to handle notifications delivered while your app is running in the foreground](https://developer.apple.com/documentation/usernotifications/handling_notifications_and_notification-related_actions).
/// - Parameters:
///   - title: The title of the notification; should be kept brief. e.g.: "Return to Campus Suggested"
///   - subtitle: The subtitle of the notification; should be kept brief. e.g.: "40 minutes of leave time remain"
///   - body: The body of the notification; can be somewhat longer. "Walking time from Foodland to campus is about 32 minutes."
///   - timeUntil: A length of time, measured in seconds, until the notification will be published.
///   - identifier: A unique identifier for notifications published by this app, e.g.: "com.mydomainname.localnotificationsexample"
/// - Tag: notifications_time_interval
func publishNotification(title: String,
                         subtitle: String,
                         body: String,
                         timeUntil: Double,
                         identifier: String = UUID().uuidString) {
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.subtitle = subtitle
    content.body = body
    content.sound = UNNotificationSound.default
    
    // Show this notification x number of seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeUntil, repeats: false)
    
    // Choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // Add our notification request
    UNUserNotificationCenter.current().add(request)
    
    // Report
    Logger().notice("Notification has been scheduled.")
    
}

/// Publish a local notification that runs at a particular day and time of the week.
/// - Parameters:
///   - title: The title of the notification; should be kept brief.
///   - subtitle: The subtitle of the notification; should be kept brief.
///   - body: The body of the notification; can be somewhat longer.
///   - onDay: An integer in the range 1 to 7, where Sunday is day 1.
///   - atHour: An integer in the range 0 to 23, where midnight is 0 and 11 PM is 23.
///   - atMinute: An integer in the range 0 to 59.
///   - recurring: Whether this notification should repeat.
///   - identifier: A unique identifier for notifications published by this app, e.g.: "com.mydomainname.localnotificationsexample"
/// - Tag: notifications_date_time
func publishNotification(title: String,
                         subtitle: String,
                         body: String,
                         onDay: Int,
                         atHour: Int,
                         atMinute: Int = 0,
                         recurring: Bool,
                         identifier: String = UUID().uuidString) {
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.subtitle = subtitle
    content.body = body
    content.sound = UNNotificationSound.default
    
    // Configure the day / time to deliver this notification
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    dateComponents.weekday = onDay
    dateComponents.hour = atHour
    dateComponents.minute = atMinute
    
    // Show this notification x number of seconds from now
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: recurring)
    
    // Choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // Add our notification request
    UNUserNotificationCenter.current().add(request)
    
    // Report
    Logger().notice("Notification has been scheduled.")
    
}
