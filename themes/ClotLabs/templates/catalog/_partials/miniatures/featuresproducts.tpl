{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
    <article class="itemproduct js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        <div class="product-container">
            <div class="product-description">
                {block name='product_name'}
                    <h4 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h4>
                {/block}
                {if $page.page_name != 'index'}
                    {block name='product_price_and_shipping'}
                        {if $product.show_price}
                            <div class="product-price-and-shipping">
                              {if $product.has_discount}
                                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                                <span class="regular-price">{$product.regular_price}</span>

                              {/if}

                                {hook h='displayProductPriceBlock' product=$product type="before_price"}

                                <span itemprop="price" class="price">{$product.price}</span>

                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                              {hook h='displayProductPriceBlock' product=$product type='weight'}
                            </div>
                        {/if}
                    {/block}
                {else}
                    {block name='product_description_short'}
                        <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
                    {/block}
                {/if}
            </div>
            {block name='product_flags'}
                <ul class="new-product-flags {if $page.page_name == 'category'}listing{/if}">
                    {foreach from=$product.flags item=flag}
                        <li class="{$flag.type}"><span>{$flag.label}</span></li>
                    {/foreach}
                    {if $product.discount_type === 'percentage'}
                        <li class="discount-percentage" style="display: none;"><span>{$product.discount_percentage}</span></li>
                    {/if}
                </ul>
            {/block}
            {block name='product_thumbnail'}
                <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
                    <img
                        src = "{$product.cover.bySize.home_default.url}"
                        alt = "{$product.cover.legend}"
                        data-full-size-image-url = "{$product.cover.large.url}"s>
                </a>
            {/block}
        </div>
    </article>
{/block}
