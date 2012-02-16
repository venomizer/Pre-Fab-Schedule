/**
 * Created by JetBrains RubyMine.
 * User: JGalindo
 * Date: 2/14/12
 * Time: 8:46 AM
 * To change this template use File | Settings | File Templates.
 */
(function($){
    $.fn.jSortable = function(){

        var element = this;
        var fixHelper = function(e, ui) {
            ui.children().each(function(){
                $(this).width($(this).width());
            });
            return ui;
        };

        $(element).sortable({
            helper: fixHelper,
            axis: "y",
            cursor: "move",
            items: "tr.odd2",
            distance: "30"

        });
        $(element).disableSelection();
    };

})(jQuery);