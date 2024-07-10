/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.metadata

public class FormattingMetadataSourceImpl <: FormattingMetadataSource {
    private let phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider
    private let bootstrappingGuard: MetadataBootstrappingGuard<MapBackedMetadataContainer<Int32>>

    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, 
        bootstrappingGuard: MetadataBootstrappingGuard<MapBackedMetadataContainer<Int32>>) {
        this.phoneMetadataFileNameProvider = phoneMetadataFileNameProvider
        this.bootstrappingGuard = bootstrappingGuard
    }

    public init(phoneMetadataFileNameProvider: PhoneMetadataFileNameProvider, metadataLoader: MetadataLoader, 
        metadataParser: MetadataParser) {
        this(phoneMetadataFileNameProvider,
            BlockingMetadataBootstrappingGuard(metadataLoader, metadataParser,
                MapBackedMetadataContainer<Int32>.byCountryCallingCode()))
    }

    public func getFormattingMetadataForCountryCallingCode(countryCallingCode: Int32): PhonemetadataPhoneMetadata {
        var i: Int32 = 0
        i = countryCallingCode
        return PhonemetadataPhoneMetadata()
    }
}
