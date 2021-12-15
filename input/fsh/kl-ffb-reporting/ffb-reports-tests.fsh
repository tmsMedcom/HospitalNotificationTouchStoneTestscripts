//1st encounter / First documentation phase / phase – Case opening
Instance: ffb-1st-encounter
InstanceOf: TestScript
* insert Metadata
* id = "ffb-encounter-2-3"
* name = "Encounter phase 2-3"
* title = "Encounter phase 2-3"
* description = "Testing correct use of encounter phase 2-3"
//* insert  CreateFfbReportCaseOpeningTest( 1, /FHIRSandbox/MedCom/401-ffb-reporting/_reference/resources/01Encounter.xml)

/*Second documentation phase*/
* insert  CreateFfbReportCaseinsightTest( 2, /FHIRSandbox/MedCom/401-ffb-reporting/IG-0-9-0/_reference/resources/02Encounter.xml)

//Third documentation phase 
* insert CreateFfbReportCaseassesment(3, /FHIRSandbox/MedCom/401-ffb-reporting/IG-0-9-0/_reference/resources/03Encounter.xml)
