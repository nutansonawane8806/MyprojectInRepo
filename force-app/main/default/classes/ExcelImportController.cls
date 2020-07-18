public with sharing class ExcelImportController { 

	public virtual class BulkEmployeeException extends Exception {}     
    /*
    * @param base64Data : Content of the File in JSON format 
    * @param fileName : File Name 
    * @param contentType : Type of the File (Excel)
    */
	@AuraEnabled
	public static void parseFile(String base64Data, String fileName) {
        
 		System.debug('In ParseFile');
 		try {
              System.debug('JSONfromJS::'+base64Data);
              System.debug('fileNamefromJS::'+fileName);
              
              Blob blobData = Blob.valueOf(base64Data);
              System.debug('blobData::'+blobData);
            
              createEmployeeBatchRecords(blobData);

 			}
       	catch(BulkEmployeeException e){
  			System.debug('BulkEmployeeException::::'+e.getMessage());
  
 		}catch (Exception e) {
  			System.debug('Exception::::'+e);
 		}
	}
/**
* @description: This method is used to create the Claim Batch Stage records based on the CSV Data as Input
* @param blobData: Content of the File Uploaded by the User in Blob format 
*/
	public static void createEmployeeBatchRecords(Blob blobData)
	{
         String csvAsString;
         String[] csvFileLines;
         System.debug('blobData:::'+blobData);
         csvAsString = blobData.toString();
         system.debug('Before JSON Formator csvAsString::' + csvAsString);
 
         String csvAsString1 = jsonFormator(csvAsString);
         
         System.debug('After JSON Formator csvAsString1::'+csvAsString1);

         List<JSON2ApexController> objList = JSON2ApexController.parse(csvAsString1);
         System.debug('After JSON deserialize objList::'+objList);
         System.debug('objList[0]::'+objList[0]);
 
         List<DP_SAP_CPPC__c> batchEmployeeList = new List<DP_SAP_CPPC__c>();
         
         for(JSON2ApexController item: objList) {
          System.debug('1   ::');
          DP_SAP_CPPC__c batchEmployeeRecord = new DP_SAP_CPPC__c();

          batchEmployeeRecord.Avg_Cons__c = item.Avg_Cons;  
          batchEmployeeRecord.Avg_UVR__c = item.Avg_UVR;
          batchEmployeeRecord.Bal_Mtr__c = item.Bal_Mtr;  
          batchEmployeeRecord.Bal_to_cut_Units__c = item.Bal_to_cut_Units;
          batchEmployeeRecord.Bal_to_GI_Mtrs__c = item.Bal_to_GI_Mtrs;
          batchEmployeeRecord.Bal_to_IMS_Mtrs__c = item.Bal_to_IMS_Mtrs;  
          batchEmployeeRecord.Bal_to_pack_Units__c = item.Bal_to_pack_Units;
          batchEmployeeRecord.Bal_to_Pack_Mtr__c = item.Bal_to_Pack_Mtr;  
          batchEmployeeRecord.Bal_to_sew_Units__c = item.Bal_to_sew_Units;
          batchEmployeeRecord.Bal_to_Sew_Mtr__c = item.Bal_to_Sew_Mtr;
      		System.debug('2  ::');
          batchEmployeeRecord.Bal_Unit__c = item.Bal_Unit;  
          batchEmployeeRecord.Balance_to_weave__c = item.Balance_to_weave;
          batchEmployeeRecord.Buyer__c = item.Buyer;  
          batchEmployeeRecord.Bal_to_cut_Units__c = item.Bal_to_cut_Units;
          batchEmployeeRecord.CS_Cut_off_Date__c = item.CS_Cut_off_Date;
          batchEmployeeRecord.Category__c = item.Category;  
          batchEmployeeRecord.Days__c = item.Days;
          batchEmployeeRecord.Design__c = item.Design;  
          batchEmployeeRecord.Destination__c = item.Destination;
          batchEmployeeRecord.Diff__c = item.Diff;
     		System.debug('3  ::');
          batchEmployeeRecord.Digital_Print__c = item.Digital_Print;  
          batchEmployeeRecord.Disp_Month__c = item.Disp_Month;
          batchEmployeeRecord.Disp_Mtr__c = item.Disp_Mtr;  
          batchEmployeeRecord.Disp_Unit__c = item.Disp_Unit;
          batchEmployeeRecord.Disp_Week__c = item.Disp_Week;
          //batchEmployeeRecord.Dispatch_Date__c = item.Dispatch_Date;  
          batchEmployeeRecord.Dispatch_Delay__c = item.Dispatch_Delay;
          batchEmployeeRecord.Name = item.DpSapCppc;  
          batchEmployeeRecord.Dye_mtr__c = item.Dye_mtr;
          batchEmployeeRecord.Dyed_Based_Print__c = item.Dyed_Based_Print;
     		System.debug('4  ::');
          batchEmployeeRecord.Edited_by__c = item.Edited_by;  
          batchEmployeeRecord.Ex_plant__c = item.Ex_plant;
          batchEmployeeRecord.Export_PO__c = item.Export_PO;  
          batchEmployeeRecord.Export_SO__c = item.Export_SO;
          batchEmployeeRecord.Export_SO_DESIGN__c = item.Export_SO_DESIGN;
          batchEmployeeRecord.Finish_Type__c = item.Finish_Type;  
          batchEmployeeRecord.Inspection_Date_FRI__c = item.Inspection_Date_FRI;
          batchEmployeeRecord.Invoice_Status__c = item.Invoice_Status;  
          batchEmployeeRecord.IterationNumber__c = item.IterationNumber;
          batchEmployeeRecord.MC_Type__c = item.MC_Type;
     		System.debug('5  ::');
          batchEmployeeRecord.Merchandiser__c = item.Merchandiser;  
          batchEmployeeRecord.Merchandiser_email__c = item.Merchandiser_email;
          batchEmployeeRecord.No_of_PO__c = item.No_of_PO;  
          batchEmployeeRecord.Old_FSO__c= item.Old_FSO;
          batchEmployeeRecord.Order_MTR__c = item.Order_MTR;
          batchEmployeeRecord.Order_Status__c = item.Order_Status;  
          batchEmployeeRecord.Order_Type__c = item.Order_Type;
          batchEmployeeRecord.OTIF_As_per_SAP__c = item.OTIF_As_per_SAP;  
          batchEmployeeRecord.Port_of_loading__c = item.Port_of_loading;
          batchEmployeeRecord.Pre_washed__c = item.Pre_washed;
             System.debug('6  ::');
          batchEmployeeRecord.Process_Cut_off__c = item.Process_Cut_off;  
          batchEmployeeRecord.Process_Month__c = item.Process_Month;
          batchEmployeeRecord.Process_Week__c= item.Process_Week;  
          batchEmployeeRecord.Processing_Type__c= item.Processing_Type;
          batchEmployeeRecord.Prod_Month__c = item.Prod_Month;
          batchEmployeeRecord.Prod_Week__c = item.Prod_Week;  
          batchEmployeeRecord.Product_Group__c = item.Product_Group;
          batchEmployeeRecord.Product_Line__c = item.Product_Line;  
          batchEmployeeRecord.Product_Type__c = item.Product_Type;
          batchEmployeeRecord.Program__c = item.Program;
             System.debug('7  ::');
          batchEmployeeRecord.Program_Code__c = item.Program_Code;  
          batchEmployeeRecord.Projection_Value__c = item.Projection_Value;
          batchEmployeeRecord.Remarks__c= item.Remarks;  
          batchEmployeeRecord.Revised_Ex_plant__c= item.Revised_Ex_plant;
          batchEmployeeRecord.Self_Fabric_Bag__c = item.Self_Fabric_Bag;
          batchEmployeeRecord.Ship_End_PPC__c = item.Ship_End_PPC;  
          batchEmployeeRecord.Ship_End_SAP__c = item.Ship_End_SAP;
          batchEmployeeRecord.Ship_Start_PPC__c = item.Ship_Start_PPC;  
          batchEmployeeRecord.Ship_Start_SAP__c = item.Ship_Start_SAP;
          batchEmployeeRecord.SO_Amount__c = item.SO_Amount;
             System.debug('8  ::');
          batchEmployeeRecord.Status__c = item.Status;  
          batchEmployeeRecord.Stitching_Sam__c = item.Stitching_Sam;
          batchEmployeeRecord.Stitiching__c= item.Stitiching;  
          batchEmployeeRecord.TC__c= item.TC;
          batchEmployeeRecord.Team_Lead__c = item.Team_Lead;
          batchEmployeeRecord.Team_Lead_email__c = item.Team_Lead_email;  
          batchEmployeeRecord.TOB_Workcenter__c = item.TOB_Workcenter;
          batchEmployeeRecord.Today_Disp_Mtr__c = item.Today_Disp_Mtr;  
          batchEmployeeRecord.Today_Disp_Unit__c = item.Today_Disp_Unit;
          batchEmployeeRecord.Total_Sam__c = item.Total_Sam;
             System.debug('9  ::');
          batchEmployeeRecord.Total_Units__c = item.Total_Units;  
          batchEmployeeRecord.Warp__c = item.Warp;
          batchEmployeeRecord.Warp_Avg_Consumption__c= item.Warp_Avg_Consumption;  
          batchEmployeeRecord.Warp_Req__c= item.Warp_Req;
          //batchEmployeeRecord.Washing_Load__c = item.Washing_Load;
          //batchEmployeeRecord.Weave_Ins__c = item.Weave_Ins;  
          batchEmployeeRecord.Weave_Ins__c = item.Weave_Ins;
          batchEmployeeRecord.Weave_Os__c = item.Weave_Os;  
          batchEmployeeRecord.Weaving_Cut_off_Date__c = item.Weaving_Cut_off_Date;
          batchEmployeeRecord.Weave_type__c = item.Weave_type;
             System.debug('10  ::');
          batchEmployeeRecord.Weaving_Month__c = item.Weaving_Month;  
          batchEmployeeRecord.Weft__c = item.Weft;
          batchEmployeeRecord.Weft_Avg_Consumption__c= item.Weft_Avg_Consumption;  
          batchEmployeeRecord.Weft_Req__c= item.Weft_Req;
          batchEmployeeRecord.Washing_Load__c = item.Washing_Load;
          batchEmployeeRecord.White_Based_Print__c = item.White_Based_Print;  
          batchEmployeeRecord.White_mtr__c = item.White_mtr;
          batchEmployeeRecord.Work_Centre__c = item.Work_Centre;  
          batchEmployeeRecord.Yarn_type__c = item.Yarn_type;
          	System.debug('11  ::');
          //Date 	Dispatch_Date = convertDateToStandardDate(item.Dispatch_Date);
          //batchEmployeeRecord.Dispatch_Date__c = Dispatch_Date;
            
  		batchEmployeeList.add(batchEmployeeRecord);
 	}
    System.debug('batchEmployeeList::::'+batchEmployeeList);

    
 	try{
  		database.insert(batchEmployeeList);
 		}
    catch(Exception e) {
  		System.debug('Insert Exception::::'+e.getMessage());
 		}        
	}

	public static List<JSON2ApexController> parse(String jsonString) {
		 return (List<JSON2ApexController>) System.JSON.deserialize(jsonString, List<JSON2ApexController>.class);
	} 

	public class JSON2ApexController {
     
          public String Avg_Cons;  
          public Decimal Avg_UVR;
          public Decimal Bal_Mtr;  
          public Decimal Bal_to_cut_Units;
          public Decimal Bal_to_GI_Mtrs;
          public Decimal Bal_to_IMS_Mtrs;  
          public Decimal Bal_to_pack_Units;
          public Decimal Bal_to_Pack_Mtr;  
          public Decimal Bal_to_sew_Units;
          public Decimal Bal_to_Sew_Mtr;
            
          public Decimal Bal_Unit;  
          public String Balance_to_weave;
          public String Buyer;  
          public String CS_Cut_off_Date;
          public String Category;  
          public Integer Days;
          public String Design;  
          public String Destination;
          public Decimal Diff;
            
          public Decimal Digital_Print;  
          public String Disp_Month;
          public Decimal Disp_Mtr;  
          public Decimal Disp_Unit;
          public Integer Disp_Week;
          //public Integer Dispatch_Date;  
          public Integer Dispatch_Delay;
          public String DpSapCppc;  
          public Decimal Dye_mtr;
          public Decimal Dyed_Based_Print;
            
          public String Edited_by;  
          public String Ex_plant;
          public String Export_PO;  
          public String Export_SO;
          public String Export_SO_DESIGN;
          public String Finish_Type;  
          public String Inspection_Date_FRI;
          public String Invoice_Status;  
          public Integer IterationNumber;
          public String MC_Type;
            
          public String Merchandiser;  
          public String Merchandiser_email;
          public Integer No_of_PO;  
          public String Old_FSO;
          public Decimal Order_MTR;
          public String Order_Status;  
          public String Order_Type;
          public String OTIF_As_per_SAP;  
          public String Port_of_loading;
          public String Pre_washed;
            
          public String Process_Cut_off;  
          public String Process_Month;
          public Integer Process_Week;  
          public String Processing_Type;
          public String Prod_Month;
          public Integer Prod_Week;  
          public String Product_Group;
          public String Product_Line;  
          public String Product_Type;
          public String Program;
            
          public String Program_Code;  
          public String Projection_Value;
          public String Remarks;  
          public String Revised_Ex_plant;
          public String Self_Fabric_Bag;
          public String Ship_End_PPC;  
          public String Ship_End_SAP;
          public String Ship_Start_PPC;  
          public String Ship_Start_SAP;
          public String SO_Amount;
            
          public String Status;  
          public Decimal Stitching_Sam;
          public String Stitiching;  
          public String TC;
          public String Team_Lead;
          public String Team_Lead_email;  
          public String TOB_Workcenter;
          public Decimal Today_Disp_Mtr;  
          public Decimal Today_Disp_Unit;
          public String Total_Sam;
            
            
          public Decimal Total_Units;  
          public String Warp;
          public String Warp_Avg_Consumption;  
          public String Warp_Req;
          public String Washing_Load;
          public String Weave_Ins;  
          public String Weave_Os;  
          public String Weaving_Cut_off_Date;
          public String Weave_type;
            
          public String Weaving_Month;  
          public String Weft;
          public String Weft_Avg_Consumption;  
          public String Weft_Req;
          
          public Decimal White_Based_Print;  
          public Decimal White_mtr;
          public String Work_Centre;  
          public String Yarn_type;
         
          public String Dispatch_Date;
	}

	public static String jsonFormator(String jsonString) {
      
         String target = 'Status';
         String replacement = 'Status';
         String jsonString1 = jsonString.replace(target, replacement);
         target = 'Order Type';
         replacement = 'Order_Type';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Work Centre';
         replacement = 'Work_Centre';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'TOB Workcenter';
         replacement = 'TOB_Workcenter';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Product Line';
         replacement = 'Product_Line';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Order Status';
         replacement = 'Order_Status';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Days';
         replacement = 'Days';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Ship Start PPC';
         replacement = 'Ship_Start_PPC';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Ship End PPC';
         replacement = 'Ship_End_PPC';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Ship Start SAP';
         replacement = 'Ship_Start_SAP';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Ship End SAP';
         replacement = 'Ship_End_SAP';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Inspection Date/ FRI';
         replacement = 'Inspection_Date_FRI';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Ex plant';
         replacement = 'Ex_plant';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Revised Ex plant';
         replacement = 'Revised_Ex_plant';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'C&S Cut off Date';
         replacement = 'CS_Cut_off_Date';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Process Cut off';
         replacement = 'Process_Cut_off';
         jsonString1 = jsonString1.replace(target, replacement);   
         
            
         target = 'Weaving Cut off Date';
         replacement = 'Weaving_Cut_off_Date';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Dispatch Date';
         replacement = 'Dispatch_Date';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Disp Month';
         replacement = 'Disp_Month';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Prod Month';
         replacement = 'Prod_Month';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Process Month';
         replacement = 'Process_Month';
         jsonString1 = jsonString1.replace(target, replacement);   
         
         target = 'Weaving Month';
         replacement = 'Weaving_Month';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Invoice Status';
         replacement = 'Invoice_Status';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Buyer';
         replacement = 'Buyer';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Design';
         replacement = 'Design';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'TC';
         replacement = 'TC';
         jsonString1 = jsonString1.replace(target, replacement);
         
         target = 'Export PO';
         replacement = 'Export_PO';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Export SO';
         replacement = 'Export_SO';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Old FSO';
         replacement = 'Old_FSO';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Product Type';
         replacement = 'Product_Type';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Product Group';
         replacement = 'Product_Group';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Total Units';
         replacement = 'Total_Units';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Order MTR';
         replacement = 'Order_MTR';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Disp Unit';
         replacement = 'Disp_Unit';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Disp Mtr';
         replacement = 'Disp_Mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Today Disp Unit';
         replacement = 'Today_Disp_Unit';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Today Disp Mtr';
         replacement = 'Today_Disp_Mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal Unit';
         replacement = 'Bal_Unit';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal Mtr';
         replacement = 'Bal_Mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Weave O/s';
         replacement = 'Weave_Os';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Weave In/s';
         replacement = 'Weave_Ins';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Balance to weave';
         replacement = 'Balance_to_weave';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal to GI (Mtrs)';
         replacement = 'Bal_to_GI_Mtrs';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal to IMS (Mtrs)';
         replacement = 'Bal_to_IMS_Mtrs';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal to cut (Units)';
         replacement = 'Bal_to_cut_Units';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal to sew (Units)';
         replacement = 'Bal_to_sew_Units__c';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Bal to Sew Mtr';
         replacement = 'Bal_to_Sew_Mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Bal to Pack Mtr';
         replacement = 'Bal_to_Pack_Mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Dye mtr';
         replacement = 'Dye_mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'White mtr';
         replacement = 'White_mtr';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'White Based Print';
         replacement = 'White_Based_Print';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Dyed Based Print';
         replacement = 'Dyed_Based_Print';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Digital Print';
         replacement = 'Digital_Print';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Stitching Sam';
         replacement = 'Stitching_Sam';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Total Sam';
         replacement = 'Total_Sam';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Diff';
         replacement = 'Diff';
         jsonString1 = jsonString1.replace(target, replacement);
               
         target = 'No of PO';
         replacement = 'No_of_PO';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Yarn type';
         replacement = 'Yarn_type';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Weave type';
         replacement = 'Weave_type';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Processing Type';
         replacement = 'Processing_Type';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Finish Type';
         replacement = 'Finish_Type';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Washing Load';
         replacement = 'Washing_Load';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Stitiching';
         replacement = 'Stitiching';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'M/C Type';
         replacement = 'MC_Type';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Self Fabric Bag';
         replacement = 'Self_Fabric_Bag';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Pre-washed';
         replacement = 'Pre_washed';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Disp Week';
         replacement = 'Disp_Week';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Prod Week';
         replacement = 'Prod_Week';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Process Week';
         replacement = 'Process_Week';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Port of loading';
         replacement = 'Port_of_loading';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Destination';
         replacement = 'Destination';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Category';
         replacement = 'Category';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Export SO-DESIGN';
         replacement = 'Export_SO_DESIGN';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Remarks';
         replacement = 'Remarks';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'OTIF As per SAP';
         replacement = 'OTIF_As_per_SAP';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Dispatch Delay';
         replacement = 'Dispatch_Delay';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Edited by';
         replacement = 'Edited_by';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Program Code';
         replacement = 'Program_Code';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Program';
         replacement = 'Program';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Team Lead';
         replacement = 'Team_Lead';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Team Lead email';
         replacement = 'Team_Lead_email';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Merchandiser';
         replacement = 'Merchandiser';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Avg Cons';
         replacement = 'Avg_Cons';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Avg UVR';
         replacement = 'Avg_UVR';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'SO Amount';
         replacement = 'SO_Amount';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Projection Value';
         replacement = 'Projection_Value';
         jsonString1 = jsonString1.replace(target, replacement);
            
         target = 'Warp';
         replacement = 'Warp';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Weft';
         replacement = 'Weft';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Warp Avg Consumption';
         replacement = 'Warp_Avg_Consumption';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Weft Avg Consumption';
         replacement = 'Weft_Avg_Consumption';
         jsonString1 = jsonString1.replace(target, replacement);
         target = 'Warp Req';
         replacement = 'Warp_Req';
         jsonString1 = jsonString1.replace(target, replacement);    
         target = 'Weft Req';
         target = 'Iteration Number';
         replacement = 'IterationNumber';
         jsonString1 = jsonString1.replace(target, replacement);
        
         
         return jsonString1;
	}

	public static Date convertDateToStandardDate(String inputDate){
     // input Date in format : 10-Feb-2019
     // inputDateArray (10,Feb,2019)
     try{
          String[] inputDateArray = inputDate.split('-');
          String monthInUpperCase = inputDateArray[1].toUpperCase(); 
          Integer month = 0;
          switch on monthInUpperCase {
           when 'JAN' { month = 1; } when 'FEB' { month = 2; } when 'MAR' { month = 3; } when 'APR' { month = 4; } when 'MAY' { month = 5; }
           when 'JUN' { month = 6; } when 'JUL' { month = 7; } when 'AUG' { month = 8; } when 'SEP' { month = 9; } when 'OCT' { month = 10; }
           when 'NOV' { month = 11; } when 'DEC' { month = 12; } when else { month = 0; }
      }
      Date todayDate = System.today();
      Date standardDate;
      String currentCentury = String.valueOf(todayDate.year()).substring(0,2);
      String finalYear = currentCentury+inputDateArray[2];
  	  if(month == 0){  throw new BulkEmployeeException('Invalid Date');
       }
       else{
        standardDate = Date.newInstance(Integer.valueOf(finalYear),month,Integer.valueOf(inputDateArray[0]));
       }
      return standardDate;
   }catch(Exception e){
  throw new BulkEmployeeException('Exception:: '+inputDate);
  }
 }
}