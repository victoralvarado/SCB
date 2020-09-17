/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
// Función para cambiar el action del formulario.
    $("#db").change(function () {
        var selected = $(this).children(":selected").text();
        switch (selected) {
            case "Categoria":
                $("#myform").attr('action', 'reporteHerramientaCate.jsp');
                break;
            case "Nuevas":
                $("#myform").attr('action', 'reporteHerramientasNu.jsp');
                break;
            case "En Uso":
                $("#myform").attr('action', 'reporteHerramientaUso.jsp');
                break;
            case "Herramientas Disponibles":
                $("#myform").attr('action', 'reporteHerramientaDis.jsp');
                break;
            case "Reporte Herramientas Prestadas por Persona":
                $("#myform").attr('action', 'reporteHerramientaPP.jsp');
                break;
                case "Reporte Herramientas Defectuosas":
                $("#myform").attr('action', 'reporteHerramientasDef.jsp');
                break;
            default:
                $("#myform").attr('action', '');
        }
    });
// Función para el botón Atrás
    $(".back").click(function () {
        parent.history.back();
        return false;
    });
});
