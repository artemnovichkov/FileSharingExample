#!/usr/bin/env xcrun --sdk macosx swift

import Foundation

enum Configuration: String {
    case debug = "Debug"
    case release = "Release"
}

// Get Info.plist path
guard let productSettingsPathRawValue = getenv("PRODUCT_SETTINGS_PATH"),
    let productSettingsPath = String(utf8String: productSettingsPathRawValue) else {
        exit(1)
}

guard let configurationRawValue = getenv("CONFIGURATION"),
    let configurationString = String(utf8String: configurationRawValue),
    let configuration = Configuration(rawValue: configurationString) else {
        exit(1)
}

// Check product settings
guard let productSettings = NSMutableDictionary(contentsOfFile: productSettingsPath) else {
    exit(1)
}

switch configuration {
case .debug:
    productSettings["LSSupportsOpeningDocumentsInPlace"] = true
    productSettings["UIFileSharingEnabled"] = true
case .release:
    productSettings["LSSupportsOpeningDocumentsInPlace"] = nil
    productSettings["UIFileSharingEnabled"] = nil
}

productSettings.write(toFile: productSettingsPath, atomically: true)
