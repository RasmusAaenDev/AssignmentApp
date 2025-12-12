codeunit 50250 "Sales Assignment Test"
{
    Subtype = Test;

    [Test]
    procedure "Open Sales Order_Release_An Assignment To Be Created"()
    var
        SalesHeader: Record "Sales Header";
        Assignment: Record Assignment;
        ReleaseSalesDocument: Codeunit "Release Sales Document";
        PreTestRunCnt: Integer;
    begin
        // [GIVEN] OpenSalesOrder 
        PreTestRunCnt := Assignment.Count;

        SalesHeader.SetRange(Status, SalesHeader.Status::Open);
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.FindFirst();

        // [WHEN] Release 
        ReleaseSalesDocument.ReleaseSalesHeader(SalesHeader, false);

        // [THEN] An Assignment To Be Created 
        if PreTestRunCnt = Assignment.Count then
            Error('No assignment has been created');
    end;
}