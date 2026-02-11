/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

/**
 * @file The file declars the PhoneNumberToTimeZonesMapper class.
 */

package cangjie_tpc::phonenumber4cj.geocoder

import std.collection.*
import std.sync.*
import cangjie_tpc::phonenumber4cj.libphonenumber.*
import cangjie_tpc::phonenumber4cj.libphonenumber.metadata.*
import cangjie_tpc::phonenumber4cj.libphonenumber.inter.*
import cangjie_tpc::phonenumber4cj.prefixmapper.*

func loadUnKnownTimeZone(): ArrayList<String> {
    var arr: ArrayList<String> = ArrayList<String>(1)
    arr.add("Etc/Unknown")
    return arr
}

public class PhoneNumberToTimeZonesMapper {
    static let UNKNOWN_TIME_ZONE_LIST: ArrayList<String> = loadUnKnownTimeZone()
    private static let lock = Mutex()
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
