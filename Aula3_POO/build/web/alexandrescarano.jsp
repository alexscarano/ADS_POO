<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.DateFormatSymbols"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendario JSP</title>
    </head>
    <style>
        /* CSS do calendário */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        table {
            width: 60%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #3366ff;
            color: white;
        }

        th {
            padding: 10px;
            text-align: center;
            font-size: 1.2em;
        }

        tbody {
            background-color: #fff;
        }

        td {
            width: 14%;
            height: 50px;
            text-align: center;
            vertical-align: middle;
            font-size: 1.1em;
            border: 1px solid #ddd;
            cursor: pointer;
        }

        td:nth-child(7), td:nth-child(1) {
            color: #e74c3c; /* Cor para o sábado e domingo */
        }

        td:hover {
            background-color: #f1f1f1;
            transition: background-color 0.3s;
        }

        td:empty {
            background-color: #f9f9f9;
        }

        table {
            border-radius: 10px;
            overflow: hidden;
        }

        /* CSS para o formulário */
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px auto;
        }

        label {
            font-size: 1em;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        input[type="number"], input[type="submit"], input[type="reset"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box;
        }

        input[type="submit"], input[type="reset"] {
            width: 48%;
            margin-right: 4%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }

        input[type="reset"] {
            background-color: #f44336;
            color: white;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #45a049;
        }
    </style>
    <body>        
        <form method="post">
            <label for="ano">Ano: </label>
            <input type="number" id="ano" name="ano"><br><br>
            <label for="mes">Mês: </label>
            <input type="number" id="mes" name="mes"><br><br>
            <input type="submit" value="Consultar">
            <input type="reset" value="Resetar">
        </form>
        
        
    <%
            
       Calendar calendario = Calendar.getInstance();
       int mesCalc = 0, anoCalc = 0;
       
       if (request.getParameter("ano") != null && request.getParameter("mes") != null){
           try {
           // Tenta capturar as requests, e tratar elas
           String anoString = request.getParameter("ano");
           String mesString = request.getParameter("mes");
           
            if (anoString == null || mesString == null) {
              throw new IllegalArgumentException("Os parâmetros 'ano' e 'mes' são obrigatórios.");
            }
           mesCalc = Integer.parseInt(mesString) - 1;
           anoCalc = Integer.parseInt(anoString);
         }
         catch(NumberFormatException e){
           out.println("<h1> Erro: Os números não foram tratados corretamente  </h1>");
         }
         catch(IllegalArgumentException e) {
           out.println("<h1> Erro:"  + e.getMessage() + "</h1>");
         }
         catch(Exception e){
           out.println("<h1> Erro:"  + e.getMessage() + "</h1>");
         }
       
        }
       
        if (mesCalc > 0 && anoCalc >= 0){     
                
            calendario.set(Calendar.MONTH, mesCalc);
            calendario.set(Calendar.YEAR, anoCalc);

            calendario.set(Calendar.DAY_OF_MONTH, 1);
            int primeiroDiaMes = calendario.get(Calendar.DAY_OF_WEEK);
            int ultimoDiaMes = calendario.getActualMaximum(Calendar.DAY_OF_MONTH);

            String[] diasSemana = new DateFormatSymbols().getShortWeekdays();
            
            String[] mesesPortugues = {
            "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
            "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
            };
            
            String[] diasPortugues = {
            "", "Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", 
            "Quinta-feira", "Sexta-feira", "Sábado"
            };
            
            out.println("<br>");
            out.println("<h2>  Calendário de " + mesesPortugues[mesCalc] + " do ano de " + anoCalc  + "</h2>");
            out.println("<table>");
            out.println("<thead><tr>"); 
            
            // Criando table header com os nomes dos meses
            for(int i = 1; i < diasSemana.length; i++){
                out.println("<th>" + diasPortugues[i] + "</th>");
            }
            
            out.println("</tr></thead>");
            out.println("<tbody><tr>");
            
            // Criando a table data vazia para posteriormente popular ela com os dias da semana
            for (int col = 1; col < primeiroDiaMes; col++){
                if(primeiroDiaMes != Calendar.SUNDAY){
                   out.println("<td></td>");
                } 
                
            }

            for(int dia = 1; dia <= ultimoDiaMes; dia++){
                 out.println("<td>" + dia + "</td>");
                 calendario.set(Calendar.DAY_OF_MONTH, dia);

                 int diaSemana = calendario.get(Calendar.DAY_OF_WEEK);

                 if(diaSemana == Calendar.SATURDAY){
                     out.println("</tr><tr>");
                 }

            }
            
            // Ele irá capturar o último dia da semana por causa do loop anterior
            int ultimoDiaSemana = calendario.get(Calendar.DAY_OF_WEEK);
          
            // Loop feito para garantir que o último dia seja o sábado
            while (ultimoDiaSemana != Calendar.SATURDAY){
                out.println("<td></td>");
                ultimoDiaSemana++;
            }
           
            out.println("</tr></tbody>");
            out.println("</table>");
              
        }  

    %>
  
    </body>
</html>


