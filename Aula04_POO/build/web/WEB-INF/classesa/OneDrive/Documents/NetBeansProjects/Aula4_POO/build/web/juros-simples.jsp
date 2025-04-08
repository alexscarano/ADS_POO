<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>

<style>
   div {
    background-color: #f8f9fa;
    padding: 10px;
    display: flex;
    gap: 10px;
    border-radius: 5px;
    justify-content: center;
    align-items: center;
} 

div a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    padding: 8px 12px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

div a:hover {
    background-color: #007bff;
    color: white;
}

form {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    margin: 20px auto;
    display: flex;
    flex-direction: column;
}

label {
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"], input[type="number"] {
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

h3 {
    text-align: center;
    margin-top: 20px;
    color: #333;
}

p {
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    color: #007bff;
}
</style>

<title>Juros Simples</title>

<%@include file="WEB-INF/jspf/menu.jspf"%>
 <form method="post">
        <label>Montante Inicial:</label>
        <input type="text" name="montante" required><br><br>

        <label>Taxa de Juros (% ao mês):</label>
        <input type="text" name="taxa" required><br><br>

        <label>Quantidade de Meses:</label>
        <input type="number" name="meses" required><br><br>

        <input type="submit" value="Calcular">
</form>


<%-- Processamento do cálculo --%>

<%  
        DecimalFormat df = new DecimalFormat("#.##");
        float resultado = 0;
        String montanteStr = request.getParameter("montante");
        String taxaStr = request.getParameter("taxa");
        String mesesStr = request.getParameter("meses");
        
        if (montanteStr != null && taxaStr != null && mesesStr != null &&
            !montanteStr.trim().isEmpty() && !taxaStr.trim().isEmpty() && !mesesStr.trim().isEmpty()){
            
            try{
                float montante = Float.parseFloat(montanteStr);
                float taxa = Float.parseFloat(taxaStr) / 100;
                int meses = Integer.parseInt(mesesStr);
                resultado =  montante * (1 + taxa * meses);
            }
            catch(NumberFormatException e){
                out.println("<p style='color:red;'>Erro: Certifique-se de inserir números válidos.</p>");
            }
            
        }
       
%>

<h3>Resultado:</h3>
<p>Valor Futuro: <%= df.format(resultado) %></p>

