<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <title>JA-HomeWork-18</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">Spring MVC -Logos</div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="/">All participants</a></li>
            <li><a href="new">new Participant</a></li>
        </ul>
    </div>
</nav>

<div class="container">

    <c:choose>
        <c:when test="${mode == 'PARTICIPANT_VIEW'}">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Participant Name</th>
                    <th>email</th>
                    <th>Level</th>
                    <th>Primary Skill</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="participant" items="${participants}">
                    <tr>
                        <td>${participant.id}</td>
                        <td>${participant.name}</td>
                        <td>${participant.email}</td>
                        <td>${participant.level}</td>
                        <td>${participant.primarySkill}</td>
                        <td><a href="update?id= ${participant.id}">edit</a></td>
                        <td><a href="delete?id= ${participant.id}">delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>

        <c:when
                test="${mode == 'PARTICIPANT_EDIT' || mode == 'PARTICIPANT_CREATE'}"><jsp:useBean id="participant" scope="request" type="com.sun.org.apache.xml.internal.security.signature.SignatureProperty"/>

            <form action="save" method="POST">

                <input type="hidden" value="${participant.id}" class="form-control"
                       id="id" name="id">

                <div class="form-group">
                   <%--@declare id="participantname"--%><label for="participantName">Participant Name:</label> <input
                        type="text" class="form-control" id="name" name="name"
                        value="${participant.name}">
                </div>


                <div class="form-group">
                    <label for="email">Email:</label> <input type="text"
                                                             class="form-control" id="email" name="email"
                                                             value="${participant.email}">
                </div>

                <div class="form-group">
                    <label for="level">Level:</label>
                        <%-- <input type="text"
                            class="form-control" id="level" name="level"
                            value="${participant.level}"> --%>

                    <select class="form-select" aria-label="Default select example"
                            id="level" name="level"  >
                        <option selected value="${participant.level}">${participant.level}</option>
                        <option value="L1">L1</option>
                        <option value="L2">L2</option>
                        <option value="L3">L3</option>
                        <option value="L4">L4</option>
                        <option value="L5">L5</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="primarySkill">Primary Skill</label> <input type="text"
                                                                           class="form-control" id="primarySkill" name="primarySkill"
                                                                           value="${participant.primarySkill}">

                </div>


                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </c:when>

    </c:choose>
</div>

</body>
</html>