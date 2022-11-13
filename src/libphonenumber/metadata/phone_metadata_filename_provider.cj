package libphonenumber.metadata

public interface PhoneMetadataFileNameProvider {
    func getFor(key: String): ArrayList<String>
}
