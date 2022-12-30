//3rd_party_lib:phonenumber/build/phonenumber

from std import collection.*
from phonenumber import libphonenumber.inter.*
from phonenumber import libphonenumber.data.*
from phonenumber import libphonenumber.*

@Test
public class phoneNumberutil_{

    @TestCase
    func phoneNumber_1(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    println(phonenumberUtil.isValidNumber(Phonenumber))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),false)
    }


    @TestCase
    func phoneNumber_2(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("19991822826", "CN",Phonenumber)
    println(phonenumberUtil.isValidNumber(Phonenumber))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),true)
    }


    @TestCase
    func phoneNumber_3(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("02595566", "CN",Phonenumber)
    println(phonenumberUtil.isValidNumber(Phonenumber))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),true)
    }

    @TestCase
    func phoneNumber_4(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("00-1-213-282-3146", "CN",Phonenumber)
    println(phonenumberUtil.isValidNumber(Phonenumber))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),true)
    }


    @TestCase
    func phoneNumber_5(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("4255550100", "US",Phonenumber)
    println(phonenumberUtil.isValidNumber(Phonenumber))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),true)
    }


    @TestCase
    func phoneNumber_6(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("+14255550100", "US",Phonenumber)
    println(phonenumberUtil.isValidNumber(Phonenumber))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),true)
    }


    @TestCase
    func phoneNumber_7(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("+14255550100", "US",Phonenumber)
    println(phonenumberUtil.isValidNumberForRegion(Phonenumber,"US"))
    @Assert(phonenumberUtil.isValidNumberForRegion(Phonenumber,"US"),true)
    }


    @TestCase
    func phoneNumber_8(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("4255550100", "US",Phonenumber)
    println(phonenumberUtil.isValidNumberForRegion(Phonenumber,"US"))
    @Assert(phonenumberUtil.isValidNumberForRegion(Phonenumber,"US"),true)
    }


    @TestCase
    func phoneNumber_9(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()                    
    phonenumberUtil.parse("00-1-213-282-3146", "CN",Phonenumber)
    println(phonenumberUtil.isValidNumberForRegion(Phonenumber,"CN"))
    @Assert(phonenumberUtil.isValidNumberForRegion(Phonenumber,"CN"),false)
    }


    @TestCase
    func phoneNumber_10(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("02595566", "CN",Phonenumber)
    println(phonenumberUtil.isValidNumberForRegion(Phonenumber,"CN"))
    @Assert(phonenumberUtil.isValidNumberForRegion(Phonenumber,"CN"),true)
    }


    @TestCase
    func phoneNumber_11(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    phonenumberUtil.parse("02595566", "CN",Phonenumber)
    println(phonenumberUtil.isValidNumberForRegion(Phonenumber,"US"))
    @Assert(phonenumberUtil.isValidNumberForRegion(Phonenumber,"US"),false)
    }


    @TestCase
    func phoneNumber_12(): Unit {

    var Phonenumber: PhoneNumber = PhoneNumber()
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    println(phonenumberUtil.isValidNumberForRegion(Phonenumber,"CN"))
    @Assert(phonenumberUtil.isValidNumber(Phonenumber),false)
    }


    @TestCase
    func phoneNumber_13(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parseAndKeepRawInput("18717619089","CN")
    println(phonenumber.hasRawInputs())
    println(phonenumber.getRawInputs())
    @Assert(phonenumber.hasRawInputs(),true)
    @Assert(phonenumber.getRawInputs(),"18717619089")
    }



    @TestCase
    func phoneNumber_14(): Unit {
 
    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parseAndKeepRawInput("02595566","CN")
    println(phonenumber.hasRawInputs())
    println(phonenumber.getRawInputs())
    @Assert(phonenumber.hasRawInputs(),true)
    @Assert(phonenumber.getRawInputs(),"02595566")
    }


    @TestCase
    func phoneNumber_15(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parseAndKeepRawInput("+14255550100","US")
    println(phonenumber.hasRawInputs())
    println(phonenumber.getRawInputs())
    @Assert(phonenumber.hasRawInputs(),true)
    @Assert(phonenumber.getRawInputs(),"+14255550100")
    }


    @TestCase
    func phoneNumber_16(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var phonenumber=phonenumberUtil.parseAndKeepRawInput("+14255550100","CN")
    println(phonenumber.hasRawInputs())
    println(phonenumber.getRawInputs())
    @Assert(phonenumber.hasRawInputs(),true)
    @Assert(phonenumber.getRawInputs(),"+14255550100")
    }



    @TestCase
    func phoneNumber_17(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var iterator: Iterator<PhoneNumberMatch>=phonenumberUtil.findNumbers("18717619089","CN").iterator()
    var str=""
      while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                @Assert(number1.getNationalNumbers().toString(),"18717619089")
                break
            case None => str="None..."
            println(str)
            @Assert(str,"None...")
                break
        }
    }
    }

    @Skip
    @TestCase
    func phoneNumber_18(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var iterator: Iterator<PhoneNumberMatch>=phonenumberUtil.findNumbers("红红火火恍恍惚惚18717619089","CN").iterator()
    var str=""
      while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                @Assert(number1.getNationalNumbers().toString(),"18717619089")
                break
            case None => str="None..."
            println(str)
            @Assert(str,"None...")
                break
        }
    }
    }



    @TestCase
    func phoneNumber_19(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var iterator: Iterator<PhoneNumberMatch>=phonenumberUtil.findNumbers("cangjie1hhhhhhh,18717619089","CN").iterator()
    var str=""
      while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                @Assert(number1.getNationalNumbers().toString(),"18717619089")
                break
            case None => str="None..."
            println(str)
            @Assert(str,"None...")
                break
        }
    }
    }


    @TestCase
    func phoneNumber_20(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var iterator: Iterator<PhoneNumberMatch>=phonenumberUtil.findNumbers("cangjie13636766050hhhhhhh,18717619089","CN").iterator()
    var str=""
      while (true) {
        match (iterator.next()) {
            case Some(v) => 
                var number1 = v.getNumber()
                println(number1.getNationalNumbers())
                @Assert(number1.getNationalNumbers().toString(),"18717619089")
                break
            case None => str="None..."
            println(str)
            @Assert(str,"None...")
                break
        }
    }
    }


    @TestCase
    func phoneNumber_21(): Unit {
    var m = MatchType.NO_MATCH
    var m2 = MatchType.NOT_A_NUMBER
    @Assert(m.toString(),"NO_MATCH")
    @Assert(m2.toString(),"NOT_A_NUMBER")
    @Assert(m==m2,false)
    }


    @TestCase
    func phoneNumber_22(): Unit {
    var m = MatchType.NO_MATCH
    var m2=m
    @Assert(m.toString(),"NO_MATCH")
    @Assert(m2.toString(),"NO_MATCH")
    @Assert(m==m2,true)
    }


    @TestCase
    func phoneNumber_23(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.MOBILE)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"2015550123")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }


    @TestCase
    func phoneNumber_24(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.FIXED_LINE_OR_MOBILE)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"2015550123")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }


    @TestCase
    func phoneNumber_25(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.TOLL_FREE)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"8002345678")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }



    @TestCase
    func phoneNumber_26(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.PREMIUM_RATE)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"9002345678")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }


    @TestCase
    func phoneNumber_27(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.SHARED_COST)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"2015550123")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }


    
    @TestCase
    func phoneNumber_28(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.VOIP)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"2015550123")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")

        }
    }


    @TestCase
    func phoneNumber_29(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.PERSONAL_NUMBER)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"5002345678")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }



    @TestCase
    func phoneNumber_30(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.PAGER)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"2015550123")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }





    @TestCase
    func phoneNumber_31(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumberForType ("US",PhoneNumberType.PREMIUM_RATE)
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"9002345678")
        case None =>str="Null"
            println(str)
            @Assert(str,"Null")
        }
    }


    @TestCase
    func phoneNumber_32(): Unit {

    var phonenumberUtil: PhoneNumberUtil = PhoneNumberUtil.getInstance().getOrThrow()
    var us = phonenumberUtil.getExampleNumber("US")
    var str=""
        match(us) {
        case Some(x) =>
            println("showExamplePhoneNumber ==> ${x.getNationalNumbers()}")
            @Assert(x.getNationalNumbers().toString(),"2015550123")
        case None => str="None..."
            println(str)
        }
    }
}

    
