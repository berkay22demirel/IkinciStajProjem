<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HemaEndustriFihristv2._default" MaintainScrollPositionOnPostback="true" %>
<script runat="server">
</script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dahili Telefon Fihristi</title>
    <link href="/style.css" rel="stylesheet" />
    <script src="jquery-3.2.1.js"></script>
    <script type="text/javascript">
        $('document').ready(function(){
            $('header nav ul .YoneticiIslemleri-Wrap').mouseover(function () {
                $('header nav ul .YoneticiIslemleri-Wrap .YoneticiIslemleriAcilanMenu').css("display", "block");
                $('header nav ul .YoneticiIslemleri-Wrap .YoneticiIslemleriAcilanMenu').animate({ height:"270px" }, 200);
            })
            $('header nav ul .HesapIslemleri-Wrap').mouseover(function () {
                $('header nav ul .HesapIslemleri-Wrap .HesapIslemleriAcilanMenu').css("display", "block");
                $('header nav ul .HesapIslemleri-Wrap .HesapIslemleriAcilanMenu').animate({ height:"135px" },200);
            })
            $('header nav ul .YoneticiIslemleri-Wrap').mouseleave(function () {
                $('header nav ul .YoneticiIslemleri-Wrap .YoneticiIslemleriAcilanMenu').animate({ height: "0px" }, 10);
                $('header nav ul .YoneticiIslemleri-Wrap .YoneticiIslemleriAcilanMenu').css("display", "none");
            })
            $('header nav ul .HesapIslemleri-Wrap').mouseleave(function () {
                $('header nav ul .HesapIslemleri-Wrap .HesapIslemleriAcilanMenu').animate({ height: "0px" }, 10);
                $('header nav ul .HesapIslemleri-Wrap .HesapIslemleriAcilanMenu').css("display", "none");
                
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div class="banner">
            <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="/images/banner.jpg">
                <asp:RectangleHotSpot Bottom="85" Top="25" Left="412" Right="636" AlternateText="Hattat Holding A.Ş." Target="_blank" NavigateUrl="http://www.hattat.com.tr/" />
                <asp:RectangleHotSpot Bottom="145" Top="105" Left="20" Right="160" AlternateText="Hema Endüstri A.Ş." Target="_blank" NavigateUrl="http://www.hemaendustri.com.tr/" />
                <asp:RectangleHotSpot Bottom="145" Top="105" Left="189" Right="329" AlternateText="Hema Otomotiv Sistemleri A.Ş." Target="_blank" NavigateUrl="http://www.hemaotomotiv.com/" />
                <asp:RectangleHotSpot Bottom="145" Top="105" Left="358" Right="498" AlternateText="Hema Trw Otomotiv Direksiyon Sistemleri" Target="_blank" NavigateUrl="http://www.hematrw.com.tr/" />
                <asp:RectangleHotSpot Bottom="145" Top="105" Left="527" Right="667" AlternateText="Hattat Traktör" Target="_blank" NavigateUrl="http://www.hattattraktor.com/" />
                <asp:RectangleHotSpot Bottom="145" Top="105" Left="696" Right="836" AlternateText="Hattat Otomotiv Pazarlama A.Ş." Target="_blank" NavigateUrl="http://www.hattatotomotiv.com.tr/" />
                <asp:RectangleHotSpot Bottom="145" Top="105" Left="865" Right="1005" AlternateText="Hattat Enerji ve Maden Ticaret A.Ş." Target="_blank" NavigateUrl="http://www.hemaenerji.com/" />
            </asp:ImageMap>
        </div>
        <header>
            <nav>
                <ul>
                    <li>
                        <a href="default.aspx">Anasayfa</a>
                    </li>
                    <asp:Panel ID="YoneticiMenusuPanel" runat="server">
                    <li class="YoneticiIslemleri-Wrap">
                        <asp:LinkButton ID="YoneticiİslemleriButtonAnasayfa" CssClass="li" runat="server">Yönetici İşlemleri</asp:LinkButton>
                        <div class="YoneticiIslemleriAcilanMenu">
                            <ul>
                                <li class="alt-li">
                                    <asp:LinkButton ID="YoneticiMenusuKayıtEkleButton" CssClass="li" runat="server" OnClick="YoneticiMenusuKayıtEkleButton_Click">Kayıt Ekle</asp:LinkButton>
                                </li>
                                <li class="alt-li">
                                    <asp:LinkButton ID="YoneticiMenusuKayıtDuzenleButton" CssClass="li" runat="server" OnClick="YoneticiMenusuKayıtDuzenleButton_Click">Kayıt Düzenle</asp:LinkButton>
                                </li>
                                <li class="alt-li">
                                    <asp:LinkButton ID="YoneticiMenusuDepartmanEkleButton" CssClass="li" runat="server" OnClick="YoneticiMenusuDepartmanEkleButton_Click">Departman Ekle</asp:LinkButton>
                                </li>
                                <li class="alt-li">
                                    <asp:LinkButton ID="YoneticiMenusuDepartmanDuzenleButton" CssClass="li" runat="server" OnClick="YoneticiMenusuDepartmanDuzenleButton_Click">Departman Düzenle</asp:LinkButton>
                                </li>
                                <li class="alt-li">
                                    <asp:LinkButton ID="YoneticiMenusuDepartmanaGoreDuzenleButton" CssClass="li" runat="server" OnClick="YoneticiMenusuDepartmanaGoreDuzenleButton_Click">Departmana Göre Düzenle</asp:LinkButton>
                                </li>
                                <li class="alt-li">
                                    <asp:LinkButton ID="YoneticiMenusuDisaAktarButton" CssClass="li" runat="server" OnClick="YoneticiMenusuDisaAktarButton_Click">Dışa Aktar</asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="HesapIslemleri-Wrap">
                         <asp:LinkButton ID="HesapİslemleriButtonAnasayfa" CssClass="li" runat="server">Hesap İşlemleri</asp:LinkButton>
                            <div class="HesapIslemleriAcilanMenu">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="HesapİslemleriSifreDegistirButton" CssClass="li" runat="server" OnClick="HesapİslemleriSifreDegistirButton_Click">Şifre Değiştir</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="HesapİslemleriYoneticiEkleButton" CssClass="li" runat="server" OnClick="HesapİslemleriYoneticiEkleButton_Click">Yönetici Ekle</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="HesapİslemleriYoneticiDuzenleButton" CssClass="li" runat="server" OnClick="HesapİslemleriYoneticiDuzenleButton_Click">Yönetici Düzenle</asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                         <asp:LinkButton ID="YoneticiCikisButtonAnasayfa" CssClass="li" runat="server" OnClick="YoneticiCikisButtonAnasayfa_Click">Çıkış</asp:LinkButton>
                    </li>
                    </asp:Panel>
                </ul>
            </nav>
            <div class="DepartmanlarBaslik">
                <asp:Label ID="DepartmanlarBaslikBolgelerLabel" CssClass="DepartmanlarBaslikBolgelerLabel" runat="server" Text="Bölgeler"></asp:Label>
            </div>
        </header>
        <div class="icerik">
            <asp:Panel ID="MainPanel" runat="server">
            <div class="IcerikBaslik">
                Dahili Telefon Fihristi
            </div>
            <div class="MainSearch">
                <asp:TextBox ID = "MainSearchTextBox" cssClass="MainSearchTextBox" runat="server" Text="" placeholder="Aramak İstediğiniz bilgiyi giriniz"/>
                <asp:Button ID = "MainSearchButton" cssClass="MainSearchButton" runat="server" OnClick="MainSearchButton_Click" />
            </div>
            </asp:Panel>
            <div class="AramaSonucu">
                <asp:Label ID="DepartmanBaslikLabeli" cssClass="DepartmanBaslikLabeli" runat="server" Text="Label"></asp:Label>
                <asp:GridView ID="AramaTablosu" cssClass="AramaTablosu" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" CellSpacing="2" BackColor="#507CD1"  CellPadding="23" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="Resim" DataImageUrlFormatString="~\KisiResimleri\{0}" ControlStyle-Height="85px" ControlStyle-Width="63.5" HeaderText="Fotoğraf" SortExpression="Resim" >
<ControlStyle Height="85px" Width="63.5px"></ControlStyle>
                        </asp:ImageField>
                        <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                        <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" >
                        <ControlStyle Font-Size="X-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" SortExpression="Aciklama" >
                        <ItemStyle Font-Size="X-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IsTel" HeaderText="İş Tel" SortExpression="IsTel" />
                        <asp:BoundField DataField="IsTel2" HeaderText="İş Tel2" SortExpression="IsTel2" />
                        <asp:BoundField DataField="EvTel" HeaderText="Ev Tel" SortExpression="EvTel" />
                        <asp:BoundField DataField="DepartmanID" HeaderText="Departman" SortExpression="DepartmanID" >
                        <ItemStyle Font-Size="X-Small" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT Kayitlar.Resim, Kayitlar.Ad, Kayitlar.Soyad, Kayitlar.Aciklama, Kayitlar.IsTel, Kayitlar.IsTel2, Kayitlar.EvTel, Departmanlar.Ad AS DepartmanID, Kayitlar.SirketID FROM Kayitlar , Departmanlar WHERE (Kayitlar.DepartmanID = Departmanlar.id) AND ((Kayitlar.Ad LIKE '%' + @Ad + '%') OR (Kayitlar.EvTel LIKE '%' + @EvTel + '%') OR (Kayitlar.IsTel LIKE '%' + @IsTel + '%') OR (Kayitlar.IsTel2 LIKE '%' + @IsTel2 + '%') OR (Kayitlar.Soyad LIKE '%' + @Soyad + '%') OR (Kayitlar.Aciklama LIKE '%' + @Aciklama + '%')) ORDER BY z, Kayitlar.Ad, Kayitlar.Soyad">
                    <SelectParameters>
                        <asp:FormParameter FormField="MainSearchTextBox" Name="Ad" Type="String" />
                        <asp:FormParameter FormField="MainSearchTextBox" Name="EvTel" Type="String" />
                        <asp:FormParameter FormField="MainSearchTextBox" Name="IsTel" Type="String" />
                        <asp:FormParameter FormField="MainSearchTextBox" Name="IsTel2" Type="String" />
                        <asp:FormParameter FormField="MainSearchTextBox" Name="Soyad" Type="String" />
                        <asp:FormParameter FormField="MainSearchTextBox" Name="Aciklama" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="DepartmanSecimTablosu" cssClass="DepartmanSecimTablosu" CellSpacing="2" BackColor="#507CD1" runat="server" CellPadding="23" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="Resim" DataImageUrlFormatString="~\KisiResimleri\{0}" ControlStyle-Height="85px" ControlStyle-Width="63.5" HeaderText="Fotoğraf" SortExpression="Resim" >
<ControlStyle Height="85px" Width="63.5px"></ControlStyle>
                        </asp:ImageField>
                        <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                        <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" />
                        <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" SortExpression="Aciklama" />
                        <asp:BoundField DataField="IsTel" HeaderText="İş Tel" SortExpression="IsTel" />
                        <asp:BoundField DataField="IsTel2" HeaderText="İş Tel2" SortExpression="IsTel2" />
                        <asp:BoundField DataField="EvTel" HeaderText="Ev Tel" SortExpression="EvTel" />
                        <asp:ImageField DataImageUrlField="SirketID" DataImageUrlFormatString="~\SirketResimleri\{0}.jpg" ControlStyle-Height="20px" ControlStyle-Width="70px" HeaderText="Şirket" SortExpression="SirketID" >
<ControlStyle Height="20px" Width="70px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [Ad], [Soyad], [Aciklama], [IsTel], [IsTel2], [EvTel], [DepartmanID], [PozisyonID], [SirketID], [Resim] FROM [Kayitlar] WHERE ([DepartmanID] = @DepartmanID) ORDER BY [PozisyonID], [Ad], [Soyad]" >
                    <SelectParameters>
                        <asp:FormParameter FormField="DepartmanlarListBox" Name="DepartmanID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="BilgiLabel" cssClass="BilgiLabel" runat="server" Text="Bilgi: Yukarıdaki Liste Organizasyon Şemasına Göre Düzenlenmiştir."></asp:Label>
            </div>
            <div class="YoneticiGirisi">
            <asp:Panel ID="YoneticiGirisPaneli" runat="server">
                <div class="YoneticiGirisBaslik"><asp:Label ID="YoneticiGirisBaslikLabel" cssClass="YoneticiGirisBaslikLabel" runat="server" Text="Yönetici Girişi"></asp:Label></div>
                <div class="KullaniciAdi"><asp:Label ID="YoneticiGirisKullaniciAdiLabel" cssClass="YoneticiGirisLabel" runat="server" Text="Kullanıcı Adı : "></asp:Label>
                <asp:TextBox ID="YoneticiGirisKullaniciAdiTextBox" cssClass="YoneticiGirisTextBox" runat="server"></asp:TextBox>
                </div>
                <div class="Sifre">
                <asp:Label ID="YoneticiGirisSifreLabel" cssClass="YoneticiGirisLabel" runat="server" Text="Parola : "></asp:Label>
                <asp:TextBox ID="YoneticiGirisSifreTextBox" cssClass="YoneticiGirisTextBox" TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <div class="GirisB">
                <asp:Button ID="YoneticiGirisButton" cssClass="YoneticiGirisButton" runat="server" Text="Giriş Yap" OnClick="YoneticiGirisButton_Click" />
                </div>
                <div class="GirisSonuc">
                    <asp:Label ID="YoneticiGirisSonucLabel" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>
            </div>
            <div class="HesapIslemleriSifreDegistirDiv">
                <asp:Panel ID="HesapIslemleriSifreDegistirPanel" runat="server">
                    <div class="HesapIslemleriSifreDegistirBaslik">
                        <asp:Label ID="HesapIslemleriSifreDegistirBaslikLabel" cssClass="HesapIslemleriSifreDegistirBaslikLabel" runat="server" Text="Şifre Değiştir"></asp:Label>
                    </div>
                <div class="HesapIslemleriSifreDegistirEskiSifre">
                    <asp:Label ID="HesapIslemleriSifreDegistirEskiSifreLabel" cssClass="HesapIslemleriSifreDegistirEskiSifreLabel" runat="server" Text="Eski Şifre : "></asp:Label>
                    <asp:TextBox ID="HesapIslemleriSifreDegistirEskiSifreTextBox" cssClass="HesapIslemleriSifreDegistirEskiSifreTextBox" TextMode="Password" runat="server" MaxLength="25"></asp:TextBox>
                    <asp:CompareValidator ID="HesapIslemleriSifreDegistirSifreValidator" CssClass="HesapIslemleriSifreDegistirSifreValidator" runat="server" ControlToValidate="HesapIslemleriSifreDegistirYeniSifreTekrarTextBox" ControlToCompare="HesapIslemleriSifreDegistirYeniSifreTextBox" validationgroup="HesapIslemleriSifreDegistir" ErrorMessage="Girilen şifreler uyuşmuyor!"></asp:CompareValidator>
                </div>
                <div class="HesapIslemleriSifreDegistirSifre">
                    <asp:Label ID="HesapIslemleriSifreDegistirYeniSifreLabel" cssClass="HesapIslemleriSifreDegistirYeniSifreLabel" runat="server" Text="Yeni Şifre : "></asp:Label>
                    <asp:TextBox ID="HesapIslemleriSifreDegistirYeniSifreTextBox" cssClass="HesapIslemleriSifreDegistirYeniSifreTextBox"  TextMode="Password" runat="server" MaxLength="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="HesapIslemleriSifreDegistirSifreBosValidator" CssClass="HesapIslemleriSifreDegistirSifreBosValidator" runat="server" ControlToValidate="HesapIslemleriSifreDegistirYeniSifreTextBox" validationgroup="HesapIslemleriSifreDegistir" ErrorMessage="Bu alan boş olamaz!"></asp:RequiredFieldValidator>
                </div>
                <div class="HesapIslemleriSifreDegistirSifreTekrar">
                    <asp:Label ID="HesapIslemleriSifreDegistirYeniSifreTekrarLabel" cssClass="HesapIslemleriSifreDegistirYeniSifreTekrarLabel" runat="server" Text="Yeni Şifre Tekrar : "></asp:Label>
                    <asp:TextBox ID="HesapIslemleriSifreDegistirYeniSifreTekrarTextBox" cssClass="HesapIslemleriSifreDegistirYeniSifreTekrarTextBox" TextMode="Password" runat="server" MaxLength="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="HesapIslemleriSifreDegistirSifreBosValidator2" CssClass="HesapIslemleriSifreDegistirSifreBosValidator2" runat="server" ControlToValidate="HesapIslemleriSifreDegistirYeniSifreTekrarTextBox" validationgroup="HesapIslemleriSifreDegistir" ErrorMessage="Bu alan boş olamaz!"></asp:RequiredFieldValidator>
                </div>
                <div class="HesapIslemleriSifreDegistirGirisButon">
                    <asp:Button ID="HesapIslemleriSifreDegistirGirisButton" cssClass="HesapIslemleriSifreDegistirGirisButton" validationgroup="HesapIslemleriSifreDegistir" runat="server" Text="Şifre Değiştir" OnClick="HesapIslemleriSifreDegistirButton_Click" />
                </div>
                <div class="HesapIslemleriSifreDegistirGirisSonuc">
                    <asp:Label ID="HesapIslemleriSifreDegistirGirisSonucLabel" CssClass="HesapIslemleriSifreDegistirGirisSonucLabel" runat="server" Text=""></asp:Label>
                </div>
                </asp:Panel>
            </div>
            <div class="HesapIslemleriYoneticiEkleDiv">
                <asp:Panel ID="HesapIslemleriYoneticiEklePanel" runat="server">
                    <div class="HesapIslemleriYoneticiEkleBaslik">
                        <asp:Label ID="HesapIslemleriYoneticiEkleBaslikLabel" cssClass="HesapIslemleriYoneticiEkleBaslikLabel" runat="server" Text="Yönetici Ekle"></asp:Label>
                    </div>
                    <div class="HesapIslemleriYoneticiEkleKullaniciAdi">
                        <asp:Label ID="HesapIslemleriYoneticiEkleKullaniciAdiLabel" cssClass="HesapIslemleriYoneticiEkleKullaniciAdiLabel" runat="server" Text="Kullanıcı Adı : "></asp:Label>
                        <asp:TextBox ID="HesapIslemleriYoneticiEkleKullaniciAdiTextBox" cssClass="HesapIslemleriYoneticiEkleKullaniciAdiTextBox" runat="server" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="HesapIslemleriYoneticiEkleKullaniciAdiBosValidator" CssClass="HesapIslemleriYoneticiEkleKullaniciAdiBosValidator" runat="server" ControlToValidate="HesapIslemleriYoneticiEkleKullaniciAdiTextBox" validationgroup="HesapIslemleriYoneticiEkle" ErrorMessage="Bu alan boş olamaz!"></asp:RequiredFieldValidator>
                    </div>
                    <div class="HesapIslemleriYoneticiEkleSifre">
                        <asp:Label ID="HesapIslemleriYoneticiEkleSifreLabel" cssClass="HesapIslemleriYoneticiEkleSifreLabel" runat="server" Text="Şifre : "></asp:Label>
                        <asp:TextBox ID="HesapIslemleriYoneticiEkleSifreTextBox" cssClass="HesapIslemleriYoneticiEkleSifreTextBox"  TextMode="Password" runat="server" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="HesapIslemleriYoneticiEkleSifreBosValidator" CssClass="HesapIslemleriYoneticiEkleSifreBosValidator" runat="server" ControlToValidate="HesapIslemleriYoneticiEkleSifreTextBox" validationgroup="HesapIslemleriYoneticiEkle" ErrorMessage="Bu alan boş olamaz!"></asp:RequiredFieldValidator>
                    </div>
                    <div class="HesapIslemleriYoneticiEkleSifreTekrar">
                        <asp:Label ID="HesapIslemleriYoneticiEkleSifreTekrarLabel" cssClass="HesapIslemleriYoneticiEkleSifreTekrarLabel" runat="server" Text="Şifre Tekrar : "></asp:Label>
                        <asp:TextBox ID="HesapIslemleriYoneticiEkleSifreTekrarTextBox" cssClass="HesapIslemleriYoneticiEkleSifreTekrarTextBox" TextMode="Password" runat="server" MaxLength="25"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="HesapIslemleriYoneticiEkleSifreTekrarBosValidator" CssClass="HesapIslemleriYoneticiEkleSifreTekrarBosValidator" runat="server" ControlToValidate="HesapIslemleriYoneticiEkleSifreTekrarTextBox" validationgroup="HesapIslemleriYoneticiEkle" ErrorMessage="Bu alan boş olamaz!"></asp:RequiredFieldValidator>
                    </div>
                    <div class="HesapIslemleriYoneticiEkleYetkiSecim">
                        <asp:Label ID="HesapIslemleriYoneticiEkleYetkiSecimLabel" cssClass="HesapIslemleriYoneticiEkleYetkiSecimLabel" runat="server" Text="Yetki : "></asp:Label>
                        <asp:DropDownList ID="HesapIslemleriYoneticiEkleYetkiSecimDropDownList" CssClass="HesapIslemleriYoneticiEkleYetkiSecimDropDownList" runat="server" DataSourceID="SqlDataSource35" DataTextField="Bölge" DataValueField="id" AppendDataBoundItems="true">
                            <asp:ListItem Enabled="true">Lütfen Bir Seçenek Seçiniz...</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource35" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Bölge] FROM [Bolgeler] ORDER BY [id]"></asp:SqlDataSource>
                        <asp:Label ID="HesapIslemleriYoneticiEkleYetkiSecimSonucLabel" CssClass="HesapIslemleriYoneticiEkleYetkiSecimSonucLabel" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="HesapIslemleriYoneticiEkleButon">
                        <asp:Button ID="HesapIslemleriYoneticiEkleButton" cssClass="HesapIslemleriYoneticiEkleButton" validationgroup="HesapIslemleriYoneticiEkle" runat="server" Text="Ekle" OnClick="HesapIslemleriYoneticiEkleButton_Click" />
                    </div>
                    <div class="HesapIslemleriYoneticiEkleSonuc">
                        <asp:Label ID="HesapIslemleriYoneticiEkleSonucLabel" CssClass="HesapIslemleriYoneticiEkleSonucLabel" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:CompareValidator ID="HesapIslemleriYoneticiEkleSonucCompareValidator" CssClass="HesapIslemleriYoneticiEkleSonucCompareValidator" runat="server" ControlToValidate="HesapIslemleriYoneticiEkleSifreTextBox" ControlToCompare="HesapIslemleriYoneticiEkleSifreTekrarTextBox" validationgroup="HesapIslemleriYoneticiEkle" ErrorMessage="Girilen şifreler uyuşmuyor!" ></asp:CompareValidator>
                    </div>
                </asp:Panel>
            </div>
            <div class="HesapIslemleriYoneticiDuzenleDiv">
                <asp:Panel ID="HesapIslemleriYoneticiDuzenlePanel" runat="server">
                    <div class="HesapIslemleriYoneticiDuzenleBaslik">
                        <asp:Label ID="HesapIslemleriYoneticiDuzenleBaslikLabel" cssClass="HesapIslemleriYoneticiDuzenleBaslikLabel" runat="server" Text="Yönetici Düzenle"></asp:Label>
                    </div>
                    <div class="HesapIslemleriYoneticiDuzenleTablo">
                        <asp:GridView ID="HesapIslemleriYoneticiDuzenleGridView" cssClass="HesapIslemleriYoneticiDuzenleGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" BackColor="#507CD1" ForeColor="#333333" GridLines="None" OnRowDeleted="HesapIslemleriYoneticiDuzenleGridView_RowDeleted" OnRowEditing="HesapIslemleriYoneticiDuzenleGridView_RowEditing" OnRowUpdated="HesapIslemleriYoneticiDuzenleGridView_RowUpdated" OnRowCancelingEdit="HesapIslemleriYoneticiDuzenleGridView_RowCancelingEdit" HorizontalAlign="Center" Width="684px" DataKeyNames="KullaniciAdi" DataSourceID="SqlDataSource37">
                        <AlternatingRowStyle BackColor="White" Width="684px" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField ControlStyle-Width="100%" DataField="KullaniciAdi" HeaderText="Kullanıcı Adı" SortExpression="KullaniciAdi" ReadOnly="True">
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField ControlStyle-Width="100%" DataField="Sifre" HeaderText="Şifre" SortExpression="Sifre">
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Yetki" SortExpression="Yetki" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="HesapIslemleriYoneticiDuzenleYetkiDropDownList" CssClass="HesapIslemleriYoneticiDuzenleYetkiDropDownList" SelectedValue = '<% # Bind ("Yetki")%>' runat="server" DataSourceID="SqlDataSource38" DataTextField="Bölge" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource38" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Bölge] FROM [Bolgeler] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Yetki") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource37" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" DeleteCommand="DELETE FROM [Yonetici] WHERE [KullaniciAdi] = @KullaniciAdi" InsertCommand="INSERT INTO [Yonetici] ([KullaniciAdi], [Sifre], [Yetki]) VALUES (@KullaniciAdi, @Sifre, @Yetki)" SelectCommand="SELECT [KullaniciAdi], [Sifre], [Yetki] FROM [Yonetici] WHERE Yetki <> 0 ORDER BY [Yetki], [KullaniciAdi]" UpdateCommand="UPDATE [Yonetici] SET [Sifre] = @Sifre, [Yetki] = @Yetki WHERE [KullaniciAdi] = @KullaniciAdi">
                            <DeleteParameters>
                                <asp:Parameter Name="KullaniciAdi" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="KullaniciAdi" Type="String" />
                                <asp:Parameter Name="Sifre" Type="String" />
                                <asp:Parameter Name="Yetki" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Sifre" Type="String" />
                                <asp:Parameter Name="Yetki" Type="Int32" />
                                <asp:Parameter Name="KullaniciAdi" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                </div>

                </asp:Panel>
            </div>
            <div class="KayitEkle">
            <asp:Panel ID="KayitEklePaneli" runat="server">
                <div class="KayitEkleBaslik">
                    <asp:Label ID="KayitEkleBaslikLabel" cssClass="KayitEkleBaslikLabel" runat="server" Text="Kayit Ekle"></asp:Label>
                </div>
                <div class="KayitEkleAd">
                    <asp:Label ID="KayitEkleAdLabel" cssClass="KayitEkleLabel" runat="server" Text="*Ad : "></asp:Label>
                    <asp:TextBox ID="KayitEkleAdTextBox" cssClass="KayitEkleTextBox" runat="server" ControlToValidate="KayitEkleAdTextBox" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="KayitEkleAdValidator" CssClass="KayitEkleAdValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alanı doldurun!" ControlToValidate="KayitEkleAdTextBox"></asp:RequiredFieldValidator>
                </div>
                <div class="KayitEkleSoyad">
                    <asp:Label ID="KayitEkleSoyadLabel" cssClass="KayitEkleLabel" runat="server" Text="*Soyad : "></asp:Label>
                    <asp:TextBox ID="KayitEkleSoyadTextBox" cssClass="KayitEkleTextBox" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="KayitEkleSoyadValidator" CssClass="KayitEkleSoyadValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alanı doldurun!" ControlToValidate="KayitEkleSoyadTextBox"></asp:RequiredFieldValidator>
                </div>
                <div class="KayitEkleSicilNo">
                    <asp:Label ID="KayitEkleSicilNoLabel" cssClass="KayitEkleLabel" runat="server" Text="Sicil No : "></asp:Label>
                    <asp:TextBox ID="KayitEkleSicilNoTextBox" cssClass="KayitEkleTextBox" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:CompareValidator ID="KayitEkleSicilNoValidator" CssClass="KayitEkleSicilNoSayiValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alana sayı girin!" ControlToValidate="KayitEkleSicilNoTextBox" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </div>
                <div class="KayitEkleDepartmanSecim">
                    <asp:Label ID="KayitEkleDepartmanSecimiLabel" cssClass="KayitEkleLabel" runat="server" Text="*Departman : "></asp:Label>
                    <asp:DropDownList ID="KayitEkleDepartmanSecimDropDownList" cssClass="KayitEkleDepartmanSecimDropDownList" runat="server" DataSourceID="SqlDataSource5" DataTextField="Ad" DataValueField="id" AppendDataBoundItems="true">
                     <asp:ListItem Enabled="true">Lütfen Bir Seçenek Seçiniz...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [Ad], [id] FROM [Departmanlar]"></asp:SqlDataSource>
                    <asp:Label ID="KayitEkleDepartmanSecimHataLabel" CssClass="KayitEkleDepartmanSecimHataLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="KayitEkleAciklama">
                    <asp:Label ID="KayitEkleAciklamaLabel" cssClass="KayitEkleLabel" runat="server" Text="*Açıklama : "></asp:Label>
                    <asp:TextBox ID="KayitEkleAciklamaTextBox" cssClass="KayitEkleTextBox" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="KayitEkleAciklamaValidator" CssClass="KayitEkleAciklamaValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alanı doldurun!" ControlToValidate="KayitEkleAciklamaTextBox"></asp:RequiredFieldValidator>
                </div>
                <div class="KayitEkleFotograf">
                    <asp:Label ID="KayitEkleFotografLabel" cssClass="KayitEkleLabel" runat="server" Text="Fotoğraf : "></asp:Label>
                    <asp:FileUpload ID="KayitEkleFotografFileUpload"  cssClass="KayitEkleFileUpload" runat="server" />
                    <asp:CompareValidator ID="KayitEkleIsTelSayiValidator" CssClass="KayitEkleIsTelSayiValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen İş Tel alanına sayı girin!" ControlToValidate="KayitEkleIsTelTextBox" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </div>
                <div class="KayitEkleIsTel">
                    <asp:Label ID="KayitEkleIsTelLabel" cssClass="KayitEkleLabel" runat="server" Text="*İş Tel : "></asp:Label>
                    <asp:TextBox ID="KayitEkleIsTelTextBox" cssClass="KayitEkleTextBox" runat="server" MaxLength="11"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="KayitEkleIsTelValidator" CssClass="KayitEkleIsTelValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alanı doldurun!" ControlToValidate="KayitEkleIsTelTextBox"></asp:RequiredFieldValidator>
                </div>
                <div class="KayitEkleIsTel2">
                    <asp:Label ID="KayitEkleIsTel2Label" cssClass="KayitEkleLabel" runat="server" Text="İş Tel 2 : "></asp:Label>
                    <asp:TextBox ID="KayitEkleIsTel2TextBox" cssClass="KayitEkleTextBox" runat="server" MaxLength="11"></asp:TextBox>
                    <asp:CompareValidator ID="KayitEkleIsTel2SayiValidator" CssClass="KayitEkleIsTel2SayiValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alana sayı girin!" ControlToValidate="KayitEkleIsTel2TextBox" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </div>
                <div class="KayitEkleEvTel">
                    <asp:Label ID="KayitEkleEvTelLabel" cssClass="KayitEkleLabel" runat="server" Text="Ev Tel : "></asp:Label>
                    <asp:TextBox ID="KayitEkleEvTelTextBox" cssClass="KayitEkleTextBox" runat="server" MaxLength="11"></asp:TextBox>
                    <asp:CompareValidator ID="KayitEkleEvTelSayiValidator" CssClass="KayitEkleEvTelSayiValidator" validationgroup="KayitEkle" runat="server" ErrorMessage="Lütfen bu alana sayı girin!" ControlToValidate="KayitEkleEvTelTextBox" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </div>
                <div class="KayitEkleSirketSecim">
                    <asp:Label ID="KayitEkleSirketSecimLabel" cssClass="KayitEkleLabel" runat="server" Text="*Şirket : "></asp:Label>
                    <asp:DropDownList ID="KayitEkleSirketSecimDropDownList" cssClass="KayitEkleSirketSecimDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource23" DataTextField="Ad" DataValueField="id">
                        <asp:ListItem Enabled="true">Lütfen Bir Seçenek Seçiniz...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Sirketler] ORDER BY [id]"></asp:SqlDataSource>
                    <asp:Label ID="KayitEkleSirketSecimHataLabel" CssClass="KayitEkleSirketSecimHataLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="KayitEklePozisyonSecim">
                    <asp:Label ID="KayitEklePozisyonSecimLabel" cssClass="KayitEkleLabel" runat="server" Text="*Pozisyon : "></asp:Label>
                    <asp:DropDownList ID="KayitEklePozisyonSecimDropDownList" cssClass="KayitEklePozisyonSecimDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource8" DataTextField="Ad" DataValueField="id">
                        <asp:ListItem Enabled="true">Lütfen Bir Seçenek Seçiniz...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Pozisyonlar] ORDER BY [id]"></asp:SqlDataSource>
                    <asp:Label ID="KayitEklePozisyonSecimHataLabel" CssClass="KayitEklePozisyonSecimHataLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="KayitEkleButonu">
                <asp:Button ID="KayitEkleButton" cssClass="KayitEkleButton" validationgroup="KayitEkle" runat="server" Text="Kayıt Ekle" OnClick="KayitEkleButton_Click"/>
                </div>
                <div class="KayitEkleNot">
                    <asp:Label ID="KayitEkleNotLabel" CssClass="KayitEkleNotLabel" runat="server" Text="Not: Başında * olan alanların doldurulması zorunludur!"></asp:Label>
                </div>
                <div class="KayitEkleSonuc">
                    <asp:Label ID="KayitEkleSonucLabel" CssClass="KayitEkleSonucLabel" runat="server" Text="" Visible="false"></asp:Label>
                </div>
            </asp:Panel>
            </div>
            <div class="KayitDuzenle">
                    <asp:Panel ID="KayitDuzenlePaneli" runat="server">
                    <div class="KayitDuzenleBaslik">
                        <asp:Label ID="KayitDuzenleBaslikLabel" CssClass="KayitDuzenleBaslikLabel" runat="server" Text="Kayit Düzenle"></asp:Label>
                    </div>
                    <div class="KayitDuzenleSearch">
                        <asp:TextBox ID = "KayitDuzenleTextBox" cssClass="KayitDuzenleTextBox" runat="server" placeholder="Aramak İstediğiniz bilgiyi giriniz"/>
                        <asp:Button ID = "KayitDuzenleButton" cssClass="KayitDuzenleButton" runat="server" OnClick="KayitDuzenleButton_Click" />
                    </div>
                    <div class="KayitDuzenleAramaSonucu">
                        <asp:Label ID="KayitDuzenleAramaSonucuLabel" cssClass="KayitDuzenleAramaSonucuLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="KayitDuzenleTablo">
                        <asp:GridView ID="KayitDuzenleTablosu" cssClass="KayitDuzenleTablosu" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" BackColor="#507CD1" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" OnRowDeleted="KayitDuzenleSil_Click" OnRowEditing="KayitDuzenleDuzenle_Click" OnRowUpdated="KayitDuzenleGuncellestir_Click" OnRowCancelingEdit="KayitDuzenleIptal_Click" HorizontalAlign="Center" Width="684px" DataKeyNames="id">
                        <AlternatingRowStyle BackColor="White" Width="684px" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:ImageField DataImageUrlField="Resim" DataImageUrlFormatString="~\KisiResimleri\{0}" ControlStyle-Height="85px" ControlStyle-Width="63.5" HeaderText="Fotoğraf" SortExpression="Resim" >
                            <ControlStyle Height="85px" Width="63.5px"></ControlStyle>
                            </asp:ImageField>
                            <asp:BoundField ControlStyle-Width="100%" DataField="Ad" HeaderText="Ad" SortExpression="Ad">
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField ControlStyle-Width="100%" DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad">
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SicilNo" HeaderText="Sicil No" SortExpression="SicilNo" ControlStyle-Width="100%" >
                                <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" SortExpression="Aciklama" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IsTel" HeaderText="İş Tel" SortExpression="IsTel" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IsTel2" HeaderText="İş Tel2" SortExpression="IsTel2" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EvTel" HeaderText="Ev Tel" SortExpression="EvTel" ControlStyle-Width="100%" >
                                <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Departman" SortExpression="DepartmanID" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="KayitDuzenleDepartmanDropDownList" runat="server" DataSourceID="SqlDataSource9" SelectedValue = '<% # Bind ("DepartmanID")%>' DataTextField="Ad" DataValueField="id" Width="100%">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Departmanlar] ORDER BY [Ad]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DepartmanID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Şirket" SortExpression="SirketID" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="KayitDuzenleSirketDropDownList" runat="server" DataSourceID="SqlDataSource24" SelectedValue = '<% # Bind ("SirketID")%>' DataTextField="Ad" DataValueField="id" Width="100%"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource24" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Sirketler] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SirketID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pozisyon" SortExpression="PozisyonID" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="KayitDuzenleOncelikDropDownList" runat="server" DataSourceID="SqlDataSource10" SelectedValue = '<% # Bind ("PozisyonID")%>' DataTextField="Ad" DataValueField="id" Width="100%"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Pozisyonlar] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PozisyonID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100%" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [Ad], [Soyad], [SicilNo], [Aciklama], [IsTel], [IsTel2], [EvTel], [DepartmanID], [PozisyonID], [SirketID], [Resim], [id] FROM [Kayitlar] WHERE (([Ad] LIKE '%' + @Ad + '%') OR ([Soyad] LIKE '%' + @Soyad + '%') OR ([Aciklama] LIKE '%' + @Aciklama + '%') OR ([IsTel] LIKE '%' + @IsTel + '%') OR ([IsTel2] LIKE '%' + @IsTel2 + '%') OR ([EvTel] LIKE '%' + @EvTel + '%')) ORDER BY [PozisyonID], [Ad], [Soyad]" DeleteCommand="DELETE FROM [Kayitlar] WHERE [id] = @id" InsertCommand="INSERT INTO [Kayitlar] ([Ad], [Soyad], [SicilNo], [Aciklama], [IsTel], [IsTel2], [EvTel], [DepartmanID], [PozisyonID], [SirketID], [Resim]) VALUES (@Ad, @Soyad, @SicilNo, @Aciklama, @IsTel, @IsTel2, @EvTel, @DepartmanID, @PozisyonID, @SirketID, @Resim)" UpdateCommand="UPDATE [Kayitlar] SET [Ad] = @Ad, [Soyad] = @Soyad, [SicilNo] = @SicilNo, [Aciklama] = @Aciklama, [IsTel] = @IsTel, [IsTel2] = @IsTel2, [EvTel] = @EvTel, [DepartmanID] = @DepartmanID, [PozisyonID] = @PozisyonID, [SirketID] = @SirketID, [Resim] = @Resim WHERE [id] = @id">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Ad" Type="String" />
                                <asp:Parameter Name="Soyad" Type="String" />
                                <asp:Parameter Name="SicilNo" Type="String" />
                                <asp:Parameter Name="Aciklama" Type="String" />
                                <asp:Parameter Name="IsTel" Type="String" />
                                <asp:Parameter Name="IsTel2" Type="String" />
                                <asp:Parameter Name="EvTel" Type="String" />
                                <asp:Parameter Name="DepartmanID" Type="Int32" />
                                <asp:Parameter Name="PozisyonID" Type="Int32" />
                                <asp:Parameter Name="SirketID" Type="Int32" />
                                <asp:Parameter Name="Resim" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:FormParameter FormField="KayitDuzenleTextBox" Name="Ad" Type="String" />
                                <asp:FormParameter FormField="KayitDuzenleTextBox" Name="Soyad" Type="String" />
                                <asp:FormParameter FormField="KayitDuzenleTextBox" Name="Aciklama" Type="String" />
                                <asp:FormParameter FormField="KayitDuzenleTextBox" Name="IsTel" Type="String" />
                                <asp:FormParameter FormField="KayitDuzenleTextBox" Name="IsTel2" Type="String" />
                                <asp:FormParameter FormField="KayitDuzenleTextBox" Name="EvTel" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Ad" Type="String" />
                                <asp:Parameter Name="Soyad" Type="String" />
                                <asp:Parameter Name="SicilNo" Type="String" />
                                <asp:Parameter Name="Aciklama" Type="String" />
                                <asp:Parameter Name="IsTel" Type="String" />
                                <asp:Parameter Name="IsTel2" Type="String" />
                                <asp:Parameter Name="EvTel" Type="String" />
                                <asp:Parameter Name="DepartmanID" Type="Int32" />
                                <asp:Parameter Name="PozisyonID" Type="Int32" />
                                <asp:Parameter Name="SirketID" Type="Int32" />
                                <asp:Parameter Name="Resim" Type="String" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                    </asp:SqlDataSource>
                    </div>
                    <div class="KayitDuzenleBilgi">
                        <asp:Label ID="KayitDuzenleBilgiLabel" cssClass="KayitDuzenleBilgiLabel" runat="server" Text="Bilgi: Yukarıdaki Liste Organizasyon Şemasına Göre Düzenlenmiştir."></asp:Label>
                    </div>
                </asp:Panel>
            </div>
            <div class="DepartmanEkle">
                <asp:Panel ID="DepartmanEklePaneli" runat="server">
                    <div class="DepartmanEkleBaslik">
                        <asp:Label ID="DepartmanEkleBaslikLabel" cssClass="DepartmanEkleBaslikLabel" runat="server" Text="Departman Ekle"></asp:Label>
                    </div>
                    <div class="DepartmanEkleBolgeSecim">
                        <asp:Label ID="DepartmanEkleBolgeSecimLabel" cssClass="DepartmanEkleBolgeSecimLabel" runat="server" Text="Bölge : "></asp:Label>
                        <asp:DropDownList ID="DepartmanEkleBolgeSecimDropDownList" cssClass="DepartmanEkleBolgeSecimDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource26" DataTextField="Bölge" DataValueField="id">
                        <asp:ListItem Enabled="true">Lütfen Bir Seçenek Seçiniz...</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource26" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Bölge] FROM [Bolgeler] ORDER BY [id]"></asp:SqlDataSource>
                        <asp:Label ID="DepartmanEkleBolgeSecimHataLabel" CssClass="DepartmanEkleBolgeSecimHataLabel" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="DepartmanEkleSirketSecim">
                        <asp:Label ID="DepartmanEkleSirketSecimLabel" cssClass="DepartmanEkleSirketSecimLabel" runat="server" Text="Şirket : "></asp:Label>
                        <asp:DropDownList ID="DepartmanEkleSirketSecimDropDownList" cssClass="DepartmanEkleSirketSecimDropDownList" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource27" DataTextField="Ad" DataValueField="id">
                        <asp:ListItem Enabled="true">Lütfen Bir Seçenek Seçiniz...</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource27" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Sirketler] ORDER BY [id]"></asp:SqlDataSource>
                        <asp:Label ID="DepartmanEkleSirketSecimHataLabel" CssClass="DepartmanEkleSirketSecimHataLabel" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="DepartmanEkleAd">
                        <asp:Label ID="DepartmanEkleAdLabel" cssClass="DepartmanEkleLabel" runat="server" Text="Ad : "></asp:Label>
                        <asp:TextBox ID="DepartmanEkleAdTextBox" cssClass="DepartmanEkleTextBox" runat="server" ControlToValidate="KayitEkleAdTextBox" MaxLength="45"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="DepartmanEkleAdBosValidator" CssClass="DepartmanEkleAdBosValidator" runat="server" ControlToValidate="DepartmanEkleAdTextBox" validationgroup="DepartmanEkle" ErrorMessage="Bu alan boş olamaz!"></asp:RequiredFieldValidator>
                    </div>
                    <div class="DepartmanEkleButonu">
                        <asp:Button ID="DepartmanEkleButton" cssClass="DepartmanEkleButton" validationgroup="DepartmanEkle" runat="server" Text="Departman Ekle" OnClick="DepartmanEkleButton_Click"/>
                    </div>
                    <div class="DepartmanEkleSonuc">
                        <asp:Label ID="DepartmanEkleSonucLabel" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
            <div class="DepartmanDuzenle">
                <asp:Panel ID="DepartmanDuzenlePaneli" runat="server">
                    <div class="DepartmanDuzenleBaslik">
                        <asp:Label ID="DepartmanDuzenleBaslikLabel" CssClass="DepartmanDuzenleBaslikLabel" runat="server" Text="Departman Düzenle"></asp:Label>
                    </div>
                    <asp:Panel ID="DepartmanDuzenleHataPanel" runat="server">
                        <div class="DepartmanDuzenleHata">
                            <asp:Label ID="DepartmanDuzenleHataLabel" CssClass="DepartmanDuzenleHataLabel" runat="server" Text=""></asp:Label>
                        </div>
                    </asp:Panel>
                    <div class="DepartmanDuzenleTablo">
                        <asp:GridView ID="DepartmanDuzenleTablosu" cssClass="DepartmanDuzenleTablosu" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" BackColor="#507CD1" DataSourceID="SqlDataSource7" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="684px" DataKeyNames="id" OnRowCancelingEdit="DepartmanDuzenleIptal_Click" OnRowDeleted="DepartmanDuzenleSil_Click" OnRowEditing="DepartmanDuzenleDuzenle_Click" OnRowUpdated="DepartmanDuzenleGuncellestir_Click">
                        <AlternatingRowStyle BackColor="White" Width="684px" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField ControlStyle-Width="100%" DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                            <asp:TemplateField ControlStyle-Width="100%" HeaderText="BolgeID" SortExpression="BolgeID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DepartmanDuzenleBolgeSecimDropDownList" CssClass="DepartmanDuzenleBolgeSecimDropDownList" runat="server" SelectedValue = '<% # Bind ("BolgeID")%>' DataSourceID="SqlDataSource28" DataTextField="Bölge" DataValueField="id" Width="100%"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource28" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Bölge] FROM [Bolgeler] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("BolgeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-Width="100%" HeaderText="SirketID" SortExpression="SirketID">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DepartmanDuzenleSirketSecimDropDownList" CssClass="DepartmanDuzenleSirketSecimDropDownList" SelectedValue = '<% # Bind ("SirketID")%>' runat="server" DataSourceID="SqlDataSource29" DataTextField="Ad" DataValueField="id" Width="100%"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource29" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Sirketler] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SirketID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" Width="250" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad], [BolgeID], [SirketID] FROM [Departmanlar] ORDER BY [Ad]" DeleteCommand="DELETE FROM [Departmanlar] WHERE [id] = @id" InsertCommand="INSERT INTO [Departmanlar] ([Ad], [BolgeID], [SirketID]) VALUES (@Ad, @BolgeID, @SirketID)" UpdateCommand="UPDATE [Departmanlar] SET [Ad] = @Ad, [BolgeID] = @BolgeID, [SirketID] = @SirketID WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Ad" Type="String" />
                            <asp:Parameter Name="BolgeID" Type="Int32" />
                            <asp:Parameter Name="SirketID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Ad" Type="String" />
                            <asp:Parameter Name="BolgeID" Type="Int32" />
                            <asp:Parameter Name="SirketID" Type="Int32" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </div>
                </asp:Panel>
            </div>
            <div class="DepartmanaGoreDuzenle">
                <asp:Panel ID="DepartmanaGoreDuzenlePaneli" runat="server">
                    <div class="DepartmanaGoreDuzenleBaslik">
                        <asp:Label ID="DepartmanaGoreDuzenleBaslikLabel" CssClass="DepartmanaGoreDuzenleBaslikLabel" runat="server" Text="Departmana Göre Düzenle"></asp:Label>
                    </div>
                    <div class="DepartmanaGoreDuzenleListBox">
                        <asp:ListBox ID="DepartmanaGoreDuzenleDepartmanListBox" CssClass="DepartmanaGoreDuzenleDepartmanListBox" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DepartmanaGoreDuzenleDepartmanListBox_Selected" DataSourceID="SqlDataSource30" DataTextField="Ad" DataValueField="id"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource30" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Departmanlar] ORDER BY [Ad]"></asp:SqlDataSource>
                    </div>
                    <div class="DepartmanaGoreDuzenleBaslik2">
                        <asp:Label ID="DepartmanaGoreDuzenleBaslikLabel2" CssClass="DepartmanaGoreDuzenleBaslikLabel2" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="DepartmanaGoreDuzenleTablo">
                        <asp:GridView ID="DepartmanaGoreDuzenleTablosu" CssClass="DepartmanaGoreDuzenleTablosu" runat="server" CellPadding="4" CellSpacing="2" BackColor="#507CD1" HorizontalAlign="Center" Width="684px" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource14" OnRowCancelingEdit="DepartmanaGoreDuzenleIptal_Click" OnRowDeleted="DepartmanaGoreDuzenleSil_Click" OnRowEditing="DepartmanaGoreDuzenleDuzenle_Click" OnRowUpdated="DepartmanaGoreDuzenleGuncellestir_Click">
                        <AlternatingRowStyle BackColor="White" Width="684px" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:ImageField DataImageUrlField="Resim" DataImageUrlFormatString="~\KisiResimleri\{0}" ControlStyle-Height="85px" ControlStyle-Width="63.5" HeaderText="Fotoğraf" SortExpression="Resim" >
                            <ControlStyle Height="85px" Width="63.5px"></ControlStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad"  ControlStyle-Width="100%">
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SicilNo" HeaderText="Sicil No" SortExpression="SicilNo" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" SortExpression="Aciklama" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IsTel" HeaderText="İş Tel" SortExpression="IsTel" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IsTel2" HeaderText="İş Tel2" SortExpression="IsTel2" ControlStyle-Width="100%" >
                            <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EvTel" HeaderText="Ev Tel" SortExpression="EvTel" ControlStyle-Width="100%">
                                <ControlStyle Width="100%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Departman" SortExpression="DepartmanID" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DepartmanaGoreDuzenleDepartmanSecimDropDownList" CssClass="DepartmanaGoreDuzenleDepartmanSecimDropDownList" SelectedValue = '<% # Bind ("DepartmanID")%>' runat="server" DataSourceID="SqlDataSource31" DataTextField="Ad" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource31" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Departmanlar] ORDER BY [Ad]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartmanID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pozisyon" SortExpression="PozisyonID" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DepartmanaGoreDuzenlePozisyonSecimDropDownList" CssClass="DepartmanaGoreDuzenlePozisyonSecimDropDownList" SelectedValue = '<% # Bind ("PozisyonID")%>' runat="server" DataSourceID="SqlDataSource32" DataTextField="Ad" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource32" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Pozisyonlar] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PozisyonID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Şirket" SortExpression="SirketID" ControlStyle-Width="100%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DepartmanaGoreDuzenleSirketSecimDropDownList" CssClass="DepartmanaGoreDuzenleSirketSecimDropDownList" SelectedValue = '<% # Bind ("SirketID")%>' runat="server" DataSourceID="SqlDataSource33" DataTextField="Ad" DataValueField="id"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource33" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [Ad], [id] FROM [Sirketler] ORDER BY [id]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SirketID") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="100%" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" DeleteCommand="DELETE FROM [Kayitlar] WHERE [id] = @id" InsertCommand="INSERT INTO [Kayitlar] ([Ad], [Soyad], [SicilNo], [Aciklama], [IsTel], [IsTel2], [EvTel], [DepartmanID], [PozisyonID], [SirketID], [Resim]) VALUES (@Ad, @Soyad, @SicilNo, @Aciklama, @IsTel, @IsTel2, @EvTel, @DepartmanID, @PozisyonID, @SirketID, @Resim)" SelectCommand="SELECT [Ad], [Soyad], [SicilNo], [Aciklama], [IsTel], [IsTel2], [EvTel], [DepartmanID], [PozisyonID], [SirketID], [Resim], [id] FROM [Kayitlar] WHERE ([DepartmanID] = @DepartmanID) ORDER BY [PozisyonID], [Ad], [Soyad]" UpdateCommand="UPDATE [Kayitlar] SET [Ad] = @Ad, [Soyad] = @Soyad, [SicilNo] = @SicilNo, [Aciklama] = @Aciklama, [IsTel] = @IsTel, [IsTel2] = @IsTel2, [EvTel] = @EvTel, [DepartmanID] = @DepartmanID, [PozisyonID] = @PozisyonID, [SirketID] = @SirketID, [Resim] = @Resim WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Ad" Type="String" />
                            <asp:Parameter Name="Soyad" Type="String" />
                            <asp:Parameter Name="SicilNo" Type="String" />
                            <asp:Parameter Name="Aciklama" Type="String" />
                            <asp:Parameter Name="IsTel" Type="String" />
                            <asp:Parameter Name="IsTel2" Type="String" />
                            <asp:Parameter Name="EvTel" Type="String" />
                            <asp:Parameter Name="DepartmanID" Type="Int32" />
                            <asp:Parameter Name="PozisyonID" Type="Int32" />
                            <asp:Parameter Name="SirketID" Type="Int32" />
                            <asp:Parameter Name="Resim" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:FormParameter FormField="DepartmanaGoreDuzenleDepartmanListBox" Name="DepartmanID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Ad" Type="String" />
                            <asp:Parameter Name="Soyad" Type="String" />
                            <asp:Parameter Name="SicilNo" Type="String" />
                            <asp:Parameter Name="Aciklama" Type="String" />
                            <asp:Parameter Name="IsTel" Type="String" />
                            <asp:Parameter Name="IsTel2" Type="String" />
                            <asp:Parameter Name="EvTel" Type="String" />
                            <asp:Parameter Name="DepartmanID" Type="Int32" />
                            <asp:Parameter Name="PozisyonID" Type="Int32" />
                            <asp:Parameter Name="SirketID" Type="Int32" />
                            <asp:Parameter Name="Resim" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </div>
                </asp:Panel>
            </div>
            <div class="DisaAktar">
                <asp:Panel ID="DisaAktarPaneli" runat="server">
                    <div class="DisaAktarBaslik">
                        <asp:Label ID="DisaAktarBaslikLabel" CssClass="DisaAktarBaslikLabel" runat="server" Text="Kayıtları Excel'e Aktar"></asp:Label>
                    </div>
                    <div class="DisaAktarButonu">
                        <asp:Button ID="DisaAktarButton" cssClass="DisaAktarButton" runat="server" Text="Dışa Aktar" OnClick="DisaAktarButton_Click"/>
                    </div>
                    <div class="DisaAktarTablosu">
                        <asp:GridView ID="DisaAktarGridView" CssClass="DisaAktarGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" BackColor="#507CD1" HorizontalAlign="Center" Width="684px" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource17" >
                            <AlternatingRowStyle BackColor="White" Width="684px" />
                            <Columns>
                                <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" ControlStyle-Width="100%" >
                                    <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SicilNo" HeaderText="SicilNo" SortExpression="SicilNo" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Aciklama" HeaderText="Aciklama" SortExpression="Aciklama" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IsTel" HeaderText="IsTel" SortExpression="IsTel" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IsTel2" HeaderText="IsTel2" SortExpression="IsTel2" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EvTel" HeaderText="EvTel" SortExpression="EvTel" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DepartmanID" HeaderText="DepartmanID" SortExpression="DepartmanID" ControlStyle-Width="100%" > 
                                    <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PozisyonID" HeaderText="PozisyonID" SortExpression="PozisyonID" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SirketID" HeaderText="SirketID" SortExpression="SirketID" ControlStyle-Width="100%" >
                                     <ControlStyle Width="100%" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT k.[Ad], k.[Soyad], k.[SicilNo], k.[Aciklama], k.[IsTel], k.[IsTel2], k.[EvTel], d.[Ad] as DepartmanID, p.[Ad] as PozisyonID, s.[Ad] as SirketID FROM [Kayitlar] k, [Departmanlar] d, Pozisyonlar p,Sirketler s WHERE k.DepartmanID = d.id AND k.PozisyonID = p.id AND k.SirketID = s.id ORDER BY k.[PozisyonID], k.[Ad], k.[Soyad]"></asp:SqlDataSource>
                    </div>
                </asp:Panel>
            </div>
            <asp:Panel ID="NotPaneli" runat="server">
            <div class="Not">Not: Bulunduğunuz bölgeden başka bir bölgedeki dahili numarayı aramak için dahili numaradan önce aşağıdaki tabloya göre o bölgenin kısa kodunu  çeviriniz.</div>
            </asp:Panel>
            <div class="BolgelerTablo">
                <asp:GridView ID="BolgelerTablosu" cssClass="BolgelerTablosu" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="KisaKod" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Bölge" HeaderText="Bölge" SortExpression="Bölge" />
                        <asp:BoundField DataField="KisaKod" HeaderText="Kısa Kod" InsertVisible="False" ReadOnly="True" SortExpression="KisaKod" />
                        <asp:BoundField DataField="Santral" HeaderText="Santral" SortExpression="Santral" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [KisaKod], [Bölge], [Santral] FROM [Bolgeler]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="Departmanlar">
            <div class="BolgelerListBoxDiv">
                <asp:ListBox ID="BolgelerListBox" CssClass="BolgelerListBox" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BolgelerListBox_SelectedIndexChanged" DataSourceID="SqlDataSource21" DataTextField="Bölge" DataValueField="id" AppendDataBoundItems="True">
                    <asp:ListItem Enabled="true" Selected="True" >Tüm Bölgeler</asp:ListItem>
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Bölge] FROM [Bolgeler] ORDER BY [KisaKod]"></asp:SqlDataSource>
            </div>
            <div class="SirketlerBaslik">
                <asp:Label ID="SirketlerBaslikLabel" CssClass="SirketlerBaslikLabel" runat="server" Text="Şirketler"></asp:Label>
            </div>
            <div class="SirketlerListBoxDiv">
                <asp:ListBox ID="SirketlerListBox" CssClass="SirketlerListBox" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SirketlerListBox_SelectedIndexChanged" DataSourceID="SqlDataSource22" DataTextField="Ad" DataValueField="id" AppendDataBoundItems="True">
                    <asp:ListItem Enabled="true" Selected="True">Tüm Şirketler</asp:ListItem>
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [Ad], [id] FROM [Sirketler] ORDER BY [id]"></asp:SqlDataSource>
            </div>
            <div class="DepartmanlarBaslik">
                <asp:Label ID="DepartmanlarBaslikLabel" CssClass="DepartmanlarBaslikLabel" runat="server" Text="Departmanlar"></asp:Label>
            </div>
            <div class="DepartmanlarListBoxDiv">
                <asp:ListBox ID="DepartmanlarListBox" cssClass="DepartmanlarListBox" runat="server" OnSelectedIndexChanged="DepartmanlarListBox_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Ad" DataValueField="id"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HemaEndustriFihristDatabaseConnectionString %>" SelectCommand="SELECT [id], [Ad] FROM [Departmanlar] ORDER BY [Ad]"></asp:SqlDataSource>
            </div>
        </div>
        <footer>
            <div class="Telif">
               Copyright ©  2017 Hema Endüstri Dahili Fihrist, tüm hakları saklıdır. | 
               <asp:LinkButton ID="YoneticiGirisButtonAnasayfa" CssClass="YoneticiGirisButtonAnasayfa" runat="server" OnClick="YoneticiGirisButtonAnasayfa_Click" >Yönetici Girişi</asp:LinkButton>
            </div>
        </footer>
    </div>
    </form>
</body>
</html>