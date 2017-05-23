<#--
自定义指令genPagin的参数说明，如下
url           必填。用于指定链接所跳转的URL
totalPages    必填。用于指定总页数
currPage      选填。用于指定当前显示第几页，默认显示第一页
showPageNum   选填。用于指定所显示页链接的数量，默认显示10个页链接。否则总不能把所有页的链接都显示出来吧
-->
<#macro genPagin url totalPages currPage=1 size=10 showPageNum=10 urlLink="?" >
<div>
<ul class="pagination" >
    <#if currPage==1>
        <li class="prev disabled">
            <span><i class="fa fa-angle-double-left"></i></span>
        </li>
        <li class="prev disabled">
            <span><i class="fa fa-angle-left"></i></span>
        </li>
    <#else>
        <li class="prev">
            <a href="${url}${urlLink}page=1&size=${size}" title="First"><i class="fa fa-angle-double-left"></i></a>
        </li>
        <li class="prev">
            <a href="${url}${urlLink}page=${currPage-1}&size=${size}" title="Prev"><i class="fa fa-angle-left"></i></a>
        </li>
    </#if>

    <#local halfPage = (showPageNum/2)?int/>
    <#if (halfPage>=currPage)>
        <@showPage start=1 end=currPage currPage=currPage size=size url=url urlLink=urlLink/>
        <#if totalPages<=showPageNum>
            <@showPage start=currPage+1 end=totalPages currPage=currPage size=size url=url urlLink=urlLink/>
        <#else>
            <@showPage start=currPage+1 end=showPageNum currPage=currPage size=size url=url urlLink=urlLink/>
        </#if>
    <#else>
        <#if (currPage+halfPage>totalPages)>
            <#local endPage=totalPages/>
        <#else>
            <#local endPage=currPage+halfPage/>
        </#if>
        <#if (endPage-showPageNum<0)>
            <#local startPage=1/>
        <#else>
            <#local startPage=endPage-showPageNum+1/>
        </#if>
        <@showPage start=startPage end=endPage currPage=currPage size=size url=url urlLink=urlLink/>
    </#if>
    <#if (currPage>=totalPages)>
        <li class="next disabled">
            <span><i class="fa fa-angle-right"></i></span>
        </li>
        <li class="next disabled">
            <span><i class="fa fa-angle-double-right"></i></span>
        </li>
    <#else >
        <li class="next ">
            <a href="${url}${urlLink}page=${currPage+1}&size=${size}" title="Next"><i class="fa fa-angle-right"></i></a>
        </li>
        <li class="next ">
            <a href="${url}${urlLink}page=${totalPages}&size=${size}" title="Last"><i class="fa fa-angle-double-right"></i></a>
        </li>
    </#if>
</ul>
</div>
</#macro>

<#macro showPage start end currPage size url urlLink>
    <#if start lte end>
        <#list start..end as page>
        <#-- 当前页则不显示链接 -->
            <#if currPage==page>
            <li class="active">
                <span>${page}</span>
            </li>
            <#else>
            <li>
                <a href="${url}${urlLink}page=${page}&size=${size}">${page}</a>
            </li>
            </#if>
        </#list>
    </#if>
</#macro>