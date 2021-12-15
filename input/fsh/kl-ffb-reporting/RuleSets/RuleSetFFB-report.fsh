//Second documentation phase. Check: citizen, same CaseNumber
RuleSet: CreateFfbReportCaseinsightTest(number, fixture)
* insert originClient
* insert destinationServer
* insert fixtureFfb({number}, {fixture})
* insert actionOperationFfb({number})
* insert profileFfb
//validation
//* insert validation

* insert variableMunicipalityCaseNumber({number})
* insert variablePatientIdentifier({number})
* insert variableServiceRequestFullUrl({number}) //Only assign in first test
* insert variableClinicalImpressionId({number})

* insert testEffectiveDateTimeLtBundleTime
* insert testEffectiveDateTimeBeforeNow
* insert testClinicalImpressionStatus(in-progress)


//Test: Is Conditions Existing in the bundle
* insert testConditionsExists

//Test: is the number of FindingRefferences and Conditions the same. 
* insert testSameNoOfFindingRefAndCondition



//Test: Is the Severity.code matching the expected Condition code.
// from 2en encounter https://build.fhir.org/ig/hl7dk/kl-ffb-reporting/example.html#2nd-encounter--second-documentation-phase--case-insight 
* insert testSeverityMatchSpeceficCode(3f9da5ac-9686-4eeb-b517-b46e17fcb1d7, 5bdde847-2837-416b-ab63-bbff8b7aa531)
* insert testSeverityMatchSpeceficCode(685e8517-2f5c-4ef8-a7c4-fa2d008fdd9d, 8328ce4a-6238-4f73-bf1a-74aadb68eff8)
* insert testSeverityMatchSpeceficCode(464a2ab6-a7df-4b3a-b74d-7873f4cfe668, cae545f5-2813-4d79-98fc-0a7d770af3cd)
* insert testSeverityMatchSpeceficCode(01770afa-cd17-41fe-a966-b8895e4d55d8, 5bdde847-2837-416b-ab63-bbff8b7aa531)
* insert testSeverityMatchSpeceficCode(eff3385d-01fa-4c9c-9850-52e179243f21, cae545f5-2813-4d79-98fc-0a7d770af3cd)

* insert testconditionCodesExists
* insert testConditionRecordedDateLtBundleTime
* insert testConditionClinicalStatusActive
* insert testConditionVerificationStatusEqConfirmed



//Third documentation phase 
RuleSet: CreateFfbReportCaseassesment(number, fixture)
* insert originClient
* insert destinationServer
* insert fixtureFfb({number}, {fixture})
* insert actionOperationFfb({number})
* insert testClinicalImpressionContainsRefMunicipalityCaseNumber
//Only relevant for n+1 test
* insert testPatientIdentifirEqualsFirst
* insert testMunicipalityCaseNumberEqualsFist
* insert testServiceRequestEqualsFirst
* insert testConditionsExists
* insert testSameNoOfFindingRefAndCondition

//validation
//* insert validation

//below specific tests for 3rd encounter.

//Test: that the CarePlanEvalutionCode Let støttebehov exists
* insert testCarePlanEvaluationCode(dd628e73-d6c9-4837-a2b8-aa62d73bd6ae) 

//Test: changevalue: Let nedsat funktionsevne  is of taget.type funktionsevneniveau (66959f77-6e2a-4574-8423-3ff097f8b9fa) 
* insert testGoalTargetTypeValueIsFunktionsevneniveau(8328ce4a-6238-4f73-bf1a-74aadb68eff8) 

//Test: changevalue: Ingen nedsat funktionsevne is of taget.type funktionsevneniveau (66959f77-6e2a-4574-8423-3ff097f8b9fa) 
* insert testGoalTargetTypeValueIsFunktionsevneniveau(b508ff66-6326-4862-a6d7-7bbf184c9823) 

//Test: changevalue: Svært nedsat funktionsevne is of taget.type funktionsevneniveau (66959f77-6e2a-4574-8423-3ff097f8b9fa) 
* insert testGoalTargetTypeValueIsFunktionsevneniveau(cae545f5-2813-4d79-98fc-0a7d770af3cd) 

//Test: changevalue: Fastholde funktionsevne is of taget.type funktionsevneniveau (66959f77-6e2a-4574-8423-3ff097f8b9fa) 
* insert testGoalTargetTypeValueIsFunktionsevneniveau(cae545f5-2813-4d79-98fc-0a7d770af3cd) 

//Test: The numbers of Ranked GoalConditions is 5 according to DeliveryReport-3rd-Encounter
* insert testGoalConditionRankCount(5)

//Goal can be found in the 3th encounter instance
* insert testGoal83fdfed2-f182-4a11-8ea1-de8181e6eab9

//Goal can be found in the 3th encounter instance
* insert testGoalfcbf670a-f310-485b-b717-07c027c3c808

