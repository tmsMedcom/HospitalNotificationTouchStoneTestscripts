//1st encounter / First documentation phase / phase – Case opening
Instance: ffb-1st-encounter
InstanceOf: TestScript
* insert Metadata
* id = "ffb-encounter-1-3"
* name = "Encounter phase 1-3"
* title = "Encounter phase 1-3"
* description = "Testing correct use of encounter phase 1-3"
* insert  CreateFfbReportCaseOpeningTest( 1, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/01Encounter.xml)

/*Second documentation phase*/
* insert  CreateFfbReportCaseinsightTest( 2, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/02Encounter.xml)

//Third documentation phase 
* insert CreateFfbReportCaseassesment(3, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/03Encounter.xml)
