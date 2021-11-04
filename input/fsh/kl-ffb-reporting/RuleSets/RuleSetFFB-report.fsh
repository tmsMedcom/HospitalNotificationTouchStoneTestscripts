//1st encounter / First documentation phase / phase – Case opening
Instance: ffb-1-encounter
InstanceOf: TestScript
* insert Metadata
* id = "ffb-1-encounter"
* name = "First documentation phase"
* title = "First documentation phase"
* description = "Testing correct use of First documentation phase"
* insert  createFfbReportCaseOpeningTest( 1, /FHIRSandbox/MedCom/401-ffb-reporting/send/Userstory/_reference/resources/firstEncounter.xml)


RuleSet:  createFfbReportCaseOpeningTest(number, fixture)
* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[+].id = "bundle-create-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"



* insert profileffb
* insert variableMunicipalityCaseNumber
* insert actionOperationFfb
* insert testResourceIsBundle
* insert testBundleType
* insert testPatientIdentifier
* insert testMunicipalityCaseNumberExists
* insert testClinicalImpressionContainsRefMunicipalityCaseNumber



RuleSet:  createFfbReportCaseinsightTest(number, fixture)
* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[+].id = "bundle-create-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

* profile.id = "kl-ffb-reporting-profile"
* profile.reference = "http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-deliveryReport" 

* test[+].id = "HN-{type}-{number}" 
* test[=].name = "{number} Post ffb-report" 
* test[=].description = "Post ffb-report" 
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #create
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Post a ffb-report"
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.sourceId = "bundle-create-{number}" 

* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the Bundle is of type collection"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.type"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = #collection
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the Bundle contains an Identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).identifier.exists()"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the Bundle contains a ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType('ServiceRequest').extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = ${MunicipalityCaseNumber} //THis variable is from createFfbReportCaseOpeningTest
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the ClinicalImpression contains reference to the ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType('ClinicalImpression').extension.where(url= 'http://kl.dk/fhir/common/caresocial/StructureDefinition/BasedOnServiceRequest').value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${MunicipalityCaseNumber}"
* test[=].action[=].assert.warningOnly = false


/*Isolated Testmothods*/
RuleSet: testClinicalImpressionContainsRefMunicipalityCaseNumber
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression contains reference to the ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType('ClinicalImpression').extension.where(url= 'http://kl.dk/fhir/common/caresocial/StructureDefinition/BasedOnServiceRequest').value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${MunicipalityCaseNumber}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testMunicipalityCaseNumberExists
* test[=].action[+].assert.description = "Confirm that the Bundle contains a ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType('ServiceRequest').extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* test[=].action[=].assert.warningOnly = false

RuleSet: testPatientIdentifier
* test[=].action[+].assert.description = "Confirm that the Patient contains an Identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).identifier.exists()"
* test[=].action[=].assert.warningOnly = false

RuleSet: testBundleType
* test[=].action[+].assert.description = "Confirm that the Bundle is of type collection"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.type"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = #collection
* test[=].action[=].assert.warningOnly = false

RuleSet: testResourceIsBundle
* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

RuleSet: actionOperationFfb
* test[+].id = "HN-{type}-{number}" 
* test[=].name = "{number} Post ffb-report" 
* test[=].description = "Post ffb-report" 
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #create
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Post a ffb-report"
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.sourceId = "bundle-create-{number}" 

RuleSet: variableMunicipalityCaseNumber
//There will only be one and only one MunicipalityCaseNumber for each test.
* variable[+].name = "MunicipalityCaseNumber"
* variable[=].expression = "Bundle.entry.resource.ofType('ServiceRequest').extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* variable[=].sourceId = "bundle-create-{number}"

RuleSet: profileFfb
* profile.id = "kl-ffb-reporting-profile"
* profile.reference = "http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-deliveryReport" 