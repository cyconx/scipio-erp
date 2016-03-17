<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#if miniProduct??>
    <#if solrProduct?has_content && solrProduct.mediumImage?exists>    
        <#assign smallImageUrl = solrProduct.mediumImage>
    <#elseif solrProduct?has_content && solrProduct.smallImage?exists>
        <#assign smallImageUrl = solrProduct.smallImage>        
    <#elseif miniProductContentWrapper?exists && miniProductContentWrapper.get("SMALL_IMAGE_URL","html")?has_content>
        <#assign smallImageUrl = miniProductContentWrapper.get("SMALL_IMAGE_URL","html")!>        
    </#if>

    <#if smallImageUrl?has_content><#assign imgSrc><@ofbizContentUrl>${smallImageUrl}</@ofbizContentUrl></#assign>
    <#else>
        <#assign imgSrc="https://placehold.it/300x100"/>
    </#if>
        <#assign imgLink><@ofbizCatalogAltUrl productCategoryId=requestParameters.category_id productId=miniProduct.productId/></#assign>

    <#assign productImage>
            <@img src=imgSrc!"https://placehold.it/300x100" type="contain" link=imgLink!"" width="100%" height="100px"/>
    </#assign>
    <@pul>
        <#if priceResult.isSale?exists && priceResult.isSale><li class="ribbon"><span>${uiLabelMap.OrderOnSale}!</span></li></#if>
            <@pli>
               ${productImage!""}
            </@pli>
        <@pli type="description">
            ${miniProductContentWrapper.get("PRODUCT_NAME", "html")?default("No Name Available")}
         </@pli>

         <@pli>
           <#if (priceResult.price?default(0) > 0 && miniProduct.requireAmount?default("N") == "N")>
            <#if totalPrice??>
                <@ofbizCurrency amount=totalPrice isoCode=priceResult.currencyUsed/>
            <#else>
                <@ofbizCurrency amount=priceResult.price isoCode=priceResult.currencyUsed/>
            </#if>
          </#if>
          <a href="<@ofbizCatalogAltUrl productCategoryId=requestParameters.category_id?? productId=miniProduct.productId/>"><i class="${styles.icon} ${styles.icon_prefix}magnifying-glass"></i></a>
        </@pli>
        </@pul>

</#if>
