<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/menu.jspf"%>
 <form method="post">
     <label><h1>Visualize a soma de todos os numeros até o número informado</h1></label>
     <input type="number" name="somaLim" required><br><br>

        <input type="submit" value="Verificar">
</form>

<%
   String somaLimStr = request.getParameter("somaLim");
   int somaLim = 0;
   
    if (request.getParameter("somaLim") != null){
        try{
           somaLim = Integer.parseInt(somaLimStr);
        }
        catch(NumberFormatException e){
            out.println("<h1> " + e + "</h1>");
        }
        
        int somaTot = 0;
        
        for(int i = 1; i <= somaLim; i++){
            somaTot += i;
        }
        out.println("<h3>" + somaTot + "</h3>");
        
    }
                
%>
