/**
 * Created by JetBrains RubyMine.
 * User: JGalindo
 * Date: 2/14/12
 * Time: 8:46 AM
 * To change this template use File | Settings | File Templates.
 */
(function($){
    $.fn.jSortable = function(){

        $("#sortable").sortable("enable");
        $("#sortable").disableSelection();
    }

})(jQuery);