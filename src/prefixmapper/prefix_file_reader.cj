/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

/**
 * @file The file declars the PrefixFileReader class.
 */

package phonenumber4cj.prefixmapper

import std.process.*

func getFilePath(): Path {
    let curProcess = Process.current
    match(curProcess.getEnv("LD_LIBRARY_PATH")) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                throw NoneValueException("")
            }
            let paths: Array<String> = str.split(":")
            for (path in paths where (path.contains("target/phonenumber4cj") || path.contains("target/release/phonenumber4cj")) && path.endsWith("phonenumber4cj") && exists(path)) {
                return Path(path)
            }
            throw NoneValueException("")
        case None => throw NoneValueException("")
    }
}

public class PrefixFileReader {
    private let DEFAULT_CARRIER_PATH_US: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.US , PrefixReaderFilePath.CARRIER_US_EN]
    private let DEFAULT_CARRIER_PATH_ZH_EN: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.ZH , PrefixReaderFilePath.CARRIER_ZH_EN]
    private let DEFAULT_CARRIER_PATH_ZH_CN: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.ZH , PrefixReaderFilePath.CARRIER_ZH_CN]
    private let DEFAULT_GEO_PATH_US: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.US , PrefixReaderFilePath.GEO_US_EN]
    private let DEFAULT_GEO_PATH_ZH_EN: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.ZH , PrefixReaderFilePath.GEO_ZH_EN]
    private let DEFAULT_GEO_PATH_ZH_CN: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.ZH , PrefixReaderFilePath.GEO_ZH_CN]
    private let DEFAULT_TZ_PATH_ALL: Array<String> = [PrefixReaderFilePath.RESOURCES, PrefixReaderFilePath.TZ , PrefixReaderFilePath.TZ_ALL]
    private var phonePrefixDataDirectoryUser: String = ""

    public init(phonePrefixDataDirectoryUser: String) {
        this.phonePrefixDataDirectoryUser = phonePrefixDataDirectoryUser
    }

    public func getCarrierDescriptionForNumber(number: PhoneNumber, lan: Language, script: String, region: String): String {
        let phonePrefix: Int64 = getPrefixForNumber(number)
        let nationalNumber: String = number.getNationalNumbers().toString()
        let language: String = lan.getLanguage()
        var eventDataPath: Path = getFilePath()
        var arrs: Array<String> = []
        var scriptStr = ""
        scriptStr = script
        var regionStr = ""
        regionStr = region
        var readArrs: Array<UInt8> = []
        var metadata: String = ""
        if (!phonePrefixDataDirectoryUser.isEmpty()) {
            arrs = phonePrefixDataDirectoryUser.split("/")
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findCarrierRes(phonePrefix, metadata, nationalNumber, language)
        } else {
            if (phonePrefix == 1) {
                arrs = DEFAULT_CARRIER_PATH_US
            } else if (phonePrefix == 86) {
                if (language == "en") {
                    arrs = DEFAULT_CARRIER_PATH_ZH_EN
                } else if (language == "zh") {
                    arrs = DEFAULT_CARRIER_PATH_ZH_CN
                }
            } else {
                return ""
            }
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findCarrierRes(phonePrefix, metadata, nationalNumber, language)
        }
    }

    public func getGeoDescriptionForNumber(number: PhoneNumber, lan: Language, script: String, region: String): String {
        let phonePrefix: Int64 = getPrefixForNumber(number)
        let nationalNumber: String = number.getNationalNumbers().toString()
        let language: String = lan.getLanguage()
        var eventDataPath: Path = getFilePath()
        var arrs: Array<String> = []
        var readArrs: Array<UInt8> = []
        var metadata: String = ""
        var scriptStr = ""
        scriptStr = script
        var regionStr = ""
        regionStr = region
        if (!phonePrefixDataDirectoryUser.isEmpty()) {
            arrs = phonePrefixDataDirectoryUser.split("/")
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findGeoRes(phonePrefix, metadata, nationalNumber, language)
        } else {
            if (phonePrefix == 1) {
                arrs = DEFAULT_GEO_PATH_US
            } else if (phonePrefix == 86) {
                if (language == "en") {
                    arrs = DEFAULT_GEO_PATH_ZH_EN
                } else if (language == "zh") {
                    arrs = DEFAULT_GEO_PATH_ZH_CN
                }
            } else {
                return ""
            }
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findGeoRes(phonePrefix, metadata, nationalNumber, language)
        }
    }

    public func lookupTimeZonesForNumber(number: PhoneNumber): ArrayList<String> {
        var util: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
        let phonePrefix: String = number.getCountryCodes().toString() + util.getNationalSignificantNumber(number)
        var eventDataPath: Path = getFilePath()
        var arrs: Array<String> = []
        var readArrs: Array<UInt8> = []
        var data: String = ""
        if (!phonePrefixDataDirectoryUser.isEmpty()) {
            arrs = phonePrefixDataDirectoryUser.split("/")
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            data = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findTzRes(phonePrefix, data, number)
        } else {
            arrs = DEFAULT_TZ_PATH_ALL
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            data = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findTzRes(phonePrefix, data, number)
        }

    }

    private func findTzRes(phonePrefix: String, metadata: String, number: PhoneNumber): ArrayList<String> {
        var res: ArrayList<String> = ArrayList<String>()
        var maxBit: Int64 = 0
        if (number.getCountryCodes() == 1) {
            maxBit = 7
        } else if (number.getCountryCodes() == 86) {
            maxBit = 3
        }
        while (maxBit > 0) {
            match (metadata.indexOf("\n" + phonePrefix[..maxBit] + "|")) {
                case Some(v) =>
                    var s: String = sliceRes(metadata, v + 1)
                    var count: Int64 = s.count("&")
                    if (count > 0) {
                        let arr: Array<String> = s.split("&")
                        res.add(all: arr)
                    } else {
                        res.add(s)
                    }
                    break
                case None => 
                    maxBit -= 1
            }
        }
        return res
    }

    private func getPrefixForNumber(number: PhoneNumber): Int64 {
        let countryCallingCode: Int64 = number.getCountryCodes()
        return countryCallingCode
    }

    private func findGeoRes(phonePrefix: Int64, metadata: String, nationalNumber: String, language: String): String {
        var res: String = ""
        var fullNumber: String = phonePrefix.toString() + nationalNumber
        var maxBit: Int64 = nationalNumber.size
        if (phonePrefix == 1 && language == "en") {
            if (nationalNumber.size < 0 && nationalNumber.size > 10) {
                return res
            }
            while (maxBit > 0) {
                match (metadata.indexOf("\n" + fullNumber[..maxBit] + "|")) {
                    case Some(v) =>
                        res = sliceRes(metadata, v + 1)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        } else if (phonePrefix == 86) {
            if (nationalNumber.size < 0 && nationalNumber.size > 11) {
                return res
            }
            while (maxBit > 0) {
                match (metadata.indexOf("\n" + fullNumber[..maxBit] + "|")) {
                    case Some(v) =>
                        res =  sliceRes(metadata, v + 1)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        }
        return res
    }

    private func findCarrierRes(phonePrefix: Int64, metadata: String, nationalNumber: String, language: String): String {
        var res: String = ""
        var fullNumber: String = phonePrefix.toString() + nationalNumber
        var maxBit: Int64 = nationalNumber.size
        if (phonePrefix == 1 && language == "en") {
            if (nationalNumber.size < 0 && nationalNumber.size > 10) {
                return res
            }
            while (maxBit > 0) {
                match (metadata.indexOf("\n" + fullNumber[..maxBit] + "|")) {
                    case Some(v) =>
                        res = sliceRes(metadata, v + 1)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        } else if (phonePrefix == 86) {
            if (nationalNumber.size < 0 && nationalNumber.size > 11) {
                return res
            }
            while (maxBit > 0) {
                match (metadata.indexOf("\n" + fullNumber[..maxBit] + "|")) {
                    case Some(v) =>
                        res =  sliceRes(metadata, v + 1)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        }
        return res
    }
    
    private func sliceRes(metadata: String, toBeFound: Int64): String {
        var index: Int64 = 0
        index = toBeFound
        var begin: Int64 = 0
        var final: Int64 = 0
        var res: String = ""
        while(true) {
            let c: Rune = Rune(metadata[index])
            if (c == r'|') {
                begin = index
            }
            if (c == r'\n') {
                final = index
                break
            }
            index += 1
        }
        res = metadata[(begin + 1)..final]
        return res
    }

}
