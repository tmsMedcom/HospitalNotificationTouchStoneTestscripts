//1st encounter / First documentation phase / phase – Case opening
Instance: ffb-1st-encounter
InstanceOf: TestScript
* insert Metadata
* id = "ffb-1-encounter"
* name = "First documentation phase"
* title = "First documentation phase"
* description = "Testing correct use of First documentation phase"
* insert  createFfbReportCaseOpeningTest( 1, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/01Encounter.xml)

/**/
* insert  createFfbReportCaseinsightTest( 2, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/02Encounter.xml)
