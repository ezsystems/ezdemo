{if $attribute.content.tag_ids|count}
<ul class="tags-wrapper">
    {foreach $attribute.content.tags as $tag}
    <li>
        <a href="{concat( '/tags/view/', $tag.url )|ezurl( 'no' )}">
            <span class="tag-title">{$tag.keyword|wash()}</span>
            <span class="tag-amount">{$tag.related_objects_count}</span>
        </a>
    </li>
    {/foreach}
</ul>
{/if}
