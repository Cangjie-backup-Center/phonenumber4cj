package libphonenumber.internal

from std import collection.*

public class GeoEntityUtility {
    public static let REGION_CODE_FOR_NON_GEO_ENTITIES: String = "001"

    public func isGeoEntity(regionCode: String): Bool {
        return true
    }

    public func isGeoEntity(countryCallingCode: Int32): Bool {
        return true
    }

    private init() {}
}
