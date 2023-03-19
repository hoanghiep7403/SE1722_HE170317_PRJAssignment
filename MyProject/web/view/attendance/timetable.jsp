<%-- 
    Document   : timetable
    Created on : Mar 12, 2023, 9:23:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style type="text/css">
        .style1 {
            font-weight: bold;
        }

        body{
            background-image: url('870517.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 120%;
        }
        
        p{
            font-size: 50px;
            margin-right: 50px;
        }
        td{
            background-color: rgba(127,255,212, 0.5);
 
        }
    </style>
    <body>
        <div class="container" style="margin-left: 100px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 100px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
                <div class="col-md-4" style="margin-left: 400px">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr>
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg"
                                         style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg"
                                         style="width: 120px; height: 40px" alt="google store" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 100px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Timetable</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 680px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="student/info">${s.account.accountName}</a>
                        </button>
                    </c:forEach>
                    <%--<c:forEach items="${requestScope.lec}" var="l" varStatus="loop">--%>          
                    <!--<button style="background-color: rgb(67, 205, 128); color: white">-->
                        <!--<a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>-->
                    <!--</button>-->
                    <%--</c:forEach>--%>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/MyProject/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            ${cs.name}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <form style="margin-left: 100px" action="timetable" method="GET">
                <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                    <h1>Activities for ${s.code} (${s.name})</h1>
                </c:forEach>
                <table style="border: solid 2px black">
                    <thead>
                        <tr style="background-color: orange">
                            <th style="text-align: left">From: <input type="date" name="from"/><br/>
                                To: <input type="date" name="to"/><br/>
                            </th>
                            <th>
                                <input style="height: 45px;background-color: orange" type="submit" value="Enter"/>
                            </th>
                        </tr>
                    </thead>
                </table>
            </form>
            <div style="margin-left: 100px">
                <c:if test="${requestScope.dates ne null}">
                    <table style="border: 2px solid black;" border="1px"> 
                        <tr style="background-color: orange">
                            <td></td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td><fmt:formatDate value="${d}" type="date"/><br/><fmt:formatDate value="${d}" pattern="EEEE"/>
                                </td>
                            </c:forEach>

                        </tr>
                        <c:forEach items="${requestScope.slots}" var="slot"> 
                            <tr>
                                <td style="background-color: rgb(234, 234, 234)">Slot ${slot.id}</td>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <td style="width: 120px">
                                        <c:forEach items="${requestScope.s.groups}" var="g">
                                            <c:forEach items="${g.sessions}" var="ses" varStatus="loop">
                                                <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                    <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a><br/>
                                                    at ${ses.room.name} <br/>
                                                    <c:if test="${ses.status eq true}">
                                                        <c:if test="${ses.attendance.status eq true}">
                                                            <b style="color: rgb(67, 205, 128)">(Attended)</b><br/>
                                                        </c:if>
                                                        <c:if test="${ses.attendance.status eq false}">
                                                            <b style="color: red">(Absent)</b><br/>
                                                        </c:if>
                                                    </c:if>
                                                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                                        <c:if test="${ses.status eq false}">
                                                            <b style="color: red">(Not yet)</b><br/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <button style="background-color: rgb(67, 205, 128); color: white">
                                                        ${ses.slot.name}
                                                    </button>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
            
        </div>
    </body>
</html>
