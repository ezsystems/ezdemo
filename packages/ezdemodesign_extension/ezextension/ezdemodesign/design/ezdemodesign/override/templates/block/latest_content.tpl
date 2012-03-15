{def $valid_nodes = $block.valid_nodes}

<div class="block-type-latest-content">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    <div class="block-content">
        {foreach $valid_nodes as $valid_node}
            {node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}
        {/foreach}
    </div>

</div>

{undef $valid_nodes}
