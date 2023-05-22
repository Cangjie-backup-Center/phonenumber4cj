// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.inter.*
from phonenumber4cj import libphonenumber.data.*

main() {
    var col: PhonemetadataPhoneMetadataCollection = PhonemetadataPhoneMetadataCollection()
    var PhoneMetadataBuilder = PhonemetadataPhoneMetadataCollection.newBuilder()
    if (col.getMetadataCount() != 0) {
        return 1
    }
    try {
        col.addMetadata(Option<PhonemetadataPhoneMetadata>.None)
    } catch(e: Exception) {
        if (e.toString() != "IllegalArgumentException") {
            return 1
        }
    }
    col.addMetadata(Option<PhonemetadataPhoneMetadata>.Some(PhonemetadataPhoneMetadata()))
    col.addMetadata(Option<PhonemetadataPhoneMetadata>.Some(PhonemetadataPhoneMetadata()))
    if (col.getMetadataCount() != 2) {
        return 1
    }
    var colBuild: PhonemetadataPhoneMetadataCollection = PhoneMetadataCollectionBuilder(col).build()
    if (colBuild.getMetadataCount() != 2) {
        return 1
    }
    col.clear()
    if (col.getMetadataCount() != 0) {
        return 1
    }
    0
}

