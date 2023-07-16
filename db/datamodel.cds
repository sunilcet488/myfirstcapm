namespace sunil.db;

using { cuid, temporal } from '@sap/cds/common';
using { sunil.reuse } from './reuse';



// data element or custom data type
type company_name_type : String(80);

// conext is nothing but grouping of table - its SE11 Delivery class - master, transaction
context master {

    entity businesspartner {
        key node_key : UUID;
        bp_id : Int16;
        bp_role: String(10);
        email : String(40);
        phone : String(14);
        address_key : Association to address;
        company_name : company_name_type;
    }

    annotate businesspartner with{
        node_key @title : '{i18n>bp_key}';
        bp_role @title : '{i18n>bp_role}';
        email @title : '{i18n>email}';
        bp_id @title : '{i18n>bp_id}';
        phone @title : '{i18n>phone}';
        company_name @title : '{i18n>company_name}';
    } ;
    

    entity test{
        key name : String(20);
        salary : Int16;
    }

    entity address{
        key node_key : UUID;
        city : String(20);
        postal_code : String(14);
        street : String(30);
        country : String(2);
        val_start_date : Date;
        val_end_date : Date;
        latitude : Decimal;
        longitude : Decimal;
        businesspartner : Association to one businesspartner on businesspartner.address_key = $self;
    }

    // entity product_text{
    //     key node_key : UUID;
    //     parent_key : UUID;
    //     lang : String(2);
    //     text : String(80);
    // }    

    entity product{
        key node_key : UUID;
        product_id : Int16;
        product_name: String(40);
        product_cat: String(2);
        description : localized String(255);
        // desc_guid : Association to product_text;
        price: Decimal;
        currency : String(4);
        supplier_guid : Association to master.businesspartner;
    }



    entity employee: cuid,temporal{
        name: String(60);
        gender: reuse.gender;
        email: reuse.email;
        phonenumber : reuse.phonenumber;
    }
    
}

context transaction {
    entity purchaseorder: cuid,reuse.amount{
        po_id : Int16;
        parnter_guid : Association to master.businesspartner;
        lifecycle_status : String(2);
        overall_status: String(2);
        items: Association to many poitems on items.parent_key = $self
    }

    entity poitems: cuid,reuse.amount{
        parent_key : Association to one purchaseorder;
        po_item : Int16;
        product_uuid : Association to master.product;

    }
}
