<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="Proiect_BDI.GridView" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style10 {
            margin-left: 0px;
            margin-bottom: 0px;
        }
        .auto-style12 {
            width: 400px;
            height: 0px;
        }
        .auto-style13 {
            width: 1344px;
            height: 423px;
        }
        .auto-style14 {
            width: 693px;
        }
        .auto-style15 {
            width: 641px;
            height: 0px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>
            <center>Imprumuturi Biblioteca</center>
        </h1>
        <br />
        <center>
            <table class="auto-style13">
            <tr>
                <td class="auto-style12">
                    <center><h3>Clientii Bibliotecii</h3></center></td>
                <td class="auto-style12"><center><h3>Carti Disponibile</h3></center></td>
            </tr>
            <tr>
                <td class="auto-style12">
        <asp:TextBox ID="tbNume" placeholder="Nume" runat="server" Width="120px"></asp:TextBox>
                    <br />
        <asp:TextBox ID="tbPrenume" placeholder="Prenume" runat="server" Width="120px"></asp:TextBox>
                    <br />
        <asp:TextBox ID="tbDataNastere" placeholder="Data Nasterii" runat="server" Width="120px"></asp:TextBox>
                    <br />
        <asp:TextBox ID="tbAdresaMail" placeholder="E-mail" runat="server" Width="120px"></asp:TextBox>
                    <br />
        <asp:TextBox ID="tbTelefon" placeholder="Telefon" runat="server" Width="120px"></asp:TextBox>
                    <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
                    <br />
        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_Client" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID_Client" HeaderText="ID_Client" InsertVisible="False" ReadOnly="True" SortExpression="ID_Client" />
                <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                <asp:BoundField DataField="Prenume" HeaderText="Prenume" SortExpression="Prenume" />
                <asp:BoundField DataField="Data_Nastere" HeaderText="Data_Nastere" SortExpression="Data_Nastere" />
                <asp:BoundField DataField="Adresa_mail" HeaderText="Adresa_mail" SortExpression="Adresa_mail" />
                <asp:BoundField DataField="Nr_Telefon" HeaderText="Nr_Telefon" SortExpression="Nr_Telefon" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" DeleteCommand="DELETE FROM [Clienti] WHERE [ID_Client] = @ID_Client" InsertCommand="INSERT INTO [Clienti] ([Nume], [Prenume], [Data_Nastere], [Adresa_mail], [Nr_Telefon]) VALUES (@Nume, @Prenume, @Data_Nastere, @Adresa_mail, @Nr_Telefon)" SelectCommand="SELECT [ID_CLIENT], [Nume], [Prenume], FORMAT([Data_Nastere],'dd/MM/yyyy') AS 'Data_Nastere', [Adresa_mail], [Nr_Telefon] FROM [Clienti]" UpdateCommand="UPDATE [Clienti] SET [Nume] = @Nume, [Prenume] = @Prenume, [Data_Nastere] = @Data_Nastere, [Adresa_mail] = @Adresa_mail, [Nr_Telefon] = @Nr_Telefon WHERE [ID_Client] = @ID_Client">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Client" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nume" Type="String" />
                    <asp:Parameter Name="Prenume" Type="String" />
                    <asp:Parameter DbType="Date" Name="Data_Nastere" />
                    <asp:Parameter Name="Adresa_mail" Type="String" />
                    <asp:Parameter Name="Nr_Telefon" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nume" Type="String" />
                    <asp:Parameter Name="Prenume" Type="String" />
                    <asp:Parameter DbType="Date" Name="Data_Nastere" />
                    <asp:Parameter Name="Adresa_mail" Type="String" />
                    <asp:Parameter Name="Nr_Telefon" Type="String" />
                    <asp:Parameter Name="ID_Client" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="tbMes" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Gen" DataValueField="Gen">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" SelectCommand="SELECT [Gen] FROM [Genuri]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="ID_Carte" HeaderText="ID_Carte" SortExpression="ID_Carte" />
                            <asp:BoundField DataField="Titlu" HeaderText="Titlu" SortExpression="Titlu" />
                            <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                            <asp:BoundField DataField="Prenume" HeaderText="Prenume" SortExpression="Prenume" />
                            <asp:BoundField DataField="Nume_Editura" HeaderText="Nume_Editura" SortExpression="Nume_Editura" />
                            <asp:BoundField DataField="Numar Pagini" HeaderText="Numar Pagini" SortExpression="Numar Pagini" />
                            <asp:BoundField DataField="Data Lansare" HeaderText="Data Lansare" SortExpression="Data Lansare" />
                            <asp:BoundField DataField="Nr_Stoc" HeaderText="Nr_Stoc" SortExpression="Nr_Stoc" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" SelectCommand="SELECT Carti.ID_Carte, Carti.Titlu, Autori.Nume, Autori.Prenume, Edituri.Nume_Editura, Carti.[Numar Pagini], FORMAT(Carti.[Data Lansare], 'dd/MM/yyyy') AS 'Data Lansare', Carti.Nr_Stoc FROM Autori INNER JOIN Carti ON Autori.ID_Autor = Carti.ID_Autor INNER JOIN Edituri ON Carti.ID_Editura = Edituri.ID_Editura INNER JOIN [Gen-Carte] ON Carti.ID_Carte = [Gen-Carte].ID_Carte INNER JOIN Genuri ON [Gen-Carte].ID_Gen = Genuri.ID_Gen WHERE (Genuri.Gen = @Gen)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Gen" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        </center>
            <hr />
        <center>
        <table style="width:100%;">
            <tr>
                <td class="auto-style14">
                    <center><h3>Autori Disponibili</h3></center>
                </td>
                <td><center><h3>Imprumuturi efectuate</h3></center></td>
            </tr>
        </table>
            <table class="auto-style13">
                <tr>
                    <td class="auto-style15">
            <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Prenume" HeaderText="Prenume" SortExpression="Prenume" />
                    <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                    <asp:BoundField DataField="Data_Nastere" HeaderText="Data_Nastere" SortExpression="Data_Nastere" ReadOnly="True" />
                    <asp:BoundField DataField="Nationalitate" HeaderText="Nationalitate" SortExpression="Nationalitate" />
                    <asp:BoundField DataField="Numar_Carti_Scrise" HeaderText="Numar_Carti_Scrise" SortExpression="Numar_Carti_Scrise" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" SelectCommand="SELECT [Prenume], [Nume],  FORMAT([Data_Nastere], 'dd/MM/yyyy') AS Data_Nastere, [Nationalitate], [Numar Carti Scrise] AS Numar_Carti_Scrise FROM [Autori]"></asp:SqlDataSource>
                    </td>
                    <td>
        <center>
            <asp:TextBox ID="tbDataImprumut" placeholder="Data imprumut" runat="server" CssClass="auto-style10"></asp:TextBox>
                        <br />
            <asp:TextBox ID="tbIDClient" placeholder="IDClient" runat="server"></asp:TextBox>
                        <br />
            <asp:TextBox ID="tbIDCarte" placeholder="IDCarte" runat="server"></asp:TextBox>
                        <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Insert" />

           <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_Imprumut" DataSourceID="SqlDataSource4" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="ID_Imprumut" HeaderText="ID_Imprumut" SortExpression="ID_Imprumut" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Data_Imprumut" HeaderText="Data_Imprumut" SortExpression="Data_Imprumut" />
                    <asp:BoundField DataField="ID_Client" HeaderText="ID_Client" SortExpression="ID_Client" />
                    <asp:BoundField DataField="ID_Carte" HeaderText="ID_Carte" SortExpression="ID_Carte" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
             
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BibliotecaConnectionString %>" SelectCommand="SELECT [ID_Imprumut], FORMAT([Data_Imprumut], 'dd/MM/yyyy') AS Data_Imprumut, [ID_Client], [ID_Carte] FROM [Imprumuturi]" DeleteCommand="DELETE FROM [Imprumuturi] WHERE [ID_Imprumut] = @ID_Imprumut" InsertCommand="INSERT INTO [Imprumuturi] ([Data_Imprumut], [ID_Client], [ID_Carte]) VALUES (@Data_Imprumut, @ID_Client, @ID_Carte)" UpdateCommand="UPDATE [Imprumuturi] SET [Data_Imprumut] = @Data_Imprumut, [ID_Client] = @ID_Client, [ID_Carte] = @ID_Carte WHERE [ID_Imprumut] = @ID_Imprumut">
            <DeleteParameters>
                <asp:Parameter Name="ID_Imprumut" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="Data_Imprumut" />
                <asp:Parameter Name="ID_Client" Type="Int32" />
                <asp:Parameter Name="ID_Carte" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Data_Imprumut" />
                <asp:Parameter Name="ID_Client" Type="Int32" />
                <asp:Parameter Name="ID_Carte" Type="Int32" />
                <asp:Parameter Name="ID_Imprumut" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:TextBox ID="tbMes2" runat="server"></asp:TextBox>
                        <br />
        <asp:TextBox ID="DerementBox" runat="server"></asp:TextBox>
                   </center> </td>
                </tr>
        </table>
        </center>
        <br />
        <br />
    <center><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        <asp:ListItem>Alegeti grafic</asp:ListItem>
        <asp:ListItem>Linie</asp:ListItem>
        <asp:ListItem>Bare</asp:ListItem>
        <asp:ListItem>Pie</asp:ListItem>
    </asp:DropDownList>
         <br />
        <br />
         <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Proceduri Stocate" />
        <br />
    </center>
    </form>
</body>
</html>

