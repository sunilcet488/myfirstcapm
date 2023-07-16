# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

My Note:

System automatically generate the V4 version of the odata service
however the crud operation can be restricted using the annotation

few odata operation
http://localhost:4004/CatalogService/BusinessPartnerSet
http://localhost:4004/CatalogService/BusinessPartnerSet?$top=1
http://localhost:4004/CatalogService/BusinessPartnerSet?$skip=1
http://localhost:4004/CatalogService/BusinessPartnerSet?$filter=bp_role%20eq%20%27CUST%27


expand association

http://localhost:4004/CatalogService/pitems(337a2bcc-18a2-11ee-be56-0242ac120002)?$expand=parent_key,product_uuid
http://localhost:4004/CatalogService/pos(28b30412-18a1-11ee-be56-0242ac120002)?$expand=items

http://localhost:4004/CatalogService/pos(28b30412-18a1-11ee-be56-0242ac120002)?$expand=items&$select=po_id,overall_status

http://localhost:4004/CDSViewService/CDSView

