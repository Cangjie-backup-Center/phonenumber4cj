/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights resvered.
 */

package phonenumber4cj.libphonenumber.inter

public interface MetadataLoader {
    func loadMetadata(metadataFileName: ArrayList<String>): ArrayList<String>
}
