using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class GridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*SqlParameter p1 = new SqlParameter("@Id_Client", System.Data.SqlDbType.Int);
            p1.Value = int.Parse(tbID_Client.Text);*/
            SqlParameter p2 = new SqlParameter("@Nume", System.Data.SqlDbType.NVarChar);
            p2.Value = tbNume.Text;
            SqlParameter p3 = new SqlParameter("@Prenume", System.Data.SqlDbType.NVarChar);
            p3.Value = tbPrenume.Text;
            SqlParameter p4 = new SqlParameter("@Data_Nastere", System.Data.SqlDbType.Date);
            p4.Value = DateTime.Parse(tbDataNastere.Text);
            SqlParameter p5 = new SqlParameter("@Adresa_Mail", System.Data.SqlDbType.NVarChar);
            p5.Value = tbAdresaMail.Text;
            SqlParameter p6 = new SqlParameter("@Nr_Telefon", System.Data.SqlDbType.NVarChar);
            p6.Value = tbTelefon.Text;
            string cmdInsert = "INSERT INTO [Clienti] ([Nume], [Prenume], [Data_Nastere], [Adresa_Mail], [Nr_Telefon]) VALUES (@Nume, @Prenume, @Data_Nastere, @Adresa_Mail, @Nr_Telefon)";
            SqlConnection myConn = new SqlConnection(
                @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='D:\Master\sem 2\BDI\proiect\Proiect_BDI\Biblioteca.mdf';Integrated Security=True;Connect Timeout=30");
            myConn.Open();
/*            SqlCommand setIdentity = new SqlCommand("SET IDENTITY_INSERT CLIENTI ON", myConn);
            setIdentity.ExecuteNonQuery();*/
            SqlCommand myComm = new SqlCommand(cmdInsert, myConn);
            /*myComm.Parameters.Add(p1); */myComm.Parameters.Add(p2); myComm.Parameters.Add(p3); myComm.Parameters.Add(p4); myComm.Parameters.Add(p5); myComm.Parameters.Add(p6);
            int n = myComm.ExecuteNonQuery();
            if (n > 0)
            {
                tbMes.Text = "\r\n Insert Ok";
                GridView7.DataBind();
                tbNume.Text = ""; tbPrenume.Text = ""; tbDataNastere.Text = ""; tbAdresaMail.Text = ""; tbTelefon.Text = "";
            }
            else
                tbMes.Text = "\r\n Insert failed";
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView dataView1 = (DataView)SqlDataSource2.Select(args);
            DataTable dataTabl1 = dataView1.ToTable();
            DataSet ds = new DataSet(); ds.Tables.Add(dataTabl1);
            Cache["Autori"] = ds;

            Response.Redirect("GridView2.aspx?tip=" + this.DropDownList2.SelectedItem.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("GridView3.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
/*            SqlParameter p1 = new SqlParameter("@ID_Imprumut", System.Data.SqlDbType.Int);
            p1.Value = int.Parse(tbIDImprumut.Text);*/
            SqlParameter p2 = new SqlParameter("@Data_Imprumut", System.Data.SqlDbType.Date);
            p2.Value = DateTime.Parse(tbDataImprumut.Text);
            SqlParameter p3 = new SqlParameter("@ID_Client", System.Data.SqlDbType.Int);
            p3.Value = int.Parse(tbIDClient.Text);
            SqlParameter p4 = new SqlParameter("@ID_Carte", System.Data.SqlDbType.Int);
            p4.Value = int.Parse(tbIDCarte.Text);
            SqlConnection myConn = new SqlConnection(
                @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='D:\Master\sem 2\BDI\proiect\Proiect_BDI\Biblioteca.mdf';Integrated Security=True;Connect Timeout=30");
            myConn.Open();
/*            SqlCommand setIdentity = new SqlCommand("SET IDENTITY_INSERT IMPRUMUTURI ON", myConn);
            setIdentity.ExecuteNonQuery();*/

            string cmdSelect = "SELECT Nr_Stoc FROM [Carti] WHERE ID_Carte = @ID_Carte2";
            SqlParameter p5 = new SqlParameter("@ID_Carte2", System.Data.SqlDbType.Int);
            p5.Value = int.Parse(tbIDCarte.Text);
            SqlCommand getStoc = new SqlCommand(cmdSelect, myConn);
            getStoc.Parameters.Add(p5);
            Int32 stoc = (Int32)getStoc.ExecuteScalar();

            if (stoc == 0)
            {
                tbMes2.Text = "\r\n Stoc insuficient";
                DerementBox.Text = "\r\n Decrement Stoc Failed";
            }
            else
            {
                string cmdInsert = "INSERT INTO [Imprumuturi] ([Data_Imprumut], [ID_Client], [ID_Carte]) VALUES (@Data_Imprumut, @ID_Client, @ID_Carte)";
                SqlCommand myComm = new SqlCommand(cmdInsert, myConn);
                /*myComm.Parameters.Add(p1); */myComm.Parameters.Add(p2); myComm.Parameters.Add(p3); myComm.Parameters.Add(p4);
                int n = myComm.ExecuteNonQuery();
                if ( n > 0 )
                {
                    tbMes2.Text = "\r\n Insert Ok";
                    GridView9.DataBind();

                    string cmdDecrementStoc = "UPDATE [Carti] SET [Nr_Stoc] = [Nr_Stoc] - 1 WHERE ID_Carte = @ID_Carte3";
                    SqlCommand decrementStoc = new SqlCommand(cmdDecrementStoc, myConn);
                    SqlParameter p6 = new SqlParameter("@ID_Carte3", System.Data.SqlDbType.Int);
                    p6.Value = int.Parse(tbIDCarte.Text);
                    decrementStoc.Parameters.Add(p6);
                    if (decrementStoc.ExecuteNonQuery() > 0)
                    {
                        DerementBox.Text = "\r\n Decrement Stoc Ok";
                        GridView6.DataBind();
                    }
                    else
                    {
                        DerementBox.Text = "\r\n Decrement Stoc Failed";
                    }
                }
                else
                    tbMes2.Text = "\r\n Insert failed";

                tbDataImprumut.Text = ""; tbIDClient.Text = ""; tbIDCarte.Text = "";
            }

            
        }
    }
}