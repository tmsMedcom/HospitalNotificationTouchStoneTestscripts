### Background

In this IG, testscripts for sending and receiving [HospitalNotifications](https://medcomdk.github.io/dk-medcom-hospitalnotification) are included.
The testscripts are created by MedCom for testing in [Touchstone](https://touchstone.aegis.net/touchstone/) during MedCom test and certification, both self- and livetest. However, they may be used locally by vendors in their own testsetup. 

Testscripts presented in this IG are all based on the [Testscript FHIR resource](https://www.hl7.org/fhir/testscript.html). They are profiled by MedCom using FSH and published using the FHIR publisher. 

### Before getting started

Use cases described in the [use case document](https://medcomdk.github.io/dk-medcom-hospitalnotification/#12-use-cases) will be referenced throughout this Implementation Guide and are the basis for the testscripts. 

As a supplementary for testscripts associated with the use cases, testscripts testing patient flow are included. These testscripts will test different and in some cases extended flows of the HospitalNotification, that hasn't been tested in the use cases. They will of course only test within the boundaries of the HospitalNotification standard and governance. 

#### TouchStone and API
Before getting started with testscript execution, it is nessecary to have an account on TouchStone and to create a testsystem. Please follow [this guide to steup an account and testsystem](https://medcomdk.github.io/MedComLandingPage/assets/documents/TouchStoneGettingStarted.html).

#### Abbreviations and naming
The term 'inpatient' and abbreviation 'imp' refers to a patient that is hospitalised as an inpatient (Danish: indlagt) and the term 'emergency' or abbreviation 'emer' refers to a patient thst is hospitalised as acute ambulant (Danish: akut ambulant).

The abbreviation 'tec' is used when testing the patient flow, to indicate that the testscript has a tecnical character. 

The system under test is abbreviated 'SUT'.

**Testscript naming:**

**Use cases:** Most of the send testscripts requires that the system under test (SUT) has executed one or more use cases in advance. 
The name of the testscripts are constituted by HospitalNotification-[Type]-[imp/emer or alternative flow]-[precondition], describing the type of messaging being sent, or receveived. 'HospitalNotifciation-' is not shown in the naming below.

**Patient flow:** These will be named HospitalNotification-PF-[send/receive]-[imp/emer/tec]-[number]. 'HospitalNotifciation-' is not shown in the naming below. 


### Send Hospitalnotification testscripts
When sending a HospitalNotification, a POST operation is required for all types of messages, valid for both the precondition messages and actual messages being tested. 

#### Use Cases

| **Testscript** | **Use case code** | **Use case description** | **Type** | **Precondition** |
|---|---|---|---|---|
| **Inpatient** |  |  |  |  |
| STIN | S1 | Indlæg   patient og send ‘Advis om sygehusophold’ | STIN |  |
| STIN-A1 | S1.A1 | Indlæg patient og send ‘Advis om   sygehusophold’ uden anmodning om indlæggelsesrapport | STIN |  |
| STOR-imp | S3 | Registrér   patient på orlov og send ‘Advis om sygehusophold’ | STOR | STIN |
| SLOR-imp | S4 | Registrér patient som returneret   fra orlov og send ‘Advis om sygehusophold’ | SLOR | STIN, STOR |
| SLHJ-imp | S6 | Udskriv/afslut   patient og send ‘Advis om sygehusophold’ | SLHJ | STIN |
| MORS | S7 | Send ‘Advis om sygehusophold’   ved patientens død - død ved ankomst | MORS |   |
| MORS-imp | S7 | Send   ‘Advis om sygehusophold’ ved patientens død - patient død under indlæggelse | MORS | STIN |
| MORS-STOR | S7 | Send ‘Advis om sygehusophold’   ved patientens død - patient død under orlov | MORS | STIN, STOR |
| **Emergency** |  |  |  |  |
| STAA | S2 | Registrér patient som akut   ambulant og send ‘Advis om sygehusophold’ | STAA |  |
| SLHJ-emer | S6 | Udskriv/afslut   patient og send ‘Advis om sygehusophold’ | SLHJ | STAA |
| MORS-emer | S7 | Send ‘Advis om sygehusophold’   ved patientens død | MORS | STAA |
| **Inpatient** |  |  |  |  |
| RE_STIN | S.CORR | Ret sygehusophold og send   rettelsesadvis | RE_STIN | STIN |
| RE_STOR | S.CORR | Ret   sygehusophold og send rettelsesadvis | RE_STOR | STIN,   STOR |
| RE_SLOR | S.CORR | Ret sygehusophold og send   rettelsesadvis | RE_SLOR | STIN, STOR, SLOR |
| RE_SLHJ-imp | S.CORR | Ret   sygehusophold og send rettelsesadvis | RE_SLHJ | STIN,   SLHJ |
| RE_MORS | S.CORR | Send ‘Advis om sygehusophold’   ved patientens død - død ved ankomst | RE_MORS | MORS |
| RE_MORS-imp | S.CORR | Send   ‘Advis om sygehusophold’ ved patientens død - patient død under indlæggelse | RE_MORS | STIN,   MORS |
| RE_MORS-STOR | S.CORR | Send ‘Advis om sygehusophold’   ved patientens død - patient død under orlov | RE_MORS | STIN, STOR, MORS |
| **Emergency** |  |  |  |  |
| RE_STAA | S.CORR | Ret sygehusophold og send   rettelsesadvis | RE_STAA | STAA |
| RE_SLHJ-emer | S.CORR | Ret   sygehusophold og send rettelsesadvis | RE_SLHJ | STAA,   SLHJ |
| RE_MORS-emer | S.CORR | Ret sygehusophold og send   rettelsesadvis | RE_MORS | STAA, MORS |
| **Inpatient** |  |  |  |  |
| AN_STIN | S.CANC | Annullér en allerede afsendt   ‘Advis om sygehusophold’ | AN_STIN | STIN |
| AN_STOR-imp | S.CANC | Annullér   en allerede afsendt ‘Advis om sygehusophold’ | AN_STOR | STIN,   STOR |
| AN_SLOR-imp | S.CANC | Annullér en allerede afsendt   ‘Advis om sygehusophold’ | AN_SLOR | STIN, STOR, SLOR |
| AN_SLHJ-imp | S.CANC | Annullér   en allerede afsendt ‘Advis om sygehusophold’ | AN_SLHJ | STIN,   SLHJ |
| AN_MORS | S.CANC | Send ‘Advis om sygehusophold’   ved patientens død - død ved ankomst | AN_MORS | MORS |
| AN_MORS-imp | S.CANC | Send   ‘Advis om sygehusophold’ ved patientens død - patient død under indlæggelse | AN_MORS | STIN,   MORS |
| AN_MORS-STOR | S.CANC | Send ‘Advis om sygehusophold’   ved patientens død - patient død under orlov | AN_MORS | STIN, STOR, MORS |
| **Emergency** |  |  |  |  |
| AN_STAA | S.CANC | Annullér en allerede afsendt   ‘Advis om sygehusophold’ | AN_STAA | STAA |
| AN_SLHJ-emer | S.CANC | Annullér   en allerede afsendt ‘Advis om sygehusophold’ | AN_SLHJ | STAA,   SLHJ |
| AN_MORS-emer | S.CANC | Annullér en allerede afsendt   ‘Advis om sygehusophold’ | AN_MORS | STAA, MORS |


#### Patient Stories
Patient story (PS) act as a likely story for a exchange of messages about a HospitalNotification. 

| Teststript | Description | Type(s) | Precondition | Operation | Fixture |
|------------|-------------|---------|--------------|-----------|---------|
| **Inpatient** ||||||
| PF-send-imp-01 | Admit patient, register patient as being on leave, register patient as returned from leave, discharge patient. | STIN, STOR, SLOR, SLHJ | |  Post |  |
| PF-send-imp-02 | Admit patient, register patient as being on leave, patient doesn't return from leave, discharge patient.  | STIN, STOR, SLHJ  | | Post |  |
| PF-send-imp-03 | Admit patient, register patient as being on leave, patient dies during leave.  | STIN, STOR, MORS  | | Post |  |
| PF-send-imp-04 | Admit patient, register patient as being on leave, patient dies during leave.  | STIN, STOR, MORS  | | Post |  |
| PF-send-imp-05 | Admit patient, correct message due to incorrect hospital department | STIN, RE_STIN, SLHJ | | Post, Update |  |
| PF-send-imp-06 | Admit patient, correct message due to incorrect time of admission | STIN, RE_STIN | | Post, Update |  |
| PF-send-imp-07 | Admit patient, cancel message due to incorrect patient-identifier | STIN, AN_STIN, SLHJ| | Post, Delete |  |
| PF-send-imp-08 | Admit patient, correct message due to incorrect use of hospital stay | STIN, AN_STIN | | Post, Delete |  |
|**Emergency**||||||
| PF-send-emer-01 | Admit patient, correct message due to incorrect hospital department | STAA, RE_STAA, SLHJ | | Post, Update |  |
| PF-send-emer-02 | Admit patient, correct message due to incorrect time of admission | STAA, RE_STAA, SLHJ | | Post, Update |  |
| PF-send-emer-03 | Admit patient, cancel message due to incorrect patient-identifier (CPR-nr.) | STAA, AN_STAA | | Post, Delete |  |
| PF-send-emer-04 | Admit patient, correct message due to incorrect use of hospital stay | STAA, AN_STAA | | Post, Delete |  |
| **Emergency/Inpatient** ||||||
| PF-send-emer/imp-01 | Admit patient as emergency, Admit patient as inpatient, discharge patient  | STAA, STIN, SLHJ  | | Post |  |



### Receive HospitalNotification message
When receiving a HospitalNotification, a GET operation is required for all types of messages, valid for both the precondition messages and actual messages being tested. During setup of the testscript, all messages in these testscripts will be put on the server using during test. 


#### Use Cases

| Teststript | Use case code | Use case description | Type | Precondition | Operation | Fixture |
|------------|---------------|----------------------|------|--------------|-----------|---------|
|**Inpatient** |||||||
| STIN     | R1 | Modtag advisering om indlæggelse og send indlæggelsesrapport | STIN | |    Get/Post |  |
| STIN-A1  | R1.A1 | Modtag advisering om indlæggelse uden afsendelse af indlæggelsesrapport |STIN | |    Get |  |
| STOR | R3 | Modtag advisering om orlov  | STOR | R1 |  Get |  |
| SLOR | R4 |Modtag advisering om afslutning af orlov  |SLOR | R1, R3 |  Get |  |
| SLHJ-imp | R6 |Modtag advisering om afslutning/udskrivelse  |SLHJ | R1 |  Get |  |
| MORS-imp-R1 | R7 |Modtag advisering om borgerens død  |MORS | R1 | Get |  |
| MORS-imp-R3 | R7 |Modtag advisering om borgerens død  |MORS | R3 | Get |  |
| MORS-imp-R4 | R7 |Modtag advisering om borgerens død  |MORS | R4 | Get |  |
|**Emergency** |||||||
| STAA     | R2 | Modtag advisering om akut ambulant sygehusophold og send indlæggelsesrapport |STAA | |  Get/Post |  |
| SLHJ-emer| R6 |Modtag advisering om afslutning/udskrivelse |SLHJ | R2 |  Get |  |
| MORS-emer| R7 |Modtag advisering om borgerens død |MORS | R2 |  Get |  |
|**Inpatient** |||||||
| AN_STIN    | R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STIN | R1 | Get |  |
| AN_STOR| R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STOR | R1, R3 | Get |  |
| AN_SLOR| R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_SLOR | R1, R3, R4 | Get |  |
| AN_SLHJ-imp| R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_SLHJ | R1, R6 | Get |  |
| AN_MORS-imp| R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_MORS | R1, R7 | Get |  |
|**Emergency** |||||||
| AN_STAA     | R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_STAA | R2 | Get |  |
| AN_SLHJ-emer| R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_SLHJ | R2, R6 | Get |  |
| AN_MORS-emer| R.CANC |Modtag advisering om annulleret ‘Advis om sygehusophold’ | AN_MORS | R2, R7 | Get |  |
|**Inpatient**|||||||
| RE_STIN    | R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_STIN | R1 | Get |  |
| RE_STOR| R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_STOR | R1, R3 | Get |  |
| RE_SLOR| R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_SLOR | R1, R3, R4 | Get |  |
| RE_SLHJ-imp| R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_SLHJ | R1, R6 | Get |  |
| RE_MORS-imp| R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_MORS | R1, R7 | Get |  |
|**Emergency**|||||||
| RE_STAA    | R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_STAA | R2 | Get |  |
| RE_SLHJ-imp| R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_SLHJ | R2, R6 | Get |  |
| RE_MORS-imp| R.CORR |Modtag advisering om rettet ‘Advis om sygehusophold’ | RE_MORS | R2, R7 | Get |  |


#### Patient Stories
Patient story (PS) act as a likely story for a exchange of messages about a HospitalNotification. 

| Teststript | Description | Type(s) | Precondition | Operation | Fixture |
|------------|-------------|---------|--------------|-----------|---------|
| **Inpatient** ||||||
| PF-receive-imp-01 | Admit patient, register patient as being on leave, register patient as returned from leave, discharge patient. | STIN, STOR, SLOR, SLHJ | |  Get |  |
| PF-receive-imp-02 | Admit patient, register patient as being on leave, patient doesn't return from leave, discharge patient.  | STIN, STOR, SLHJ  | | Get |  |
| PF-receive-imp-03 | Admit patient, register patient as being on leave, patient dies during leave.  | STIN, STOR, MORS  | | Get |  |
| PF-receive-imp-04 | Admit patient, register patient as being on leave, patient dies during leave.  | STIN, STOR, MORS  | | Get |  |
| PF-receive-imp-05 | Admit patient, correct message due to incorrect hospital department | STIN, RE_STIN, SLHJ | |Get |  |
| PF-receive-imp-06 | Admit patient, correct message due to incorrect time of admission | STIN, RE_STIN | | Get |  |
| PF-receive-imp-07 | Admit patient, cancel message due to incorrect patient-identifier | STIN, AN_STIN, SLHJ| | Get |  |
| PF-receive-imp-08 | Admit patient, correct message due to incorrect use of hospital stay | STIN, AN_STIN | | Get |  |
|**Emergency**||||||
| PF-receive-emer-01 | Admit patient, correct message due to incorrect hospital department | STAA, RE_STAA, SLHJ | | Get |  |
| PF-receive-emer-02 | Admit patient, correct message due to incorrect time of admission | STAA, RE_STAA, SLHJ | | Get |  |
| PF-receive-emer-03 | Admit patient, cancel message due to incorrect patient-identifier (CPR-nr.) | STAA, AN_STAA | | Get|  |
| PF-receive-emer-04 | Admit patient, correct message due to incorrect use of hospital stay | STAA, AN_STAA | | Get |  |
| **Emergency/Inpatient** ||||||
| PF-receive-emer/imp-01 | Admit patient as emergency, Admit patient as inpatient, discharge patient  | STAA, STIN, SLHJ  | | Get |  |


### FHIR Shorthand Resources
<!-- 
FHIR Shorthand calls currently are the second Thursday of every month at 9 am Eastern US Time. Click here to join(https://teams.microsoft.com/l/meetup-join/19%3ameeting_OGJmYmVlM2UtYzVkZi00YWJjLWJlNzMtN2ZkYTVkYTA1Mzlk%40thread.v2/0?context=%7b%22Tid%22%3a%22c620dc48-1d50-4952-8b39-df4d54d74d82%22%2c%22Oid%22%3a%22f9a60b6f-fbcc-48d0-bc8e-d6d742b4b339%22%7d)

[HL7 Confluence site](https://confluence.hl7.org/display/FHIRI/FHIR+Shorthand)

[FHIR Shorthand Documentation](https://build.fhir.org/ig/HL7/fhir-shorthand) 

[FHIR Shorthand documentation code repository](https://github.com/HL7/fhir-shorthand)

[SUSHI code repository](https://github.com/FHIR/sushi)

[Zulip](https://chat.fhir.org) channel: #shorthand -->