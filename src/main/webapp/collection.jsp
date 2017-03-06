<!-- 
 *  Devoir AJAX et Java EE, par Eric Boivin
 *  Cette page contient une liste déroulante d'images populée
 *  par un tableau de titres reçu par le servlet. Lors de la 
 *  sélection d'un article, une requête AJAX est faite au servlet
 *  en arrière-plan, permettant de recevoir la page des détails
 *  et de l'afficher dans le conteneur prévu à cet effet.
 /-->
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="ca.etsmtl.gti525.devoir1.Image"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
	List<Image> listeImages = (ArrayList<Image>)request.getAttribute("collection");
%>
<!DOCTYPE html>
<html>
<head>
<title>Démo AJAX - J2EE</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script>
        function appelAjax(strURL) {
            var url = strURL
                + "?listeImages="
                + selection.listeImages.options[selection.listeImages.selectedIndex].value;
            $.ajax({url: url, success: function(result){
                $('#result')[0].innerHTML = result;
            }});
        }

	</script>

</head>
<body>
	<form name="selection">
		<span>Liste d'images:</span> <br />
		<select name="listeImages" id="liste"
			onchange='JavaScript:appelAjax("AjaxServlet")'>
			<option selected disabled>Sélectionner une image</option>
			<%
				for (int i = 0; i < listeImages.size(); i++) {
						Image image = listeImages.get(i);
			%>
					<option value="<%=image.getId()%>"><%=image.getTitre()%></option>
			<%
				}
			%>
		</select>
	</form>
	<br />
	<div id="result"></div>
</body>
</html>
