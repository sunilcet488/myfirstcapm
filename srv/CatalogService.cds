using { sunil.db.master,sunil.db.transaction } from '../db/datamodel';

service CatalogService@(path:'/CatalogService') {

    entity ProductSet as projection on master.product;
    entity ProductTextSet as projection on master.product_text;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;

}