<%@page contentType="UTF-8" import="java.util.*, com.demo.*, java.lang.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <pre>
        <%
            String evolution = (String) request.getAttribute("evolution");
            out.println(evolution);
        %>
    </pre>
</body>
</html>