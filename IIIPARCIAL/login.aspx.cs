﻿using IIIPARCIAL.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IIIPARCIAL
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bingresar_Click(object sender, EventArgs e)
        {

            clslogin.Usuario = Tusuario.Text;

            clslogin.Clave = Tcontraseña.Text; // 123

            ValidarUsuario(clslogin.Usuario, clslogin.Clave);

        }
        protected void ValidarUsuario(string usuario, string contrasena)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select ID, CLAVE, NOMBRE from USUARIOCONTRASEÑA where NOMBRE = '" + usuario + "' " +
                "and CLAVE = '" + contrasena + "'", conexion);
            SqlDataReader registro = comando.ExecuteReader();
            if (registro.Read())
            {
                clslogin.Usuario = registro[2].ToString();
                Response.Redirect("inicio.aspx");
            }
            else
            {
                Lmensaje.Text = " usuario o contraseña incorrecto";
                Tusuario.Text = "";
                Tcontraseña.Text = "";

            }
            conexion.Close();
        }
    }
}