(function($){
    $.fn.jExpand = function(){
        var element = this;

        $(element).find("tr:odd").addClass("odd2");
        $(element).find("tr:not(.odd2)").hide();
        $(element).find("tr:first-child").show();

        $(element).find("tr.odd2").click(function() {
            $(this).next("tr").slideToggle();
        });
    }    
})(jQuery);