<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Filter_StatusBarFilterWithComboBox_StatusBarFilterWithComboBox" %>

<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web" TagPrefix="dxwp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Filter data using a combo box embedded into the grid's status bar</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <p><input type="button" value="Clear Filter" onclick="grid.ClearFilter();" /></p>
        <dxwgv:ASPxGridView ID="grid" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="False" KeyFieldName="CategoryID" ClientInstanceName="grid" OnCustomCallback="grid_CustomCallback">
            <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
            <Columns>
                <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                <dxwgv:GridViewDataTextColumn Caption="CategoryID" FieldName="CategoryID" ReadOnly="True"
                    VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataComboBoxColumn Caption="CategoryName" FieldName="CategoryName"
                    VisibleIndex="2">
                    <PropertiesComboBox TextField="CategoryName" ValueField="CategoryName">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                </dxwgv:GridViewDataComboBoxColumn>
                <dxwgv:GridViewDataTextColumn Caption="Description" FieldName="Description" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <Templates>
                <StatusBar>
                    <dxe:ASPxComboBox ID="cbFilterBy" runat="server" ClientInstanceName="cbFilterBy"
                        EnableClientSideAPI="True" DataSourceID="AccessDataSource2" TextField="CategoryName" ValueField="CategoryName">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
    grid.PerformCallback(cbFilterBy.GetText());
}" />
                    </dxe:ASPxComboBox>
                </StatusBar>
            </Templates>
        </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT * FROM [Categories]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT CategoryName FROM [Categories]">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>
