{def $big = $node.data_map.image.content[$big_class]
     $thumb = $node.data_map.image.content[$thumb_class]}
<!-- BOX CONTENT: START -->
<figure class="attribute-image">
    <img src={$thumb.url|ezroot}
         width="{$thumb.width}" height="{$thumb.height}" alt="{$node.name|wash}"
         data-big-src={$big.url|ezroot} />
    <figcaption class="attribute-caption">
        {if $node.data_map.caption.has_content}
            {attribute_view_gui attribute=$node.data_map.caption}
        {/if}
    </figcaption>
</figure>
<!-- BOX CONTENT: END -->
{undef $big $thumb}
