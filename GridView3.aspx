<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView3.aspx.cs" Inherits="Proiect_BDI.GridView3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proceduri Stocate</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnCreare" runat="server" OnClick="Button1_Click" Text="Create" />
            <br />
            <br />
            <br />
            <asp:TextBox ID="tbMes" runat="server" BackColor="#66CCFF" Height="281px" TextMode="MultiLine" Width="740px"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Min&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbMin" runat="server" BackColor="#FFCCCC" Width="89px">200</asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnApel" runat="server" OnClick="btnApel_Click" Text="Call" Width="76px" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbMax" runat="server" BackColor="#FFCCCC" Width="89px">300</asp:TextBox>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Back to first page" />
    </form>
</body>
</html>
