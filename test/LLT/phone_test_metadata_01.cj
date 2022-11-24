// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from phonenumber import libphonenumber.inter.*
from std import io.*
from std import collection.*
from std import convert.*

main() {

    let pnf: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    let pnf2: PhonemetadataNumberFormat = PhonemetadataNumberFormat()
    pnf2.setNationalPrefixOptionalWhenFormatting(true)
    pnf.hasPatternFunc()
    pnf.hasFormatFunc()
    pnf.leadingDigitsPatternSize()
    
    try {
        let opt = pnf.getLeadingDigitsPattern(pnf.getLeadingDigitsPatternCount())
        match (opt) {
            case Some(v) => println(v)
            case None => println("LeadingDigitsPattern is 0")
        }
        pnf.addLeadingDigitsPattern(opt)
    } catch (e: IndexOutOfBoundsException) {
        e.toString()
    }

    if (pnf == pnf2) {
        pnf.clearNationalPrefixFormattingRule()
    }

    if (pnf != pnf2) {
        pnf.hasNationalPrefixOptionalWhenFormattingFunc()
    }

    let ppm: PhonemetadataPhoneMetadata = PhonemetadataPhoneMetadata.newBuilder()
    ppm.getGeneralDescBuilder()
    ppm.hasIdFunc()
    ppm.hasCountryCodeFunc()
    ppm.hasInternationalPrefixFunc()
    ppm.clearPreferredInternationalPrefix()
    ppm.clearNationalPrefix()

    ppm.setPreferredExtnPrefix("str").getPreferredExtnPrefix()
    ppm.clearPreferredExtnPrefix()
    ppm.setNationalPrefixTransformRule("str2")
    ppm.clearNationalPrefixTransformRule()
    ppm.hasSameMobileAndFixedLinePatternFunc()
    ppm.numberFormats()
    ppm.clearSameMobileAndFixedLinePattern()
    ppm.numberFormatSize()
    ppm.getNumberFormatCount()

    let ppn: PhonemetadataPhoneNumberDesc = PhonemetadataPhoneNumberDesc.newBuilder()
    ppn.getPossibleLengthLocalOnlyCount()

    let pndb: PhoneNumberDescBuilder = PhoneNumberDescBuilder(ppn)
    let pndb2: PhoneNumberDescBuilder = PhoneNumberDescBuilder()
    pndb.build()
    pndb.mergeFrom(pndb2)
    try {
        let opt = ppn.getPossibleLength(ppn.getPossibleLengthCount())
        match (opt) {
            case Some(v) => println(v)
            case None => println("LeadingDigitsPattern is 0")
        }
    } catch (e: IndexOutOfBoundsException) {
        e.toString()
    }
    ppn.clearExampleNumber()

    return 0
}
