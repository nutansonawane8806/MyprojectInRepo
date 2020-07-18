@isTest
public class TestVerifyDate {
    
     @isTest static void date2within30daydate() {
        Date returnDate = VerifyDate.CheckDates(date.valueOf('2020-02-14'),date.valueOf('2020-02-24'));
        System.assertEquals(date.valueOf('2020-02-24'), returnDate);
    }
    @isTest static void date2NOwithin30daydate() {
        Date returnDate2 = VerifyDate.CheckDates(date.valueOf('2020-02-14'),date.valueOf('2020-03-24'));
        System.assertEquals(date.valueOf('2020-02-29'), returnDate2);
    }

    

}