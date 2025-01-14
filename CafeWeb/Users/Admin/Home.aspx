﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CafeWebAdmin.WebForm1" %>

<!DOCTYPE html lang="tr">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Ana Sayfa</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <link rel="stylesheet" type="text/css" href="../assets/font/iconsmind-s/css/iconsminds.css" />
    <link rel="stylesheet" type="text/css" href="../assets/font/simple-line-icons/css/simple-line-icons.css" />

    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/bootstrap.rtl.only.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/fullcalendar.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/datatables.responsive.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/perfect-scrollbar.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/glide.core.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/bootstrap-stars.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/nouislider.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/vendor/component-custom-switch.min.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/main.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&display=swap');

        .card:active {
            box-shadow: rgba(0, 0, 0, 0.06) 0px 2px 4px 0px inset;
        }
    </style>
</head>

<body id="app-container" class="menu-default show-spinner">
    <form id="form2" runat="server">
       <div>
        <nav class="navbar fixed-top">
        <div class="d-flex align-items-center navbar-left">
            <a href="javascript:void(0);" class="menu-button d-none d-md-block">
                <svg class="main" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 9 17">
                    <rect x="0.48" y="0.5" width="7" height="1" />
                    <rect x="0.48" y="7.5" width="7" height="1" />
                    <rect x="0.48" y="15.5" width="7" height="1" />
                </svg>
                <svg class="sub" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 17">
                    <rect x="1.56" y="0.5" width="16" height="1" />
                    <rect x="1.56" y="7.5" width="16" height="1" />
                    <rect x="1.56" y="15.5" width="16" height="1" />
                </svg>
            </a>

            <a href="javascript:void(0);" class="menu-button-mobile d-xs-block d-sm-block d-md-none">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26 17">
                    <rect x="0.5" y="0.5" width="25" height="1" />
                    <rect x="0.5" y="7.5" width="25" height="1" />
                    <rect x="0.5" y="15.5" width="25" height="1" />
                </svg>
            </a>

            <div class="search" data-search-path="Home.aspx?q=">
                <input placeholder="Search...">
                <span class="search-icon">
                    <i class="simple-icon-magnifier"></i>
                </span>
            </div>
        </div>


        <a class="navbar-logo" href="<%#: GetRouteUrl("Admin") %>" style="text-align: center;">
            <span class="logo d-none d-xs-block"></span><span style="font-size: large; font-weight: bold; font-family: 'Cookie', cursive;">CafeWeb</span>
            <span class="logo-mobile d-block d-xs-none"></span>
        </a>

        <div class="navbar-right">
            <div class="header-icons d-inline-block align-middle">
                <div class="d-none d-md-inline-block align-text-bottom mr-3">
                    <div class="custom-switch custom-switch-primary-inverse custom-switch-small pl-1" 
                        data-toggle="tooltip" data-placement="left" title="Dark Mode">
                        <input class="custom-switch-input" id="switchDark" type="checkbox" checked>
                        <label class="custom-switch-btn" for="switchDark"></label>
                    </div>
                </div>

                <button class="header-icon btn btn-empty d-none d-sm-inline-block" type="button" id="fullScreenButton">
                    <i class="simple-icon-size-fullscreen"></i>
                    <i class="simple-icon-size-actual"></i>
                </button>

            </div>

            <div class="user d-inline-block">
                <button class="btn btn-empty p-0" type="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <span class="name"><%: UserName %></span>
                    <span>
                        <img alt="Profile Picture" src="../Users/assets/img/profiles/accountLogo.svg" />
                    </span>
                </button>

                <div class="dropdown-menu dropdown-menu-right mt-3">
                    <a href="javascript:void(0);" id="SignOut" runat="server" onserverclick="SignOut_ServerClick" class="dropdown-item">Çıkış yap</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="menu">
        <div class="main-menu">
            <div class="scroll">
                <ul class="list-unstyled">
                    <li class="active">
                        <a href="javascript:void(0);">
                            <i class="iconsminds-digital-drawing"></i> Ana Sayfa
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!--MAIN-->
    <main>
        <div id="app" class="container-fluid">
            <div  id="bgBlur" v-if="orgPop || persPop" @click="orgPop=false; persPop=false;"></div>
            <div class="row text-center">
                <div class="col-12">
                    <h1 v-if="!showOrg && !showPers && !showMenus && !showFinancial">Admin Paneli</h1>
                    <h1 v-if="showOrg">İşletme İşlemleri </h1>
                    <h1 v-if="showPers">Personel İşlemleri</h1>
                    <h1 v-if="showMenus">Menü ve Envanter İşlemleri</h1>
                    <h1 v-if="showFinancial">Bilanço İşlemleri</h1>
                    <div class="separator mb-5"></div>
                    <button class="w3-button w3-large w3-circle w3-light-grey" v-if="(showOrg || showPers || showMenus || showFinancial) && (!orgPop && !persPop)" style="margin-bottom:30px;" 
                        @click="setFirstState(); preventPostBack();">‹</button>
                </div>
            </div>

            <div class=row v-if="showOrg || showPers" style="gap: 30px; margin-bottom: 30px; justify-content:center; align-content:center;">
                <button id="saveBtn" @focus="focusBtn('saveBtn'); save=true; edit=false; waiting=false;"  type="button" class="btn btn-primary">Kaydet</button>
                <button id="editBtn" @focus="focusBtn('editBtn'); edit=true; save=false; waiting=false;"  type="button" class="btn btn-light">Düzenle</button>
                <button v-show="!showOrg && !showMenus && !showFinancial && showPers" id="waitingBtn" @focus="focusBtn('waitingBtn'); edit=false; save=false; waiting=true;"  type="button" class="btn btn-light">Bekleyenler</button>
            </div>
            
            <!--İşlem Blokları-->
            <div class="row" style="justify-content:center;"> 

               <!--İşletme Kayıt-->
                <div class="col-12 col-lg-6 mb-5" v-if="showOrg && save">
                    <h5 class="mb-5">İşletme Kayıt Formu</h5>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-4">İşletme Bilgileri</h5>
                            <div class="needs-validation tooltip-label-right">
                                <div class="form-group position-relative error-l-50">
                                    <label for="OrgName">Ad</label>
                                    <input type="text" runat="server" id="OrgName" name="OrgName" class="form-control">
                                    <div class="invalid-tooltip">
                                        Ad gerekli!
                                    </div>
                                </div>
                                <div class="form-group position-relative">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" runat="server" class="custom-control-input" id="OrgisActive" name="OrgisActive">
                                        <label class="custom-control-label" for="OrgisActive">Aktif mi?</label>
                                    </div>
                                </div>
                                    <button type="button" class="btn btn-primary mb-0" @click="isPop=true;">Kaydet</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--İşletme Düzenleme-->
                <div v-show="(showOrg && edit) && (!orgPop && !persPop)">
                    <h5 class="mb-5">İşletme Listesi</h5>
                    <asp:GridView runat="server" ID="OrgView"
                        ItemType="Database.Org" DataKeyNames="Id" AllowPaging="true"
                        SelectMethod="OrgView_GetData" CssClass="styled-table" OnRowDataBound="OrgView_RowDataBound"
                        AutoGenerateColumns="false" EmptyDataText="Gösterilecek herhangi bir veri yok.">
                        <Columns>
                            <asp:DynamicField DataField="Id" />
                            <asp:TemplateField HeaderText="İşletme Adı">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.OrgName.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aktif mi?">
                                <ItemTemplate>
                                <asp:Label Text='<%# Item.isActive == true ? "Evet": "Hayır" %>' 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Oluşturulma Tarihi">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.CreatedAt.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Değiştirilme Tarihi">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.ChangedAt.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Güncelle">
                                <ItemTemplate>
                                    <div @click="orgPop=true;" role="button">
                                        <a id="updateOrg" href="javascript:void(0);" onclick="GetOrgRow(this);">Güncelle</a>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sil">
                                <ItemTemplate>
                                <div @click="isPop=true; del=true;">
                                    <a href="javascript:void(0);" onclick="GetRowForDel('Org', this);">Sil</a>
                                </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>


                <!--İşletme Güncelleme Popup-->
                <div id="OrgUpdatePop" class="col-12 col-lg-6 mb-5" v-if="showOrg && edit && orgPop">
                    <button class="closeBtn" @click="orgPop=false" style="float:right;">X</button>
                    <h5 class="mb-5">İşletme Güncelleme</h5>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-4">İşletme</h5>
                            <div class="needs-validation tooltip-label-right">
                                <div class="form-group position-relative error-l-50">
                                    <label for="OrgUpdateId">Id</label>
                                    <input type="text" id="OrgUpdateId" name="OrgUpdateId" runat="server" class="form-control">
                                </div>
                                <div class="form-group position-relative error-l-50">
                                    <label for="OrgUpdateName">Ad</label>
                                    <input type="text" id="OrgUpdateName" name="OrgUpdateName" runat="server" class="form-control">
                                    <div class="invalid-tooltip">
                                        Ad gerekli!
                                    </div>
                                </div>
                                <div class="form-group position-relative">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" id="OrgUpdateActive" name="OrgUpdateActive" class="custom-control-input" runat="server">
                                        <label class="custom-control-label" for="OrgUpdateActive">Aktif mi?</label>
                                    </div>
                                </div>
                                    <button type="button" class="btn btn-primary mb-0" @click="isPop=true">Güncelle</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Personel Kayıt-->
                <div class="col-12 col-lg-6" v-if="(showPers && save) && (!edit && !waiting)">
                    <h5 class="mb-5">Personel Kayıt Formu</h5>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-4">İlgili Bilgiler</h5>
                            <div id="rulesForm" class="tooltip-label-right">
                                <div class="form-group position-relative error-l-50">
                                    <label for="UserOrgId">Organizasyon Id</label>
                                    <input id="UserOrgId" type="text" runat="server" class="form-control" name="UserOrgId">
                                    <small class="form-text text-muted">Sadece 6 adet rakamdan oluşmalıdır!</small>
                                </div>
                                <div class="form-group position-relative error-l-50">
                                    <label for="UserSetName">Ad</label>
                                    <input id="UserSetName" type="text" runat="server" class="form-control" name="UserSetName">
                                    <small class="form-text text-muted">Sadece karakter içermelidir!</small>
                                </div>
                                <div class="form-group position-relative">
                                    <label for="UserYetki" style="display:block;">Yetkilendirme</label>
                                    <select id="UserYetki" name="UserYetki" class="selectYetki" runat="server">

                                        <option value=''></option>

                                        <option value='2'>Yetkili</option>

                                        <option selected="selected" value='3'>Personel</option>

                                        </select>
                                    
                                    <div class="invalid-tooltip">
                                        Yetki girişi gerekli!
                                    </div>
                                </div>
                                <div class="form-group position-relative">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" runat="server" class="custom-control-input" id="UserisActive" name="UserisActive">
                                        <label class="custom-control-label" for="UserisActive">Aktif mi?</label>
                                    </div>
                                </div>
                                <div class="form-group position-relative error-l-75">
                                    <label for="UserSetPassword">Şifre</label>
                                    <input type="password" class="form-control" runat="server" name="UserSetPassword" id="UserSetPassword">
                                    <small class="form-text text-muted">En az 8 karakter olmalıdır!</small>
                                </div>
                                <div class="form-group position-relative error-l-125">
                                    <label for="UserSetPassConfirm">Şifre tekrar</label>
                                    <input type="password" class="form-control" runat="server" name="UserSetPassConfirm" id="UserSetPassConfirm">
                                    <small class="form-text text-muted">Şifreyle aynı olmalıdır!</small>
                                </div>
                                <button type="button" class="btn btn-primary mb-0" @click="userFormCheck">Kaydet</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Personel Düzenleme-->
                <div v-show="((showPers && edit) && (!save && !waiting)) && (!orgPop && !persPop)">
                    <h5 class="mb-5">Personel Listesi</h5>
                    <asp:GridView runat="server" ID="UserView"
                        ItemType="Database.User" DataKeyNames="Id" AllowPaging="true"
                        SelectMethod="UserView_GetData" CssClass="styled-table" OnRowDataBound="UserView_RowDataBound"
                        AutoGenerateColumns="false" EmptyDataText="Gösterilecek herhangi bir veri yok.">
                        <Columns>
                            <asp:DynamicField DataField="Id" />
                            <asp:TemplateField HeaderText="Kullanıcı Adı">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.UserName.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Yetki">
                                <ItemTemplate>
                                <asp:Label ID="authLabel" Text='<%# Item.Auth == 2 ? "Yetkili" : "Personel" %>' 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Oluşturulma Tarihi">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.CreatedAt.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Değiştirilme Tarihi">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.ChangedAt.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aktif mi?">
                                <ItemTemplate>
                                <asp:Label Text='<%# Item.isActive == true ? "Evet": "Hayır" %>' 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organizasyon Id">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.OrgFk.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Güncelle">
                                <ItemTemplate>
                                <div @click="persPop=true;" role="button">
                                     <a id="updatePers" href="javascript:void(0);" onclick="GetPersRow(this);">Güncelle</a>
                                </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sil">
                                <ItemTemplate>
                                <div @click="isPop=true; del=true;">
                                    <a href="javascript:void(0);" onclick="GetRowForDel('User', this);">Sil</a>
                                </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <!--Personel Güncelleme Popup-->
                <div id="PersUpdatePop" class="col-12 col-lg-6 mb-5" v-if="showPers && edit && persPop">
                    <button class="closeBtn" @click="persPop=false" style="float:right;">X</button>
                    <h5 class="mb-5">Personel Güncelleme</h5>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-4">Personel</h5>
                            <div class="tooltip-label-right">
                                <div class="form-group position-relative error-l-50">
                                    <label for="PersUpdateId">Id</label>
                                    <input type="text" id="PersUpdateId" name="PersUpdateId" runat="server" class="form-control"/>
                                </div>
                                <div class="form-group position-relative error-l-50">
                                    <label for="PersUpdateOrgId">Organizasyon Id</label>
                                    <input id="PersUpdateOrgId" type="text" runat="server" class="form-control" name="PersUpdateOrgId">
                                    <small class="form-text text-muted">Sadece 6 adet rakamdan oluşmalıdır!</small>
                                </div>
                                <div class="form-group position-relative error-l-50">
                                    <label for="PersUpdateName">Ad</label>
                                    <input id="PersUpdateName" type="text" runat="server" class="form-control" name="PersUpdateName">
                                    <small class="form-text text-muted">Sadece karakter içermelidir!</small>
                                </div>
                                <div class="form-group position-relative">
                                    <label for="PersUpdateYetki" style="display:block;">Yetkilendirme</label>
                                    <select id="PersUpdateYetki" name="PersUpdateYetki" class="selectYetki" runat="server">

                                        <option value=''></option>

                                        <option value='2'>Yetkili</option>

                                        <option selected="selected" value='3'>Personel</option>

                                        </select>
                                    
                                    <div class="invalid-tooltip">
                                        Yetki girişi gerekli!
                                    </div>
                                </div>
                                <div class="form-group position-relative">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" runat="server" class="custom-control-input" id="PersUpdateActive" name="PersUpdateActive">
                                        <label class="custom-control-label" for="PersUpdateActive">Aktif mi?</label>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-primary mb-0" @click="persFormCheck">Güncelle</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Bekleyen Personeller-->
                <div v-show="(showPers && waiting) && (!orgPop && !persPop) && ((!save && !edit) && waiting)">
                    <h5 class="mb-5">Onay Bekleyenler</h5>
                    <asp:GridView runat="server" ID="WaitingUserView"
                        ItemType="Database.WaitingUser" DataKeyNames="Id" AllowPaging="true"
                        SelectMethod="WaitingUserView_GetData" CssClass="styled-table" OnRowDataBound="WaitingUserView_RowDataBound"
                        AutoGenerateColumns="false" EmptyDataText="Gösterilecek herhangi bir veri yok.">
                        <Columns>
                            <asp:DynamicField DataField="Id" />
                            <asp:TemplateField HeaderText="Kullanıcı Adı">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.UserName.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Yetki">
                                <ItemTemplate>
                                <asp:Label ID="authLabel" Text='<%# Item.Auth == 2 ? "Yetkili" : "Personel" %>' 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Oluşturulma Tarihi">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.CreatedAt.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Değiştirilme Tarihi">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.ChangedAt.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aktif mi?">
                                <ItemTemplate>
                                <asp:Label Text='<%# Item.isActive == true ? "Evet": "Hayır" %>' 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Organizasyon Id">
                                <ItemTemplate>
                                <asp:Label Text="<%# Item.OrgFk.ToString() %>" 
                                    runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Onayla">
                                <ItemTemplate>
                                <div @click="isPop=true;" role="button">
                                     <a id="updatePers" href="javascript:void(0);" onclick="GetWaitingRow(this);">Onayla</a>
                                </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sil">
                                <ItemTemplate>
                                <div @click="isPop=true; del=true;">
                                    <a href="javascript:void(0);" onclick="GetRowForDel('User', this);">Sil</a>
                                </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <!--Bilanço İşlemleri-->
                <div class="col-12 col-lg-6" v-if="showFinancial && save">

                </div>

                <!--Menu ve Envanter İşlemleri-->
                <div class="col-12 col-lg-6" v-if="showMenus && save">
                    
                </div>

                 <!--Onay Popup-->
                <div class="cd-popup" role="alert" v-if="isPop">
	                <div class="cd-popup-container">
		                <p v-if="((showOrg && !orgPop) || (showPers && !persPop)) && (!del && !waiting)">Kaydetmek istediğinize emin misiniz?</p>
                        <p v-if="((showOrg && orgPop) || (showPers && persPop)) && (!del && !waiting)">Güncellemek istediğinize emin misiniz?</p>
                        <p v-if="(!persPop && !orgPop) && del">Silmek istediğinize emin misiniz?</p>
                        <p v-if="((!persPop && !orgPop) && (!showOrg && showPers) && ((!edit && !del) && waiting)) ">Onaylamak istediğinize emin misiniz?</p>
		                <ul class="cd-buttons">
                            <li role="button" @click="isPostBack=true; setState();">
                                <a id="SaveOrgBtn" v-if="(showOrg && !orgPop) && (!del && !waiting)" role="button" href="javascript:void(0);" runat="server" onserverclick="SaveOrg_ServerClick">Evet</a>
                                <a id="OrgUpdateBtn" v-if="(showOrg && orgPop) && (!del && !waiting)" role="button" href="javascript:void(0);" runat="server" onserverclick="OrgUpdateBtn_ServerClick">Evet</a>
                                <a id="SaveUserBtn" v-if="(showPers && !persPop) && (!del && !waiting)" role="button" href="javascript:void(0);" runat="server" onserverclick="SaveUser_ServerClick">Evet</a>
                                <a id="PersUpdateBtn" v-if="(showPers && persPop) && (!del && !waiting)" role="button" href="javascript:void(0);" runat="server" onserverclick="PersUpdateBtn_ServerClick">Evet</a>
                                <a id="DelBtn" v-if="(!orgPop && !persPop) && (edit && del) && !waiting" role="button" href="javascript:void(0);" runat="server" onserverclick="DelBtn_ServerClick">Evet</a>
                                <a id="OnayWaitingBtn" v-if="((!persPop && !orgPop) && (!showOrg && showPers) && ((!edit && !del) && waiting))" role="button" href="javascript:void(0);" runat="server" onserverclick="OnayWaitingBtn_ServerClick">Evet</a>
                                <a id="DelWaitingBtn" v-if="(!orgPop && !persPop) && (del && waiting)" role="button" href="javascript:void(0);" runat="server" onserverclick="DelWaitingBtn_ServerClick">Evet</a>
                            </li>
			                <li><a href="javascript:void(0);" @click="isPop=false; del=false; clearResultEl();">Hayır</a></li>
		                </ul>
		                <a href="javascript:void(0);" @click="isPop=false; del=false; clearResultEl();" class="cd-popup-close img-replace"></a>
	                </div> <!-- cd-popup-container -->
                </div> <!-- cd-popup -->

                <!-- Menu İşlemleri -->
                <div>

                </div>

                <!--Admin İşlem Butonları-->
                <div id="adminIsl" class="container-fluid icon-cards-row row text-center" v-if="!showOrg && !showPers && !showMenus && !showFinancial">
                    <div class="card col-4" role="button" @click="showOrg=true;">
                        <a>
                            <i class="simple-icon-home"></i>
                        </a>
                        <p class="card-text mb-2">İşletme Yönetimi</p>
                        <p class="lead"><%=OrgView_GetData().Count() %></p>
                    </div>
                    <div class="card col-4" role="button" @click="showPers=true;">
                        <a>
                            <i class="simple-icon-people"></i>
                        </a>
                        <p class="card-text mb-2">Personel Yönetimi</p>
                        <p class="lead"><%=UserView_GetData().Count() %></p>
                    </div>
                    <div class="card col-4" role="button" @click="showMenus=true;">
                        <a href="javascript:void(0);">
                            <i class="simple-icon-basket-loaded"></i>
                        </a>
                        <p class="card-text mb-2">Envanter Yönetimi</p>
                        <p class="lead">-</p>
                    </div>
                    <div class="card col-4" role="button" @click="showFinancial=true;">
                        <a href="javascript:void(0);">
                            <i class="simple-icon-credit-card"></i>
                        </a>
                        <p class="card-text mb-2">Bilanço Yönetimi</p>
                        <p class="lead">-</p>
                    </div>
                 </div>
               </div>
            </div>

        <p id="resultEl" style="display:none;" runat="server"></p>
        <asp:HiddenField id="aspHidden" runat="server"/>
        </main>
    </div>
  </form>
    
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/Chart.bundle.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/chartjs-plugin-datalabels.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/moment.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/fullcalendar.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/datatables.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/perfect-scrollbar.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/progressbar.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/select2.full.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/nouislider.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/Sortable.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/mousetrap.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/vendor/glide.min.js"></script>
    <script type="text/javascript" src="../Users/assets/js/dore.script.js"></script>
    <script type="text/javascript" src="../Users/assets/js/scripts.js"></script>
    <script type="text/javascript" src="../Users/assets/js/main.js"></script>

</body>
</html>
