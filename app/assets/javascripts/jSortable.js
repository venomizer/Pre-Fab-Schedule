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

        $(element).find("div.odd").addClass("odd2");
        $(element).find("div.even").addClass("odd2");
        $(element).find("div.job-items-block").hide();

        $(element).sortable({
            distance: "30"

        });

        $(".full-job-portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix")
            .find(".odd2")
                .addClass("ui-widget-header")
                .end()
            .find(".job-items-block");

        $(".odd2").click(function(){
            $(this).parents(".full-job-portlet:first").find(".job-items-block").slideToggle();
        });
        $(element).disableSelection();
    };

})(jQuery);