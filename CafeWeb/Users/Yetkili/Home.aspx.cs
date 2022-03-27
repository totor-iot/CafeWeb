﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebClasses;

namespace CafeWebYetkili
{
    public partial class HomePage : System.Web.UI.Page
    {
        public string uname, auth, panelName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (MySession.Current.Auth != "2")
            {
                Yonlendir();
            }

            if (Request.Cookies["Auth"] != null)
            {
                MySession.Current.OrgFk = Request.Cookies["OrgFk"].Value;
                MySession.Current.UserName = Request.Cookies["UserName"].Value;
                MySession.Current.Auth = Request.Cookies["Auth"].Value;

                if (MySession.Current.Auth != "2")
                {
                    Yonlendir();
                }
            }

            uname = MySession.Current.UserName;
            uname = CryptPass.FirstLetterToUpper(uname);
        }

        protected void SignOut1_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            HttpContext.Current.Response.Cookies.Clear();
            Response.Cookies["OrgFk"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["Auth"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("~/Login.aspx", true);
        }
        protected void PersYon_ServerClick(object sender, EventArgs e)
        {
            PersYon.Visible = false;
        }

        protected void Yonlendir()
        {
            if (MySession.Current.Auth == "1")
            {
                Response.Redirect("~/Users/Admin/Home.aspx", true);
            }
            else if (MySession.Current.Auth == "3")
            {
                Response.Redirect("~/Users/Personel/Home.aspx", true);
            }
            Session.Clear();
            Response.Redirect("~/Login.aspx", true);
        }
    }
}