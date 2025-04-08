<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/menu.jspf"%>  
 <form method="post">
     <label><h1>Visualize a sequência de Fibonacci até o índice desejado</h1></label>
     <input type="number" name="fibonacciLim" required><br><br>

        <input type="submit" value="Verificar">
</form>

<%
   String fibonacciLimStr = request.getParameter("fibonacciLim");
   int fibonacciLim = 0;
   
    if (request.getParameter("fibonacciLim") != null){
        try{
            fibonacciLim = Integer.parseInt(fibonacciLimStr);
        }
        catch(NumberFormatException e){
            out.println("<h1> " + e + "</h1>");
        }
        
        int primeiroValor = 0, segundoValor = 1, proximo; 
        
        for (int i = 0; i <= fibonacciLim; i++){
            if(i <= 1){
               proximo = i;
            }
            else {
                proximo = primeiroValor + segundoValor;
                primeiroValor = segundoValor;
                segundoValor = proximo;  
            }
            out.println("<h3>" + proximo + "</h3>");
        }
        
        
       
     
       }
            
%>
