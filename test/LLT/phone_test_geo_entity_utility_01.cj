// EXEC: cjc %import-path %L %l %f
// EXEC: export CJSTACKSIZE=10mb && ./main
from std import collection.*
from phonenumber4cj import libphonenumber.internal.*
from phonenumber4cj import libphonenumber.metadata.*
from phonenumber4cj import libphonenumber.inter.*

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
