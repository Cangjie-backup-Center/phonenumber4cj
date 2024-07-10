/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package libphonenumber.metadata

public interface FormattingMetadataSource {
    
    func getFormattingMetadataForCountryCallingCode(countryCallingCode: Int32): PhonemetadataPhoneMetadata
}
