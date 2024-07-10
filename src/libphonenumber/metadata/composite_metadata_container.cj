/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.metadata

public class CompositeMetadataContainer <: MetadataContainer {
    
    private let metadataByCountryCode: MapBackedMetadataContainer<Int32> = 
        MapBackedMetadataContainer<Int32>.byCountryCallingCode()
    private let metadataByRegionCode: MapBackedMetadataContainer<String> = 
        MapBackedMetadataContainer<String>.byRegionCode()

    func getMetadataBy(regionCode: String): PhonemetadataPhoneMetadata {
        return metadataByRegionCode.getMetadataBy(regionCode).getOrThrow()
    }

    func getMetadataBy(countryCallingCode: Int32): PhonemetadataPhoneMetadata {
        return metadataByCountryCode.getMetadataBy(countryCallingCode).getOrThrow()
    }

    public func accept(phoneMetadata: PhonemetadataPhoneMetadata): Unit {
        var regionCode: String = metadataByRegionCode.getKeyProvider().getKeyOf(phoneMetadata)
        if (GeoEntityUtility.isGeoEntity(regionCode)) {
            metadataByRegionCode.accept(phoneMetadata)
        } else {
            metadataByCountryCode.accept(phoneMetadata)
        }
    }
}
