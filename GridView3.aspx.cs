using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proiect_BDI
{
    public partial class GridView3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string dropProc = "Drop procedure CartiIntreMinMax";
            SqlConnection myConn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='D:\Master\sem 2\BDI\proiect\Proiect_BDI\Biblioteca.mdf';Integrated Security=True;Connect Timeout=30");
            SqlCommand myComm = new SqlCommand(dropProc, myConn);
            try
            {
                myConn.Open();
                myComm.ExecuteNonQuery();
                tbMes.Text += "\r\n DROP cu succes";
            }
            catch (Exception ex)
            {
                tbMes.Text += "\r\n Esuare DROP " + ex.Message;
            }
            finally
            {
                if (myConn.State == System.Data.ConnectionState.Open)
                    myConn.Close();
            }
            string creareProc = "CREATE PROCEDURE CartiIntreMinMax " +
                "(" +
                 " @minPagini INT," +
                 " @maxPagini INT, @cateCarti INT OUTPUT " +
                ") AS " +
                "SELECT Carti.ID_Carte, Carti.Titlu, Autori.Nume, Autori.Prenume, Edituri.Nume_Editura, Carti.[Numar Pagini], FORMAT(Carti.[Data Lansare], 'dd/MM/yyyy') AS 'Data Lansare' FROM Autori INNER JOIN Carti ON Autori.ID_Autor = Carti.ID_Autor INNER JOIN Edituri ON Carti.ID_Editura = Edituri.ID_Editura WHERE [Numar Pagini] >= @minPagini and [Numar Pagini] <= @maxPagini;" +
                "SELECT @cateCarti = count(*) from CARTI where [Numar Pagini] >= @minPagini and [Numar Pagini] <= @maxPagini;" +
                  "RETURN 0";
            myComm = new SqlCommand(creareProc, myConn);
            myConn.Open();
            try
            {
                myComm.ExecuteNonQuery();
                tbMes.Text += "\r\n Creare procedura cu succes";
            }
            catch (Exception ex)
            {
                tbMes.Text += "\r\n Esuare CREATE " + ex.Message;
            }
            finally
            {
                myConn.Close();
            }
        }

        protected void btnApel_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='D:\Master\sem 2\BDI\proiect\Proiect_BDI\Biblioteca.mdf';Integrated Security=True;Connect Timeout=30");
            SqlCommand myComm = new SqlCommand("CartiIntreMinMax", myConn);
            myComm.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter p1 = new SqlParameter("@minPagini", System.Data.SqlDbType.Int);
            p1.Value = tbMin.Text;

            SqlParameter p2 = new SqlParameter("@maxPagini", System.Data.SqlDbType.Int);
            p2.Value = tbMax.Text;

            SqlParameter p3 = new SqlParameter("@cateCarti", System.Data.SqlDbType.Int);
            p3.Direction = System.Data.ParameterDirection.Output;

            myComm.Parameters.Add(p1); myComm.Parameters.Add(p2); myComm.Parameters.Add(p3);

            myConn.Open();
            SqlDataReader dr = null; // = new SqlDataReader();
            try
            {
                dr = myComm.ExecuteReader();
                while (dr.Read())
                {
                    tbMes.Text += "\r\n" + dr["ID_Carte"] + "\t" + dr[1] + "\t" + dr[2] + "\t" + dr[3];
                }
                GridView1.DataSource = dr; GridView1.DataBind();
            }
            catch (Exception ex)
            {
                tbMes.Text += "\r\nEsuare citire " + ex.Message;
            }
            finally
            {
                dr.Close(); myConn.Close();
                tbMes.Text += "\r\n \r\n  Nr Carti selectate: " + p3.Value;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("GridView.aspx");
        }
    }
}