//Goal can be found in the 3th encounter instance
* insert testGoal90fa089a-1f80-40d0-96db-8e875e241b06

* insert testGoallifecycleStatusActive

* insert testMunicipalityCaseNumberEqualsFist

* insert testconditionCodesExists

* insert testEffectiveDateTimeLtBundleTime
* insert testEffectiveDateTimeBeforeNow
* insert testClinicalImpressionStatus(completed)


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

RuleSet: testMunicipalityCaseNumberEqualsFist
* test[=].action[+].assert.description = "Confirm that the Bundle contains a ServiceRequest MunicipalityCaseNumber"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ServiceRequest).extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${municipalityCaseNumber}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testPatientIdentifierExists
* test[=].action[+].assert.description = "Confirm that the Citizen contains an Identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).identifier.exists()"
* test[=].action[=].assert.warningOnly = false

RuleSet: testPatientIdentifirEqualsFirst
* test[=].action[+].assert.description = "Confirm that the Citizen Identifier is same as Previous"
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

RuleSet: testServiceRequestEqualsFirst
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
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).count() = Bundle.entry.resource.ofType(ClinicalImpression).finding.count()"
* test[=].action[=].assert.warningOnly = false

//Check for specific Condition.codes 
RuleSet: testConditionCode(code)
* test[=].action[+].assert.description = "Confirm that the Condition {code} exist in Bundle"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).code.coding.where(code ='{code}').exists()"
* test[=].action[=].assert.warningOnly = false

//Check that Condition severity match specefic code
RuleSet: testSeverityMatchSpeceficCode(code, severity)
* test[=].action[+].assert.description = "Confirm that the Condition {code} exist where severity is {severity} in Bundle.Condition"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).where(code.coding.code = '{code}').severity.coding.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{severity}"
* test[=].action[=].assert.warningOnly = false

//Due to 3rd encounter check that the CarePlanEvaluation Observation code is equal to the code in exampel encounter 3.
RuleSet: testCarePlanEvaluationCode(code)
* test[=].action[+].assert.description = "Confirm that the CarePlanEvaluationCode is equal to {code}"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Observation).value.where(coding.system = 'http://kl.dk/fhir/common/caresocial/CodeSystem/FFB').coding.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{code}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testCarePlanRefEvalution
* test[=].action[+].assert.description = "Confirm that the Careplan outcomeReference refference CarePlanEvalution"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(CarePlan).activity.outcomeReference.reference = Bundle.entry.where(resource.ofType(Observation)).fullUrl"
* test[=].action[=].assert.warningOnly = false

//Used for 3ed encounter
RuleSet: testGoalTargetTypeValueIsFunktionsevneniveau(code) 
* test[=].action[+].assert.description = "Confirm that the changevalue is of taget type funktionsevneniveau"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Goal).target.where(detail.coding.code = '{code}').measure.coding.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "66959f77-6e2a-4574-8423-3ff097f8b9fa"
* test[=].action[=].assert.warningOnly = false

RuleSet: testGoalConditionRankCount(expectedNo)
* test[=].action[+].assert.description = "Confirm that the numbers of GoalConditionRank is equal to {expectedNo}"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Goal).addresses.extension.where(url = 'http://kl.dk/fhir/common/caresocial/StructureDefinition/ConditionRank').count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{expectedNo}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testPatientExists
* test[=].action[+].assert.description = "Confirm that the bundle contains one patient resource"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"
* test[=].action[=].assert.warningOnly = false

RuleSet: testClinicalImpressionExists
* test[=].action[+].assert.description = "Confirm that the bundle contains at least one ClinicalImpression resource"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).count() > 0"
* test[=].action[=].assert.warningOnly = false

RuleSet: testEffectiveDateTimeLtBundleTime
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression.effectiveDateTime is less than or equal to the bundle.timestamp"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).effective  <= Bundle.timestamp"
* test[=].action[=].assert.warningOnly = false

RuleSet: testEffectiveDateTimeBeforeNow
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression.effectiveDateTime less than or equal to now"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).effective"
* test[=].action[=].assert.operator = #lessThan
* test[=].action[=].assert.value = "${CURRENTDATETIME}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testClinicalImpressionStatus(status)
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression.status is equal to {status}"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).status"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{status}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testBundleTimestampGtPreviousBundle(number)
* test[=].action[+].assert.description = "Confirm that the bundle.timestamp is greater than the previousBundle"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.timestamp"
* test[=].action[=].assert.operator = #greaterThan
* test[=].action[=].assert.value = "${BundleTimestamp{number}}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testConditionClinicalStatusActive
* test[=].action[+].assert.description = "Confirm that the Condition clinicalStatus is active"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).all(clinicalStatus.coding.code = 'active')"
* test[=].action[=].assert.warningOnly = false

