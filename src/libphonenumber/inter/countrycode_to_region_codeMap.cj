package libphonenumber.inter

from std import collection.*

public class CountryCodeToRegionCodeMap {

    public static func getCountryCodeToRegionCodeMap(): HashMap<Int32, ArrayList<String>> {

        var countryCodeToRegionCodeMap: HashMap<Int32, ArrayList<String>> = HashMap<Int32, ArrayList<String>>(286)
        var listWithRegionCode: ArrayList<String> = ArrayList<String>(25)

        listWithRegionCode.append("US")
        listWithRegionCode.append("AG")
        listWithRegionCode.append("AI")
        listWithRegionCode.append("AS")
        listWithRegionCode.append("BB")
        listWithRegionCode.append("BM")
        listWithRegionCode.append("BS")
        listWithRegionCode.append("CA")
        listWithRegionCode.append("DM")
        listWithRegionCode.append("DO")
        listWithRegionCode.append("GD")
        listWithRegionCode.append("GU")
        listWithRegionCode.append("JM")
        listWithRegionCode.append("KN")
        listWithRegionCode.append("KY")
        listWithRegionCode.append("LC")
        listWithRegionCode.append("MP")
        listWithRegionCode.append("MS")
        listWithRegionCode.append("PR")
        listWithRegionCode.append("SX")
        listWithRegionCode.append("TC")
        listWithRegionCode.append("TT")
        listWithRegionCode.append("VC")
        listWithRegionCode.append("VG")
        listWithRegionCode.append("VI")
        countryCodeToRegionCodeMap.put(1, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("RU")
        listWithRegionCode.append("KZ")
        countryCodeToRegionCodeMap.put(7, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("EG")
        countryCodeToRegionCodeMap.put(20, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ZA")
        countryCodeToRegionCodeMap.put(27, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GR")
        countryCodeToRegionCodeMap.put(30, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NL")
        countryCodeToRegionCodeMap.put(31, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BE")
        countryCodeToRegionCodeMap.put(32, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("FR")
        countryCodeToRegionCodeMap.put(33, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ES")
        countryCodeToRegionCodeMap.put(34, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("HU")
        countryCodeToRegionCodeMap.put(36, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("IT")
        listWithRegionCode.append("VA")
        countryCodeToRegionCodeMap.put(39, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("RO")
        countryCodeToRegionCodeMap.put(40, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CH")
        countryCodeToRegionCodeMap.put(41, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AT")
        countryCodeToRegionCodeMap.put(43, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(4)
        listWithRegionCode.append("GB")
        listWithRegionCode.append("GG")
        listWithRegionCode.append("IM")
        listWithRegionCode.append("JE")
        countryCodeToRegionCodeMap.put(44, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("DK")
        countryCodeToRegionCodeMap.put(45, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SE")
        countryCodeToRegionCodeMap.put(46, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("NO")
        listWithRegionCode.append("SJ")
        countryCodeToRegionCodeMap.put(47, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PL")
        countryCodeToRegionCodeMap.put(48, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("DE")
        countryCodeToRegionCodeMap.put(49, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PE")
        countryCodeToRegionCodeMap.put(51, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MX")
        countryCodeToRegionCodeMap.put(52, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CU")
        countryCodeToRegionCodeMap.put(53, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AR")
        countryCodeToRegionCodeMap.put(54, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BR")
        countryCodeToRegionCodeMap.put(55, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CL")
        countryCodeToRegionCodeMap.put(56, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CO")
        countryCodeToRegionCodeMap.put(57, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("VE")
        countryCodeToRegionCodeMap.put(58, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MY")
        countryCodeToRegionCodeMap.put(60, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(3)
        listWithRegionCode.append("AU")
        listWithRegionCode.append("CC")
        listWithRegionCode.append("CX")
        countryCodeToRegionCodeMap.put(61, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ID")
        countryCodeToRegionCodeMap.put(62, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PH")
        countryCodeToRegionCodeMap.put(63, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NZ")
        countryCodeToRegionCodeMap.put(64, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SG")
        countryCodeToRegionCodeMap.put(65, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TH")
        countryCodeToRegionCodeMap.put(66, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("JP")
        countryCodeToRegionCodeMap.put(81, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KR")
        countryCodeToRegionCodeMap.put(82, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("VN")
        countryCodeToRegionCodeMap.put(84, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CN")
        countryCodeToRegionCodeMap.put(86, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TR")
        countryCodeToRegionCodeMap.put(90, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IN")
        countryCodeToRegionCodeMap.put(91, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PK")
        countryCodeToRegionCodeMap.put(92, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AF")
        countryCodeToRegionCodeMap.put(93, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LK")
        countryCodeToRegionCodeMap.put(94, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MM")
        countryCodeToRegionCodeMap.put(95, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IR")
        countryCodeToRegionCodeMap.put(98, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SS")
        countryCodeToRegionCodeMap.put(211, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("MA")
        listWithRegionCode.append("EH")
        countryCodeToRegionCodeMap.put(212, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("DZ")
        countryCodeToRegionCodeMap.put(213, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TN")
        countryCodeToRegionCodeMap.put(216, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LY")
        countryCodeToRegionCodeMap.put(218, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GM")
        countryCodeToRegionCodeMap.put(220, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SN")
        countryCodeToRegionCodeMap.put(221, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MR")
        countryCodeToRegionCodeMap.put(222, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ML")
        countryCodeToRegionCodeMap.put(223, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GN")
        countryCodeToRegionCodeMap.put(224, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CI")
        countryCodeToRegionCodeMap.put(225, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BF")
        countryCodeToRegionCodeMap.put(226, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NE")
        countryCodeToRegionCodeMap.put(227, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TG")
        countryCodeToRegionCodeMap.put(228, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BJ")
        countryCodeToRegionCodeMap.put(229, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MU")
        countryCodeToRegionCodeMap.put(230, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LR")
        countryCodeToRegionCodeMap.put(231, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SL")
        countryCodeToRegionCodeMap.put(232, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GH")
        countryCodeToRegionCodeMap.put(233, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NG")
        countryCodeToRegionCodeMap.put(234, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TD")
        countryCodeToRegionCodeMap.put(235, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CF")
        countryCodeToRegionCodeMap.put(236, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CM")
        countryCodeToRegionCodeMap.put(237, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CV")
        countryCodeToRegionCodeMap.put(238, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ST")
        countryCodeToRegionCodeMap.put(239, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GQ")
        countryCodeToRegionCodeMap.put(240, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GA")
        countryCodeToRegionCodeMap.put(241, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CG")
        countryCodeToRegionCodeMap.put(242, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CD")
        countryCodeToRegionCodeMap.put(243, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AO")
        countryCodeToRegionCodeMap.put(244, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GW")
        countryCodeToRegionCodeMap.put(245, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IO")
        countryCodeToRegionCodeMap.put(246, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AC")
        countryCodeToRegionCodeMap.put(247, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SC")
        countryCodeToRegionCodeMap.put(248, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SD")
        countryCodeToRegionCodeMap.put(249, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("RW")
        countryCodeToRegionCodeMap.put(250, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ET")
        countryCodeToRegionCodeMap.put(251, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SO")
        countryCodeToRegionCodeMap.put(252, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("DJ")
        countryCodeToRegionCodeMap.put(253, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KE")
        countryCodeToRegionCodeMap.put(254, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TZ")
        countryCodeToRegionCodeMap.put(255, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("UG")
        countryCodeToRegionCodeMap.put(256, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BI")
        countryCodeToRegionCodeMap.put(257, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MZ")
        countryCodeToRegionCodeMap.put(258, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ZM")
        countryCodeToRegionCodeMap.put(260, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MG")
        countryCodeToRegionCodeMap.put(261, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("RE")
        listWithRegionCode.append("YT")
        countryCodeToRegionCodeMap.put(262, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ZW")
        countryCodeToRegionCodeMap.put(263, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NA")
        countryCodeToRegionCodeMap.put(264, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MW")
        countryCodeToRegionCodeMap.put(265, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LS")
        countryCodeToRegionCodeMap.put(266, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BW")
        countryCodeToRegionCodeMap.put(267, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SZ")
        countryCodeToRegionCodeMap.put(268, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KM")
        countryCodeToRegionCodeMap.put(269, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("SH")
        listWithRegionCode.append("TA")
        countryCodeToRegionCodeMap.put(290, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ER")
        countryCodeToRegionCodeMap.put(291, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AW")
        countryCodeToRegionCodeMap.put(297, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("FO")
        countryCodeToRegionCodeMap.put(298, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GL")
        countryCodeToRegionCodeMap.put(299, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GI")
        countryCodeToRegionCodeMap.put(350, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PT")
        countryCodeToRegionCodeMap.put(351, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LU")
        countryCodeToRegionCodeMap.put(352, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IE")
        countryCodeToRegionCodeMap.put(353, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IS")
        countryCodeToRegionCodeMap.put(354, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AL")
        countryCodeToRegionCodeMap.put(355, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MT")
        countryCodeToRegionCodeMap.put(356, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CY")
        countryCodeToRegionCodeMap.put(357, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("FI")
        listWithRegionCode.append("AX")
        countryCodeToRegionCodeMap.put(358, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BG")
        countryCodeToRegionCodeMap.put(359, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LT")
        countryCodeToRegionCodeMap.put(370, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LV")
        countryCodeToRegionCodeMap.put(371, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("EE")
        countryCodeToRegionCodeMap.put(372, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MD")
        countryCodeToRegionCodeMap.put(373, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AM")
        countryCodeToRegionCodeMap.put(374, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BY")
        countryCodeToRegionCodeMap.put(375, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AD")
        countryCodeToRegionCodeMap.put(376, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MC")
        countryCodeToRegionCodeMap.put(377, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SM")
        countryCodeToRegionCodeMap.put(378, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("UA")
        countryCodeToRegionCodeMap.put(380, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("RS")
        countryCodeToRegionCodeMap.put(381, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("ME")
        countryCodeToRegionCodeMap.put(382, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("XK")
        countryCodeToRegionCodeMap.put(383, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("HR")
        countryCodeToRegionCodeMap.put(385, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SI")
        countryCodeToRegionCodeMap.put(386, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BA")
        countryCodeToRegionCodeMap.put(387, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MK")
        countryCodeToRegionCodeMap.put(389, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CZ")
        countryCodeToRegionCodeMap.put(420, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SK")
        countryCodeToRegionCodeMap.put(421, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LI")
        countryCodeToRegionCodeMap.put(423, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("FK")
        countryCodeToRegionCodeMap.put(500, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BZ")
        countryCodeToRegionCodeMap.put(501, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GT")
        countryCodeToRegionCodeMap.put(502, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SV")
        countryCodeToRegionCodeMap.put(503, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("HN")
        countryCodeToRegionCodeMap.put(504, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NI")
        countryCodeToRegionCodeMap.put(505, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CR")
        countryCodeToRegionCodeMap.put(506, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PA")
        countryCodeToRegionCodeMap.put(507, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PM")
        countryCodeToRegionCodeMap.put(508, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("HT")
        countryCodeToRegionCodeMap.put(509, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(3)
        listWithRegionCode.append("GP")
        listWithRegionCode.append("BL")
        listWithRegionCode.append("MF")
        countryCodeToRegionCodeMap.put(590, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BO")
        countryCodeToRegionCodeMap.put(591, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GY")
        countryCodeToRegionCodeMap.put(592, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("EC")
        countryCodeToRegionCodeMap.put(593, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GF")
        countryCodeToRegionCodeMap.put(594, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PY")
        countryCodeToRegionCodeMap.put(595, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MQ")
        countryCodeToRegionCodeMap.put(596, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SR")
        countryCodeToRegionCodeMap.put(597, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("UY")
        countryCodeToRegionCodeMap.put(598, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(2)
        listWithRegionCode.append("CW")
        listWithRegionCode.append("BQ")
        countryCodeToRegionCodeMap.put(599, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TL")
        countryCodeToRegionCodeMap.put(670, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NF")
        countryCodeToRegionCodeMap.put(672, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BN")
        countryCodeToRegionCodeMap.put(673, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NR")
        countryCodeToRegionCodeMap.put(674, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PG")
        countryCodeToRegionCodeMap.put(675, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TO")
        countryCodeToRegionCodeMap.put(676, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SB")
        countryCodeToRegionCodeMap.put(677, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("VU")
        countryCodeToRegionCodeMap.put(678, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("FJ")
        countryCodeToRegionCodeMap.put(679, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PW")
        countryCodeToRegionCodeMap.put(680, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("WF")
        countryCodeToRegionCodeMap.put(681, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("CK")
        countryCodeToRegionCodeMap.put(682, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NU")
        countryCodeToRegionCodeMap.put(683, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("WS")
        countryCodeToRegionCodeMap.put(685, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KI")
        countryCodeToRegionCodeMap.put(686, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NC")
        countryCodeToRegionCodeMap.put(687, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TV")
        countryCodeToRegionCodeMap.put(688, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PF")
        countryCodeToRegionCodeMap.put(689, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TK")
        countryCodeToRegionCodeMap.put(690, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("FM")
        countryCodeToRegionCodeMap.put(691, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MH")
        countryCodeToRegionCodeMap.put(692, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(800, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(808, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KP")
        countryCodeToRegionCodeMap.put(850, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("HK")
        countryCodeToRegionCodeMap.put(852, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MO")
        countryCodeToRegionCodeMap.put(853, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KH")
        countryCodeToRegionCodeMap.put(855, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LA")
        countryCodeToRegionCodeMap.put(856, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(870, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(878, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BD")
        countryCodeToRegionCodeMap.put(880, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(881, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(882, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(883, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TW")
        countryCodeToRegionCodeMap.put(886, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(888, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MV")
        countryCodeToRegionCodeMap.put(960, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("LB")
        countryCodeToRegionCodeMap.put(961, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("JO")
        countryCodeToRegionCodeMap.put(962, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SY")
        countryCodeToRegionCodeMap.put(963, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IQ")
        countryCodeToRegionCodeMap.put(964, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KW")
        countryCodeToRegionCodeMap.put(965, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("SA")
        countryCodeToRegionCodeMap.put(966, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("YE")
        countryCodeToRegionCodeMap.put(967, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("OM")
        countryCodeToRegionCodeMap.put(968, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("PS")
        countryCodeToRegionCodeMap.put(970, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AE")
        countryCodeToRegionCodeMap.put(971, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("IL")
        countryCodeToRegionCodeMap.put(972, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BH")
        countryCodeToRegionCodeMap.put(973, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("QA")
        countryCodeToRegionCodeMap.put(974, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("BT")
        countryCodeToRegionCodeMap.put(975, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("MN")
        countryCodeToRegionCodeMap.put(976, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("NP")
        countryCodeToRegionCodeMap.put(977, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("001")
        countryCodeToRegionCodeMap.put(979, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TJ")
        countryCodeToRegionCodeMap.put(992, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("TM")
        countryCodeToRegionCodeMap.put(993, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("AZ")
        countryCodeToRegionCodeMap.put(994, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("GE")
        countryCodeToRegionCodeMap.put(995, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("KG")
        countryCodeToRegionCodeMap.put(996, listWithRegionCode)

        listWithRegionCode = ArrayList<String>(1)
        listWithRegionCode.append("UZ")
        countryCodeToRegionCodeMap.put(998, listWithRegionCode)

        return countryCodeToRegionCodeMap
    }
}
