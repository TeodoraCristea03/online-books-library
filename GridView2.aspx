<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView2.aspx.cs" Inherits="Proiect_BDI.GridView2" %><%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>
            <center>Grafic</center>
        </h1>
        <div>
            <cc1:ZedGraphWeb ID="ZedGraphWeb" runat="server">
            </cc1:ZedGraphWeb>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back" />
    </form>
</body>
</html>
