
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" style="margin-left: 200px">

            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../timetable"><h3 style="margin-top: 8px"><strong>Timetable</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../schedule"><h3 style="margin-top: 8px"><strong>Schedule</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3></a></div>
                <div class="col-md-6" style="margin-left: 600px">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../student/info">${s.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/DemoOfGitHub/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            ${cs.name}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <table style="margin-left: 200px">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                <h2 style="margin-left: 50px">User detail</h2>
                            </div>
                            <table>
                                <tbody>
                                    <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">
                                        <tr>
                                            <td style="width: 450px"><b>Login</b></td>
                                            <td style="width: 550px; border-bottom: solid lightgray 1px">${l.account.accountName}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Full name</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${l.name}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Image</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"><img style="height: 150px; width: 120px" src="${l.img}" alt="alt"/></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Email</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${l.email}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </td> 
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
