
<jsp:directive.include file="header.jsp"/>

	<div class="breadcrumb-area pt-35 pb-35 bg-gray-3">
	    <div class="container">
	        <div class="breadcrumb-content text-center">
	            <ul>
	                <li>
	                    <a href="/BookStoreWebsite">Home</a>
	                </li>
	                <li class="active"> MY ORDER </li>
	            </ul>
	        </div>
	    </div>
	</div>
<br/>

	<div align="center">
	<h2>My Order History</h2>
	<br/>
	<c:if test="${fn:length(listOrders) == 0 }">
		<h3>You have not placed any orders.</h3>
	</c:if>
	
	<c:if test="${fn:length(listOrders) > 0 }">
	<div class="col-lg-6 col-md-6 ">
		<table class=" table table-bordered text-center ">
			<thead>
				<tr class="table-info">
					<th>No</th>
					<th>Order ID</th>
					<th>Quantity</th>
					<th>Total Amount</th>
					<th>Order Date</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${listOrders}" var="order" varStatus="status">
				<tr>
					<td>${status.index + 1 }</td>
					<td>${order.orderId}</td>
					<td>${order.bookCopies }</td>
					<td>
					   <fmt:setLocale value = "en_US"/>
					   <fmt:formatNumber value="${order.total}" type="currency" />
					</td>
					<td>${order.orderDate }</td>
					<td>${order.status }</td>
					<td>
						<div class="button-box">
				            <button  ><span><a href="show_order_detail?id=${order.orderId }">View Details</a></span></button>
				        </div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
	<br/>

<jsp:directive.include file="footer.jsp"/>


