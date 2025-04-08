<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/menu.jspf"%>
 <form method="post">
     <label><h1>Verifique se um número é primo</h1></label>
     <input type="number" name="numeroPrimo" required><br><br>

        <input type="submit" value="Verificar">
</form>

<%
   String numeroPrimoStr = request.getParameter("numeroPrimo");
   int numeroPrimo = 0;
   
   if (request.getParameter("numeroPrimo") != null){
        try{
            numeroPrimo = Integer.parseInt(numeroPrimoStr);
        }
        catch(NumberFormatException e){
            out.println("<h1> " + e + "</h1>");
        }
        
        int contDivisores = 0;
        
        if (numeroPrimo > 0){
        
              for(int i = 1; i <= numeroPrimo; i++){  
                    if(numeroPrimo % i == 0){
                        contDivisores++;
                    }
               }
               
                if(contDivisores == 2){
                   out.println("<h1>O número é primo</h1>");
                }
                else {
                   out.println("<h1>O número não é primo</h1>");
                   out.println("<h2>Lista de divisores: <h2>"); 
                   for(int i = 1; i < numeroPrimo; i++){
                        if(numeroPrimo % i == 0 && (i != 1 && i % i == 0)){
                            out.println("<h3>" + i + "</h3>");
                        }
                   }
                }   
            }
        }
            
%>
