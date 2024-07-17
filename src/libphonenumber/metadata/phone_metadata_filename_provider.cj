/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package phonenumber4cj.libphonenumber.metadata

public interface PhoneMetadataFileNameProvider {
    func getFor(key: String): ArrayList<String>
}
