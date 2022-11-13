package libphonenumber.metadata

import libphonenumber.inter.*

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
        return PhonemetadataPhoneMetadata()
    }
}
