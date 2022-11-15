package libphonenumber.internal

from std import collection.*

public class GeoEntityUtility {
    public static let REGION_CODE_FOR_NON_GEO_ENTITIES: String = "001"

    public static func isGeoEntity(regionCode: String): Bool {
        return !regionCode.equals(REGION_CODE_FOR_NON_GEO_ENTITIES)
    }

    public static func isGeoEntity(countryCallingCode: Int32): Bool {
        var regionCodesForCountryCallingCode = CountryCodeToRegionCodeMap.getCountryCodeToRegionCodeMap().get(countryCallingCode).getOrThrow()
        return !regionCodesForCountryCallingCode.isEmpty() && !regionCodesForCountryCallingCode.contains(REGION_CODE_FOR_NON_GEO_ENTITIES)
    }

    private init() {}
}
