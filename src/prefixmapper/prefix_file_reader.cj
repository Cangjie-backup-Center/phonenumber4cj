package prefixmapper

from std import fs.*
from encoding import json.*
import libphonenumber.inter.*

public class PrefixFileReader {

    private let phonePrefixDataDirectory: String

    public init(phonePrefixDataDirectory: String) {
        this.phonePrefixDataDirectory = phonePrefixDataDirectory  
    }

    public func getPrefixForNumber(number: PhoneNumber): Int64 {
        let countryCallingCode: Int64 = number.getCountryCodes()
        return countryCallingCode
    }

    public func getCarrierDescriptionForNumber(number: PhoneNumber, language: String, script: String, region: String): String {
        var res: String = ""
        let phonePrefix = getPrefixForNumber(number)
        if (phonePrefix == 1) {
            let f: Path = Path(phonePrefixDataDirectory + "/resources/1/1_en_carrier.txt")
            let arr: Array<UInt8> = File.readFrom(f)
            let metadata: String = unsafe{ String.fromUtf8Unchecked(arr) }
            let str: String = "${number.getNationalNumbers()}"
            var maxBit: Int64 = 7
            while (maxBit > 0) {
                match (metadata.indexOf(str[..maxBit])) {
                    case Some(v) =>
                        res = sliceRes(metadata, v)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        } else if (phonePrefix == 86) {
            var filePath: String = phonePrefixDataDirectory
            if (language == "en") {
                filePath = phonePrefixDataDirectory + "/resources/86/86_en_carrier.txt"
            } else {
                filePath = phonePrefixDataDirectory + "/resources/86/86_zh_carrier.txt"
            }
            let f: Path = Path(filePath)
            let arr: Array<UInt8> = File.readFrom(f)
            let metadata: String = unsafe{ String.fromUtf8Unchecked(arr) }
            let str: String = "${number.getNationalNumbers()}"
            var maxBit: Int64 = 4
            while (maxBit > 0) {
                match (metadata.indexOf(str[..maxBit])) {
                    case Some(v) =>
                        res =  sliceRes(metadata, v)
                        break
                    case None => 
                        maxBit -= 1
                }
            }
            return res
        } else {
            return res
        }
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
