package prefixmapper

from std import fs.*
from std import os.*
from std import os.posix.*
from encoding import json.*
import libphonenumber.inter.*

func getFilePath(): Path {
    match(getEnv("LD_LIBRARY_PATH")) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                throw NoneValueException("")
            }
            let paths: Array<String> = str.split(":")
            for (path in paths where path.contains("build")) {
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
    private var phonePrefixDataDirectoryUser: String = ""

    public init(phonePrefixDataDirectoryUser: String) {
        this.phonePrefixDataDirectoryUser = phonePrefixDataDirectoryUser
    }

    public func getCarrierDescriptionForNumber(number: PhoneNumber, language: String, script: String, region: String): String {
        let phonePrefix: Int64 = getPrefixForNumber(number)
        let nationalNumber: String = number.getNationalNumbers().toString()
        var eventDataPath: Path = getFilePath()
        var arrs: Array<String> = []
        var readArrs: Array<UInt8> = []
        var metadata: String = ""
        if (!phonePrefixDataDirectoryUser.isEmpty()) {
            arrs = phonePrefixDataDirectoryUser.split('/')
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findCarrierRes(phonePrefix, metadata, nationalNumber)
        } else {
            if (phonePrefix == 1) {
                arrs = DEFAULT_CARRIER_PATH_US
            } else if (phonePrefix == 86) {
                if (language == "en") {
                    arrs = DEFAULT_CARRIER_PATH_ZH_EN
                } else if (language == "zh") {
                    arrs = DEFAULT_CARRIER_PATH_ZH_CN
                }
            }
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findCarrierRes(phonePrefix, metadata, nationalNumber)
        }
    }

    public func getGeoDescriptionForNumber(number: PhoneNumber, language: String, script: String, region: String): String {
        let phonePrefix: Int64 = getPrefixForNumber(number)
        let nationalNumber: String = number.getNationalNumbers().toString()
        var eventDataPath: Path = getFilePath()
        var arrs: Array<String> = []
        var readArrs: Array<UInt8> = []
        var metadata: String = ""
        if (!phonePrefixDataDirectoryUser.isEmpty()) {
            arrs = phonePrefixDataDirectoryUser.split('/')
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findGeoRes(phonePrefix, metadata, nationalNumber)
        } else {
            if (phonePrefix == 1) {
                arrs = DEFAULT_GEO_PATH_US
            } else if (phonePrefix == 86) {
                if (language == "en") {
                    arrs = DEFAULT_GEO_PATH_ZH_EN
                } else if (language == "zh") {
                    arrs = DEFAULT_GEO_PATH_ZH_CN
                }
            }
            for (dir in arrs where dir != "") {
                eventDataPath = eventDataPath.join(dir)
            }
            readArrs = File.readFrom(eventDataPath)
            metadata = unsafe{ String.fromUtf8Unchecked(readArrs) }
            return findGeoRes(phonePrefix, metadata, nationalNumber)
        }
    }

    private func getPrefixForNumber(number: PhoneNumber): Int64 {
        let countryCallingCode: Int64 = number.getCountryCodes()
        return countryCallingCode
    }

    private func findGeoRes(phonePrefix: Int64, metadata: String, nationalNumber: String): String {
        var res: String = ""
        if (phonePrefix == 1) {
            if (nationalNumber.size != 10) {
                return res
            }
            var maxBit: Int64 = 6
            while (maxBit > 0) {
                match (metadata.indexOf(nationalNumber[..maxBit])) {
                    case Some(v) =>
                        res = sliceRes(metadata, v)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        } else if (phonePrefix == 86) {
            if (nationalNumber.size != 11) {
                return res
            }
            var maxBit: Int64 = 7
            while (maxBit > 0) {
                match (metadata.indexOf(nationalNumber[..maxBit])) {
                    case Some(v) =>
                        res =  sliceRes(metadata, v)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        }
        return res
    }

    private func findCarrierRes(phonePrefix: Int64, metadata: String, nationalNumber: String): String {
        var res: String = ""
        if (phonePrefix == 1) {
            if (nationalNumber.size != 10) {
                return res
            }
            var maxBit: Int64 = 7
            while (maxBit > 0) {
                match (metadata.indexOf(nationalNumber[..maxBit])) {
                    case Some(v) =>
                        res = sliceRes(metadata, v)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        } else if (phonePrefix == 86) {
            if (nationalNumber.size != 11) {
                return res
            }
            var maxBit: Int64 = 4
            while (maxBit > 0) {
                match (metadata.indexOf(nationalNumber[..maxBit])) {
                    case Some(v) =>
                        res =  sliceRes(metadata, v)
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
            let c: Char = metadata.charAt(index)
            if (c == '|') {
                begin = index
            }
            if (c == '\n') {
                final = index
                break
            }
            index += 1
        }
        res = metadata[(begin + 1)..final]
        return res
    }

}
