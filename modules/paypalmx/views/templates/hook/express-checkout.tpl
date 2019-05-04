{*** @author PrestaShop SA <contact@prestashop.com>** @copyright  2007-2014 PrestaShop SA**** International Registered Trademark & Property of PrestaShop SA**** Description: PayPal "Express Checkout" buttons template (Product page, Shopping cart content page, Payment page/step)**** This template is displayed to the customer to allow him/her to pay with PayPal Express Checkout** It can be either displayed on the Product pages, the Shopping cart content page depending on your preferences (Back-office addon's configuration)** It will also always be displayed on the payment page/step to confirm the payment**** Step 1: The customer is clicking on the PayPal Express Checkout button from a product page or the shopping cart content page** Step 2: The customer is redirected to PayPal and selecting a funding source (PayPal account, credit card, etc.)** Step 3: PayPal redirects the customer to your store ("Shipping" checkout process page/step)** Step 4: PayPal is also sending you the customer details (delivery address, e-mail address, etc.)** If we do not have these info yet, we update your store database and create the related customer** Step 5: The customer is selected his/her shipping preference and is redirected to the payment page/step (still on your store)** Step 6: The customer is clicking on the second PayPal Express Checkout button to confirm his/her payment** Step 7: The transaction success or failure is sent to you by PayPal at the following URL: http://www.mystore.com/modules/paypalmx/controllers/front/expresscheckout.php?pp_exp_payment=1** Step 8: The customer is redirected to the Order confirmation page***}{if ($page_name == 'order' && (!isset($paypal_mx_express_checkout_no_token) || !$paypal_mx_express_checkout_no_token) && ((isset($smarty.get.step) && $smarty.get.step > 1) || (isset($smarty.post.step) && $smarty.post.step > 1))) || ($page_name == 'order-opc' && isset($smarty.get.isPaymentStep) && $smarty.get.isPaymentStep == true && isset($paypal_mx_express_checkout_hook_payment))}    <p class="payment_module row HERE">        <div id="paypal-express-checkout">            <form id="paypal-express-checkout-form" class="well payment_module" action="{$paypal_mx_action_payment}" method="post">                {if $paypal_mx_merchant_country_is_mx}                    <input id="paypal-express-checkout-btn" type="image" name="submit" src="{$module_dir}img/boton_terminar_compra.png" alt="" class="ecb f_left" />                    <p class="f_left">{l s='Da clic para confirmar tu compra con PayPal' mod='paypalmx'}</p>                    <div class="clearboth"></div>                {else}                    <input id="paypal-express-checkout-btn" type="image" name="submit" src="https://www.paypalobjects.com/{if $lang_iso == 'en'}en_US{else}{if $lang_iso == 'fr'}fr_CA{else}{if $lang_iso == 'es'}es_ES{else}en_US{/if}{/if}{/if}/i/bnr/horizontal_solution_PPeCheck.gif" alt="" class="ecb" /> {l s='Complete your order with PayPal Express Checkout' mod='paypalmx'}                {/if}            </form>        </div>    </p>    {else}                <div id="paypal-express-checkout" class="{if isset($paypal_mx_express_checkout_no_token) && $paypal_mx_express_checkout_no_token}payment_module{/if}">           {if !$PS_CATALOG_MODE}            <form id="paypal-express-checkout-form" class="well box-security {if !isset($paypal_mx_express_checkout_no_token) || !$paypal_mx_express_checkout_no_token} align_right {/if}" action="{$paypal_mx_action}" method="post" onsubmit="$('#paypal_express_checkout_id_product_attribute').val($('#idCombination').val());                      $('#paypal_express_checkout_quantity').val($('#quantity_wanted').val());">                {if $page_name == 'product' && isset($smarty.get.id_product)}                    <input type="hidden" id="paypal_express_checkout_id_product" name="paypal_express_checkout_id_product" value="{$smarty.get.id_product|intval}" />                    <input type="hidden" id="paypal_express_checkout_id_product_attribute" name="paypal_express_checkout_id_product_attribute" value="0" />                    <input type="hidden" id="paypal_express_checkout_quantity" name="paypal_express_checkout_quantity" value="0" />                {/if}                {if $paypal_mx_merchant_country_is_mx}                    <input id="paypal-express-checkout-btn-product" type="image" name="submit" src="{if isset($paypal_mx_express_checkout_no_token) && $paypal_mx_express_checkout_no_token}{$module_dir}/img/accpmark_tarjdeb_mx.png{else}{$module_dir}/img/express_checkout_mx.png{/if}" alt=""/>                {else}                    <input id="paypal-express-checkout-btn-product" type="image" name="submit" src="{if isset($paypal_mx_express_checkout_no_token) && $paypal_mx_express_checkout_no_token}https://www.paypalobjects.com/{if $lang_iso == 'en'}en_US{else}{if $lang_iso == 'fr'}fr_CA{else}{if $lang_iso == 'es'}es_ES{else}en_US{/if}{/if}{/if}/i/bnr/horizontal_solution_PPeCheck.gif{else}https://www.paypal.com/{if $lang_iso == 'en'}en_US{else}{if $lang_iso == 'fr'}fr_CA{else}{if $lang_iso == 'es'}es_ES{else}en_US{/if}{/if}{/if}/i/btn/btn_xpressCheckout.gif{/if}" alt="" />                {/if}            </form>            {/if}        </div>        <div class="clearboth"></div>    {if !isset($paypal_mx_from_error)}        <script type="text/javascript">        {literal}        $(document).ready(function()        {                        {/literal}            {if $page_name == 'product' && !$PS_CATALOG_MODE}                {literal}                $('#paypal-express-checkout-form').insertAfter('#buy_block');                {/literal}            {else}                {if !isset($paypal_mx_express_checkout_no_token) || !$paypal_mx_express_checkout_no_token}                    {literal}                    $('#paypal-express-checkout-btn-product').hide();                    $('#paypal-express-checkout').insertAfter('.cart_navigation .button_large');                    $('#paypal-express-checkout-btn-product').show();                    {/literal}                {/if}            {/if}            {literal}        });        {/literal}    </script>    {/if}{/if}