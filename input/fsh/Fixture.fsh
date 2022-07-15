
RuleSet: fixtureCreateMessage(fixture, type, number)
* fixture[+].id = "create-{type}-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

RuleSet: fixtureUpdateMessage(fixture, type, number)
* fixture[+].id = "update-{type}-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

RuleSet: fixtureCancelMessage(fixture, type, number)
* fixture[+].id = "cancel-{type}-{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"