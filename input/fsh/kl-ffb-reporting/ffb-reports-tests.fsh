//1st encounter / First documentation phase / phase – Case opening
Instance: ffb-1st-encounter
InstanceOf: TestScript
* insert Metadata
* id = "ffb-1-encounter"
* name = "First documentation phase"
* title = "First documentation phase"
* description = "Testing correct use of First documentation phase"
* insert  CreateFfbReportCaseOpeningTest( 1, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/01Encounter.xml)

/*Second documentation phase.*/
* insert  CreateFfbReportCaseinsightTest( 2, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/02Encounter.xml)

//Third documentation phase 
* insert CreateFfbReportCaseassesment(3, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/03Encounter.xml)
