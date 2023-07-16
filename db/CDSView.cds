namespace sunil.db;

using { sunil.db.transaction } from './datamodel';

context CDSViews {
    define view ![OrderWorklist] as
    select from transaction.purchaseorder{
        key po_id as ![purchaseOrderId],
        gross_amount as ![grossAmount],
        overall_status as ![overallStatus],
        key items.po_item as ![purchaseOrderItem],
        items.product_uuid.product_id as ![productId],
        items.product_uuid.product_name as ![productName],
        items.product_uuid.description as ![productDescription],
        items.net_amount as ![netAmount],
        items.currency as ![currencyCode]
    }
}


