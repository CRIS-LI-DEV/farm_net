<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<center>
<h1>Edit Lenguage</h1>
<form:form action="/books/${book.id}" method="post" modelAttribute="book">
    <input type="hidden" name="_method" value="put">
    <p>
        <form:label path="title">Title</form:label>
        <form:errors path="title"/>
        <form:input path="title"/>
    </p>
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>
        <form:textarea path="description"/>
    </p>
    <p>
        <form:label path="language">Language</form:label>
        <form:errors path="language"/>
        <form:input path="language"/>
    </p>
    <p>
        <form:label path="numberOfPages">Pages</form:label>
        <form:errors path="numberOfPages"/>     
        <form:input type="number" path="numberOfPages"/>
    </p>    <br>
    <input type="submit" value="Submit"/>
</form:form>

<style>
@charset "ISO-8859-1";
body{
font-family: "Lucida Console", Monaco, monospace;
	background: black;
	color: #56DD37;
}
#delete{
background: color: #56DD37;
color:black;
}
a:visited{
color: #56DD37;
}
a:link{
color: #56DD37;
}
</style>