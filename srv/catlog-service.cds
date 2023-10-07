using {riskmanagement as my} from '../db/schema';

service catservice @(path:'/catlog'){

    entity Risks as projection on my.Risks;
    annotate Risks with @odata.draft.enabled;

    entity Mitigations as projection on my.Mitigations;
    annotate Mitigations with @odata.draft.enabled;

    @readonly entity BusinessPartners as projection on my.BusinessPartners;

}

