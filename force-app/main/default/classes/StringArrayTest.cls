Public class StringArrayTest
{   
    public static List<String>  generateStringArray(Integer Count)
    {
        List<String> inputList = new List<String>();
        List<String> ResultList = new List<String>();
        
        for(Integer i=0;i<Count;i++)
        {
            //String str='Test' + i;
            ResultList.add('Test '+ i);           
        }
        return ResultList;
    }
    
}