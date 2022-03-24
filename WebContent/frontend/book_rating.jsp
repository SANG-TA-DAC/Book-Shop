<c:forTokens items="${book.ratingStars }" delims="," var="star">
	<c:if test="${star eq 'on' }">
        <i class="fa fa-star yellow"></i>
    </c:if>
    <c:if test="${star eq 'off' }">
         <i class="fa fa-star-o"></i>
    </c:if>
    <c:if test="${star eq 'half' }">
         <i class="fa fa-star-half-o yellow"></i>
	</c:if>
</c:forTokens>