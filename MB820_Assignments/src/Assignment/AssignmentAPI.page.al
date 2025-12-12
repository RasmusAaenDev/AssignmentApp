page 50206 AssignmentAPI
{
    PageType = API;
    Caption = 'Assignment';
    APIPublisher = 'rasmus';
    APIGroup = 'assignment';
    APIVersion = 'v1.0';
    EntityName = 'assignment';
    EntitySetName = 'assignments';
    SourceTable = Assignment;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(apiId; Rec."API Id")
                {
                    Caption = 'API Id';
                }
                field(categoryCode; Rec."Category Code")
                {
                    Caption = 'Category Code';
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(no; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(title; Rec.Title)
                {
                    Caption = 'Title';
                }
                field(userId; Rec."User Id")
                {
                    Caption = 'User Id';
                }
            }
        }
    }
}