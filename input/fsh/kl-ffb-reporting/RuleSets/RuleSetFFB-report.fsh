
//1stFirst documentation phase
RuleSet:  createFfbReportCaseOpeningTest(number, fixture)
* insert originClient
* insert destinationServer
* insert fixtureFfb({number}, {fixture})
* insert variableMunicipalityCaseNumber({number})
* insert variablePatientIdentifier({number})
* insert variableServiceRequestFullUrl({number}) //Only assign in first test
//* insert profileFfb //only add once
* insert actionOperationFfb({number})
* insert testResourceIsBundle
* insert testBundleType
* insert testPatientIdentifierExists
* insert testMunicipalityCaseNumberExists
* insert testClinicalImpressionContainsRefMunicipalityCaseNumber



//Second documentation phase. Check: citizen, same CaseNumber
RuleSet:  createFfbReportCaseinsightTest(number, fixture)
* insert originClient
* insert destinationServer
* insert fixtureFfb({number}, {fixture})
* insert variableClinicalImpressionCountFindings({number}) //only for 2end test
* insert actionOperationFfb({number})
* insert testResourceIsBundle
* insert testBundleType
* insert testPatientIdentifierExists
* insert testMunicipalityCaseNumberExists
* insert testClinicalImpressionContainsRefMunicipalityCaseNumber
//Only relevant for n+1 test
* insert testPatientIdentifierSameAsFirst
* insert testMunicipalityCaseNumberSameAsFirst
* insert testServiceRequestSameAsFirst
* insert testConditionsExists
* insert testSameNoOfFindingRefAndCondition

* insert testConditionCode(4934e45a-0f93-4c23-a767-2b681378700b)
* insert testConditionCode(ef4271c4-f942-4194-a2b0-e9a7045eab22)
* insert testConditionCode(b93216fa-3843-4a7e-85bc-e3ef35a1967f)
* insert testConditionCode(9959e779-e8ee-47e8-989b-bbff4aae2883)
* insert testConditionCode(e6f82424-da5a-41d1-bd1a-5796aa79d5f2)
* insert testConditionCode(f5b8e809-7689-4952-838c-a069c99408b3)
* insert testConditionCode(52efa2e9-e0dc-41eb-8c01-9865e2fdebae)
* insert testConditionCode(7a8f247b-baf8-4552-95bb-acf8ef004b74)
* insert testConditionCode(83342ff3-5f2e-4914-b045-e98357685866)
* insert testConditionCode(df194a84-6e4b-4f14-a194-d8d9d9a1fcad)
* insert testConditionCode(3f9da5ac-9686-4eeb-b517-b46e17fcb1d7)
* insert testConditionCode(685e8517-2f5c-4ef8-a7c4-fa2d008fdd9d)
* insert testConditionCode(464a2ab6-a7df-4b3a-b74d-7873f4cfe668)
* insert testConditionCode(01770afa-cd17-41fe-a966-b8895e4d55d8)
* insert testConditionCode(eff3385d-01fa-4c9c-9850-52e179243f21)

* insert testSeverityMatchSpeceficCode(3f9da5ac-9686-4eeb-b517-b46e17fcb1d7, 5bdde847-2837-416b-ab63-bbff8b7aa531)
* insert testSeverityMatchSpeceficCode(685e8517-2f5c-4ef8-a7c4-fa2d008fdd9d, 8328ce4a-6238-4f73-bf1a-74aadb68eff8)
* insert testSeverityMatchSpeceficCode(464a2ab6-a7df-4b3a-b74d-7873f4cfe668, cae545f5-2813-4d79-98fc-0a7d770af3cd)
* insert testSeverityMatchSpeceficCode(01770afa-cd17-41fe-a966-b8895e4d55d8, 5bdde847-2837-416b-ab63-bbff8b7aa531)
* insert testSeverityMatchSpeceficCode(eff3385d-01fa-4c9c-9850-52e179243f21, cae545f5-2813-4d79-98fc-0a7d770af3cd)


//Third documentation phase 
RuleSet:  createFfbReportCaseinsightTest(number, fixture)
* insert originClient
* insert destinationServer
* insert fixtureFfb({number}, {fixture})
* insert variableClinicalImpressionCountFindings({number}) //only for 2end test
* insert actionOperationFfb({number})
* insert testResourceIsBundle
* insert testBundleType
* insert testPatientIdentifierExists
* insert testMunicipalityCaseNumberExists
* insert testClinicalImpressionContainsRefMunicipalityCaseNumber
//Only relevant for n+1 test
* insert testPatientIdentifierSameAsFirst
* insert testMunicipalityCaseNumberSameAsFirst
* insert testServiceRequestSameAsFirst
* insert testConditionsExists
* insert testSameNoOfFindingRefAndCondition
* insert testCarePlanEvaluationCode(code) //dd628e73-d6c9-4837-a2b8-aa62d73bd6ae







