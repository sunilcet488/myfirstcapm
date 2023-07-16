using { sunil.db.master,sunil.db.transaction } from '../db/datamodel';

service CatalogService@(path:'/CatalogService') {

    entity ProductSet as projection on master.product;
    // entity ProductTextSet as projection on master.product_text;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity test as projection on master.test;

    entity pos as projection on transaction.purchaseorder{
       *,
       items : redirected to pitems
    };

    entity pitems as projection on transaction.poitems{
      *,
      parent_key : redirected to pos,
      product_uuid : redirected to ProductSet
    };

}