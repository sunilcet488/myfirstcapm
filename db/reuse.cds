namespace sunil.reuse;

using { cuid,managed,temporal,Currency } from '@sap/cds/common';

// User defined aspects
type gender : String(2) enum{
    male = 'M';
    female = 'F';
    nodisclose = 'N';
};

type phonenumber : String(20)@assert.format : '^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$';
type email : String(20) @assert.format : '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';

type amount_type : Decimal(15,2)@(
    Semantic.amount.currency : 'CURRENCY',
    sap.unit : 'CURRENCY_CODE'   
);


abstract entity amount {
        currency : String(4);
        gross_amount: amount_type;
        net_amount: amount_type;
};