/*Isolated Testmothods*/
RuleSet: testClinicalImpressionContainsRefMunicipalityCaseNumber
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression contains reference to the ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).extension.where(url= 'http://kl.dk/fhir/common/caresocial/StructureDefinition/BasedOnServiceRequest').value.reference"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${ServiceRequestFullUrl}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testMunicipalityCaseNumberExists
* test[=].action[+].assert.description = "Confirm that the Bundle contains a ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ServiceRequest).extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value.exists()"
* test[=].action[=].assert.warningOnly = false

RuleSet: testMunicipalityCaseNumberSameAsFirst
* test[=].action[+].assert.description = "Confirm that the Bundle contains a ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ServiceRequest).extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${municipalityCaseNumber}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testPatientIdentifierExists
* test[=].action[+].assert.description = "Confirm that the Patient contains an Identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).identifier.exists()"
* test[=].action[=].assert.warningOnly = false

RuleSet: testPatientIdentifierSameAsFirst
* test[=].action[+].assert.description = "Confirm that the Patient Identifier is same as Previous"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).identifier.value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${patientIdentifier}"
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

RuleSet: testServiceRequestSameAsFirst
* test[=].action[+].assert.description = "Confirm that the ServiceRequest is the same as the first"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.where(resource.ofType(ServiceRequest)).fullUrl"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${ServiceRequestFullUrl}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testConditionsExists
* test[=].action[+].assert.description = "Test that there exists at least 1 Condition in the bundle "
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).count() > 0"
* test[=].action[=].assert.warningOnly = false

RuleSet: testSameNoOfFindingRefAndCondition
* test[=].action[+].assert.description = "Make sure the numbers of ClinicalImpression.finding and Conditions is equal "
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${clinicalImpressionFindingsAmount}"
* test[=].action[=].assert.warningOnly = false

//Check for specific Condition.codes 
RuleSet: testConditionCode(code)
* test[=].action[+].assert.description = "Confirm that the Condition {code} exist in Bundle"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).code.coding.where(code ='{code}').exists()"
* test[=].action[=].assert.warningOnly = false

//Check that Condition severity match specefic code
//Bundle.entry.resource.ofType('Condition').where(code.coding.code = '3f9da5ac-9686-4eeb-b517-b46e17fcb1d7' ).severity.coding.code
RuleSet: testSeverityMatchSpeceficCode(code, severity)
* test[=].action[+].assert.description = "Confirm that the Condition {code} exist where severity is {severity} in Bundle.Condition"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).where(code.coding.code = '{code}').severity.coding.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{severity}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testCarePlanEvaluationCode(code)
* test[=].action[+].assert.description = "Confirm that the CarePlanEvaluationCode is equal to {code}"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).where(code.coding.code = '{code}').severity.coding.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{severity}"
* test[=].action[=].assert.warningOnly = false


RuleSet: actionOperationFfb(number)
* test[+].id = "ffb-{number}" 
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



RuleSet: variableMunicipalityCaseNumber(number)
//There will only be one and only one MunicipalityCaseNumber for each test.
* variable[+].name = "municipalityCaseNumber"
* variable[=].expression = "Bundle.entry.resource.ofType(ServiceRequest).extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* variable[=].sourceId = "bundle-create-{number}"

RuleSet: variablePatientIdentifier(number)
//There will only be one and only one MunicipalityCaseNumber for each test.
* variable[+].name = "patientIdentifier"
* variable[=].expression = "Bundle.entry.resource.ofType(Patient).identifier.value"
* variable[=].sourceId = "bundle-create-{number}"

RuleSet: variableServiceRequestFullUrl(number)
* variable[+].name = "ServiceRequestFullUrl"
* variable[=].expression = "Bundle.entry.where(resource.ofType(ServiceRequest)).fullUrl"
* variable[=].sourceId = "bundle-create-{number}"

//For the 2end test to compare refferences and Conditions
RuleSet: variableClinicalImpressionCountFindings(number)
* variable[+].name = "clinicalImpressionFindingsAmount"
* variable[=].expression = "Bundle.entry.resource.ofType(ClinicalImpression).finding.count()"
* variable[=].sourceId = "bundle-create-{number}"


RuleSet: profileFfb
* profile.id = "kl-ffb-reporting-profile"
* profile.reference = "http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-deliveryReport" 

RuleSet: fixtureFfb(number, fixture)
* fixture[+].id = "bundle-create-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

RuleSet: originClient
* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

RuleSet: destinationServer
* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server


