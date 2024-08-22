<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="resultados.aspx.cs" Inherits="IIIPARCIAL.resultados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>      
       <h1 class="auto-style1">Resultado de votaciones</h1>
     <h3>En este aparto puede observar los resultados preliminares de la votación.</h3>
     <h3>Resultado de votaciones</h3>
 </div>

 <div>   
     <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
         <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
         <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
         <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
         <RowStyle BackColor="White" ForeColor="#003399" />
         <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
         <SortedAscendingCellStyle BackColor="#EDF6F6" />
         <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
         <SortedDescendingCellStyle BackColor="#D6DFDF" />
         <SortedDescendingHeaderStyle BackColor="#002876" />
     </asp:GridView>
 </div>
</asp:Content>
