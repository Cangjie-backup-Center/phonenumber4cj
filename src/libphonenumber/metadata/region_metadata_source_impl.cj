/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package cangjie_tpc::phonenumber4cj.libphonenumber.metadata

public class RegionMetadataSourceImpl <: RegionMetadataSource {
    private let phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider
    private let bootstrappingGuard: MetadataBootstrappingGuard<MapBackedMetadataContainer<String>>

    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, 
        bootstrappingGuard: MetadataBootstrappingGuard<MapBackedMetadataContainer<String>>) {
        this.phoneMetadataFileNameProvider = phoneMetadataFileNameProvider
        this.bootstrappingGuard = bootstrappingGuard
    }

    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, metadataLoader: MetadataLoader, 
        metadataParser: MetadataParser) {
        this(phoneMetadataFileNameProvider,
            BlockingMetadataBootstrappingGuard(metadataLoader, metadataParser,
                MapBackedMetadataContainer<String>.byRegionCode()))
    }

    public func getMetadataForRegion(regionCode: String): PhonemetadataPhoneMetadata {
        var str = ""
        str = regionCode
        return PhonemetadataPhoneMetadata()
    }
}
