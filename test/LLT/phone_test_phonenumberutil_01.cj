// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import collection.*
from serialization import serialization.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

main() {
    var pnu: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var pn: PhoneNumber = pnu.parse("044 66 77 88", "CN")
    PhoneNumberUtil.normalizeDiallableCharsOnly("011")
    PhoneNumberUtil.convertAlphaCharactersInNumber("022")
    let r: Int32 = pnu.getLengthOfGeographicalAreaCode(pn)
    pnu.getLengthOfNationalDestinationCode(pn)
    pnu.getSupportedRegions()
    pnu.getSupportedGlobalNetworkCallingCodes()
    pnu.getSupportedCallingCodes()
    pnu.getSupportedTypesForRegion("CN")
    pnu.getSupportedTypesForNonGeoEntity(7)
    PhoneNumberUtil.getCountryMobileToken(7)
    if (r > 0) {
        return 1
    }
    return 0
}
