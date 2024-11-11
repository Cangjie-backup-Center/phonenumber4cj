// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
import std.collection.*
import phonenumber4cj.libphonenumber.internal.*
import phonenumber4cj.libphonenumber.metadata.*
import phonenumber4cj.libphonenumber.inter.*

main() {
    var b: Bool = GeoEntityUtility.isGeoEntity(27)
    var dmd: DefaultMetadataDependenciesProvider = DefaultMetadataDependenciesProvider.getInstance()
    dmd.getAlternateFormatsMetadataFileNameProvider()
    dmd.getPhoneNumberMetadataSource()
    dmd.getShortNumberMetadataFileNameProvider()
    dmd.getAlternateFormatsMetadataSource()
    dmd.getShortNumberMetadataSource()
    if (b) {
        return 0
    }
    return 1
}
