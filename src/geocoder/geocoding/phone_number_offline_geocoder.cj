/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package phonenumber4cj.geocoder.geocoding

import std.sync.*
import std.collection.*
import phonenumber4cj.libphonenumber.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.inter.*
import phonenumber4cj.prefixmapper.*

public class PhoneNumberOfflineGeocoder {

    private static let lock = Mutex()
    private static var instance: Option<PhoneNumberOfflineGeocoder> = Option<PhoneNumberOfflineGeocoder>.None
    private var phonePrefixDataDirectory: String = ""
    private let prefixFileReader: PrefixFileReader
    private let phoneUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()

    init(phonePrefixDataDirectory: String) {
        prefixFileReader = PrefixFileReader(phonePrefixDataDirectory)
    }

    public static func getInstance(): Option<PhoneNumberOfflineGeocoder> {
        synchronized(lock) {
            match (instance) {
                case None => 
                    instance = PhoneNumberOfflineGeocoder("")
                case _ => ()
            }
        }
        return instance.getOrThrow()
    }

    private func getCountryNameForNumber(number: PhoneNumber, language: Language): String {
        let regionCodes: ArrayList<String> = phoneUtil.getRegionCodesForCountryCode(Int32(number.getCountryCodes()))
        if (regionCodes.size == 1) {
            return getRegionDisplayName(regionCodes.get(0).getOrThrow(), language)
        } else {
            var regionWhereNumberIsValid: String = "ZZ"
        for (regionCode in regionCodes) {
            if (phoneUtil.isValidNumberForRegion(number, regionCode)) {
                if (regionWhereNumberIsValid != "ZZ") {
                    return ""
                }
                regionWhereNumberIsValid = regionCode
            }
        }
            return getRegionDisplayName(regionWhereNumberIsValid, language)
        }
    }

    private func getRegionDisplayName(regionCode: String, language: Language): String {
        if (regionCode.isEmpty() || regionCode == "ZZ" || regionCode == PhoneNumberUtil.REGION_CODE_FOR_NON_GEO_ENTITY) {
            return ""
        }
        if (regionCode == "CN") {
            return language.getDisplayCountryToCN()
        } else if (regionCode == "US") {
            return language.getDisplayCountryToUS()
        } else {
            return ""
        }
    }

    public func getDescriptionForValidNumber(number: PhoneNumber, languageCode: Language): String {
        let scriptStr: String = ""
        let regionStr: String = languageCode.getCountry()
        var areaDescription: String = ""
        let mobileToken: String = PhoneNumberUtil.getCountryMobileToken(Int32(number.getCountryCodes()))
        var nationalNumber: String = phoneUtil.getNationalSignificantNumber(number)
        if (mobileToken != "" && nationalNumber.startsWith(mobileToken)) {
            nationalNumber = nationalNumber[mobileToken.size..]
            let region: String = phoneUtil.getRegionCodeForCountryCode(Int32(number.getCountryCodes()))
            var copiedNumber: PhoneNumber = PhoneNumber()
            try {
                copiedNumber = phoneUtil.parse(nationalNumber, region)
            } catch (e: NumberParseException) {
                copiedNumber = number
            }
            areaDescription = prefixFileReader.getGeoDescriptionForNumber(copiedNumber, languageCode, scriptStr, regionStr)
        } else {
            areaDescription = prefixFileReader.getGeoDescriptionForNumber(number, languageCode, scriptStr, regionStr)
        }
        if (areaDescription.size > 0) {
            return areaDescription
        } else {
            return getCountryNameForNumber(number, languageCode)
        }
    }

    public func getDescriptionForValidNumber(number: PhoneNumber, languageCode: Language, userRegion: String): String {
        let opt = match(phoneUtil.getRegionCodeForNumber(number)) {
            case Some(v) => v
            case None => ""
        }
        if (userRegion == opt) {
            return getDescriptionForValidNumber(number, languageCode)
        }
        return getRegionDisplayName(opt, languageCode)
    }

    public func getDescriptionForNumber(number: PhoneNumber, languageCode: Language): String {
        let numberType: PhoneNumberType = phoneUtil.getNumberType(number)
        if (numberType == PhoneNumberType.UNKNOWN) {
            return ""
        } else if (!phoneUtil.isNumberGeographical(numberType, Int32(number.getCountryCodes()))) {
            return getCountryNameForNumber(number, languageCode)
        }
        return getDescriptionForValidNumber(number, languageCode)
    }

    public func getDescriptionForNumber(number: PhoneNumber, languageCode: Language, userRegion: String): String {
        let numberType: PhoneNumberType = phoneUtil.getNumberType(number)
        if (numberType == PhoneNumberType.UNKNOWN) {
            return ""
        } else if (!phoneUtil.isNumberGeographical(numberType, Int32(number.getCountryCodes()))) {
            return getCountryNameForNumber(number, languageCode)
        }
        return getDescriptionForValidNumber(number, languageCode, userRegion)
    }

}
