{def $valid_nodes = $block.valid_nodes
     $first = $valid_nodes.0
     $big_image_class = 'gallery'
     $image = $first.data_map.image.content[$big_image_class]}
<!-- BLOCK: START -->
<div class="block-type-gallery">

    <div class="block-gallery">
        <div class="gallery-viewer">
            <figure>
                <img src={$image.url|ezroot} alt="{$first.name|wash()}" height="{$image.height}" width="{$image.width}" />
                <figcaption>
                    <h3>
                        <span class="counter"><span>1</span>/{$valid_nodes|count}</span>
                        <a href={$first.url_alias|ezurl}>{$first.name|wash()}</a>
                    </h3>
                    <div>
                    {if $first.data_map.caption.has_content}
                        {attribute_view_gui attribute=$first.data_map.caption}
                    {/if}
                    </div>
                </figcaption>
            </figure>
        </div>
        <div class="gallery-navigator">
            <a href="#" class="navig prev" style="opacity:0;"><span class="hide">&lt;</span></a>
            <a href="#" class="navig next"><span class="hide">&gt;</span></a>

            <img src={'fg-selected.png'|ezimage} alt="Selected indicator" class="cursor" />
            <ul class="images">
            {foreach $valid_nodes as $k => $img}
                <li>{node_view_gui view='gallery_item' thumb_class='gallerythumbnail' big_class=$big_image_class content_node=$img}</li>
            {/foreach}
            </ul>
        </div>

    </div>
    {run-once}
    <script type="text/javascript">
    {literal}

    YUI(YUI3_config).use('ezgallery', 'event', function (Y) {
        Y.on('domready', function () {
            Y.all('.block-type-gallery').each(function () {
                var g = new Y.eZ.Gallery({
                    title: 'h3 a',
                    caption: 'figcaption div',
                    autoFixSizes: false,
                    autoScrollOnSelect: false,
                    navigator: {
                        gallery: this.one('.block-gallery')
                    },
                    initFunc: function () {
                        var imgs = this.navigator.getImages();

                        setTimeout(function () {
                            imgs.each(function(elem) {
                                (new Image).src = elem.getAttribute('data-gallery-src');
                            });
                        }, 0);
                    },
                    updateFunc: function (item) {
                        var node = item.imageNode,
                            t = this.container.one(this.conf.title),
                            img = this.container.one(this.conf.image),
                            cap = this.container.one(this.conf.caption);
                            c = this.container.one(this.conf.counter);

                        img.setAttribute('src', node.getAttribute('data-gallery-src'));
                        img.setAttribute('height', node.getAttribute('data-gallery-height'));
                        img.setAttribute('width', node.getAttribute('data-gallery-width'));
                        img.setAttribute('alt', node.get('title'));
                        t.setContent(node.get('title'));
                        t.setAttribute('href', node.getAttribute('data-gallery-node-url'));
                        c.setContent(item.index + 1);
                        cap.setContent(node.one('figcaption').getContent());
                    }
                });
            });
        });
    });
    
    {/literal}
    </script>
    {/run-once}
{undef $valid_nodes $first $big_image_class $image}
</div>
<!-- BLOCK: END -->
