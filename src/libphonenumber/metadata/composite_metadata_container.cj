package libphonenumber.metadata

from std import io.*
import libphonenumber.inter.*

public class CompositeMetadataContainer <: MetadataContainer {
    private let metadataByCountryCode: MapBackedMetadataContainer<Int32> = 
        MapBackedMetadataContainer<Int32>.byCountryCallingCode()
    private let metadataByRegionCode: MapBackedMetadataContainer<String> = 
        MapBackedMetadataContainer<String>.byRegionCode()

    func getMetadataBy(regionCode: String): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }

    func getMetadataBy(countryCallingCode: Int32): PhonemetadataPhoneMetadata {
        return PhonemetadataPhoneMetadata()
    }

    public func accept(phoneMetadata: PhonemetadataPhoneMetadata): Unit {}
}
