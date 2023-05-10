<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My JSP page</title>
</head>
<body>
    <%
        List<Map<String, Object>> listMap = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        map.put("name", "John");
        map.put("age", 30);
        listMap.add(map);
        map = new HashMap<>();
        map.put("name", "Jane");
        map.put("age", 25);
        listMap.add(map);
    %>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
            </tr>
        </thead>
        <tbody>
            <% for(Map<String, Object> m : listMap){ %>
                <tr>
                    <% for(String key : m.keySet()){ %>
                        <td><%=m.get(key)%></td>
                        <td><button onclick="saveKey('<%=key%>')">Save key</button></td>
                    <% } %>
                </tr>
            <% } %>
        </tbody>
    </table>

    <script>
        let keys = [];

        function saveKey(key) {
            keys.push(key);
            console.log(keys);
        }
    </script>
</body>
</html>
