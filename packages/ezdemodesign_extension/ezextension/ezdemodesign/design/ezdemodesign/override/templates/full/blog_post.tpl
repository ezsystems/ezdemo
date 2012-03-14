{* Blog post - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}


<section class="content-view-full">
    <div class="class-blog-post">
        <div class="row">
            <div class="span8">
                <div class="attribute-header">
                    <h1>{$node.data_map.title.content|wash}</h1>
                </div>

                <div class="attribute-byline">
                    <span class="date">{$node.data_map.publication_date.content.timestamp|l10n(shortdatetime)}</span>
                    <span class="author">{$node.object.owner.name}</span>
                    <span class="tags"> {"Tags:"|i18n("design/ezdemodesign/full/blog_post")}
                    {foreach $node.data_map.tags.content.keywords as $keyword}
                        <a href={concat( $node.parent.url_alias, "/(id)/", $node.parent.node_id, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}">{$keyword}</a>
                        {delimiter}
                            ,
                        {/delimiter}
                    {/foreach}
                    </span>
                </div>

                <div class="attribute-body float-break">
                {attribute_view_gui attribute=$node.data_map.body}
                </div>

            {include uri='design:parts/related_content.tpl'}

            {if $node.data_map.enable_comments.data_int}
                <div class="attribute-comments">
                    <a name="comments" id="comments"></a>
                    <h1>{"Comments"|i18n("design/ezdemodesign/full/blog_post")}</h1>
                    <div class="content-view-children">
                        {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                                    {node_view_gui view='line' content_node=$comment}
                                {/foreach}
                    </div>

                    {if fetch( 'content', 'access', hash( 'access', 'create', 'contentobject', $node, contentclass_id, 'comment' ) )}
                        <form method="post" action={"content/action"|ezurl}>
                            <input type="hidden" name="ClassIdentifier" value="comment" />
                            <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                            <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                            <input class="button new_comment" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezdemodesign/full/article' )}" />
                        </form>
                        {else}
                        {if ezmodule( 'user/register' )}
                            <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezdemodesign/full/blog_post', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                            {else}
                            <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezdemodesign/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
                        {/if}
                    {/if}
                </div>
            {/if}
            </div>
            <div class="span4">
                {include uri='design:parts/blog/extra_info.tpl' used_node=$node.parent}
            </div>
        </div>
    </div>
</section>
