{if $attribute.content.keywords|count()}
<ul class="tags-wrapper">
    {foreach $attribute.content.keywords as $keyword}
    <li>
        <a href="{concat( '/content/keyword/', $keyword|wash() )|ezurl( 'no' )}">
            <span class="tag-title">{$keyword|wash()}</span>
            <span class="tag-amount">{fetch( 'content', 'keyword_count', hash( 'alphabet', $keyword ) )}</span>
        </a>
    </li>
    {/foreach}
</ul>
{/if}
