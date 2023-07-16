using { sunil.db.CDSViews } from '../db/CDSView';

service CDSViewService @(path:'/CDSViewService') {
    entity CDSView as projection on CDSViews.OrderWorklist;
}
