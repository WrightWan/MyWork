module namespace q = "http://www.example.org/xquery/clinic";
declare namespace c = "http://www.example.org/schemas/clinic";
declare namespace p = "http://www.example.org/schemas/clinic/patient";
declare namespace t="http://www.example.org/schemas/clinic/treatment";
declare namespace cid = "http://www.example.org/schemas/clinic/clinic_ids";
declare namespace pr="http://www.example.org/schemas/clinic/provider";

declare function q:getPatientTreatments($pid as element(p:patient-id), $klinic as element(c:Clinic)) 
    as element(p:treatment)* {
   
    let $pat := $klinic/p:Patient
    where $pat/p:patient-id = $pid
    return 
        for $tre in $pat/p:treatments/p:treatment
        return $tre        
};

declare function q:getPatientDrugs($pid as element(p:patient-id), $klinic as element(c:Clinic))
    as element(q:patient-drug)* {
    
    let $pat := $klinic/p:Patient
    where $pat/p:patient-id = $pid
    return
        for $tre in $pat/p:treatments/p:treatment
        return
            let $diag := $tre/t:diagnosis
            return
                for $drug in $tre/t:drug-treatment
                return <q:patient-drug>{ $drug/t:name, $diag, $drug/t:dosage }</q:patient-drug>
};

declare function q:getTreatmentInfo($klinic as element(c:Clinic))
    as element(q:treatment-info) {
    <q:treatment-info> {
        for $pat in $klinic/p:Patient
        return
            let $pid := $pat/p:patient-id
            return
                for $tre in $pat/p:treatments/p:treatment
                return <q:record>{$tre, $pid, $tre/t:provider-id}</q:record>

    
    }</q:treatment-info>
};

declare function q:getProviderInfo($klinic as element(c:Clinic))
    as element(q:provider-info) {
    <q:provider-info> {
        for $prov in $klinic/pr:Provider
        return <q:provider-records> {
            $prov,
            for $pat in $klinic/p:Patient
            where $pat/p:treatments/p:treatment/t:provider-id = $prov/pr:provider-id
            return <q:patient-records>{
                $pat/p:name, $pat/p:patient-id, 
                for $tre in $pat/p:treatments/p:treatment
                where $tre/t:provider-id = $prov/pr:provider-id
                return $tre
                }</q:patient-records>
        }</q:provider-records>
    }</q:provider-info>
    
};    

declare function q:getDrugInfo($klinic as element(c:Clinic))
    as element(q:drug-info) {
    <q:drug-info> {
        for $drug in $klinic/p:Patient/p:treatments/p:treatment/t:drug-treatment/t:name
        return <q:drug-record>{ $drug,
        for $pat in $klinic/p:Patient
        where $pat/p:treatments/p:treatment/t:drug-treatment/t:name = $drug
        return 
            for $tre in $pat/p:treatments/p:treatment
            where $tre/t:drug-treatment/t:name = $drug
            return <q:treatment>{$pat/p:name,$tre/t:diagnosis,$tre/t:provider-id}</q:treatment>
        }</q:drug-record>       
    }</q:drug-info>
    
};    