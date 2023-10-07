using {riskmanagement as my} from '../db/schema';

annotate my.Risks with {
    ID @title: 'Risk';
    title @title: 'Title';
    owner @title: 'Owner';
    prio @title: 'Priority';
    descr @title: 'Description';
    miti @title: 'Mitigation';
    impact @title: 'Impact';
    criticality @title: 'Criticality';
    miti @(Common: {
        Text: miti.descr,
        TextArrangement: #TextOnly,
        ValueList: {
            Label: 'Mitigations',
            CollectionPath: 'Mitigations',
            Parameters: [
                {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: miti_ID, ValueListProperty: 'ID'},
                {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'descr'}
            ]
        }
    });
    // Assuming bp refers to Business Partner in Risks
    bp @title: 'Business Partner';
    bp @(Common: {
        Text: bp.LastName,
        TextArrangement: #TextOnly,
        ValueList: {
            Label: 'Business Partners',
            CollectionPath: 'BusinessPartners',
            Parameters: [
                {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: bp_BusinessPartner, ValueListProperty: 'BusinessPartner'},
                {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'LastName'},
                {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'FirstName'}
            ]
        }
    });
};

annotate my.Mitigations with {
    ID @(
        UI.Hidden,
        Common: {Text: descr}
    );
    owner @title: 'Owner';
    descr @title: 'Description';
};

annotate my.BusinessPartners with {
    BusinessPartner @(
        UI.Hidden,
        Common: {Text: LastName}
    );
    LastName @title: 'Last Name';
    FirstName @title: 'First Name';
};
