declare namespace c = "http://www.example.org/schemas/clinic";
declare namespace p = "http://www.example.org/schemas/clinic/patient";
declare namespace t="http://www.example.org/schemas/clinic/treatment";
declare namespace pr="http://www.example.org/schemas/clinic/provider";
declare namespace cid = "http://www.example.org/schemas/clinic/clinic_ids";
import module namespace q = "http://www.example.org/xquery/clinic" at "Queries.xq";

let $pat := <p:patient-id>10124341</p:patient-id>

let $clinic := doc("instance1.xml")/c:Clinic

return q:getPatientTreatments ($pat, doc("instance1.xml")/c:Clinic)