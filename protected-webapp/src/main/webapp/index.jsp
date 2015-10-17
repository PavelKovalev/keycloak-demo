<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%@ page import="org.keycloak.KeycloakSecurityContext" %>
<%
    KeycloakSecurityContext ksc = (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());
    String idTokenString = ksc.getIdTokenString();
    String tokenString = ksc.getTokenString();
    String realm = ksc.getRealm();
%>


<!DOCTYPE html>
<html>
<head>
<title>Video Manager</title>
<link rel="stylesheet" href="css/styles.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
$( document ).ready( function() {
    $( '#sayHello' ).click( function( event ) {
        var result = $( '#result' ), name = $.trim( $( '#name' ).val() );

        result.removeClass( 'invalid' );

        if( !name || !name.length ) {
            result.addClass( 'invalid' ).text( 'A name is required!' );
            return;
        }

        $.ajax( '/rest/api/videos/json/' + name, {
            dataType:'json',
            data:{},
            type:'GET',
            headers: {
                "Authorization": "Bearer " + "<%=tokenString%>"
            },
            success:function ( data ) {
                $( '#result' ).text( data.result );
            }
        })
        .error( function() {
        });
    });
}); // (document).ready
</script>
</head>
<body>
<h3>Video Manager</h3>
<form name="theForm">
    <fieldset>
        <label for="name" id="name_label">Name</label>
        <input name="name" id="name" type="text" required placeholder="Your Name"/>
        <input type="button" id="sayHello" value="Say Hello"/><span id="result"></span>
    </fieldset>
</form>

<div>Security info</div>
<div>idTokenString = <span style="font-size: larger"><%=idTokenString%></span></div>
<div>tokenString = <span style="font-size: larger"><%=tokenString%></span></div>
<div><%=realm%></div>

</body>
</html>
