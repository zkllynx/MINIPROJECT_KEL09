<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html;
         charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title>Home Page</title>
</head>
<body>
<sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/testdb1"
                   user="root" password="" />
<sql:query dataSource="${dbSource}" var="dbResult">
    SELECT * FROM address_book;
</sql:query>



<br />
<font color="blue"> <c:if test="${not empty param.msg}">
    <c:out value="${param.msg}" />
</c:if>
</font>
<br />
<form>
    <div class="CSSTableGenerator">
        <table>
            <tr>
                <td>ID</td>
                <td>First Name</td>
                <td>Function UpperCase</td>
                <td>Last Name</td>
                <td>Phone</td>
                <td>Email</td>
                <td colspan="2"></td>
            </tr>
            <c:forEach var="row" items="${dbResult.rows}">
                <tr>
                    <td><c:out value="${row.id}" /></td>
                    <td><c:out value="${row.fname}" /></td>
                    <td><c:set var="author" value="${row.fname}"/>
                      ${fn:toUpperCase(author)}.</td>
                    <td><c:out value="${row.lname}" /></td>
                    <td><c:out value="${row.phone}" /></td>
                    <td><c:out value="${row.email}" /></td>

                </tr>
            </c:forEach>
        </table>
    </div>
</form>
<br />
</body>
</html>