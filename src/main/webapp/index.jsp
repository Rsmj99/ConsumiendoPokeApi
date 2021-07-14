<%@page contentType="UTF-8" import="java.util.*, com.demo.*, java.lang.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <h1 class="alert alert-info">Listado de Pokemones</h1>

    <div class="row container">
        <form action="DemoServlet" method="get">
                <input type="submit" value="Mostar Pokemones">
            </form>
            <br/><br/>

            <table class="table table-hover table-striped">
                <tr>
                    <th>Nombre</th>
                    <th>Url</th>
                    <th>Evolucion</th>
                </tr>
                <%
                List<Pokemon> pokemones = (List<Pokemon>) request.getAttribute("pokemones");
                    if(pokemones != null) {
                        for (int i=0; i<pokemones.size(); i++){
                            out.println("<tr>");
                            out.println("<td>" + pokemones.get(i).getName() + "</td>");
                            out.println("<td>" + pokemones.get(i).getUrl() + "</td>");
                            String[] str = pokemones.get(i).getUrl().split("/");
                            String id = str[str.length-1];
                            String url = "http://localhost:8080/DemoServlet/EvolutionServlet?num="+id;
                            out.println("<td><a class=\"btn btn-sm btn-primary\" href="+url+">Ver evolucion</a></td>");
                            out.println("</tr>");
                        }
                    }
                %>
            </table>
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <%
                if(request.getAttribute("offset") != null) {
                    Integer n = (Integer) request.getAttribute("offset");
                if(n>=1){
                %>
                <li class="page-item">
                  <a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=<%=n-1%>&limit=10" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                </li>
                <%}%>
                <li class="page-item"><a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=<%=n%>&limit=10"><%=n+1%></a></li>
                <%if(n<=87){%>
                <li class="page-item"><a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=<%=n+1%>&limit=10"><%=n+2%></a></li>
                <li class="page-item"><a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=<%=n+2%>&limit=10"><%=n+3%></a></li>
                <li class="page-item">
                  <a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=<%=n+1%>&limit=10" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <%}} else {
                %>
                <li class="page-item"><a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=0&limit=10">1</a></li>
                <li class="page-item"><a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=1&limit=10">2</a></li>
                <li class="page-item"><a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=2&limit=10">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="http://localhost:8080/DemoServlet/DemoServlet?offset=<%=3%>&limit=10" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <% }
                %>
              </ul>
            </nav>
    </div>
</body>
</html>