RuleSet: testConditionRecordedDateLtBundleTime
* test[=].action[+].assert.description = "Confirm that the Condition recordedDate is less than or equal to bundle.timestamp"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).all(recordedDate <= %resource.timestamp)"
* test[=].action[=].assert.warningOnly = false

RuleSet: testConditionVerificationStatusEqConfirmed
* test[=].action[+].assert.description = "Confirm that the Condition verification Status is Confirmed"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Condition).all(verificationStatus.coding.code = 'confirmed')"
* test[=].action[=].assert.warningOnly = false

RuleSet: testClinicalImpressionIdEqPrevious(number)
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression Id  is the same ad previous"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).id"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${clinicalImpressionId{number}}"
* test[=].action[=].assert.warningOnly = false

RuleSet: testClinicalImpressionStatusInProgress
* test[=].action[+].assert.description = "Confirm that the ClinicalImpression status  is in-progress"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).status"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "in-progress"
* test[=].action[=].assert.warningOnly = false

RuleSet: testClinicalImpressionEffectiveDateTimeEqPrevious(number)
* test[=].action[+].assert.description = "Confirm that the effective dateTime is equal to previous"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(ClinicalImpression).effective"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${clinicalImpressionEffectiveDatetime{number}}"
* test[=].action[=].assert.warningOnly = false

//Goal can be found in the 3th instans example entry 18
RuleSet: testGoal83fdfed2-f182-4a11-8ea1-de8181e6eab9
* test[=].action[+].assert.description = "Confirm that the Goal contains the correct target and addresses combinations"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Goal).where((('66959f77-6e2a-4574-8423-3ff097f8b9fa' in target.measure.coding.code) and ('90c48f03-f194-4b2f-ad7d-6cba1069ae48' in target.measure.coding.code)) and (target.where(measure.coding.code = '66959f77-6e2a-4574-8423-3ff097f8b9fa').detail.coding.code = '8328ce4a-6238-4f73-bf1a-74aadb68eff8') and (target.where(measure.coding.code = '90c48f03-f194-4b2f-ad7d-6cba1069ae48').detail.coding.code = '10752a63-00b4-4958-b7f4-9f3a18f74266') and (%resource.entry.where(resource.ofType(Condition).code.coding.code = '3f9da5ac-9686-4eeb-b517-b46e17fcb1d7' and resource.ofType(Condition).severity.coding.code = '5bdde847-2837-416b-ab63-bbff8b7aa531').fullUrl.replace('url','') in addresses.reference) and (%resource.entry.where(resource.ofType(Condition).code.coding.code = '685e8517-2f5c-4ef8-a7c4-fa2d008fdd9d' and resource.ofType(Condition).severity.coding.code = '8328ce4a-6238-4f73-bf1a-74aadb68eff8').fullUrl.replace('url','') in addresses.reference) and (%resource.entry.where(resource.ofType(Condition).code.coding.code = 'eff3385d-01fa-4c9c-9850-52e179243f21' and resource.ofType(Condition).severity.coding.code = 'cae545f5-2813-4d79-98fc-0a7d770af3cd').fullUrl.replace('url','') in addresses.reference)).count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"
* test[=].action[=].assert.warningOnly = false

//Goal can be found in the 3th instans example entry 19
RuleSet: testGoalfcbf670a-f310-485b-b717-07c027c3c808
* test[=].action[+].assert.description = "Confirm that the Goal contains the correct target and addresses combinations"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Goal).where((('66959f77-6e2a-4574-8423-3ff097f8b9fa' in target.measure.coding.code) and ('90c48f03-f194-4b2f-ad7d-6cba1069ae48' in target.measure.coding.code)) and (target.where(measure.coding.code = '66959f77-6e2a-4574-8423-3ff097f8b9fa').detail.coding.code = 'b508ff66-6326-4862-a6d7-7bbf184c9823') and (target.where(measure.coding.code = '90c48f03-f194-4b2f-ad7d-6cba1069ae48').detail.coding.code = 'd41c8072-52f8-42b5-9375-ddbea454d27f') and (%resource.entry.where(resource.ofType(Condition).code.coding.code = '01770afa-cd17-41fe-a966-b8895e4d55d8' and resource.ofType(Condition).severity.coding.code = '5bdde847-2837-416b-ab63-bbff8b7aa531').fullUrl.replace('url','') in addresses.reference)).count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"
* test[=].action[=].assert.warningOnly = false

