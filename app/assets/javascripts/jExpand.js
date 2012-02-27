(function($){
    $.fn.jExpand = function(){
        var element = this;

        $(element).find("div.odd").addClass("odd2");
        $(element).find("div.even").addClass("odd2");
        $(element).find("div.job-items-block").hide();

        $(element).find("div.odd2").click(function() {
            $(this).next("div.job-items-block").toggle('fade','fast');
        });
    };
})(jQuery);