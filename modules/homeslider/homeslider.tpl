{if $page_name =='index'}
  {if isset($homeslider_slides)}

<style>
.bx-wrapper img {
  border: solid 1px #999 !important;
  height: 500px !important;
  width: 500px !important;
}

.homeslider-inner {
  position: absolute;
  height: 100%;
  left: 640px;
  width: 500px;
  top: 0;
  border: solid 1px #999 !important;
  padding: 15px;
}
</style>


    <div id="homepage-slider" class="col-xs-12">
      {if isset($homeslider_slides[0]) && isset($homeslider_slides[0].sizes.1)}{capture name='height'}{$homeslider_slides[0].sizes.1}{/capture}{/if}
      <ul id="homeslider"{if isset($smarty.capture.height) && $smarty.capture.height} style="max-height:{$smarty.capture.height}px;"{/if}>
        {foreach from=$homeslider_slides item=slide}
          {if $slide.active}
            {if isset($slide.imageUrl)}
              {$slideImageUrl = $slide.imageUrl}
            {else}
              {$slideImageUrl = "`$smarty.const._MODULE_DIR_`homeslider/images/`$slide.image`"}
            {/if}
            <li class="homeslider-container">
              <a href="{$slide.url|escape:'html':'UTF-8'}" title="{$slide.legend|escape:'html':'UTF-8'}">
                <img  class="img-responsive"
                      src="{$link->getMediaLink($slideImageUrl)|escape:'htmlall':'UTF-8'}"
                      {if isset($slide.size) && $slide.size} {$slide.size}{/if}
                      alt="{$slide.legend|escape:'htmlall':'UTF-8'}"
                      style="width: 100%; height: 100%"
                >
              </a>
              {if isset($slide.description) && trim($slide.description) != ''}
                <div class="homeslider-wrapper hidden-xs">
                  <div class="homeslider-inner">
                  <div class="homeslider-description">{$slide.description}</div>
                  </div>
                </div>
              {/if}
            </li>
          {/if}
        {/foreach}
      </ul>
      <div id="homeslider-pager">
        <span>{l s='More offers:' mod='homeslider'}</span>
        <span id="homeslider-pages"></span>
      </div>
    </div>
  {/if}
{/if}
