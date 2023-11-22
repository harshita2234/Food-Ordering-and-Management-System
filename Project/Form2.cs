using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Collections;

namespace Project
{
    public partial class Form2 : Form
    {
        string searchtext;
        MySqlCommand comm;
        MySqlDataAdapter da;
        DataSet ds;
        DataTable dt;
        DataRow dr;
        int i = 0;
        private static ArrayList ListRestaurant = new ArrayList();
        private static ArrayList ListItem = new ArrayList();
        private static ArrayList ListCategory = new ArrayList();
        private static ArrayList ListPrice = new ArrayList();
        private static ArrayList ListDescription = new ArrayList();
        public static MySqlConnection DB_connect()
        {
            string myConnectionString = "server=localhost;uid=root;pwd=0000;database=project;SslMode=none;";
            MySqlConnection conn = new MySqlConnection(myConnectionString);
            try
            {
                conn.Open();
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                MessageBox.Show("DB connect:" + ex.Message);
            }
            return conn;
        }
        public Form2(string text)
        {
            InitializeComponent();
            searchtext = text;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            string sql;
            MySqlConnection conn = DB_connect();
            sql = "select r.Name as Restaurant, m.Name as Item , c.Name as Category, m.Price, m.Description from menuitems as m, restaurants as r, menucategories as c where m.RestaurantID = r.RestaurantID and m.CategoryID=c.CategoryID and m.Name like '%"+searchtext+"%';";
            //comm = new MySqlCommand(sql, conn);
            //comm.CommandType = CommandType.Text;
            //ds = new DataSet();
            //da = new MySqlDataAdapter(comm.CommandText, conn);
            //da.Fill(ds, "prev_orders");
            //dt = ds.Tables["prev_orders"];
            //int t = dt.Rows.Count;
            //MessageBox.Show(t.ToString());
            //dr = dt.Rows[i];
            MySqlDataReader row;
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            row = cmd.ExecuteReader();
            if (row.HasRows)
            {
                while (row.Read())
                {
                    ListRestaurant.Add(row["Restaurant"].ToString());
                    ListItem.Add(row["Item"].ToString());
                    ListCategory.Add(row["Category"].ToString());
                    ListPrice.Add(row["Price"].ToString());
                    ListDescription.Add(row["Description"].ToString());
                }
            }
            else
            {
                MessageBox.Show("Data not found");
            }
            //dataGridView1.DataSource = ds;
            dataGridView1.Rows.Clear();
            for (int i = 0; i < ListRestaurant.Count; i++)
            {
                DataGridViewRow newRow = new DataGridViewRow();

                newRow.CreateCells(dataGridView1);
                newRow.Cells[0].Value = ListRestaurant[i];
                newRow.Cells[1].Value = ListItem[i];
                newRow.Cells[2].Value = ListCategory[i];
                newRow.Cells[3].Value = ListPrice[i];
                newRow.Cells[4].Value = ListDescription[i];
                dataGridView1.Rows.Add(newRow);
            }
            //dataGridView1.DataMember = "instructor"; // Database Table name
            conn.Close();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            
        }
    }
}
