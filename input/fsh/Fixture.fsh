
RuleSet: fixtureCreateMessage(fixture, type, number)
* fixture[+].id = "create-{type}-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

/* RuleSet: fixtureUpdateMessage(fixture, type, number)
* fixture[+].id = "update-{type}-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

RuleSet: fixtureCancelMessage(fixture, type, number)
* fixture[+].id = "cancel-{type}-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"
 */
/* RuleSet: dynamicFixture(fixture, type, number)
* extension.extension[0].url = "id"
* extension.extension[=].valueId = "create-{type}-{number}"
* extension.extension[+].url = "resourceType"
* extension.extension[=].valueString = "Bundle"
* extension.extension[+].url = "contentType"
* extension.extension[=].valueString = "application/fhir+json"
* extension.extension[+].url = "description"
* extension.extension[=].valueString = "Bundle create fixture. Enter the FHIR Patient resource that is to be created on the target test system."
* extension.extension[+].url = "hint"
* extension.extension[=].valueString = "Bundle resource contents"
* extension.url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-dynamic-fixture" */
