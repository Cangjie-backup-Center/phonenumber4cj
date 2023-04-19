/*
 * Copyright (c) Cangjie Library Team 2023-2023. All rights reserved.
 */

/**
 * @file The file declars the PhoneNumberToTimeZonesMapper class.
 */

package geocoder

from std import collection.*
from std import sync.*
import libphonenumber.*
import libphonenumber.metadata.*
import libphonenumber.inter.*
import prefixmapper.*

func loadUnKnownTimeZone(): ArrayList<String> {
    var arr: ArrayList<String> = ArrayList<String>(1)
    arr.append("Etc/Unknown")
    return arr
}

public class PhoneNumberToTimeZonesMapper {
    static let UNKNOWN_TIME_ZONE_LIST: ArrayList<String> = loadUnKnownTimeZone()
    private static let lock = ReentrantMutex()
    private static let UNKNOWN_TIMEZONE: String = "Etc/Unknown"
    private static var instance: Option<PhoneNumberToTimeZonesMapper> = Option<PhoneNumberToTimeZonesMapper>.None
    private var phonePrefixDataDirectory: String = ""
    private let prefixFileReader: PrefixFileReader
    private let phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()

    init(phonePrefixDataDirectory: String) {
        prefixFileReader = PrefixFileReader(phonePrefixDataDirectory)
    }

    public static func getInstance(): Option<PhoneNumberToTimeZonesMapper> {
        synchronized(lock) {
            match (instance) {
                case None => 
                    instance = PhoneNumberToTimeZonesMapper("")
                case _ => ()
            }
        }
        return instance.getOrThrow()
    }

    public func getTimeZonesForGeographicalNumber(number: PhoneNumber): ArrayList<String> {
        return getTimeZonesForGeocodableNumber(number)
    }

    public func getTimeZonesForNumber(number: PhoneNumber): ArrayList<String> {
        var numberType: PhoneNumberType = PhoneNumberUtil.getInstance().getOrThrow().getNumberType(number)
        if (numberType == PhoneNumberType.UNKNOWN) {
            return UNKNOWN_TIME_ZONE_LIST
        } else {
            return getTimeZonesForGeographicalNumber(number)
        }
    }

    private func getTimeZonesForGeocodableNumber(number: PhoneNumber): ArrayList<String> {
        let timezones: ArrayList<String> = prefixFileReader.lookupTimeZonesForNumber(number)
        if (timezones.isEmpty()) {
            return UNKNOWN_TIME_ZONE_LIST
        }
        return timezones
    }

    public static func getUnknownTimeZone(): String {
        return UNKNOWN_TIMEZONE
    }
}
