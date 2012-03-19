{def $valid_nodes = $block.valid_nodes}

<div class="block-type-content-grid block-view-{$block.view}">

    {if ne( $block.name, '' )}
    <div class="attribute-header">
        <h2>{$block.name|wash()}</h2>
    </div>
    {/if}

    <div class="row">
        <div class="span4">
    {foreach $valid_nodes as $valid_node}
        {node_view_gui view='block_item' image_class='contentgrid' content_node=$valid_node}

        {delimiter modulo=2}
        </div>
        <div class="span4">
        {/delimiter}
    {/foreach}
         </div>
    </div>

</div>

{undef $valid_nodes}
