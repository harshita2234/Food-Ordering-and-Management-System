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


namespace Project
{
    public partial class Form1 : Form
    {
        //MySqlConnection conn;
        MySqlCommand comm;
        MySqlDataAdapter da;
        DataSet ds;
        DataTable dt;
        DataRow dr;
        int i = 0;
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
                MessageBox.Show("DB connect:"+ex.Message);
            }
            return conn;
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        //EXIT BUTTON
        private void button6_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Are you sure you want to exit the Application ? ", "Exit", MessageBoxButtons.YesNoCancel);
            if (dr == DialogResult.Yes)
                Application.Exit();
        }

        //Previous order button
        private void button5_Click(object sender, EventArgs e)
        {
            string sql;
            MySqlConnection conn = DB_connect();
            sql = "select o.CustomerID, r.Name, a.FullAddress, o.OrderDate, o.OrderStatus, o.PaymentID from orders as o, restaurants as r, address as a where o.RestaurantID = r.RestaurantID and a.AddressID = o.AddressID; ";
            comm = new MySqlCommand(sql, conn);
            comm.CommandType = CommandType.Text;
            ds = new DataSet();
            da = new MySqlDataAdapter(comm.CommandText, conn);
            da.Fill(ds, "prev_orders");
            dt = ds.Tables["prev_orders"];
            int t= dt.Rows.Count;
            //MessageBox.Show(t.ToString());
            dr = dt.Rows[i];
            textBox2.Text = dr["CustomerID"].ToString();
            textBox3.Text = dr["Name"].ToString();
            textBox5.Text = dr["FullAddress"].ToString();
            textBox4.Text = dr["OrderDate"].ToString();
            textBox7.Text = dr["OrderStatus"].ToString();
            textBox6.Text = dr["PaymentID"].ToString();
            conn.Close();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
        //next button for past orders
        private void button7_Click(object sender, EventArgs e)
        {
            i++;
            if (i >= dt.Rows.Count)
                i = 0;
            dr = dt.Rows[i];
            textBox2.Text = dr["CustomerID"].ToString();
            textBox3.Text = dr["Name"].ToString();
            textBox5.Text = dr["FullAddress"].ToString();
            textBox4.Text = dr["OrderDate"].ToString();
            textBox7.Text = dr["OrderStatus"].ToString();
            textBox6.Text = dr["PaymentID"].ToString();
        }
        //previous button for past orders
        private void button8_Click(object sender, EventArgs e)
        {
            i--;
            if (i < 0)
                i = dt.Rows.Count - 1;
            dr = dt.Rows[i];
            textBox2.Text = dr["CustomerID"].ToString();
            textBox3.Text = dr["Name"].ToString();
            textBox5.Text = dr["FullAddress"].ToString();
            textBox4.Text = dr["OrderDate"].ToString();
            textBox7.Text = dr["OrderStatus"].ToString();
            textBox6.Text = dr["PaymentID"].ToString();
        }
        //search enter
        private void button1_Click(object sender, EventArgs e)
        {
            Form2 f = new Form2(textBox1.Text);
            f.Show();
        }
    }
}
