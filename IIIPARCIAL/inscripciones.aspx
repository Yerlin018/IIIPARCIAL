<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="inscripciones.aspx.cs" Inherits="IIIPARCIAL.inscripciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div>      
             <h1 class="auto-style1">Inscripción de postulantes</h1>
             <h3 class="text-start"><em><span class="auto-style2">En este apartado usted puede postularse, no es necesario para la postulación ingresar su cédula ya que el sistema se lo genera de manera automática.</span></em></h3>
             <h3 class="text-start"> <em><span class="auto-style2">Si desea eliminar su postulación, solo ingrese la cédula, es suficiente para eliminar su postulación. </span></em> </h3>
             <h3 class="text-start"> <em><span class="auto-style2">Si desea modificar su postulación, debe ingresar la misma cédula que le asignó el sistema al postulante y llenar los demas espacios con la información que desea.</span></em></h3>


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
            <div>
    <div class="mb-3">
        <label class="form-label">Cedula  </label>
        <asp:TextBox class="form-control" ID="tcedula" AutoComplete type="int" runat="server"></asp:TextBox>
    </div>

    <br />
    <div class="mb-3">
        <label class="form-label">Nombre  </label>
        <asp:TextBox class="form-control" ID="tnombre" runat="server"></asp:TextBox>
    </div>
    <br />
    <div class="mb-3">
        <label class="form-label">Apellido  </label>
        <asp:TextBox class="form-control" ID="tapellido" runat="server"></asp:TextBox>
    </div>
    <br />

    <div class="mb-3">
        <label class="form-label">Telefono  </label>
        <asp:TextBox class="form-control" ID="ttelefono" runat="server"></asp:TextBox>
    </div>
    <br />

<div class="mb-3">
       <label class="form-label">Edad&nbsp;&nbsp;  </label>
       <asp:TextBox class="form-control" ID="tedad" type="int" runat="server"></asp:TextBox>
</div>
    <br />

    <div class="mb-3">
        <label class="form-label">Partido&nbsp;  </label>
        <asp:TextBox class="form-control" ID="tpartido" runat="server"></asp:TextBox>
        <br />
    </div>
    <div class="mb-3">
        <label class="form-label">
        <br />
        Estado </label>
        <asp:TextBox class="form-control" ID="testado" runat="server"></asp:TextBox>
    </div>
    <br />
     <div>
       <br />
            
    </div>
         <asp:Button ID="Binscribir" class="btn btn-outline-primary" runat="server" Text="Inscribir" OnClick="Binscribir_Click"/>
          <asp:Button ID="Beliminar" class="btn btn-outline-danger" runat="server" Text="Eliminar" OnClick="Beliminar_Click"/>
          <asp:Button ID="Bactualizar" class="btn btn-outline-primary" runat="server" Text="Modificar" OnClick="Bactualizar_Click" />
     </div>
</asp:Content>