//Goal can be found in the 3th instans example entry 20
RuleSet: testGoal90fa089a-1f80-40d0-96db-8e875e241b06
* test[=].action[+].assert.description = "Confirm that the Goal contains the correct target and addresses combinations"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Goal).where((('66959f77-6e2a-4574-8423-3ff097f8b9fa' in target.measure.coding.code) and ('90c48f03-f194-4b2f-ad7d-6cba1069ae48' in target.measure.coding.code)) and (target.where(measure.coding.code = '66959f77-6e2a-4574-8423-3ff097f8b9fa').detail.coding.code = 'cae545f5-2813-4d79-98fc-0a7d770af3cd') and (target.where(measure.coding.code = '90c48f03-f194-4b2f-ad7d-6cba1069ae48').detail.coding.code = 'e47c22bd-d88d-48ab-882b-419923e1f44e') and (%resource.entry.where(resource.ofType(Condition).code.coding.code = '464a2ab6-a7df-4b3a-b74d-7873f4cfe668' and resource.ofType(Condition).severity.coding.code = 'cae545f5-2813-4d79-98fc-0a7d770af3cd').fullUrl.replace('url','') in addresses.reference)).count()"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "1"
* test[=].action[=].assert.warningOnly = false

RuleSet: testGoallifecycleStatusActive
* test[=].action[+].assert.description = "Confirm that the Goal lifecycleStatus is active"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Goal).all(lifecycleStatus = 'active').count()"
* test[=].action[=].assert.warningOnly = false

RuleSet: testCareplanStartbeforeBundletime
* test[=].action[+].assert.description = "Confirm that the Careplan start i less or equal to bundle time"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(CarePlan).period.start <= %resource.timestamp"
* test[=].action[=].assert.warningOnly = false

RuleSet: testCareplanIntentPLAN
* test[=].action[+].assert.description = "Confirm that the Careplan intent is plan"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(CarePlan).intent = 'plan'"
* test[=].action[=].assert.warningOnly = false

RuleSet: testCareplanStatusActive
* test[=].action[+].assert.description = "Confirm that the Careplan intent is plan"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(CarePlan).intent = 'plan'"
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
* test[=].action[=].operation.sourceId = "fix-bundle-create-{number}" 
* test[=].action[=].operation.responseId = "bundle-create-{number}"



RuleSet: variableMunicipalityCaseNumber(number)
//There will only be one and only one MunicipalityCaseNumber for each test.
* variable[+].name = "municipalityCaseNumber"
* variable[=].expression = "Bundle.entry.resource.ofType(ServiceRequest).extension.where(url= 'http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-municipalityCaseNumber').extension.where(url= 'municipalitySpecific').value.value"
* variable[=].sourceId = "bundle-create-{number}"

RuleSet: variablePatientIdentifier(number)
* variable[+].name = "patientIdentifier"
* variable[=].expression = "Bundle.entry.resource.ofType(Patient).identifier.value"
* variable[=].sourceId = "bundle-create-{number}"

RuleSet: variableServiceRequestFullUrl(number)
* variable[+].name = "ServiceRequestFullUrl"
* variable[=].expression = "Bundle.entry.where(resource.ofType(ServiceRequest)).fullUrl"
* variable[=].sourceId = "bundle-create-{number}"

//For the 3th test to compare ref to observation
RuleSet: variableObservationFullUrl(number)
* variable[+].name = "observationFullUrl{number}"
* variable[=].expression = "Bundle.entry.where(resource.ofType(Observation)).fullUrl"
* variable[=].sourceId = "bundle-create-{number}"

//For ClinicalImpression.id
RuleSet: variableClinicalImpressionId(number)
* variable[+].name = "clinicalImpressionId{number}"
* variable[=].expression = "Bundle.entry.resource.ofType(ClinicalImpression).id"
* variable[=].sourceId = "bundle-create-{number}"

//For ClinicalImpression EffectiveDatetime
RuleSet: variableClinicalImpressionEffectiveDatetime(number)
* variable[+].name = "clinicalImpressionEffectiveDatetime{number}"
* variable[=].expression = "Bundle.entry.resource.ofType(ClinicalImpression).effective"
* variable[=].sourceId = "bundle-create-{number}"

//For Bundle timestamp
RuleSet: variableBundleTime(number)
* variable[+].name = "BundleTimestamp{number}"
* variable[=].expression = "Bundle.timestamp"
* variable[=].sourceId = "bundle-create-{number}"

RuleSet: profileFfb
* profile.id = "kl-ffb-reporting-profile"
* profile.reference = "http://ffb/reporting/kl.dk/1.0/StructureDefinition/kl-reporting-ffb-deliveryReport" 

RuleSet: fixtureFfb(number, fixture)
* fixture[+].id = "fix-bundle-create-{number}"
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

RuleSet:  validation
* test[=].action[+].assert.description = "Validate the ffb message"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.validateProfileId  = "kl-ffb-reporting-profile"
* test[=].action[=].assert.warningOnly = false


//Test: is the ConditinCodes from the 2nd Encounter 
//https://build.fhir.org/ig/hl7dk/kl-ffb-reporting/example.html#2nd-encounter--second-documentation-phase--case-insight in the bundle
RuleSet: testconditionCodesExists
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