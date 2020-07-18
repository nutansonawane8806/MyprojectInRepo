({
    disableExcelInput: function(cmp) {
        cmp.set("v.disabled", true);
        cmp.set("v.isLoading", true);
    },
    
    enableExcelInput: function(cmp) {
        cmp.set("v.disabled", false);
        cmp.set("v.isLoading", false);
    },
    
    importTableAndThrowEvent: function(cmp, evt, helper) {
        evt.stopPropagation();
        evt.preventDefault();
        try {
            const file = helper.validateFile(cmp, evt);
            cmp.set("v.file",file);
            helper.readExcelFile(cmp, file, helper)
            .then($A.getCallback(excelFile => {
                helper.throwSuccessEvent(cmp, excelFile);
            }))
                .catch($A.getCallback(exceptionMessage => {
                helper.throwExceptionEvent(cmp, exceptionMessage);
                
            }))
                .finally($A.getCallback(() => {
                helper.enableExcelInput(cmp);
            }))
            } catch (exceptionMessage) {
                helper.throwExceptionEvent(cmp, exceptionMessage);
                helper.enableExcelInput(cmp);
            }
            },
                
                validateFile: function(cmp, evt) {
                    const files = evt.getSource().get("v.files");
                    if (!files || files.length === 0 || $A.util.isUndefinedOrNull(files[0])) {
                        throw cmp.get("v.messageNoFileSpecified");
                    }
                    
                    const file = files[0];
                    const fileSizeThreshold = cmp.get("v.fileSizeThreshold");
                    if (file.size > fileSizeThreshold) {
                        throw (cmp.get("v.messageFileSizeExceeded") + ': ' + fileSizeThreshold + 'b');
                    }
                    return file;
                },
                
                readExcelFile: function(cmp, file, helper) {
                    return new Promise(function (resolve, reject) {
                        const fileReader = new FileReader();
                        fileReader.onload = event => {
                            let filename = file.name;
                            let binary = "";
                            new Uint8Array(event.target.result).forEach(function (byte) {
                            binary += String.fromCharCode(byte);
                        });
                        
                        try {
                            resolve({
                                "fileName": filename,
                                "xlsb": XLSB.read(binary, {type: 'binary', header: 1})
                            });
                            console.log('XLSB.read::'+XLSB.read(binary, {type: 'binary', header: 1}));
                            console.log('END1::');
                            var workbook = XLSB.read(binary, { type: 'binary' }); 
                            
                            var sheet_name_list = workbook.SheetNames;
                            console.log(XLSB.utils.sheet_to_json(workbook.Sheets[sheet_name_list[0]]));
                            var XL_row_object = XLSB.utils.sheet_to_json(workbook.Sheets[sheet_name_list[0]]);
                            console.log('XL_row_object::'+XL_row_object); 
                            var json_object = JSON.stringify(XL_row_object);
                            cmp.set("v.content", json_object);
                            console.log('After content set::'+cmp.get("v.content"));
                            helper.parseFile1(cmp);  
                            
                            console.log('END2::');
                        } catch (error) {
                            reject(error);
                        }
                    };
                                       console.log('After content set::'+cmp.get("v.content"));
                    fileReader.readAsArrayBuffer(file);                
                });    
            },                                
                                 throwExceptionEvent: function(component, message) {
                  const errorEvent = component.getEvent("onImport");
            errorEvent.setParams({
                "type": "ERROR",
                "message": message
            });
            errorEvent.fire();
        },
            
            throwSuccessEvent: function(component, parsedFile) {
                const successEvent = component.getEvent("onImport");
                successEvent.setParams({
                    "type": "SUCCESS",
                    "fileName": parsedFile.fileName,
                    "table": parsedFile.xlsb
                });
                successEvent.fire();
            },
                
                parseFile1: function (cmp) {
                    console.log('json_object::');
                    console.log('KInside::'+cmp.get("v.content"));
                    var file = cmp.get("v.file");
                    var action = cmp.get("c.parseFile");
                    action.setParams({
                        base64Data: cmp.get("v.content"),
                        fileName: file.name,
                    });
                    action.setCallback(this, function (response) {
                        if (response.getState() == "SUCCESS") {  
                            console.log('Successful');
                        }
                        else {
                            console.log('errorMsg');
                        }
                    });
                    $A.enqueueAction(action);
                }
    })