using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Drawing.Imaging;
using System.IO;
using System.Data.OleDb;

namespace HemaEndustriFihristv2
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            object Yonetici = Session["Yonetici"];
            if (Yonetici != null)
            {
                YoneticiGirisButtonAnasayfa.Visible = false;
                YoneticiİslemleriButtonAnasayfa.Visible = true;
                HesapİslemleriButtonAnasayfa.Visible = true;
                YoneticiCikisButtonAnasayfa.Visible = true;
                YoneticiMenusuPanel.Visible = true;
                string sorgu = "Select Yetki From Yonetici Where KullaniciAdi = @kullaniciadi";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@kullaniciadi", Session["Yonetici"].ToString());
                cnn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                int Yetki = Convert.ToInt32(dr["Yetki"].ToString());
                cnn.Close();
                if(Yetki == 0)
                {
                    SqlDataSource6.SelectCommand = "SELECT[Ad], [Soyad], [SicilNo], [Aciklama], [IsTel], [IsTel2], [EvTel], [DepartmanID], [PozisyonID], [SirketID], [Resim], [id] FROM[Kayitlar] WHERE(([Ad] LIKE '%' + @Ad + '%') OR([Soyad] LIKE '%' + @Soyad + '%') OR([Aciklama] LIKE '%' + @Aciklama + '%') OR([IsTel] LIKE '%' + @IsTel + '%') OR([IsTel2] LIKE '%' + @IsTel2 + '%') OR([EvTel] LIKE '%' + @EvTel + '%')) ORDER BY [PozisyonID], [Ad], [Soyad]";
                    SqlDataSource26.SelectCommand = "SELECT[id], [Bölge] FROM[Bolgeler] ORDER BY[id]";
                    SqlDataSource7.SelectCommand = "SELECT [id], [Ad], [BolgeID], [SirketID] FROM [Departmanlar] ORDER BY [Ad]";
                    SqlDataSource30.SelectCommand = "SELECT [id], [Ad] FROM [Departmanlar] ORDER BY [Ad]";
                    HesapİslemleriYoneticiEkleButton.Visible = true;
                    HesapİslemleriYoneticiDuzenleButton.Visible = true;
                }
                else
                {
                    SqlDataSource6.SelectCommand = "SELECT k.[Ad], k.[Soyad], k.[SicilNo], k.[Aciklama], k.[IsTel], k.[IsTel2], k.[EvTel], k.[DepartmanID], k.[PozisyonID], k.[SirketID], k.[Resim], k.[id] FROM [Kayitlar] k, [Departmanlar] d WHERE (((k.[Ad] LIKE '%' + @Ad + '%') OR (k.[Soyad] LIKE '%' + @Soyad + '%') OR (k.[Aciklama] LIKE '%' + @Aciklama + '%') OR (k.[IsTel] LIKE '%' + @IsTel + '%') OR (k.[IsTel2] LIKE '%' + @IsTel2 + '%') OR (k.[EvTel] LIKE '%' + @EvTel + '%'))) AND k.DepartmanID = d.id AND d.BolgeID = "+ Yetki + " ORDER BY [PozisyonID], [Ad], [Soyad]";
                    SqlDataSource26.SelectCommand = "SELECT[id], [Bölge] FROM[Bolgeler] WHERE id = "+ Yetki +" ORDER BY[id]";
                    SqlDataSource7.SelectCommand = "SELECT [id], [Ad], [BolgeID], [SirketID] FROM [Departmanlar] WHERE [BolgeID] = " + Yetki + " ORDER BY [Ad]";
                    SqlDataSource30.SelectCommand = "SELECT [id], [Ad] FROM [Departmanlar] WHERE [BolgeID] = " + Yetki + " ORDER BY [Ad]";
                    HesapİslemleriYoneticiEkleButton.Visible = false;
                    HesapİslemleriYoneticiDuzenleButton.Visible = false;
                }
            }
            else
            {
                YoneticiGirisButtonAnasayfa.Visible = true;
                YoneticiİslemleriButtonAnasayfa.Visible = false;
                HesapİslemleriButtonAnasayfa.Visible = false;
                YoneticiCikisButtonAnasayfa.Visible = false;
                YoneticiMenusuPanel.Visible = false;
            }

            MainPanel.Visible = true;

            BilgiLabel.Visible = false;
            AramaTablosu.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = true;
            BolgelerTablosu.Visible = true;
            
        }

        protected void MainSearchButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = true;

            AramaTablosu.Visible = true;
            BilgiLabel.Visible = true;
            DepartmanBaslikLabeli.Visible = true;
            DepartmanBaslikLabeli.Text = "'" + MainSearchTextBox.Text + "' İçin Arama Sonuçları";
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = true;
            BolgelerTablosu.Visible = true;
        }

        //Anasayfa Listbox Fonksiyonları
        protected void DepartmanlarListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string sorgu = "Select k.id FROM Departmanlar d,Kayitlar k WHERE @ad = d.Ad AND d.id = k.DepartmanID ";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@ad", DepartmanlarListBox.SelectedItem.ToString());
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    throw new Exception();
                }
                cnn.Close();
                DepartmanBaslikLabeli.Text = "'" + DepartmanlarListBox.SelectedItem.ToString() + "' Departmanında Kayıt Bulunamadı!";
                DepartmanBaslikLabeli.Visible = true;
            }
            catch (Exception)
            {
                DepartmanBaslikLabeli.Text = DepartmanlarListBox.SelectedItem.ToString();
                DepartmanBaslikLabeli.Visible = true;
            }


            MainPanel.Visible = true;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = true;
            DepartmanSecimTablosu.Visible = true;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = true;
            BolgelerTablosu.Visible = true;
        }
        protected void SirketlerListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            DepartmanlarListBox.Items.Clear();
            if (SirketlerListBox.SelectedItem.ToString() == "Tüm Şirketler" && BolgelerListBox.SelectedItem.ToString() == "Tüm Bölgeler")
            {
                string sorgu = "Select Ad,id FROM Departmanlar ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
            else if (SirketlerListBox.SelectedItem.ToString() != "Tüm Şirketler" && BolgelerListBox.SelectedItem.ToString() == "Tüm Bölgeler")
            {
                string sorgu = "Select id FROM Sirketler WHERE @SirketAdi = Ad";
                SqlCommand cmd1 = new SqlCommand(sorgu, cnn);
                cmd1.Parameters.AddWithValue("@SirketAdi", SirketlerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd1.ExecuteNonQuery();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                dr1.Read();
                int SirketID = Convert.ToInt32(dr1["id"].ToString());
                cnn.Close();

                sorgu = "Select Ad,id FROM Departmanlar WHERE @Sirketid = SirketID ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@Sirketid", SirketID);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
            else if (SirketlerListBox.SelectedItem.ToString() == "Tüm Şirketler" && BolgelerListBox.SelectedItem.ToString() != "Tüm Bölgeler")
            {
                string sorgu = "Select id FROM Bolgeler WHERE @BolgeAdi = Bölge";
                SqlCommand cmd2 = new SqlCommand(sorgu, cnn);
                cmd2.Parameters.AddWithValue("@BolgeAdi", BolgelerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd2.ExecuteNonQuery();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                dr2.Read();
                int BolgeID = Convert.ToInt32(dr2["id"].ToString());
                cnn.Close();

                sorgu = "Select Ad,id FROM Departmanlar WHERE @Bolgeid = BolgeID ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@Bolgeid", BolgeID);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
            else
            {
                string sorgu = "Select id FROM Sirketler WHERE @SirketAdi = Ad";
                SqlCommand cmd1 = new SqlCommand(sorgu, cnn);
                cmd1.Parameters.AddWithValue("@SirketAdi", SirketlerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd1.ExecuteNonQuery();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                dr1.Read();
                int SirketID = Convert.ToInt32(dr1["id"].ToString());
                cnn.Close();

                sorgu = "Select id FROM Bolgeler WHERE @BolgeAdi = Bölge";
                SqlCommand cmd2 = new SqlCommand(sorgu, cnn);
                cmd2.Parameters.AddWithValue("@BolgeAdi", BolgelerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd2.ExecuteNonQuery();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                dr2.Read();
                int BolgeID = Convert.ToInt32(dr2["id"].ToString());
                cnn.Close();

                sorgu = "Select Ad,id FROM Departmanlar WHERE @Bolgeid = BolgeID AND @Sirketid = SirketID ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@Bolgeid", BolgeID);
                cmd.Parameters.AddWithValue("@Sirketid", SirketID);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
        }
        protected void BolgelerListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            DepartmanlarListBox.Items.Clear();
            if (SirketlerListBox.SelectedItem.ToString() == "Tüm Şirketler" && BolgelerListBox.SelectedItem.ToString() == "Tüm Bölgeler")
            {
                string sorgu = "Select Ad,id FROM Departmanlar ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
            else if (SirketlerListBox.SelectedItem.ToString() != "Tüm Şirketler" && BolgelerListBox.SelectedItem.ToString() == "Tüm Bölgeler")
            {
                string sorgu = "Select id FROM Sirketler WHERE @SirketAdi = Ad";
                SqlCommand cmd1 = new SqlCommand(sorgu, cnn);
                cmd1.Parameters.AddWithValue("@SirketAdi", SirketlerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd1.ExecuteNonQuery();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                dr1.Read();
                int SirketID = Convert.ToInt32(dr1["id"].ToString());
                cnn.Close();

                sorgu = "Select Ad,id FROM Departmanlar WHERE @Sirketid = SirketID ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@Sirketid", SirketID);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
            else if (SirketlerListBox.SelectedItem.ToString() == "Tüm Şirketler" && BolgelerListBox.SelectedItem.ToString() != "Tüm Bölgeler")
            {
                string sorgu = "Select id FROM Bolgeler WHERE @BolgeAdi = Bölge";
                SqlCommand cmd2 = new SqlCommand(sorgu, cnn);
                cmd2.Parameters.AddWithValue("@BolgeAdi", BolgelerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd2.ExecuteNonQuery();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                dr2.Read();
                int BolgeID = Convert.ToInt32(dr2["id"].ToString());
                cnn.Close();

                sorgu = "Select Ad,id FROM Departmanlar WHERE @Bolgeid = BolgeID ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@Bolgeid", BolgeID);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
            else
            {
                string sorgu = "Select id FROM Sirketler WHERE @SirketAdi = Ad";
                SqlCommand cmd1 = new SqlCommand(sorgu, cnn);
                cmd1.Parameters.AddWithValue("@SirketAdi", SirketlerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd1.ExecuteNonQuery();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                dr1.Read();
                int SirketID = Convert.ToInt32(dr1["id"].ToString());
                cnn.Close();

                sorgu = "Select id FROM Bolgeler WHERE @BolgeAdi = Bölge";
                SqlCommand cmd2 = new SqlCommand(sorgu, cnn);
                cmd2.Parameters.AddWithValue("@BolgeAdi", BolgelerListBox.SelectedItem.ToString());
                cnn.Open();
                cmd2.ExecuteNonQuery();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                dr2.Read();
                int BolgeID = Convert.ToInt32(dr2["id"].ToString());
                cnn.Close();

                sorgu = "Select Ad,id FROM Departmanlar WHERE @Bolgeid = BolgeID AND @Sirketid = SirketID ORDER BY Ad";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@Bolgeid", BolgeID);
                cmd.Parameters.AddWithValue("@Sirketid", SirketID);
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ListItem li = new ListItem();
                    li.Text = Convert.ToString((dr["Ad"]));
                    li.Value = Convert.ToString(dr["id"]);
                    DepartmanlarListBox.Items.Add(li);
                }
                cnn.Close();
            }
        }
        
        //Anasayfa Butonlar
        protected void YoneticiMenusuKayıtEkleButton_Click(object sender, EventArgs e)
        {
            KayitEkleSonucLabel.Text = "";
            KayitEkleSonucLabel.Visible = false;

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = true;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitEkleSonucLabel.Visible = false;
        }
        protected void YoneticiMenusuKayıtDuzenleButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = true;
            KayitDuzenleTextBox.Text = "";
            KayitDuzenleTablosu.Visible = false;
            KayitDuzenleAramaSonucuLabel.Visible = false;
            KayitDuzenleBilgiLabel.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitDuzenleTablosu.DataSource = null;
            KayitDuzenleTablosu.DataBind();
        }
        protected void YoneticiMenusuDepartmanEkleButton_Click(object sender, EventArgs e)
        {
            DepartmanEkleSonucLabel.Text = "";
            DepartmanEkleSonucLabel.Visible = false;

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = true;
            DepartmanEkleSonucLabel.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void YoneticiMenusuDepartmanDuzenleButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = true;
            DepartmanDuzenleHataPanel.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void YoneticiMenusuDepartmanaGoreDuzenleButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenleTablosu.Visible = false;
            DepartmanaGoreDuzenleBaslikLabel2.Visible = false;
            DepartmanaGoreDuzenleDepartmanListBox.SelectedIndex = -1;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void YoneticiMenusuDisaAktarButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = true;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void HesapİslemleriSifreDegistirButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = true;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitEkleSonucLabel.Visible = false;
        }
        protected void HesapİslemleriYoneticiEkleButton_Click(object sender, EventArgs e)
        {
            HesapIslemleriYoneticiEkleSonucLabel.Text = "";
            HesapIslemleriYoneticiEkleYetkiSecimSonucLabel.Text = "";
            HesapIslemleriYoneticiEkleSonucLabel.Visible = false;
            HesapIslemleriYoneticiEkleYetkiSecimSonucLabel.Visible = false;
            HesapIslemleriYoneticiEkleSonucCompareValidator.Visible = true;

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = true;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitEkleSonucLabel.Visible = false;
        }
        protected void HesapİslemleriYoneticiDuzenleButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = true;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitEkleSonucLabel.Visible = false;
        }
        protected void YoneticiGirisButtonAnasayfa_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = true;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            MaintainScrollPositionOnPostBack = false;
        }
        protected void YoneticiCikisButtonAnasayfa_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
        }

        //Panellerin İçindeki Butonlar
        protected void YoneticiGirisButton_Click(object sender, EventArgs e)
        {
            string sorgu = "Select * From Yonetici Where KullaniciAdi = @kullaniciadi AND Sifre = @sifre";
            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cmd.Parameters.AddWithValue("@kullaniciadi", YoneticiGirisKullaniciAdiTextBox.Text);
            cmd.Parameters.AddWithValue("@sifre", YoneticiGirisSifreTextBox.Text);
            cnn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Timeout = 300;
                Session.Add("Yonetici", dr["KullaniciAdi"].ToString());
                Response.Redirect(Request.RawUrl);

            }
            else
            {
                MainPanel.Visible = false;
                MainSearchTextBox.Text = "";

                AramaTablosu.Visible = false;
                BilgiLabel.Visible = false;
                DepartmanBaslikLabeli.Visible = false;
                DepartmanSecimTablosu.Visible = false;
                DepartmanlarListBox.SelectedIndex = -1;

                YoneticiGirisPaneli.Visible = true;
                HesapIslemleriSifreDegistirPanel.Visible = false;
                HesapIslemleriYoneticiEklePanel.Visible = false;
                HesapIslemleriYoneticiDuzenlePanel.Visible = false;
                KayitEklePaneli.Visible = false;
                KayitDuzenlePaneli.Visible = false;
                DepartmanEklePaneli.Visible = false;
                DepartmanDuzenlePaneli.Visible = false;
                DepartmanaGoreDuzenlePaneli.Visible = false;
                DisaAktarPaneli.Visible = false;

                NotPaneli.Visible = false;
                BolgelerTablosu.Visible = false;

                YoneticiGirisSonucLabel.Text = "Kullanıcı adı veya parola hatalı";
                YoneticiGirisSifreTextBox.Text = "";
                YoneticiGirisKullaniciAdiTextBox.Text = "";
            }
            cnn.Close();
        }
        protected void KayitEkleButton_Click(object sender, EventArgs e)
        {
            KayitEkleSonucLabel.Text = "";
            KayitEkleSonucLabel.Visible = false;
            KayitEkleDepartmanSecimHataLabel.Text = "";
            KayitEklePozisyonSecimHataLabel.Text = "";
            KayitEkleSirketSecimHataLabel.Text = "";
            KayitEkleDepartmanSecimHataLabel.Visible = false;
            KayitEklePozisyonSecimHataLabel.Visible = false;
            KayitEkleSirketSecimHataLabel.Visible = false;
            String HataDegeri = "";
            try
            {
                //Zorunlu alanların doldurulması kontrolü Başlangıç
                if (KayitEklePozisyonSecimDropDownList.SelectedItem.ToString() == "Lütfen Bir Seçenek Seçiniz...")
                {
                    HataDegeri = "Doldurulması zorunlu alan Oncelik";
                    throw new Exception();
                }
                if (KayitEkleDepartmanSecimDropDownList.SelectedItem.ToString() == "Lütfen Bir Seçenek Seçiniz...")
                {
                    HataDegeri = "Doldurulması zorunlu alan Departman";
                    throw new Exception();
                }
                if (KayitEkleSirketSecimDropDownList.SelectedItem.ToString() == "Lütfen Bir Seçenek Seçiniz...")
                {
                    HataDegeri = "Doldurulması zorunlu alan Sirket";
                    throw new Exception();
                }
                //Zorunlu alanların doldurulması kontrolü Bitiş

                int DepartmanID = Convert.ToInt32(KayitEkleDepartmanSecimDropDownList.SelectedItem.Value);
                int PozisyonID = Convert.ToInt32(KayitEklePozisyonSecimDropDownList.SelectedItem.Value);
                int SirketID = Convert.ToInt32(KayitEkleSirketSecimDropDownList.SelectedItem.Value);

                string sorgu3 = "Insert into Kayitlar (Ad,Soyad,SicilNo,Aciklama,IsTel,IsTel2,EvTel,DepartmanID,SirketID,PozisyonID,Resim) Values(@Ad,@Soyad,@SicilNo,@Aciklama,@IsTel,@IsTel2,@EvTel,@DepartmanID,@SirketID,@PozisyonID,@Resim)";
                SqlCommand cmd3 = new SqlCommand(sorgu3, cnn);

                if (KayitEkleFotografFileUpload.HasFile)
                {
                    string sorgu4 = "Select Resim FROM Kayitlar WHERE @resim = Resim";
                    SqlCommand cmd4 = new SqlCommand(sorgu4, cnn);
                    cmd4.Parameters.AddWithValue("@resim", KayitEkleFotografFileUpload.FileName.ToString());
                    cnn.Open();
                    SqlDataReader dr4 = cmd4.ExecuteReader();
                    if (dr4.Read())
                    {
                        HataDegeri = "Resim İsim Hatası";
                        throw new Exception();
                    }
                    cnn.Close();
                    if ((KayitEkleFotografFileUpload.PostedFile.ContentType == "image/jpeg" || KayitEkleFotografFileUpload.PostedFile.ContentType == "image/jpg" || KayitEkleFotografFileUpload.PostedFile.ContentType == "image/png") && (KayitEkleFotografFileUpload.PostedFile.ContentLength < 2048000))
                    {
                        System.Drawing.Image yuklenenFoto = null;
                        HttpPostedFile yuklenenResim = KayitEkleFotografFileUpload.PostedFile;
                        yuklenenFoto = System.Drawing.Image.FromStream(yuklenenResim.InputStream);
                        ResminBoyutunuKucult(yuklenenFoto, 127, 170, KayitEkleFotografFileUpload.FileName.ToString());

                        cmd3.Parameters.AddWithValue("@Resim", KayitEkleFotografFileUpload.FileName.ToString());
                    }
                    else
                    {
                        HataDegeri = "Resim Hatası";
                        throw new Exception();
                    }
                }
                else
                {
                    cmd3.Parameters.AddWithValue("@Resim", "varsayilan.jpg");
                }

                cnn.Open();
                cmd3.Parameters.AddWithValue("@Ad", KayitEkleAdTextBox.Text);
                cmd3.Parameters.AddWithValue("@Soyad", KayitEkleSoyadTextBox.Text);
                cmd3.Parameters.AddWithValue("@SicilNo", KayitEkleSicilNoTextBox.Text);
                cmd3.Parameters.AddWithValue("@Aciklama", KayitEkleAciklamaTextBox.Text);
                cmd3.Parameters.AddWithValue("@IsTel", KayitEkleIsTelTextBox.Text);
                cmd3.Parameters.AddWithValue("@IsTel2", KayitEkleIsTel2TextBox.Text);
                cmd3.Parameters.AddWithValue("@EvTel", KayitEkleEvTelTextBox.Text);
                cmd3.Parameters.AddWithValue("@DepartmanID", DepartmanID);
                cmd3.Parameters.AddWithValue("@SirketID", SirketID);
                cmd3.Parameters.AddWithValue("@PozisyonID", PozisyonID);
                cmd3.ExecuteNonQuery();
                cnn.Close();
                KayitEkleSonucLabel.Visible = true;
                KayitEkleSonucLabel.Text = "Başarıyla kayıt yapılmıştır...";
                KayitEkleAdTextBox.Text = "";
                KayitEkleSoyadTextBox.Text = "";
                KayitEkleSicilNoTextBox.Text = "";
                KayitEkleAciklamaTextBox.Text = "";
                KayitEkleIsTelTextBox.Text = "";
                KayitEkleIsTel2TextBox.Text = "";
                KayitEkleEvTelTextBox.Text = "";
                KayitEkleDepartmanSecimDropDownList.SelectedIndex = 0;
                KayitEkleSirketSecimDropDownList.SelectedIndex = 0;
                KayitEklePozisyonSecimDropDownList.SelectedIndex = 0;
            }
            catch (Exception)
            {
                if (HataDegeri == "Resim Hatası")
                {
                    KayitEkleSonucLabel.Visible = true;
                    KayitEkleSonucLabel.Text = "Fotoğraf dosyası uygun değil(Fotoğrafın boyutu en fazla 2MB ve dosya uzantısı 'jpg', 'jpeg' 'png' olabilir)!!!";
                }
                else if (HataDegeri == "Resim İsim Hatası")
                {
                    KayitEkleSonucLabel.Visible = true;
                    KayitEkleSonucLabel.Text = "Fotoğrafın ismi uygun değil!!!";
                }
                else if (HataDegeri == "Doldurulması zorunlu alan Oncelik")
                {
                    KayitEklePozisyonSecimHataLabel.Visible = true;
                    KayitEklePozisyonSecimHataLabel.Text = "Doldurulması zorunlu alan boş olamaz!!!";
                }
                else if (HataDegeri == "Doldurulması zorunlu alan Departman")
                {
                    KayitEkleDepartmanSecimHataLabel.Visible = true;
                    KayitEkleDepartmanSecimHataLabel.Text = "Doldurulması zorunlu alan boş olamaz!!!";
                }
                else if(HataDegeri == "Doldurulması zorunlu alan Sirket")
                {
                    KayitEkleSirketSecimHataLabel.Visible = true;
                    KayitEkleSirketSecimHataLabel.Text = "Doldurulması zorunlu alan boş olamaz!!!";
                }
                else
                {
                    KayitEkleSonucLabel.Visible = true;
                    KayitEkleSonucLabel.Text = "Kayıt Yapılamadı!!!";
                }

            }

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = true;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

        }
        protected void DepartmanEkleButton_Click(object sender, EventArgs e)
        {
            DepartmanEkleSonucLabel.Visible = false;
            DepartmanEkleSonucLabel.Text = "";
            DepartmanEkleSirketSecimHataLabel.Visible = false;
            DepartmanEkleSirketSecimHataLabel.Text = "";
            DepartmanEkleBolgeSecimHataLabel.Visible = false;
            DepartmanEkleBolgeSecimHataLabel.Text = "";
            String HataDegeri = "";

            try
            {
                string sorgu2 = "Select id FROM Departmanlar WHERE @ad = Ad";
                SqlCommand cmd2 = new SqlCommand(sorgu2, cnn);
                cmd2.Parameters.AddWithValue("@ad", DepartmanEkleAdTextBox.Text);
                cnn.Open();
                cmd2.ExecuteNonQuery();
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.Read())
                {
                    HataDegeri = "İsim Hatası";
                    throw new Exception();
                }
                cnn.Close();

                if (DepartmanEkleBolgeSecimDropDownList.SelectedItem.ToString() == "Lütfen Bir Seçenek Seçiniz...")
                {
                    HataDegeri = "Doldurulması zorunlu alan Bolge";
                    throw new Exception();
                }
                if (DepartmanEkleSirketSecimDropDownList.SelectedItem.ToString() == "Lütfen Bir Seçenek Seçiniz...")
                {
                    HataDegeri = "Doldurulması zorunlu alan Sirket";
                    throw new Exception();
                }

                string sorgu = "Insert into Departmanlar (Ad,BolgeID,SirketID) Values(@Ad,@BolgeID,@SirketID)";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cnn.Open();
                cmd.Parameters.AddWithValue("@Ad", DepartmanEkleAdTextBox.Text);
                cmd.Parameters.AddWithValue("@BolgeID", DepartmanEkleBolgeSecimDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SirketID", DepartmanEkleSirketSecimDropDownList.SelectedItem.Value);
                cmd.ExecuteNonQuery();
                cnn.Close();
                DepartmanEkleSonucLabel.Visible = true;
                DepartmanEkleSonucLabel.Text = "Başarıyla kayıt yapılmıştır...";
                DepartmanEkleAdTextBox.Text = "";
                DepartmanEkleBolgeSecimDropDownList.SelectedIndex = 0;
                DepartmanEkleSirketSecimDropDownList.SelectedIndex = 0;
            }
            catch (Exception)
            {
                if (HataDegeri == "İsim Hatası")
                {
                    DepartmanEkleSonucLabel.Visible = true;
                    DepartmanEkleSonucLabel.Text = "Aynı isimde departman mevcut!!!";
                }
                else if (HataDegeri == "Doldurulması zorunlu alan Sirket")
                {
                    DepartmanEkleSirketSecimHataLabel.Visible = true;
                    DepartmanEkleSirketSecimHataLabel.Text = "Bu alan boş olamaz!!!";
                }
                else if (HataDegeri == "Doldurulması zorunlu alan Bolge")
                {
                    DepartmanEkleBolgeSecimHataLabel.Visible = true;
                    DepartmanEkleBolgeSecimHataLabel.Text = "Bu alan boş olamaz!!!";
                }
                else
                {
                    DepartmanEkleSonucLabel.Visible = true;
                    DepartmanEkleSonucLabel.Text = "Kayıt Yapılamadı!!!";
                }

            }

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = true;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanlarListBox.DataSource = null;
            DepartmanlarListBox.DataBind();

            DepartmanDuzenleTablosu.DataSource = null;
            DepartmanDuzenleTablosu.DataBind();

            DepartmanaGoreDuzenleDepartmanListBox.DataSource = null;
            DepartmanaGoreDuzenleDepartmanListBox.DataBind();
        }
        protected void KayitDuzenleButton_Click(object sender, EventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = true;
            KayitDuzenleAramaSonucuLabel.Visible = true;
            KayitDuzenleAramaSonucuLabel.Text = "'" + KayitDuzenleTextBox.Text + "' İçin Arama Sonuçları";
            KayitDuzenleTablosu.Visible = true;
            KayitDuzenleBilgiLabel.Visible = true;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void DepartmanaGoreDuzenleDepartmanListBox_Selected(object sender, EventArgs e)
        {
            try
            {
                string sorgu = "Select k.id FROM Departmanlar d,Kayitlar k WHERE @ad = d.Ad AND d.id = k.DepartmanID ";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@ad", DepartmanaGoreDuzenleDepartmanListBox.SelectedItem.ToString());
                cnn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    throw new Exception();
                }
                cnn.Close();
                DepartmanaGoreDuzenleBaslikLabel2.Text = "'" + DepartmanaGoreDuzenleDepartmanListBox.SelectedItem.ToString() + "' Departmanında Kayıt Bulunamadı!";
                DepartmanaGoreDuzenleBaslikLabel2.Visible = true;
            }
            catch (Exception)
            {
                DepartmanaGoreDuzenleBaslikLabel2.Text = DepartmanaGoreDuzenleDepartmanListBox.SelectedItem.ToString();
                DepartmanaGoreDuzenleBaslikLabel2.Visible = true;
            }



            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            KayitDuzenleTablosu.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenleTablosu.Visible = true;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void DisaAktarButton_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1254");
            Response.Charset = "windows-1254";
            Response.Buffer = true;
            this.EnableViewState = false;
            Response.ContentType = "application/vnd.xls";
            string filename = "HemaEndüstriFihrist-" + System.DateTime.Now.ToShortDateString() + ".xls";
            Response.AddHeader("content-disposition", "attachment;filename= " + filename);
            string header = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n<title></title>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1254\" />\n<style>\n</style>\n</head>\n<body>\n";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            form1.Controls.Clear();
            form1.Controls.Add(DisaAktarGridView);
            form1.RenderControl(htmlWrite);
            Response.Write(header + stringWrite.ToString());
            Response.End();
        }
        protected void HesapIslemleriSifreDegistirButton_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu = "Select * From Yonetici Where Sifre = @sifre AND KullaniciAdi = @kullaniciadi";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cmd.Parameters.AddWithValue("@sifre", HesapIslemleriSifreDegistirEskiSifreTextBox.Text);
                cmd.Parameters.AddWithValue("@kullaniciadi", Session["Yonetici"].ToString());
                cnn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    String KullaniciAdi = dr["KullaniciAdi"].ToString();
                    cnn.Close();

                    string sorgu2 = "UPDATE Yonetici SET [Sifre] = @sifre WHERE [KullaniciAdi] = @kullaniciAdi";
                    SqlCommand cmd2 = new SqlCommand(sorgu2, cnn);
                    cmd2.Parameters.AddWithValue("@sifre", HesapIslemleriSifreDegistirYeniSifreTextBox.Text);
                    cmd2.Parameters.AddWithValue("@kullaniciAdi", KullaniciAdi);
                    cnn.Open();
                    cmd2.ExecuteNonQuery();
                    cnn.Close();

                    HesapIslemleriSifreDegistirGirisSonucLabel.Text = "Şifre başarıyla değiştirilmiştir.";
                    HesapIslemleriSifreDegistirEskiSifreTextBox.Text = "";
                    HesapIslemleriSifreDegistirYeniSifreTextBox.Text = "";
                    HesapIslemleriSifreDegistirYeniSifreTekrarTextBox.Text = "";
                }
                else
                {
                    HesapIslemleriSifreDegistirGirisSonucLabel.Text = "Girilen şifre hatalı!";
                    HesapIslemleriSifreDegistirEskiSifreTextBox.Text = "";
                    HesapIslemleriSifreDegistirYeniSifreTextBox.Text = "";
                    HesapIslemleriSifreDegistirYeniSifreTekrarTextBox.Text = "";
                    cnn.Close();
                }
            }
            catch (Exception)
            {
                HesapIslemleriSifreDegistirGirisSonucLabel.Text = "İşlem sırasında bir hata oluştu lütfen tekrar deneyiniz!";
                HesapIslemleriSifreDegistirEskiSifreTextBox.Text = "";
                HesapIslemleriSifreDegistirYeniSifreTextBox.Text = "";
                HesapIslemleriSifreDegistirYeniSifreTekrarTextBox.Text = "";
            }

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = true;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void HesapIslemleriYoneticiEkleButton_Click(object sender, EventArgs e)
        {
            HesapIslemleriYoneticiEkleYetkiSecimSonucLabel.Text = "";
            HesapIslemleriYoneticiEkleYetkiSecimSonucLabel.Visible = false;
            HesapIslemleriYoneticiEkleSonucCompareValidator.Visible = false;
            String HataDegeri = "";
            try
            {
                //Zorunlu alanların doldurulması kontrolü Başlangıç
                if (HesapIslemleriYoneticiEkleYetkiSecimDropDownList.SelectedItem.ToString() == "Lütfen Bir Seçenek Seçiniz...")
                {
                    HataDegeri = "Doldurulması zorunlu alan Yetki";
                    throw new Exception();
                }
                //Zorunlu alanların doldurulması kontrolü Bitiş
                string sorgu2 = "SELECT * FROM Yonetici WHERE KullaniciAdi = @kullaniciadi";
                SqlCommand cmd2 = new SqlCommand(sorgu2, cnn);
                cnn.Open();
                cmd2.Parameters.AddWithValue("@kullaniciadi", HesapIslemleriYoneticiEkleKullaniciAdiTextBox.Text);
                cmd2.ExecuteNonQuery();
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.Read())
                {
                    HataDegeri = "İsim Hatası";
                    throw new Exception();
                }
                cnn.Close();

                string sorgu = "Insert into Yonetici (KullaniciAdi,Sifre,Yetki) Values(@kullaniciadi,@sifre,@yetki)";
                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cnn.Open();
                cmd.Parameters.AddWithValue("@kullaniciadi", HesapIslemleriYoneticiEkleKullaniciAdiTextBox.Text);
                cmd.Parameters.AddWithValue("@sifre", HesapIslemleriYoneticiEkleSifreTextBox.Text);
                cmd.Parameters.AddWithValue("@yetki", Convert.ToInt32(HesapIslemleriYoneticiEkleYetkiSecimDropDownList.SelectedItem.Value));
                cmd.ExecuteNonQuery();
                cnn.Close();
                HesapIslemleriYoneticiEkleSonucLabel.Visible = true;
                HesapIslemleriYoneticiEkleSonucLabel.Text = "Başarıyla kayıt yapılmıştır...";
                HesapIslemleriYoneticiEkleKullaniciAdiTextBox.Text = "";
                HesapIslemleriYoneticiEkleSifreTextBox.Text = "";
                HesapIslemleriYoneticiEkleSifreTekrarTextBox.Text = "";
                HesapIslemleriYoneticiEkleYetkiSecimDropDownList.SelectedIndex = 0;
            }
            catch (Exception)
            {
                if (HataDegeri == "Doldurulması zorunlu alan Yetki")
                {
                    HesapIslemleriYoneticiEkleYetkiSecimSonucLabel.Visible = true;
                    HesapIslemleriYoneticiEkleYetkiSecimSonucLabel.Text = "Yetki alanı boş olamaz!";
                }
                else if (HataDegeri == "İsim Hatası")
                {
                    HesapIslemleriYoneticiEkleSonucLabel.Visible = true;
                    HesapIslemleriYoneticiEkleSonucLabel.Text = "Aynı kullanıcı adına sahip yönetici var!";
                }
                else
                {
                    HesapIslemleriYoneticiEkleSonucLabel.Visible = true;
                    HesapIslemleriYoneticiEkleSonucLabel.Text = "Kayıt Yapılamadı!";
                }

            }

            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = true;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }

        //Tablolardaki Butonlar
        protected void KayitDuzenleSil_Click(object sender, GridViewDeletedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = true;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitDuzenleTablosu.DataSource = null;
            KayitDuzenleTablosu.DataBind();
        }
        protected void KayitDuzenleDuzenle_Click(object sender, GridViewEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = true;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitDuzenleTablosu.DataSource = null;
            KayitDuzenleTablosu.DataBind();
        }
        protected void KayitDuzenleGuncellestir_Click(object sender, GridViewUpdatedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = true;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitDuzenleTablosu.DataSource = null;
            KayitDuzenleTablosu.DataBind();
        }
        protected void KayitDuzenleIptal_Click(object sender, GridViewCancelEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = true;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            KayitDuzenleTablosu.DataSource = null;
            KayitDuzenleTablosu.DataBind();
        }
        protected void DepartmanDuzenleSil_Click(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception is SqlException)
            {
                int sqlErrorCode = ((SqlException)e.Exception).Number;

                if (sqlErrorCode == 547)
                {
                    // SQL Error Code 547:
                    //    "The DELETE statement conflicted with the REFERENCE 
                    //     constraint "FK_SomeTable"
                    // 
                    //  You can display a friendly error message here and tell
                    //  the system that you have handled the error
                    // 
                    DepartmanDuzenleHataPanel.Visible = true;
                    DepartmanDuzenleHataLabel.Text = @"Bu departman ile ilişkili kayıt bulunduğundan silme işlemi gerçekleştirilemiyor!!!";
                    e.ExceptionHandled = true;
                }
            }
            else
            {
                DepartmanDuzenleHataPanel.Visible = false;
            }


            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanDuzenleTablosu.DataSource = null;
            DepartmanDuzenleTablosu.DataBind();

            DepartmanlarListBox.DataSource = null;
            DepartmanlarListBox.DataBind();

            DepartmanaGoreDuzenleDepartmanListBox.DataSource = null;
            DepartmanaGoreDuzenleDepartmanListBox.DataBind();
        }
        protected void DepartmanDuzenleDuzenle_Click(object sender, GridViewEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = true;
            DepartmanDuzenleHataPanel.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanDuzenleTablosu.DataSource = null;
            DepartmanDuzenleTablosu.DataBind();
            DepartmanlarListBox.DataSource = null;
            DepartmanlarListBox.DataBind();
        }
        protected void DepartmanDuzenleGuncellestir_Click(object sender, GridViewUpdatedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = true;
            DepartmanDuzenleHataPanel.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanDuzenleTablosu.DataSource = null;
            DepartmanDuzenleTablosu.DataBind();

            DepartmanlarListBox.DataSource = null;
            DepartmanlarListBox.DataBind();

            DepartmanaGoreDuzenleDepartmanListBox.DataSource = null;
            DepartmanaGoreDuzenleDepartmanListBox.DataBind();
        }
        protected void DepartmanDuzenleIptal_Click(object sender, GridViewCancelEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = true;
            DepartmanDuzenleHataPanel.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanDuzenleTablosu.DataSource = null;
            DepartmanDuzenleTablosu.DataBind();
            DepartmanlarListBox.DataSource = null;
            DepartmanlarListBox.DataBind();
        }
        protected void DepartmanaGoreDuzenleSil_Click(object sender, GridViewDeletedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenleTablosu.Visible = true;
            DepartmanaGoreDuzenleBaslikLabel2.Visible = true;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanaGoreDuzenleTablosu.DataSource = null;
            DepartmanaGoreDuzenleTablosu.DataBind();
        }
        protected void DepartmanaGoreDuzenleDuzenle_Click(object sender, GridViewEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenleTablosu.Visible = true;
            DepartmanaGoreDuzenleBaslikLabel2.Visible = true;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

        }
        protected void DepartmanaGoreDuzenleGuncellestir_Click(object sender, GridViewUpdatedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenleTablosu.Visible = true;
            DepartmanaGoreDuzenleBaslikLabel2.Visible = true;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            DepartmanaGoreDuzenleTablosu.DataSource = null;
            DepartmanaGoreDuzenleTablosu.DataBind();
        }
        protected void DepartmanaGoreDuzenleIptal_Click(object sender, GridViewCancelEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = false;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = true;
            DepartmanaGoreDuzenleTablosu.Visible = true;
            DepartmanaGoreDuzenleBaslikLabel2.Visible = true;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void HesapIslemleriYoneticiDuzenleGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = true;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            HesapIslemleriYoneticiDuzenleGridView.DataSource = null;
            HesapIslemleriYoneticiDuzenleGridView.DataBind();
        }
        protected void HesapIslemleriYoneticiDuzenleGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = true;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }
        protected void HesapIslemleriYoneticiDuzenleGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = true;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;

            HesapIslemleriYoneticiDuzenleGridView.DataSource = null;
            HesapIslemleriYoneticiDuzenleGridView.DataBind();
        }
        protected void HesapIslemleriYoneticiDuzenleGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MainPanel.Visible = false;
            MainSearchTextBox.Text = "";

            AramaTablosu.Visible = false;
            BilgiLabel.Visible = false;
            DepartmanBaslikLabeli.Visible = false;
            DepartmanSecimTablosu.Visible = false;
            DepartmanlarListBox.SelectedIndex = -1;

            YoneticiGirisPaneli.Visible = false;
            HesapIslemleriSifreDegistirPanel.Visible = false;
            HesapIslemleriYoneticiEklePanel.Visible = false;
            HesapIslemleriYoneticiDuzenlePanel.Visible = true;
            KayitEklePaneli.Visible = false;
            KayitDuzenlePaneli.Visible = false;
            DepartmanEklePaneli.Visible = false;
            DepartmanDuzenlePaneli.Visible = false;
            DepartmanaGoreDuzenlePaneli.Visible = false;
            DisaAktarPaneli.Visible = false;

            NotPaneli.Visible = false;
            BolgelerTablosu.Visible = false;
        }

        //Ek Fonksiyonlar
        protected static void ResminBoyutunuKucult(System.Drawing.Image yuklenenFoto, int resimGenisligi, int ResimUzunlugu, string resimIsmi)
        {
            System.Drawing.Bitmap islenmisFoto = null;
            System.Drawing.Graphics grafikNesnesi = null;
            int hedeflenenGenislik = resimGenisligi;
            int hedeflenenYukseklik = ResimUzunlugu;
            int yeni_gen, yeni_yuk;
            yeni_yuk = hedeflenenYukseklik;
            yeni_gen = hedeflenenGenislik;
            hedeflenenYukseklik = yeni_yuk;
            yeni_gen = yeni_gen > hedeflenenGenislik ? hedeflenenGenislik : yeni_gen;
            yeni_yuk = yeni_yuk > hedeflenenYukseklik ? hedeflenenYukseklik : yeni_yuk;
            islenmisFoto = new System.Drawing.Bitmap(hedeflenenGenislik, hedeflenenYukseklik);
            grafikNesnesi = System.Drawing.Graphics.FromImage(islenmisFoto);
            grafikNesnesi.FillRectangle(new System.Drawing.SolidBrush(System.Drawing.Color.White), new System.Drawing.Rectangle(0, 0, hedeflenenGenislik, hedeflenenYukseklik));
            int x = (hedeflenenGenislik - yeni_gen) / 2;
            int y = (hedeflenenYukseklik - yeni_yuk) / 2;
            grafikNesnesi.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            grafikNesnesi.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
            grafikNesnesi.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.Default;
            System.Drawing.Imaging.ImageCodecInfo codec = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders()[1];
            System.Drawing.Imaging.EncoderParameters eParams = new System.Drawing.Imaging.EncoderParameters(1);
            eParams.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 95L);
            grafikNesnesi.DrawImage(yuklenenFoto, x, y, yeni_gen, yeni_yuk);
            islenmisFoto.Save(HttpContext.Current.Server.MapPath("~/KisiResimleri/" + resimIsmi), codec, eParams);

        }
        
        
    }
}