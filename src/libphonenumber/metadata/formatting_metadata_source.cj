/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package cangjie_tpc::phonenumber4cj.libphonenumber.metadata

public interface FormattingMetadataSource {
    
    func getFormattingMetadataForCountryCallingCode(countryCallingCode: Int32): PhonemetadataPhoneMetadata
}
