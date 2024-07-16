<%if(customerId>0){
    FavouriteService fav_ser = new FavouriteService();
    boolean result = fav_ser.checkCustomerFavourite(customerId, f_dto.getId(), config, request);
    %>
    
    <div class="contact-icon mt-5">
        <i class="bi <%= result == true ? "bi-heart-fill" : "bi-heart" %>" style="font-size: 25px;color:red;"
        id="heart_<%=f_dto.getId()%>" onclick="addFavourite('<%=customerId %>', '<%=f_dto.getId()%>')"></i>
    </div>
    <%} %>


    <script>
		function addFavourite(customer_id, food_id) {
		//	alert('heart_'+food_id);
			var element = document.getElementById('heart_'+food_id);
			element.classList.contains("bi-heart");
			var flag = "";
			if(element.classList.contains("bi-heart")){
				flag = "Insert";
			//document.getElementById('heart_'+food_id).classList.add("bi-heart-fill");
			//document.getElementById('heart_'+food_id).classList.remove("bi-heart");
			}else{
				flag = "Delete";
			//document.getElementById('heart_'+food_id).classList.remove("bi-heart-fill");
			//document.getElementById('heart_'+food_id).classList.add("bi-heart");
			}
			//alert(flag);
			
				$.ajax({
					url : 'ajax/ajaxFavourite.jsp',
					data : 'Customer_id='+ customer_id+'&Food_id='+food_id+'&Flag='+flag,
					type : 'post',
					success : function(msg) {
						$('#ajax_response').html(msg);
						var result =  document.getElementById("result").value;
						if(result=='true'){
							if(element.classList.contains("bi-heart")){
							document.getElementById('heart_'+food_id).classList.add("bi-heart-fill");
							document.getElementById('heart_'+food_id).classList.remove("bi-heart");
							}else{
							document.getElementById('heart_'+food_id).classList.remove("bi-heart-fill");
							document.getElementById('heart_'+food_id).classList.add("bi-heart");
							}
						}
						$('#ajax_response').html('');
					}
				});
			}
      </script>